-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 08:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `CollegeName` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Office` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`CollegeName`, `Phone`, `Office`) VALUES
('Business School', '(777) 999-8888', 'Business Building, Lobby'),
('City College', '(987) 654-3210', 'Main Building, Room 201'),
('Liberal Arts College', '(888) 222-3333', 'Arts Building, Room 301'),
('Tech Institute', '(555) 123-4567', 'Engineering Building, Dean\'s Office'),
('University of Science', '(123) 456-7890', 'Science Building, Room 101');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_number` varchar(20) NOT NULL,
  `Course_Name` varchar(255) DEFAULT NULL,
  `Course_Descrip` text DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `DepartmentCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_number`, `Course_Name`, `Course_Descrip`, `Credits`, `DepartmentCode`) VALUES
('BUS501', 'Principles of Marketing', 'Introduction to marketing principles and strategies.', 3, 501),
('CS101', 'Introduction to Computer Science', 'Fundamental concepts of computer science.', 3, 101),
('EE301', 'Introduction to Electrical Engineering', 'Fundamental concepts of electrical engineering.', 3, 301),
('ENGL401', 'Shakespearean Literature', 'Study of Shakespeare\'s plays and sonnets.', 3, 401),
('MATH201', 'Calculus I', 'Fundamental concepts of calculus.', 4, 201);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentCode` int(11) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `DepartmentNumber` varchar(20) DEFAULT NULL,
  `CollegeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentCode`, `DepartmentName`, `DepartmentNumber`, `CollegeName`) VALUES
(101, 'Computer Science', 'CS101', 'University of Science'),
(201, 'Mathematics', 'MATH201', 'City College'),
(301, 'Electrical Engineering', 'EE301', 'Tech Institute'),
(401, 'English Literature', 'ENGL401', 'Liberal Arts College'),
(501, 'Business Administration', 'BUS501', 'Business School');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `OfficeNumber` varchar(20) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Rank` varchar(50) DEFAULT NULL,
  `DepartmentCode` int(11) DEFAULT NULL,
  `CollegeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `Name`, `OfficeNumber`, `PhoneNumber`, `Rank`, `DepartmentCode`, `CollegeName`) VALUES
(1001, 'John Smith', 'S101', '(123) 456-7890', 'Professor', 101, 'University of Science'),
(1002, 'Emily Johnson', 'M201', '(987) 654-3210', 'Associate Professor', 201, 'City College'),
(1003, 'David Lee', 'E301', '(555) 123-4567', 'Assistant Professor', 301, 'Tech Institute'),
(1004, 'Alice Brown', 'A401', '(888) 222-3333', 'Professor', 401, 'Liberal Arts College'),
(1005, 'Michael Davis', 'B501', '(777) 999-8888', 'Professor', 501, 'Business School');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `Course_number` varchar(20) NOT NULL,
  `DepartmentCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`Course_number`, `DepartmentCode`) VALUES
('BUS501', 501),
('CS101', 101),
('EE301', 301),
('ENGL401', 401),
('MATH201', 201);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `Section_number` int(11) NOT NULL,
  `Semester` varchar(10) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Timing` varchar(50) DEFAULT NULL,
  `Classroom` varchar(20) DEFAULT NULL,
  `Building` varchar(50) DEFAULT NULL,
  `FacultyID` int(11) DEFAULT NULL,
  `Course_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`Section_number`, `Semester`, `Year`, `Timing`, `Classroom`, `Building`, `FacultyID`, `Course_number`) VALUES
