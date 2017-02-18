#Import Flask Library
from flask import Flask, render_template, request, session, url_for, redirect
import pymysql.cursors


#Initialize the app from Flask
app = Flask(__name__)


#Configure MySQL
conn = pymysql.connect(host='localhost',
                       user='root',
                       password='7183596771',
                       db='findit',
                       charset='utf8mb4',
                       cursorclass=pymysql.cursors.DictCursor)


# ============================================================================================
# RENDER INITIAL PAGES
# ============================================================================================


@app.route('/')
def hello():
	return render_template('index.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
	cursor = conn.cursor()
	if request.method == 'GET':
		availableSchools = 'SELECT * FROM school'
		cursor.execute(availableSchools, ())
		availableSchoolsData = cursor.fetchall()

		return render_template('register.html', availableSchools = availableSchoolsData)
	else:
		username = request.form['username']
		password = request.form['password']
		firstName = request.form['firstName']
		lastName = request.form['lastName']
		gender = request.form['gender']
		email = request.form['email']

		school = request.form['school']
		major = request.form['major']

		query = 'SELECT * FROM member WHERE member.username = %s'
		cursor.execute(query, (username))
		data = cursor.fetchone()
		error = None
		if (data):
			error = "This user already exists"
			return render_template('register.html', error = error)
		else:
			try: 
				query = 'INSERT INTO member(username, password, firstName, lastName, gender, email) VALUES(%s, md5(%s), %s, %s, %s, %s); INSERT INTO belongs_to(username, school_name, major) VALUES(%s, %s, %s)'
				cursor.execute(query, (username, password, firstName, lastName, gender, email, username, school, major));
			except:
				pass
			
			conn.commit()
			cursor.close()
			return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
	if request.method == 'GET':
		return render_template('login.html')
	else:
		username = request.form['username']
		password = request.form['password']

		cursor = conn.cursor()
		query = 'SELECT * FROM member WHERE username = %s and password = md5(%s)'
		cursor.execute(query, (username, password))
		data = cursor.fetchone()
		cursor.close()
		error = None
		if (data):
			session['username'] = username
			return redirect(url_for('home'))
		else:
			error = 'Invalid login or username'
			return render_template('login.html', error=error)


@app.route('/home')
def home():
	username = session['username']
	cursor = conn.cursor();

	skills = 'SELECT keyword FROM member NATURAL JOIN belongs_to NATURAL JOIN interested_in WHERE (username = %s)'
	cursor.execute(skills, (username))
	skillsData = cursor.fetchall()

	matches = 'SELECT * FROM member NATURAL JOIN belongs_to NATURAL JOIN interested_in WHERE (keyword) IN (SELECT keyword FROM member NATURAL JOIN interested_in WHERE (username = %s)) AND (username != %s)'
	cursor.execute(matches, (username, username))
	matchesData = cursor.fetchall()
	
	cursor.close()
	return render_template('home.html', username = username, skills = skillsData, matches = matchesData)


@app.route('/profile')
def interests():
	username = session['username']
	cursor = conn.cursor();

	profile = 'SELECT * FROM member NATURAL JOIN belongs_to NATURAL JOIN interested_in WHERE (username = %s)'
	cursor.execute(profile, (username))
	profileData = cursor.fetchall()

	cursor.close()
	return render_template('profile.html', username = username, profile = profileData)


@app.route('/posting', methods=['GET', 'POST'])
def posting():
	username = session['username']
	cursor = conn.cursor();

	if request.method == 'GET':
		skills = 'SELECT * FROM skills'
		cursor.execute(skills, ());
		skillsData = cursor.fetchall()

		return render_template('posting.html', username = username, skills = skillsData)
	else:
		keyword = request.form['keyword']
		idea = request.form['idea']

		try:
			add_skill = 'INSERT INTO skills(keyword) VALUES(%s)'
			cursor.execute(add_skill, (keyword))
		except:
			pass

		posting = 'INSERT INTO interested_in(username, keyword, idea) VALUES(%s, %s, %s)'
		cursor.execute(posting, (username, keyword, idea))
		#postingData = cursor.fetchall()

		cursor.close()
		return redirect(url_for('home'))


# method to logout
@app.route('/logout', methods=['GET', 'POST'])
def logout():
	session.pop('username')
	return redirect('/')
		

app.secret_key = 'cat'
#Run the app on localhost port 5000
#debug = True -> you don't have to restart flask
#for changes to go through, TURN OFF FOR PRODUCTION
if __name__ == "__main__":
	app.run('0.0.0.0', 5000, debug = True)