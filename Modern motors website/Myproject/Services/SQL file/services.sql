-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 06:06 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `services`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'e6e061838856bf47e1de730719fb2609', '2017-01-24 16:21:18', '06-03-2021 11:37:30 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'Periodic services', 'Periodic services', '2021-03-06 18:07:54', NULL),
(8, 'Denting & painting', 'Denting and painting', '2021-03-07 04:41:47', '07-03-2021 10:44:27 AM'),
(9, 'Car spa&Cleaning', 'Car spa&Cleaning', '2021-03-07 04:46:58', NULL),
(10, 'Detailing services', 'Detailing services', '2021-03-07 04:59:39', NULL),
(11, 'Batteries', 'Batteries', '2021-03-07 04:59:57', NULL),
(12, 'Tyres & wheels', 'Tyres & wheels', '2021-03-07 05:00:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 7, 14, 'Basic service', 'Modern motors', 3199, 5000, '<font size=\"3\">4 Hrs Taken</font>', 'Capture 2.JPG', 'Capture.JPG', 'Capture3.JPG', 40, 'In Stock', '2021-03-07 05:12:47', NULL),
(2, 7, 14, 'Standard services', 'Modern motors', 4199, 5559, '<font size=\"3\">6 Hrs taken</font>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 05:32:58', NULL),
(3, 7, 14, 'Comprehensive services', 'Modern motors', 7199, 9599, '<font size=\"3\">8 Hrs Taken</font>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-07 05:36:11', NULL),
(4, 7, 15, 'Front Brake discs', 'Modern motors', 2200, 2999, '<font size=\"3\">Takes 5 Hrs</font>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-07 05:40:16', NULL),
(5, 7, 15, 'Front Brake pads', 'Modern motors', 2099, 2799, '<font size=\"3\">Takes 3 Hrs</font>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-07 05:41:34', NULL),
(6, 7, 15, 'Rear Brake shoes', 'Modern motors', 2579, 3499, '<font size=\"3\">Takes 3 Hrs</font>', '9.JPG', '10.JPG', '10.JPG', 40, 'In Stock', '2021-03-07 05:42:48', NULL),
(7, 7, 15, 'Disc Turning', 'Modern motors', 899, 1119, '<font size=\"3\">Takes 4 Hrs</font>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-07 05:43:49', NULL),
(8, 8, 16, 'Front Bumper', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 05:48:25', NULL),
(9, 8, 16, 'Front Bumper', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 06:03:09', NULL),
(10, 8, 16, 'Bonnet', 'Modern motors', 2400, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-07 06:04:14', NULL),
(11, 8, 17, 'Rear Bumper', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-07 06:05:55', NULL),
(12, 8, 17, 'Boot paint', 'Modern motors', 2499, 3199, 'Takes 24 Hrs', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-07 06:06:59', NULL),
(13, 8, 18, 'Full body dent paint', 'Modern motors', 28000, 37299, '<font size=\"3\">Takes 8 Days</font>', '9.JPG', '10.JPG', '10.JPG', 40, 'In Stock', '2021-03-07 06:08:57', NULL),
(14, 8, 17, 'Alloy paint', 'Modern motors', 1299, 1799, '<font size=\"3\">Takes 24 Hrs</font>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-07 06:10:47', NULL),
(15, 8, 19, 'Left Fender Paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-07 06:12:06', NULL),
(16, 8, 19, 'Left Front door paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '15.JPG', '16.JPG', '16.JPG', 40, 'In Stock', '2021-03-07 06:13:40', NULL),
(17, 8, 19, 'Left Rear door paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '17.JPG', '18.JPG', '18.JPG', 40, 'In Stock', '2021-03-07 06:15:18', NULL),
(18, 8, 19, 'Left Quarter panel paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '19.JPG', '20.JPG', '20.JPG', 40, 'In Stock', '2021-03-07 06:16:40', NULL),
(19, 8, 19, 'Left Running Board Paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '21.JPG', '22.JPG', '22.JPG', 40, 'In Stock', '2021-03-07 06:18:43', NULL),
(20, 8, 20, 'Right Fender Paint', 'Modern motors', 2499, 3199, 'Takes 24 Hrs', '23.JPG', '24.JPG', '24.JPG', 40, 'In Stock', '2021-03-07 06:19:59', NULL),
(21, 8, 20, 'Right Front door paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '25.JPG', '26.JPG', '26.JPG', 40, 'In Stock', '2021-03-07 06:22:04', NULL),
(22, 8, 20, 'Right Rear door paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '27.JPG', '28.JPG', '28.JPG', 40, 'In Stock', '2021-03-07 06:24:05', NULL),
(23, 8, 20, 'Right Quarter panel paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '29.JPG', '30.JPG', '30.JPG', 40, 'In Stock', '2021-03-07 06:25:02', NULL),
(24, 8, 20, 'Right Running Board paint', 'Modern motors', 2499, 3199, '<font size=\"3\">Takes 24 Hrs</font>', '40.JPG', '41.JPG', '41.JPG', 40, 'In Stock', '2021-03-07 06:26:11', NULL),
(25, 9, 21, 'Car Interior spa', 'Modern motors', 1399, 1899, '<font size=\"3\">Takes 6 Hrs</font>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 10:06:23', NULL),
(26, 9, 21, 'Deep all round spa', 'Modern motors', 2099, 2799, '<font size=\"3\">Takes 8 Hrs</font>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-07 10:07:47', NULL),
(27, 9, 21, 'Rat / Pest Repellent Treatment', 'Modern motors', 1600, 2199, '<font size=\"3\">Takes 3 Hrs</font>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-07 10:12:07', NULL),
(28, 9, 21, 'Sunroof Service ', 'Modern motors', 2599, 3499, '<font size=\"3\">Takes 8 Hrs</font>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-07 10:14:48', NULL),
(29, 9, 22, 'Avery PPF - Paint protection film', 'Modern motors', 54199, 73199, '<font size=\"3\">Takes 4 days</font>', '9.JPG', '10.JPG', '10.JPG', 40, 'In Stock', '2021-03-07 10:22:07', NULL),
(30, 9, 22, 'Silencer Coating', 'Modern motors', 1699, 2290, '<font size=\"3\">Takes 6 Hrs</font>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-07 10:23:33', NULL),
(31, 9, 23, 'Car inspection/Diagnostics', 'Modern motors', 499, 699, '<font size=\"3\">Takes 4 hrs</font>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-07 10:26:08', NULL),
(32, 10, 24, '3M ceramic coating', 'Modern motors', 18999, 25299, '<font size=\"3\">Takes 3 days</font>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 10:35:30', NULL),
(33, 10, 24, '3M car rubbing & polishing', 'Modern motors', 3999, 5399, '<font size=\"3\">Takes 6 hrs</font>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-07 10:37:28', NULL),
(34, 10, 24, '3M Teflon coating', 'Modern motors', 4499, 6699, '<font size=\"3\">Takes 24 hrs</font>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-07 10:39:06', NULL),
(35, 10, 24, '3M Anti Rust underbody coating', 'Modern motors', 3999, 5399, '<font size=\"3\">Takes 24 hrs</font>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-07 10:40:38', NULL),
(36, 10, 25, 'Meguiars ceramic coating', 'Modern motors', 19999, 26599, 'Takes 3 days', '9.JPG', '10.JPG', '10.JPG', 40, 'In Stock', '2021-03-07 10:42:48', NULL),
(37, 10, 25, 'Meguiars Teflon coating', 'Modern motors', 6499, 8699, '<font size=\"3\">Takes 24 hrs</font>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-07 10:44:49', NULL),
(38, 11, 26, 'Amaron(44 months waranty)', 'Modern motors', 3600, 4700, '<br>', '1.JPG', '3.JPG', '1.JPG', 40, 'In Stock', '2021-03-07 10:49:34', NULL),
(39, 11, 26, 'Amaron(55 months waranty)', 'Modern motors', 3800, 5054, '<br>', '1.JPG', '4.JPG', '1.JPG', 40, 'In Stock', '2021-03-07 10:50:33', NULL),
(40, 11, 26, 'Exide(44 months waranty)', 'Modern motors', 3999, 5318, '<br>', '2.JPG', '3.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 10:51:31', NULL),
(41, 11, 26, 'Exide(55 months waranty)', 'Modern motors', 4199, 5584, '<br>', '2.JPG', '4.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 10:52:32', NULL),
(42, 12, 27, 'GoodYear Duraplus', 'Modern motors', 4286, 5799, '<br>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-07 11:03:12', NULL),
(43, 12, 27, 'Apollo Alnac 4Gs', 'Modern motors', 4100, 5799, '<br>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-07 11:04:51', NULL),
(44, 12, 27, 'MRF ZVTV', 'Modern motors', 4850, 6499, '<br>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-07 11:05:33', NULL),
(45, 12, 27, 'JK UX ROYALE', 'Modern motors', 4864, 6499, '<br>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-07 11:07:07', NULL),
(46, 12, 27, 'Bridgestone B290', 'Modern motors', 5299, 6999, '<br>', '9.JPG', '10.JPG', '10.JPG', 40, 'In Stock', '2021-03-07 11:08:24', NULL),
(47, 12, 27, 'Bridgestone B250', 'Modern motors', 5300, 7099, '<br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-07 11:09:12', NULL),
(48, 12, 28, 'Complete wheel care', 'Modern motors', 1549, 2099, '<br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-07 11:10:08', NULL),
(49, 12, 28, 'Mud flaps', 'Modern motors', 899, 1099, '<br>', '15.JPG', '16.JPG', '16.JPG', 40, 'In Stock', '2021-03-07 11:10:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(14, 7, 'Scheduled packages', '2021-03-07 04:40:34', NULL),
(15, 7, 'Brake maintenance', '2021-03-07 04:41:06', NULL),
(16, 8, 'Front side', '2021-03-07 04:42:00', NULL),
(17, 8, 'Rear side', '2021-03-07 04:42:08', NULL),
(18, 8, 'Whole body', '2021-03-07 04:42:27', NULL),
(19, 8, 'Left side', '2021-03-07 04:42:43', NULL),
(20, 8, 'Right side', '2021-03-07 04:43:09', NULL),
(21, 9, 'Spa', '2021-03-07 04:48:59', '07-03-2021 11:57:51 AM'),
(22, 9, 'Coating', '2021-03-07 04:49:23', NULL),
(23, 9, 'Inspection', '2021-03-07 04:50:10', '07-03-2021 11:58:15 AM'),
(24, 10, '3M services', '2021-03-07 05:01:07', NULL),
(25, 10, 'Meguiars services', '2021-03-07 05:01:35', NULL),
(26, 11, 'Battery replacement', '2021-03-07 05:02:02', NULL),
(27, 12, 'Tyres replacement', '2021-03-07 05:02:24', NULL),
(28, 12, 'Wheel care services', '2021-03-07 05:02:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
