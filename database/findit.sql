-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2017 at 07:39 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `findit`
--

-- --------------------------------------------------------

--
-- Table structure for table `belongs_to`
--

CREATE TABLE `belongs_to` (
  `username` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `major` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `belongs_to`
--

INSERT INTO `belongs_to` (`username`, `school_name`, `major`) VALUES
('abc', 'nyu college of arts and science', 'math'),
('asdf', 'nyu tandon school of engineering', 'computer science'),
('mm1', 'nyu college of arts and science', 'math'),
('test', 'nyu tandon school of engineering', 'computer science'),
('wz634', 'nyu tandon school of engineering', 'computer science'),
('yw2997', 'nyu college of arts and science', 'computer science');

-- --------------------------------------------------------

--
-- Table structure for table `interested_in`
--

CREATE TABLE `interested_in` (
  `username` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `idea` text NOT NULL,
  `recruiting` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interested_in`
--

INSERT INTO `interested_in` (`username`, `keyword`, `idea`, `recruiting`) VALUES
('asdf', 'html', 'help me with idea', 1),
('mm1', 'css', 'hackathon', 1),
('test', 'html', 'hackathon web app', 1),
('test', 'javascript', 'come to me', 1),
('wz634', 'html', '', 0),
('wz634', 'javascript', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`username`, `password`, `firstname`, `lastname`, `gender`, `email`) VALUES
('abc', '900150983cd24fb0d6963f7d28e17f72', 'abc', 'abc', 'M', 'abc@gmail.com'),
('asdf', '202cb962ac59075b964b07152d234b70', 'asdf', 'zxcv', 'male', 'asdf@nyu.edu'),
('mm1', '202cb962ac59075b964b07152d234b70', 'michael', 'idk', 'M', 'mm1@nyu.edu'),
('test', '202cb962ac59075b964b07152d234b70', 'xiang', 'cu', 'M', 'xz1008@nyu.edu'),
('wz634', '202cb962ac59075b964b07152d234b70', 'warlon', 'zeng', 'M', 'wz634@nyu.edu'),
('yw2997', '202cb962ac59075b964b07152d234b70', 'y', 'w', 'F', 'yw2997@nyu.edu');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_name` varchar(255) NOT NULL,
  `major` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`school_name`, `major`) VALUES
('nyu college of arts and science', 'computer science'),
('nyu college of arts and science', 'math'),
('nyu tandon school of engineering', 'computer science');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`keyword`) VALUES
('Adobe Illustrator'),
('Adobe InDesign'),
('Adobe Photoshop'),
('Analytics'),
('Android'),
('APIs'),
('Art Design'),
('AutoCAD'),
('Backup Management'),
('C'),
('C++'),
('Client Server'),
('Client Support'),
('Configuration'),
('Content Management Systems (CMS)'),
('Content Managment'),
('css'),
('Data Analytics'),
('Design'),
('Desktop Publishing'),
('Diagnostics'),
('Documentation'),
('Email'),
('End User Support'),
('Engineering'),
('Excel'),
('FileMaker Pro'),
('Fortran'),
('Graphic Design'),
('Hardware'),
('Help Desk'),
('html'),
('Implementation'),
('Installation'),
('Internet'),
('iOS'),
('iPhone'),
('Java'),
('javascript'),
('Linux'),
('Mac'),
('Matlab'),
('Maya'),
('Microsoft Excel'),
('Microsoft Office'),
('Microsoft Outlook'),
('Microsoft Publisher'),
('Microsoft Visual'),
('Microsoft Word'),
('Mobile'),
('MySQL'),
('Networks'),
('Open Source Software'),
('Oracle'),
('Perl'),
('PHP'),
('Presentations'),
('Processing'),
('Programming'),
('PT Modeler'),
('Python'),
('Ruby'),
('Shade'),
('Software'),
('Spreadsheet'),
('SQL'),
('Support'),
('Systems Administration'),
('Tech Support'),
('Troubleshooting'),
('UI/UX'),
('Unix'),
('Web Page Design'),
('Windows'),
('Word Processing'),
('XHTML'),
('XML');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD PRIMARY KEY (`major`,`school_name`,`username`),
  ADD KEY `username` (`username`),
  ADD KEY `school_name` (`school_name`,`major`);

--
-- Indexes for table `interested_in`
--
ALTER TABLE `interested_in`
  ADD PRIMARY KEY (`username`,`keyword`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`school_name`,`major`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`keyword`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongs_to`
--
ALTER TABLE `belongs_to`
  ADD CONSTRAINT `belongs_to_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `belongs_to_ibfk_2` FOREIGN KEY (`school_name`,`major`) REFERENCES `school` (`school_name`, `major`);

--
-- Constraints for table `interested_in`
--
ALTER TABLE `interested_in`
  ADD CONSTRAINT `interested_in_ibfk_1` FOREIGN KEY (`username`) REFERENCES `member` (`username`),
  ADD CONSTRAINT `interested_in_ibfk_2` FOREIGN KEY (`keyword`) REFERENCES `skills` (`keyword`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
