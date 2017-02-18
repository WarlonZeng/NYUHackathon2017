-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 18, 2017 at 12:01 PM
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
('mm1', 'nyu college of arts and science', 'math'),
('test', 'nyu tandon school of engineering', 'computer science'),
('wz634', 'nyu tandon school of engineering', 'computer science');

-- --------------------------------------------------------

--
-- Table structure for table `interested_in`
--

CREATE TABLE `interested_in` (
  `username` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `idea` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interested_in`
--

INSERT INTO `interested_in` (`username`, `keyword`, `idea`) VALUES
('mm1', 'css', 'hackathon'),
('test', 'html', 'hackathon web app'),
('test', 'javascript', 'come to me'),
('wz634', 'html', ''),
('wz634', 'javascript', '');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`username`, `password`, `firstname`, `lastname`, `gender`, `email`) VALUES
('mm1', '202cb962ac59075b964b07152d234b70', 'michael', 'idk', 'M', 'mm1@nyu.edu'),
('test', '202cb962ac59075b964b07152d234b70', 'xiang', 'cu', 'M', 'xz1008@nyu.edu'),
('wz634', '202cb962ac59075b964b07152d234b70', 'warlon', 'zeng', 'M', 'wz634@nyu.edu');

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
('css'),
('html'),
('javascript');

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