(10101, 'Fall', 2024, 'MWF 10:00 AM - 11:00 AM', 'Room 101', 'Science Building', 1001, 'CS101'),
(20101, 'Spring', 2025, 'TTH 1:00 PM - 2:30 PM', 'Room 201', 'Main Building', 1002, 'MATH201'),
(30101, 'Fall', 2024, 'MW 3:00 PM - 4:30 PM', 'Room 301', 'Engineering Building', 1003, 'EE301'),
(40101, 'Fall', 2024, 'TTH 9:00 AM - 10:30 AM', 'Room 401', 'Arts Building', 1004, 'ENGL401'),
(50101, 'Spring', 2025, 'MWF 11:00 AM - 12:00 PM', 'Room 501', 'Business Building', 1005, 'BUS501');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Major` varchar(100) DEFAULT NULL,
  `DepartmentCode` int(11) DEFAULT NULL,
  `CollegeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `Name`, `Address`, `Nationality`, `DateOfBirth`, `Major`, `DepartmentCode`, `CollegeName`) VALUES
(10001, 'Sarah Johnson', '123 Main St', 'American', '1998-05-10', 'BUSINESS', 101, 'University of Science'),
(20001, 'Daniel Wilson', '456 Elm St', 'Canadian', '1999-08-15', 'Mathematics', 201, 'City College'),
(30001, 'Jessica Lee', '789 Oak St', 'British', '2000-02-20', 'Electrical Engineering', 301, 'Tech Institute'),
(40001, 'Ryan Martinez', '321 Pine St', 'Spanish', '1997-11-30', 'English Literature', 401, 'Liberal Arts College'),
(50001, 'Emma Taylor', '654 Cedar St', 'Australian', '1996-04-25', 'Business Administration', 501, 'Business School');

-- --------------------------------------------------------

--
-- Table structure for table `studies_in`
--

CREATE TABLE `studies_in` (
  `StudentID` int(11) NOT NULL,
  `Section_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studies_in`
--

INSERT INTO `studies_in` (`StudentID`, `Section_number`) VALUES
(10001, 10101),
(10001, 20101),
(20001, 20101),
(30001, 30101),
(40001, 40101),
(50001, 50101);

-- --------------------------------------------------------

--
-- Table structure for table `works_for`
--

CREATE TABLE `works_for` (
  `FacultyID` int(11) NOT NULL,
  `DepartmentCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works_for`
--

INSERT INTO `works_for` (`FacultyID`, `DepartmentCode`) VALUES
(1001, 101),
(1002, 201),
(1003, 301),
(1004, 401),
(1005, 501);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`CollegeName`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_number`),
  ADD KEY `DepartmentCode` (`DepartmentCode`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentCode`),
  ADD KEY `CollegeName` (`CollegeName`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyID`),
  ADD KEY `DepartmentCode` (`DepartmentCode`),
  ADD KEY `CollegeName` (`CollegeName`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`Course_number`,`DepartmentCode`),
  ADD KEY `DepartmentCode` (`DepartmentCode`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`Section_number`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `Course_number` (`Course_number`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `DepartmentCode` (`DepartmentCode`),
  ADD KEY `CollegeName` (`CollegeName`);

--
-- Indexes for table `studies_in`
--
ALTER TABLE `studies_in`
  ADD PRIMARY KEY (`StudentID`,`Section_number`),
  ADD KEY `Section_number` (`Section_number`);

--
-- Indexes for table `works_for`
--
ALTER TABLE `works_for`
  ADD PRIMARY KEY (`FacultyID`,`DepartmentCode`),
  ADD KEY `DepartmentCode` (`DepartmentCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`CollegeName`) REFERENCES `college` (`CollegeName`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`),
  ADD CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`CollegeName`) REFERENCES `college` (`CollegeName`);

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`),
  ADD CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`CollegeName`) REFERENCES `college` (`CollegeName`);

--
-- Constraints for table `studies_in`
--
ALTER TABLE `studies_in`
  ADD CONSTRAINT `studies_in_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `studies_in_ibfk_2` FOREIGN KEY (`Section_number`) REFERENCES `section` (`Section_number`);

--
-- Constraints for table `works_for`
--
ALTER TABLE `works_for`
  ADD CONSTRAINT `works_for_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `works_for_ibfk_2` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
