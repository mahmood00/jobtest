-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2016 at 03:00 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_b`
--

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `TourId` int(11) NOT NULL,
  `TourName` varchar(255) COLLATE utf8_bin NOT NULL,
  `TourCode` int(11) NOT NULL,
  `Country` varchar(255) COLLATE utf8_bin NOT NULL,
  `City` varchar(255) COLLATE utf8_bin NOT NULL,
  `Price` float NOT NULL,
  `Image` varchar(255) COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL,
  `Description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`TourId`, `TourName`, `TourCode`, `Country`, `City`, `Price`, `Image`, `Date`, `Description`) VALUES
(1, 'tour name 99', 199, 'uea', 'dubai', 1660, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(2, 'tour name 200', 2152, 'uea', 'dubai', 4040, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(3, 'tour name 540', 979, 'uea', 'dubai', 600, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(4, 'tour name 650', 599, 'uea', 'dubai', 5010, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(5, 'tour name 800', 1529, 'uea', 'dubai', 450, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(6, 'tour name 88', 5297, 'uea', 'dubai', 1520, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(7, 'tour name 555', 5555, 'uea', 'tulkarem', 2558, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(8, 'tour name 888', 888, 'uea', 'nablus', 6560, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour 888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`TourId`),
  ADD UNIQUE KEY `TourCode` (`TourCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `TourId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
