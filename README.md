# Findit
Findit website

http://ec2-54-210-90-217.compute-1.amazonaws.com:5000/

## Inspiration
Very so often we get invited by "visionaries" to implement their idea. So we built an web app that takes upon their brilliant ideas and match the right person to help them. Especially in Hackathons, finding a match can same time and stress.

## What it does
"Findit" is a web-app platform that aims connects main campus students with ideas to school of engineering computer science students with skills. Sign up with your Net ID, school, major, and post your required skill needed for your idea. Not a recruiter? Don't need to post an idea -- just list off your skills!

## How we built it
### Technologies involved
* Linux
* Apache
* MySQL
* Python
* Flask
* HTML, CSS, & JS

### Techniques involved
* Writing routes
* Writing SQL
* Architecting the thing

### How to run
1. Get git and copy the codebase from my demo
2. Install LAMP on ubuntu (16.04 preferred), flask
3. Import the SQL
4. Run by "python app.py"

Started with the database, identified tables and relationships (primary, foreign key constraints). Worked on the server after to retrieve the data from the database and render it with its respective template engine (jinja). Deployed it to the cloud via EC2 Ubuntu. Installed the LAMP stack and performed continuous integration with the cloud.

## Challenges we ran into
HTML and CSS'ing the thing to make it look pretty and presentable. Probably wasted the most time with CSS'ing. Also the NYU API was unanimously deemed garbage or way too arcane. My SQL returned "duplicates", which I could have probably easily solved with a multi-value field. 

## Accomplishments that we're proud of
Getting a minimum viable product ready. Teamwork was fluid in expressing idea requirements and specifications. Software architecture flow was implemented as planned.

## What we learned
Could have used docker to migrate virtual box technology stack to AWS EC2 instance. There was time wasted in downloading LAMP software on cloud servers. Taught and gave team mates insight on backend infrastructure work. Also shared some web design experience as well. 

## What's next for Findit

### Changelog
#### v1.0.0: 
* App launched onto AWS with basic match key-value pairs from MySQL.
* Simple login/register system.

#### v2.0.0:
 * Transform Findit to Shopit. Literally a shopping cart for ideas and we (CS majors) get to dump them to our shopping cart if the job sounds good and pays well.
