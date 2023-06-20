-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2022 at 02:37 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshopjsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userid` varchar(30) NOT NULL,
  `prodid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`userid`, `prodid`, `qty`) VALUES
('abhi@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(11) NOT NULL,
  `catname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `catname`) VALUES
(1, 'Architecture'),
(2, 'Art And Culture'),
(3, 'Forest'),
(4, 'Sports'),
(5, 'Astrology'),
(6, 'Business'),
(7, 'Economics'),
(8, 'Tourism'),
(9, 'Yoga'),
(10, 'Religion'),
(11, 'Management'),
(12, 'Terrorism'),
(16, 'Computer'),
(18, 'Science'),
(19, 'Law books'),
(20, 'Competitive Exam');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `msgDate` timestamp NULL DEFAULT current_timestamp(),
  `isRead` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cust_address`
--

CREATE TABLE `cust_address` (
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobile` char(10) NOT NULL,
  `pin` char(8) NOT NULL,
  `locality` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `adtype` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cust_address`
--

INSERT INTO `cust_address` (`userid`, `name`, `mobile`, `pin`, `locality`, `state`, `city`, `address`, `adtype`) VALUES
('abhi@gmail.com', 'Abhishek Pandey', '1234567890', '462020', 'Narela Sanakri', 'Madhya Pradesh', 'Bhopal', 'Narela Sankari Bhopal MP', 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `feedbackDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `username`, `contact`, `email`, `address`, `description`, `feedbackDate`) VALUES
(1, 'Abhishek', '1234567890', 'abhi@gmail.com', 'Narela Sankari Bhopal', 'your Service are very good', '2022-04-10 17:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT current_timestamp(),
  `userid` varchar(30) NOT NULL,
  `order_status` varchar(200) NOT NULL DEFAULT 'Pending',
  `remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `orderdate`, `userid`, `order_status`, `remarks`) VALUES
(1, '2022-04-10 17:30:52', 'abhi@gmail.com', 'Confirmed', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderview`
-- (See below for the actual view)
--
CREATE TABLE `orderview` (
`order_id` int(11)
,`orderdate` datetime
,`pname` varchar(100)
,`disc_price` decimal(16,2)
,`qty` int(11)
,`amount` decimal(26,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `prodid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `prodid`, `qty`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `pcat` varchar(20) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `disc_price` decimal(16,2) NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  `remarks` varchar(20) NOT NULL,
  `descr` text NOT NULL,
  `instock` varchar(20) DEFAULT 'In Stock',
  `featured` varchar(5) NOT NULL DEFAULT 'Yes',
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodid`, `pname`, `pcat`, `price`, `disc_price`, `photo`, `remarks`, `descr`, `instock`, `featured`, `create_date`) VALUES
(1, 'Indian Art and Culture', 'Art And Culture', '250.00', '250.00', '1.jpg', '0', 'For Civil and other Competative Exam', 'In Stock', 'Yes', '2022-04-10 16:30:39'),
(2, 'Indian art and Culture By Nitin Singhaniya', 'Art And Culture', '1500.00', '500.00', '2.jpg', '0', 'For UPSC and State civil Service Examination', 'In Stock', 'Yes', '2022-04-10 16:35:27'),
(3, 'Indian Heritage Art and Culture', 'Art And Culture', '1200.00', '1000.00', '3.jpg', '0', 'For civil service preliminary and mains Examination', 'In Stock', 'Yes', '2022-04-10 16:36:50'),
(4, 'The Sports Book', 'Sports', '500.00', '350.00', '4.jpg', '0', 'Its the sport buff\'s bible', 'In Stock', 'Yes', '2022-04-10 16:39:03'),
(5, 'The Enemy Sports', 'Sports', '1500.00', '1200.00', '5.jpg', '0', 'If you like football read it', 'In Stock', 'Yes', '2022-04-10 16:41:37'),
(6, 'Astrology Easy to Learn', 'Astrology', '1200.00', '1000.00', '6.jpg', '0', 'Astrology Easy to Learn All In One', 'In Stock', 'Yes', '2022-04-10 16:44:21'),
(7, 'Astrologer of the Moon', 'Astrology', '1050.00', '850.00', '7.jpg', '0', 'Astrology of the Moon by Herring', 'In Stock', 'Yes', '2022-04-10 16:45:53'),
(8, 'Work of the System', 'Business', '450.00', '350.00', '8.jpg', '0', 'The Simple mechanics of making more and working less\r\n', 'In Stock', 'Yes', '2022-04-10 16:52:04'),
(9, 'Better Business Book', 'Business', '650.00', '550.00', '9.jpg', '0', 'the Better Business Book', 'In Stock', 'Yes', '2022-04-10 16:53:17'),
(10, 'The Iconic House', 'Architecture', '750.00', '350.00', '10.jpg', '0', 'The iconic house', 'In Stock', 'Yes', '2022-04-10 16:55:14'),
(11, 'Frank Lyord Wright', 'Architecture', '750.00', '650.00', '11.jpg', '0', 'This is the Frank Lyord Wright', 'In Stock', 'Yes', '2022-04-10 16:56:50'),
(12, 'The Forest', 'Forest', '650.00', '500.00', '12.jpg', '0', 'The Forest is the best book for gain the knowledge', 'In Stock', 'Yes', '2022-04-10 17:55:39'),
(13, 'National Best The Forest', 'Forest', '450.00', '350.00', '13.jpg', '0', 'Best Book', 'In Stock', 'Yes', '2022-04-10 17:56:44'),
(14, 'ISC Economics', 'Economics', '520.00', '450.00', '14.jpg', '0', 'UnderStanding I.sc Economics book', 'In Stock', 'Yes', '2022-04-10 17:59:14'),
(15, 'Indian Economics Book', 'Economics', '230.00', '200.00', '15.jpg', '30', 'Best Book for Indian Economics book', 'In Stock', 'Yes', '2022-04-10 18:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `firstname`, `lastname`, `password`, `email`, `contact`, `city`, `address`, `img`) VALUES
(1, 'Abhishek', 'Pandey', '1234', 'abhi@gmail.com', '1234567899', 'Bhopal', 'Narela Sankari Bhopal', '1.jpg');

-- --------------------------------------------------------

--
-- Structure for view `orderview`
--
DROP TABLE IF EXISTS `orderview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderview`  AS SELECT `o`.`order_id` AS `order_id`, `od`.`orderdate` AS `orderdate`, `p`.`pname` AS `pname`, `p`.`disc_price` AS `disc_price`, `o`.`qty` AS `qty`, `p`.`disc_price`* `o`.`qty` AS `amount` FROM ((`order_details` `o` join `products` `p` on(`p`.`prodid` = `o`.`prodid`)) join `orders` `od` on(`od`.`order_id` = `o`.`order_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userid`,`prodid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `cust_address`
--
ALTER TABLE `cust_address`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
