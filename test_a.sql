-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2016 at 02:44 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_a`
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
(1, 'tour name 1', 123, 'uea', 'dubai', 100, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(2, 'tour name 2', 1234, 'uea', 'dubai', 8660, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(3, 'tour name 3', 1235, 'uea', 'dubai', 1040, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(4, 'tour name 4', 111, 'uea', 'dubai', 100, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(5, 'tour name 5', 222, 'uea', 'dubai', 1010, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(6, 'tour name 6', 333, 'uea', 'dubai', 200, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(10, 'tour name 7', 443, 'uea', 'dubai', 9000, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour tour tour'),
(11, 'tour name 560', 1237904, 'ps', 'tulkarem', 879660, 'http://estaticos2.catai.es/content/media/fotos/samples/large/palm-island-dubai.jpg', '2016-02-16', 'tour tour here');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `api_key` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `api_key`) VALUES
(17, 'mahmood1', 'mahmood1@gmail.com', '0e7253516cc1cffa1e8f5b16a2ace725', '4421583be86607c12c02d92047602651fe1204246ffdd4596c4bbfec450c7fa0'),
(18, 'mahmood', 'mahmood@gmail.com', '44ab1370eb802e0fd277ebf9be94547b', '3e80feeab25af50477ec0c6f9a9fbfe254814faf6ab5ebf1f926d268013ecfdb'),
(19, 'mahmood2', 'mahmood2@gmail.com', 'df3b7d148efafe962303bf33c5665342', 'ad4289f55b8e5cbf9e8d85c0badd193878d644f3372186574396ffcce3fe99a2');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `TourId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
