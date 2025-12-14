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
-- Database: `shopping`
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
(1, 'admin', 'e6e061838856bf47e1de730719fb2609', '2017-01-24 16:21:18', '27-02-2021 05:21:00 PM');

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
(3, 'Lubricants', 'Oil used for cars', '2017-01-24 19:17:37', '14-02-2021 12:11:49 AM'),
(4, 'Light bulbs', 'Exterior light bulbs', '2021-02-27 13:02:02', '28-02-2021 06:35:24 PM'),
(5, 'Filters', 'Filters for cars', '2021-02-28 13:05:04', NULL),
(6, 'Windscreen wipers&parts', 'To wipe the cars', '2021-02-28 13:45:51', NULL),
(7, 'Tool Kit & Jack', 'Tools used for repairing\r\nJack used for lifting the machine', '2021-03-06 06:56:34', '06-03-2021 12:33:20 PM'),
(9, 'Wheels', 'Used in cars', '2021-03-06 07:07:38', NULL);

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
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', 'Delivered'),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 4, '3', 1, '2021-02-12 07:15:33', 'Debit / Credit card', NULL);

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
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 1, 'Delivered', 'Good', '2021-02-13 17:48:46');

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
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19'),
(5, 21, 3, 2, 2, 'sanjana', 'it was ok', 'good', '2021-02-13 18:03:06');

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
(21, 3, 14, 'Motul 104103 7100 4T Fully Synthetic 20W-50 Petrol Engine Oil for Bikes (1 L)', 'Motul', 726, 1029, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility: KTM Duke 200 / Bajaj Pulsar 200 NS, Pulsar 220, Pulsar 180, Pulsar 150, Avenger 220 DTS-i</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">100% Synthetic with ester 4-Stroke engine oil. Formulated to meet the newest in motorcycle manufacturer specifications in terms of JASO and API. Designed with the perfect synergy for less oil consumption, reduced engine internal friction and extreme pressure performance, for more power</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Viscosity: 20W-50 - Oil Type : Synthetic petrol engine oil</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">JASO MA2 ensure optimum clutch performace at start-up, acceleration and full speed</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">API SN provide improved high temperature deposit protection for more stringent sludge control</span></li></ul>', 'm1.jpg', 'm2.jpg', 'm3.jpg', 40, 'In Stock', '2021-02-27 12:11:25', NULL),
(22, 3, 14, 'Motul 7100 4T 10W-50 API SN Fully Synthetic Petrol Engine Oil for Bikes (1.5 L)', 'Motul', 1037, 1500, '<div id=\"twister_feature_div\" class=\"celwidget\" data-feature-name=\"twister\" data-csa-c-id=\"m62gps-8d9v84-jjxcr6-lzzh03\" data-cel-widget=\"twister_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><div id=\"twisterContainer\" class=\"addTwisterMargin\" style=\"box-sizing: border-box; max-width: none;\"><div class=\"a-section\" style=\"box-sizing: border-box; margin-bottom: 0px;\"><form id=\"twister\" method=\"post\" action=\"https://www.amazon.in/gp/product/handle-buy-box/ref=dp_start-bbf_1_glance\" class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><div id=\"variation_size_name\" class=\"a-section a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 22px;\"><div class=\"a-row a-spacing-micro singleton\" style=\"box-sizing: border-box; width: 378.969px; margin-bottom: 4px !important;\"><label class=\"a-form-label\" style=\"box-sizing: border-box; display: inline; padding-left: 2px; padding-bottom: 2px; color: rgb(85, 85, 85);\">Size:&nbsp;</label><span class=\"selection\" style=\"box-sizing: border-box; font-weight: 700;\">1.5L</span>&nbsp;<span class=\"a-text-beside-button\" style=\"box-sizing: border-box; display: inline-block; position: relative; top: 0px !important; padding: 4px 0px 0px 6px;\"><span class=\"a-declarative\" data-action=\"a-modal\" data-a-modal=\"{&quot;name&quot;:&quot;g2s2SizeChartView&quot;,&quot;url&quot;:&quot;/gp/product/ajax-handlers/apparel-sizing-chart.html/ref=dp_sizechart?ie=UTF8&amp;asin=B075T31GQC&amp;isUDP=1&amp;height=338&quot;,&quot;width&quot;:&quot;800&quot;,&quot;header&quot;:&quot;Size Chart&quot;}\" id=\"size-chart-popover\" style=\"box-sizing: border-box;\"></span></span></div></div><div id=\"variation_pattern_name\" class=\"a-section a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 0px;\"><div class=\"a-row a-spacing-micro singleton\" style=\"box-sizing: border-box; width: 378.969px; margin-bottom: 4px !important;\"><label class=\"a-form-label\" style=\"box-sizing: border-box; display: inline; padding-left: 2px; padding-bottom: 2px; color: rgb(85, 85, 85);\">Design:&nbsp;</label><span class=\"selection\" style=\"box-sizing: border-box; font-weight: 700;\">Engine Oil</span></div></div></form></div></div></div><div id=\"valueAdds_feature_div\" class=\"celwidget\" data-feature-name=\"valueAdds\" data-csa-c-id=\"fi67fo-vwpgrw-gli29s-17huue\" data-cel-widget=\"valueAdds_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"></div><div id=\"clickToContact_feature_div\" class=\"celwidget\" data-feature-name=\"clickToContact\" data-csa-c-id=\"ybvh9m-mbwoff-x9tol3-cmf8q3\" data-cel-widget=\"clickToContact_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"></div><div id=\"renewedProgramDescriptionAtf_feature_div\" class=\"celwidget\" data-feature-name=\"renewedProgramDescriptionAtf\" data-csa-c-id=\"h3pm0j-vmr8wd-4h2xj6-z9s91j\" data-cel-widget=\"renewedProgramDescriptionAtf_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"></div><div id=\"productOverview_feature_div\" class=\"celwidget\" data-feature-name=\"productOverview\" data-csa-c-id=\"8jfp4a-vf8va7-dxa1j8-o0s24z\" data-cel-widget=\"productOverview_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><div class=\"a-section a-spacing-small a-spacing-top-small\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 8px !important;\"><table class=\"a-normal a-spacing-micro\" style=\"width: 378px; margin-bottom: 4px !important;\"><tbody style=\"box-sizing: border-box;\"><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Viscosity</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">10W-50</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Motul</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Liquid Volume</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1500 Millilitres<br><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility: Bajaj- Pulsar/ Dominar,DSK Benelli,DSK Hyosung,Harley Davidson 883,Harley Davidson Street 750,Harley Davidson Forty Eight,Triumph, Yamaha- FZ, Royal Enfield Classic,Royal Enfield Standard,Royal Enfield Thunderbird,Royal Enfield Continental,Royal Enfield Himalayan, KTM 200/KTM 390/ KTM 250</span></li></ul></span></td></tr></tbody></table></div></div>', 'motul 7100.jpg', 'motul 7100(1).jpg', 'motul 7100(1).jpg', 40, 'In Stock', '2021-02-27 12:15:03', NULL),
(23, 3, 14, 'Castrol MAGNATEC Diesel 15W-40 API SN Part-Synthetic Engine Oil for Diesel Cars (0.5 L) (2021/8K)', 'Castrol', 800, 1000, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility:Hyundai Creta without DPF(Diesel),Hyundai Grand i10(Diesel),Hyundai i20(Diesel),Hyundai Verna without DPF(Diesel),Hyundai Xcent(Diesel),Mahindra Scorpio(Diesel),Mahindra XUV500(Diesel),Mahindra Xylo(Diesel),Mahindra Bolero(Diesel),Mahindra TUV300(Diesel),Mahindra KUV100(Diesel),Renault DUSTER(Diesel),Renault Kwid(Diesel),Tata Indica Vista(Diesel),Tata Indigo(Diesel),Tata Safari(Diesel),Tata Manza(Diesel)</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Intelligent molecules cling to metal surfaces giving extra protection against engine wear</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Dedicated diesel technology maintains engine efficiency and responsiveness</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Provides excellent soot handling performance thus minimising oil thickening</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Exceeds the most demanding limits in the latest industry standard diesel protection test</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Suitable for naturally aspirated, turbocharged and inter-cooled turbocharged engines and also suitable for direct and indirect injection diesel engines</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Not recommended for heavy commercial vehicle application or vehicles fitted with diesel particulate filters</span></li></ul>', 'castrol.jpg', 'castrol.jpg', 'castrol.jpg', 40, 'In Stock', '2021-02-27 12:17:21', NULL),
(24, 3, 14, 'Mobil 1 Super 3000 Formula I 5W-40 Fully Synthetic Engine Oil (3.5 L)', 'Mobil Super', 1583, 2033, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Premium Synthetic Engine Oil</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Series: Super 3000</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Viscosity: 5W-40</span></li></ul>', 'mobil super 1.jpg', 'mobil super 2.jpg', 'mobil super 3.jpg', 40, 'In Stock', '2021-02-27 12:19:19', NULL),
(25, 3, 14, 'Shell Helix HX8 5W-30 API SN Plus/SN, ACEA A3/B4 Fully Synthetic Engine Oil for Cars (3.5 L)', 'Shell Helix ', 1643, 2149, '<table class=\"a-normal a-spacing-micro\" style=\"width: 378px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 4px !important;\"><tbody style=\"box-sizing: border-box;\"><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Shell</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Vehicle Service Type</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Car</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Flash Point</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">244 Degrees Celsius</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Liquid Volume</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">3.5 Litres</span></td></tr></tbody></table>', 'shell helix.jpg', 'shell helix.jpg', 'shell helix.jpg', 40, 'In Stock', '2021-02-27 12:21:27', NULL),
(26, 3, 14, 'Liqui Moly 10W50 Street Race Fully Synthetic Engine Oil (1 Litre) (LM002)', 'Liqui Moly', 1273, 1513, '<table class=\"a-normal a-spacing-micro\" style=\"width: 378px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 4px !important;\"><tbody style=\"box-sizing: border-box;\"><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Viscosity</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">10W-50</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Liqui Moly</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 99px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Liquid Volume</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 279px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1 Litres<br><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Fully Synthetic</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">For air and water-cooled 4-stroke engines.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Suitable for engines with or without a wet clutch.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">For sporting applications.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">For normal to extreme operating conditions.</span></li></ul></span></td></tr></tbody></table>', '61Ze97liocL._SL1000_.jpg', '717-QRCReaL._SL1000_.jpg', '717-QRCReaL._SL1000_.jpg', 40, 'In Stock', '2021-02-27 12:23:47', NULL),
(27, 4, 15, 'AllExtreme EX31SDW 10 LED Universal Car Interior Super Bright Roof Light Reading Dome Bulb Lamp with Festoon Holder (5W, White, 2 PCS)', 'AllExtreme', 119, 209, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">DIRECT REPLACEMENT â€“ AllExtreme 10 LED dome lights are perfect for direct replacement in all festoon connector type sockets of almost all cars. NOT SUITABLE FOR ROYAL ENFIELD MODELS BEFORE 2012. Common use for interior and exterior of Car, Truck, Trailer, SUV, Bus, Emergency Vehicles, Boat, Marine Vessels, etc.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">ADD A COOL AND ROMANTIC FEEL - AllExtreme Festoon LED Lights have soft and warm glow that illuminates a fairly large area. These lights are perfect for use in an assorted range of vehicle applications such as vanity lights, dome lights, map lights, dashboard lights and trunk lights. An ideal choice to replace a variety of traditional halogen or incandescent bulbs including stock.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">MINIMAL POWER CONSUMPTION - Thanks to its high energy efficient LED Dome bulbs that can easily replace by stock bulbs to have the same amount of light output, but still saving your operational costs. Also, it has a higher 30, 000 Hours lifespan, so with AllExtreme Car Roof Lamp you are even free from the cost of frequent bulb replacements.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">TOP-NOTCH QUALITY â€“ AllExtreme Roof LED Lamp Bulbs feature premium grade components that are well-tested under extreme conditions. Besides, these LED lights have integrated overload and over-temperature protection for years of worry free use. Superior quality product manufactured in tandem with the latest technology by AllExtreme.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">COMPACT DESIGN &amp; EASY INSTALLATION: Featured with dome shaped design at both ends along with festoon connectors this multi-purpose LED light is easy to install. You just need to plug into existing dome light bulb socket (easily detachable circuit) with care.In case of doubt or difficulty you can also take help of any professional or expert.</span></li></ul>', '1.jpg', '2.jpg', '3.jpg', 40, 'In Stock', '2021-02-27 13:14:34', NULL),
(28, 4, 15, 'Osram LED T10 2825DW-02B Parking Lamp (12V, 1W)', 'Osram', 350, 556, '<table class=\"a-normal a-spacing-micro\" style=\"width: 482px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255); margin-bottom: 4px !important;\"><tbody style=\"box-sizing: border-box;\"><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 126px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 356px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Osram</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 126px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brightness</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 356px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">6000 Lumen</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 126px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Vehicle Service Type</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 356px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Universal</span></td></tr><tr class=\"a-spacing-small\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\"><td class=\"a-span3\" style=\"vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 126px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Fit Type</span></td><td class=\"a-span9\" style=\"vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 356px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Universal Fit<br><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility (Head Lamp): All Models</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Up to 100 percent more light than a standard bulb</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">6000K cool white daylight colour appearance</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Up to 80 percent more environmentally friendly than standard bulbs</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Latest optical diffuser material gives the best light performance</span></li></ul></span></td></tr></tbody></table>', '4.jpg', '5.jpg', '6.jpg', 40, 'In Stock', '2021-02-27 13:16:56', NULL),
(29, 4, 15, 'AllExtreme EXT106W Universal T10 LED Parking Light 6 SMD Super Bright Interior Pilot License Plate Dome Indicator Lamp Bulb for Car Bike and Motorcycle (2W, White, 2 PCS)', 'AllExtreme ', 119, 259, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">DIRECT REPLACEMENT â€“ AllExtreme T10 LED lights are perfect for direct replacement in all T10 Wedge type sockets of almost all motorcycles and cars. NOT SUITABLE FOR ROYAL ENFIELD MODELS BEFORE 2012. Common use for interior and exterior of Motorcycle, Scooter, Car, Truck, Trailer, RV, Boat, Marine, etc.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">ADD A COOL AND ROMANTIC FEEL - AllExtreme T10 LED Lights have soft and warm glow that illuminates a fairly large area. These lights are perfect for use in an assorted range of vehicle applications such as parking lights, vanity lights, dome lights, map lights, dashboard lights and trunk lights. An ideal choice to replace a variety of traditional halogen or incandescent bulbs including stock.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">MINIMAL POWER CONSUMPTION - Thanks to its high energy efficient T10 LED bulbs that can easily replace by stock bulbs to have the same amount of light output, but still saving your operational costs. Also, it has a higher 30, 000 Hours lifespan, so with AllExtreme T10 LED Lights you are even free from the cost of frequent bulb replacements.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">TOP-NOTCH QUALITY â€“ AllExtreme T10 LED Bulbs feature premium grade components that are well-tested under extreme conditions. Besides, these LED lights have integrated overload and over-temperature protection for years of worry free use. Superior quality product manufactured in tandem with the latest technology by AllExtreme.</span></li></ul>', '7.jpg', '8.jpg', '9.jpg', 40, 'In Stock', '2021-02-27 13:18:28', NULL),
(30, 4, 15, 'AllExtreme EXT15CW Universal T10 LED Parking Light 5630 CMD Super Bright Interior Pilot License Plate Dome Indicator Lamp Bulb for Car Bike and Motorcycle (3W, White, 2 PCS)', 'AllExtreme', 119, 350, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">DIRECT REPLACEMENT â€“ AllExtreme T10 LED lights are perfect for direct replacement in all T10 Wedge type sockets of almost all motorcycles and cars. NOT SUITABLE FOR ROYAL ENFIELD MODELS BEFORE 2012. Common use for interior and exterior of Motorcycle, Scooter, Car, Truck, Trailer, RV, Boat, Marine, etc.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">ADD A COOL AND ROMANTIC FEEL - AllExtreme T10 LED Lights have soft and warm glow that illuminates a fairly large area. These lights are perfect for use in an assorted range of vehicle applications such as parking lights, vanity lights, dome lights, map lights, dashboard lights and trunk lights. An ideal choice to replace a variety of traditional halogen or incandescent bulbs including stock.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">MINIMAL POWER CONSUMPTION - Thanks to its high energy efficient T10 LED bulbs that can easily replace by stock bulbs to have the same amount of light output, but still saving your operational costs. Also, it has a higher 30, 000 Hours lifespan, so with AllExtreme T10 LED Lights you are even free from the cost of frequent bulb replacements.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">TOP-NOTCH QUALITY â€“ AllExtreme T10 LED Bulbs feature premium grade components that are well-tested under extreme conditions. Besides, these LED lights have integrated overload and over-temperature protection for years of worry free use. Superior quality product manufactured in tandem with the latest technology by AllExtreme.</span></li></ul>', '10.jpg', '11.jpg', '12.jpg', 40, 'In Stock', '2021-02-27 13:21:19', NULL),
(31, 4, 15, 'Osram Rallye H4 Halogen 62204 Exterior Headlight Bulb (12V, 100/90W, 2 Bulbs)', 'Osram Rallye', 380, 550, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Compatible with all major 4 wheeler brands</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Higher wattage of 100/90w gives more brightness and longer beam on the road</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Helps to drive safely on low lit road</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Requires a relay to withstand 100/90w easily available with mechanics</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Made in germany with high quality and precision</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Country of Origin: Germany</span></li></ul>', '13.jpg', '13.jpg', '13.jpg', 40, 'In Stock', '2021-02-28 12:49:13', NULL),
(32, 4, 15, 'Auto Hub Waterproof 8 LED Red Blue Police Flashing Light for All Cars', 'Auto Hub ', 599, 700, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Number of LED: 8. Output power: 8W. Voltage: DC-12V</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Made From Good Quality Metallic Material Which Makes Product Durability.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Light within the frame 4 by 19 by 5 cm line stretching before 60 cm pulled up to 3 meters</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Easy to Install and Operate.</span></li></ul>', '14.jpg', '15.jpg', '16.jpg', 40, 'In Stock', '2021-02-28 12:51:04', NULL),
(33, 5, 18, 'ZIP Cabin Filter Polo/Vento/Rapid', 'ZIP', 302, 400, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatability: Skoda| Volkswagen Polo, Rapid, Vento</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Custom: designed for a direct-replacement fit; no rewiring soldering or splicing required.|Type: N/A</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Easy to install</span></li></ul>', '31uS-QiP3BL.jpg', '31uS-QiP3BL.jpg', '31uS-QiP3BL.jpg', 40, 'In Stock', '2021-02-28 13:10:27', NULL),
(34, 5, 18, 'AutoPop Off-white Zip Cabin/ac Filter for Toyota Innova Crysta', 'AutoPop', 395, 500, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Autopop brand is solely sold by auto wheel garage. Any other seller is not genuine. Please select correct seller.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Package contents: 1 x zip cabin/ac filter for Toyota Innova Crysta</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Colour: Off-white</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle compatibility: For Toyota Innova Crysta</span></li></ul>', '51UWYPEa8jL.jpg', '716a5Q0iQrL._SL1500_.jpg', '71ex5ZKrBUL._SL1368_.jpg', 40, 'In Stock', '2021-02-28 13:12:43', NULL),
(35, 5, 18, 'AutoPop Off-white Zip Cabin/ac Filter for Hyundai Grand I10', 'AutoPop', 395, 559, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Autopop brand is solely sold by auto wheel garage. Any other seller is not genuine. Please select correct seller.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Package contents: 1 x zip cabin/ac filter for Hyundai grand i10</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Colour: Off-white</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle compatibility: For Hyundai grand i10</span></li></ul>', '51UWYPEa8jL.jpg', '716a5Q0iQrL._SL1500_.jpg', '71ex5ZKrBUL._SL1368_.jpg', 40, 'In Stock', '2021-02-28 13:18:29', NULL),
(36, 5, 18, 'Prana Air Anti-Pollution Car Cabin Filter of PM2.5, HEPA and Activated Carbon for Toyota Car (Corolla Altis)', 'Prana Air', 1990, 2550, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">âœ… CAR CABIN FILTER: Anti-Pollution Filter With HEPA &amp; Activated Carbon Purifying PM2.5</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">âœ… FILTER LAYERS: It consists of 5 different layers.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">âœ… EFFICIENCY: Its purification efficiency is 99.95%.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">âœ… PROTECTION: It blocks a high concentration of dust and dirt particles, pollen and second hand smoke from entering your lungs.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">âœ… PURIFICATION: The oxygen generating molecular sieve produces fresh, new oxygen. The catalyst removes the HCHO to improve the quality of the air.</span></li></ul>', '71bL+jx+jHL._SL1500_.jpg', '61xmmOwCMSL._SL1500_.jpg', '71ApmjPwjVL._SL1500_.jpg', 40, 'In Stock', '2021-02-28 13:20:08', NULL),
(37, 5, 18, 'MANN-FILTER CUK 3360 Cabin Filter for Porsche Cayman', 'MANN-FILTER', 1133, 1550, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility: Porsche Cayman</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Optimum protection for the engine</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Pressure-resistant and anticorrosion protected spin-on filter housing</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Long life filter media</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Long life sealing rings</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Non-return stop membrane made of high quality silicone</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Teflon-coated bypass valves</span></li></ul>', '71st6QID0uL._SL1500_.jpg', '713R7DATKGL._SL1500_.jpg', '81yzAS+ktwL._SL1500_.jpg', 40, 'In Stock', '2021-02-28 13:22:56', NULL),
(38, 5, 18, 'Auto Snap Silver 3\" 75mm Car SUV High Flow Short RAM/COLD Air Intake Vent Cone Filter Cleaner (Black)', 'Auto Snap', 899, 100, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Made of excellent quality and attractive design, chrome coating material for show-car level appearance</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Lightweight air filter with real carbon fiber heat shield</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Micro cotton gauze type filter material, washable with water or soap, and reusable</span></li></ul>', '416h6PFDxRL.jpg', '71j1pJkttqL._SL1024_.jpg', '71j1pJkttqL._SL1024_.jpg', 40, 'In Stock', '2021-02-28 13:24:41', NULL),
(39, 5, 19, 'AUTOVEA High Performance Oil Filter for Royal Enfield Thunderbird 350 (Type-1)', 'AUTOVEA', 199, 300, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Designed, engineered and manufactured to OE quality standards.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Compatible with all Bullets.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Easy to fit/Install.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Best Quality Premium Product</span></li></ul>', '1.jpg', '2.jpg', '3.jpg', 40, 'In Stock', '2021-02-28 13:30:37', NULL),
(40, 5, 19, 'Luman Oil Filter Suitable for Hyundai I20 Elite,Creta, Verna Fludic-Diesel', 'Luman Oil Filte', 404, 550, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Luman Cabin Air Filters contain Cellulose based Filter Paper imported from Germany</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Unique Design of Paper Pleats to ensure thorough filtration</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Laboratory Tested with efficiency upto 99.95%</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Ensures longevity of engine due to rigorous filtration</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">The product meets OEM specifications</span></li></ul>', '4.jpg', '5.jpg', '6.jpg', 40, 'In Stock', '2021-02-28 13:31:42', NULL),
(41, 5, 19, 'Purolator 530600I99 Spin On Oil Filter for Cars', 'Purolator', 185, 250, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility: Tata Sumo, Tata Estate, Tata Sierra, Tata Mobile</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Safeguards the engine function and assures the efficient operation of the vehicle</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Comply with the highest safety standards of vehicle manufacturers</span></li></ul>', '7.jpg', '8.jpg', '8.jpg', 40, 'In Stock', '2021-02-28 13:33:02', NULL),
(42, 5, 19, 'Purolator 529300I99 Spin On Oil Filter for Cars', 'Purolator', 220, 300, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility: Tata Venture, Tata Indigo Taxi Special, Tata Indigo Manza (Diesel), Tata Indica Turbo</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Safeguards the engine function and assures the efficient operation of the vehicle</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Comply with the highest safety standards of vehicle manufacturers</span></li></ul>', '9.jpg', '10.jpg', '10.jpg', 40, 'In Stock', '2021-02-28 13:35:00', NULL);
INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(43, 5, 19, 'Purolator 79900622 High Performance Replacement Fuel Filter for Hyundai Accent', 'Purolator', 340, 550, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Vehicle Compatibility: Hyundai Accent</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Water separation function, which helps avoid corrosion damage to injection system</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Detection and discharge fuel pre-heating to support engine start-up at low temperatures</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Measurement of fuel pressure and temperature by built-in sensors</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Designed to help clean fuel, increase gas mileage</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">The fuel filter is the key to a properly functioning fuel delivery system</span></li></ul>', '11.jpg', '12.jpg', '12.jpg', 40, 'In Stock', '2021-02-28 13:42:06', NULL),
(44, 6, 20, 'KREVIA Kitchen Platform and Car Window Glass Wiper Sponge Cleaner Washing Cleaning for car Anti-Slip Brush-1pcs', 'KREVIA', 650, 700, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Anti-slip brush</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Durable construction</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Useful product</span></li></ul>', '1.jpg', '2.jpg', '3.jpg', 40, 'In Stock', '2021-02-28 14:00:44', NULL),
(45, 6, 20, 'Auto Hub Car Wiper Blades for Nissan Sunny - Set of 2 Pcs (D-21,P-14)', 'Auto Hub', 350, 450, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Car Compatibility : - Nissan Sunny</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Material :- Made from the premium quality material which ensure product durability.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Design :- Aerodynamically designed for smooth and quiet operation. This frameless wiper blade technology is the new generation design adopted by car manufacturers.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Scratch Proof Cleaning :- Graphite coating on wiper to ensure smoother wiping with special rubber formulation.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Style: Hook and Type : Radial Arm.</span></li></ul>', '4.jpg', '5.jpg', '6.jpg', 40, 'In Stock', '2021-02-28 14:27:17', NULL),
(47, 6, 20, 'Auto Hub Car Wiper Blades for Maruti Suzuki New Swift Dzire - Set of 2 Pcs (D-21,P-19)', 'Auto Hub', 349, 466, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Material :- Made From the premium Quality Material. Durable Product</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Design :- Aerodynamically designed for smooth and quiet operation</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Scratch Proof Cleaning :- Graphite coating on wiper to ensure smoother wiping with special rubber formulation</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Style: Hook and Type : Radial Arm</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Reliable performance</span></li></ul>', '10.jpg', '11.jpg', '11.jpg', 40, 'In Stock', '2021-02-28 14:40:24', NULL),
(48, 6, 20, 'Auto Hub Car Wiper Blades for Chevrolet Cruze - Set of 2 Pcs (D-24,P-18)', 'Auto Hub', 360, 550, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Car Compatibility : - Chevrolet Cruze</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Material :- Made from the premium quality material which ensure product durability.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Design :- Aerodynamically designed for smooth and quiet operation. This frameless wiper blade technology is the new generation design adopted by car manufacturers.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Scratch Proof Cleaning :- Graphite coating on wiper to ensure smoother wiping with special rubber formulation.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Style: Hook and Type : Radial Arm.</span></li></ul>', '13.jpg', '14.jpg', '15.jpg', 40, 'In Stock', '2021-02-28 14:46:17', NULL),
(49, 6, 20, 'Auto Hub Car Wiper Blades for Chevrolet Cruze - Set of 2 Pcs (D-24,P-18)', 'Auto Hub', 395, 700, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Car Compatibility : - Chevrolet Cruze</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Material :- Made from the premium quality material which ensure product durability.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Design :- Aerodynamically designed for smooth and quiet operation. This frameless wiper blade technology is the new generation design adopted by car manufacturers.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Scratch Proof Cleaning :- Graphite coating on wiper to ensure smoother wiping with special rubber formulation.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Style: Hook and Type : Radial Arm.</span></li></ul>', '10.jpg', '11.jpg', '12.jpg', 40, 'In Stock', '2021-02-28 14:48:54', NULL),
(50, 6, 20, 'Auto Hub Car Wiper Blades Compatibility for Maruti Suzuki Alto 800 - Set of 2 Pcs (D-18,P-16)', 'Auto Hub', 349, 500, '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Car Compatibility : - Maruti Suzuki Alto 800</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Style: Hook and Type : Radial Arm.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Material :- Made from the premium quality material which ensure product durability.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Design :- Aerodynamically designed for smooth and quiet operation. This frameless wiper blade technology is the new generation design adopted by car manufacturers.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Scratch Proof Cleaning :- Graphite coating on wiper to ensure smoother wiping with special rubber formulation.</span></li></ul>', '16.jpg', '17.jpg', '18.jpg', 40, 'In Stock', '2021-03-06 06:55:56', NULL),
(51, 7, 21, 'COVER ASSY-BMPR', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 177, 186, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">This COVER ASSY-BMPR with part number 622A08AA1H is compatible with NISSAN, MICRA F/L (K13K), MICRA (K13K), MICRA ACTIVE (MK13K/MK13KK). GoMechanic Spares offer the COVER ASSY-BMPR at best price of â‚¹186.0 and are sold by our trusted seller, parcit. GoMechanic offers 100% OEM/OES Spare parts, nationwide best prices and free pan-India shipping*.100% Genuine oem COVER ASSY-BMPR by RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI) enhances the TOOL KIT in your car.</span><br>', '1.jpg', '2.jpg', '3.jpg', 40, 'In Stock', '2021-03-06 07:35:13', NULL),
(52, 7, 21, 'CAP TOWING HOOK', 'MGP', 150, 200, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">CAP TOWING HOOK</span><br>', '4.jpg', '4.jpg', '4.jpg', 40, 'In Stock', '2021-03-06 07:37:06', NULL),
(53, 7, 21, 'HANDLEJACK', 'MGP', 88, 98, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">HANDLEJACK</span><br>', '5.jpg', '5.jpg', '5.jpg', 40, 'In Stock', '2021-03-06 07:39:16', NULL),
(54, 7, 21, 'COVER ASSY-BMPR', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 105, 113, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">You can rely on GoMechanic Spares for all your spare parts needs. From basic clamps to COVER ASSY-BMPR, GoMechanic covers more than 60 lakh spare parts that your SUNNY (N17KK) needs. This COVER ASSY-BMPR is compatible with NISSAN, SUNNY (N17K), SUNNY (N17KK). With pan-India free shipping*, you get a hassle-free experience and the best quality at the best price of â‚¹113.0 and is sold by our trusted seller, parcit.</span><br>', '6.jpg', '7.jpg', '8.jpg', 40, 'In Stock', '2021-03-06 07:40:34', NULL),
(55, 7, 21, 'SWE. JACK', 'VAG (VOLKSWAGEN, SKODA, AUDI)', 5546, 5838, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SWE. JACK.</span><br>', '9.jpg', '9.jpg', '9.jpg', 40, 'In Stock', '2021-03-06 07:43:55', NULL),
(56, 7, 21, 'TOWING ANGLE', 'MAHINDRA', 1688, 1854, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">TOWING ANGLE</span><br>', '10.jpg', '10.jpg', '10.jpg', 40, 'In Stock', '2021-03-06 07:45:13', NULL),
(57, 7, 21, 'WINCH ASSY', 'TOYOTA ', 550, 700, 'WINCH ASSY<br>', '10.jpg', '10.jpg', '10.jpg', 40, 'In Stock', '2021-03-06 07:46:45', NULL),
(58, 7, 21, 'Cover, towhook', ' FORD', 628, 788, 'Cover, towhook<br>', '10.jpg', '10.jpg', '10.jpg', 40, 'In Stock', '2021-03-06 07:47:51', NULL),
(59, 7, 21, 'DRIVER-SCREW', 'MOBIS (HYUNDAI, KIA)', 200, 250, 'DRIVER-SCREW<br>', '10.jpg', '10.jpg', '10.jpg', 40, 'In Stock', '2021-03-06 07:48:57', NULL),
(60, 7, 23, 'HAND JACK', 'GMC (CHEVROLET, OPEL)', 1660, 1850, 'HAND JACK<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 07:52:20', NULL),
(61, 7, 23, '9955090017', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 1880, 1960, '9955090017<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 07:54:22', NULL),
(62, 7, 23, '9955096001', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 2015, 2550, '9955096001<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 07:56:51', NULL),
(63, 7, 23, '9955090000', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 1776, 1980, '9955090000<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 07:57:59', NULL),
(64, 7, 23, '9955090002', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 1419, 1889, '9955090002<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:00:07', NULL),
(65, 7, 23, '9955090001', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 1413, 1667, '9955090001<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:00:49', NULL),
(66, 7, 23, '99550C0400', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 2336, 2550, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">99550C0400</font></h1>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:01:53', NULL),
(67, 7, 23, 'JACK ASSY.PANTOGR', ' HONDA', 1889, 1988, 'JACK ASSY.PANTOGR<br>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:03:04', NULL),
(68, 7, 23, '9955090012', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 886, 990, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-weight: 700;\"><font size=\"2\">9955090012</font></span><br><div><span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 22.5px; font-weight: 700;\"><br></span></div>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:04:28', NULL),
(69, 7, 23, '9955090014', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 760, 887, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">9955090014</font></h1>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:05:31', NULL),
(70, 7, 23, '9955090015', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 1119, 1360, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">9955090015</font></h1>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:06:21', NULL),
(71, 7, 23, '9955090011', 'RNM ALLIANCE (RENAULT, NISSAN, MITSUBISHI)', 2550, 2770, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">9955090011</font></h1>', 'Jack.jpg', 'Jack.jpg', 'Jack.jpg', 40, 'In Stock', '2021-03-06 08:07:18', NULL),
(72, 9, 28, 'TUBE(KUMO-ZEN)', ' MGP', 548, 609, 'TUBE(KUMO-ZEN)<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:09:45', NULL),
(73, 9, 28, 'VALVE', ' SSANGYONG', 550, 650, 'VALVE<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:13:12', NULL),
(74, 9, 28, 'VALVE (TR414) (BS)', 'MGP', 600, 700, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">VALVE (TR414) (BS)</font></h1>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:14:25', NULL),
(75, 9, 28, 'VALVE-TIRE', 'MOBIS (HYUNDAI, KIA)', 870, 980, 'VALVE-TIRE<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:15:56', NULL),
(76, 9, 28, 'VALVE-TRANSMITTER', 'MOBILETRON', 1050, 1119, 'VALVE-TRANSMITTER<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:23:29', NULL),
(77, 9, 28, 'VALVE TR414 (M/S MRF)FOR TUBELESS TYRE', 'TATA', 760, 889, 'VALVE TR414 (M/S MRF)FOR TUBELESS TYRE<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:24:27', NULL),
(78, 9, 28, '4313024A20', ' MGP', 608, 750, '4313024A20<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:25:15', NULL),
(79, 9, 28, 'VALVE ASSY', 'FORD', 1190, 1450, 'VALVE ASSY<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:26:43', NULL),
(80, 9, 28, 'VALVE ASSY TYRE', 'FORD', 999, 1190, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">VALVE ASSY TYRE</font></h1>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:28:41', NULL),
(81, 9, 28, 'VALVE ASSY, RUBBER, 56MM', 'FORD', 888, 999, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">VALVE ASSY, RUBBER, 56MM</font></h1>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:29:29', NULL),
(82, 9, 28, 'VALVE ASSY', 'FORD', 800, 890, '<h1 class=\"_2r8LH\" style=\"color: rgb(40, 40, 40); margin-bottom: 0px; font-family: Gilroy, sans-serif;\"><font size=\"2\">VALVE ASSY</font></h1>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:30:15', NULL),
(83, 9, 28, 'ASSY TUBELESS TYRE & VALVE (MRF, TM-2785)', 'TATA', 700, 770, 'ASSY TUBELESS TYRE &amp; VALVE (MRF, TM-2785)<br>', 'Tyre.jpg', 'Tyre.jpg', 'Tyre.jpg', 40, 'In Stock', '2021-03-06 08:31:20', NULL),
(84, 3, 24, 'Brake oil DOT-4 250 ml', 'GOMECHANIC', 88, 99, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">GM BRAKE OIL DOT-4 250 ML</span><br>', '2.JPG', '3.JPG', '3.JPG', 40, 'In Stock', '2021-03-06 09:21:47', NULL),
(85, 3, 24, 'Brake oil DOT-3 250 ml', 'GOMECHANIC', 66, 79, 'GM BRAKE OIL DOT-4 250 ML<br>', '4.JPG', '5.JPG', '5.JPG', 40, 'In Stock', '2021-03-06 09:24:13', NULL),
(86, 3, 24, 'BRAKE OIL', 'BOSCH', 79, 90, 'BRAKE OIL<br>', '6.jpg', '6.jpg', '6.jpg', 40, 'In Stock', '2021-03-06 09:28:01', NULL),
(87, 3, 24, 'BRAKE OIL', 'BOSCH', 34, 50, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">BRAKE OIL</span><br>', '6.jpg', '6.jpg', '6.jpg', 40, 'In Stock', '2021-03-06 09:29:08', NULL),
(92, 3, 25, 'Red Coolant (1 ltr)', 'GOMECHANIC', 119, 250, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">ANTIFREEZE RED COOLANT 1 LTR</span><br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 09:43:47', NULL),
(93, 3, 25, 'Green Coolant (1 ltr)', 'GOMECHANIC', 119, 250, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">GoMechanic Green Coolant (1 ltr)</span><br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 09:44:43', NULL),
(94, 3, 25, 'Green Coolant (3 ltr)', 'GOMECHANIC', 720, 800, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">ANTIFREEZE GREEN COOLANT 3 LTR</span><br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 09:45:43', NULL),
(95, 3, 25, 'Red Coolant (3 ltr)', 'GOMECHANIC', 720, 800, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">ANTIFREEZE RED COOLANT 3 LTR</span><br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 09:46:55', NULL),
(96, 3, 25, 'Green Coolant (5 Ltr)', 'GOMECHANIC', 1125, 1566, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">ANTIFREEZE GREEN COOLANT 5 LTR</span><br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 09:48:21', NULL),
(97, 3, 25, 'Red Coolant (5 ltr)', 'GOMECHANIC', 1125, 1566, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">ANTIFREEZE RED COOLANT 5 LTR</span><br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 09:49:19', NULL),
(98, 3, 29, 'SPEED ,5W40 SYNTHETIC API SN + (4L)', 'GOMECHANIC', 1720, 2150, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SPEED ,5W40 SYNTHETIC API SN + (4L)</span><br>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-06 09:54:07', NULL),
(99, 3, 29, 'RACEMAX PRO, 20W40 SYNTHETIC BLEND API-SM JASO MA2 (0.9L)', 'GOMECHANIC', 260, 325, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">RACEMAX PRO, 20W40 SYNTHETIC BLEND API-SM JASO MA2 (0.9L)</span><br>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-06 09:55:11', NULL),
(100, 3, 29, 'SPEED ,5W40 SYNTHETIC API SN + (1L)', 'GOMECHANIC', 440, 550, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SPEED ,5W40 SYNTHETIC API SN + (1L)</span><br>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-06 09:55:56', NULL),
(101, 3, 29, 'MILEAGE ECO ,CNG 20W50 API-SF/CD (1L)', 'GOMECHANIC', 236, 295, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">MILEAGE ECO ,CNG 20W50 API-SF/CD (1L)</span><br>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-06 09:56:44', NULL),
(102, 3, 29, 'RACEMAX PRO, 20W40 SYNTHETIC BLEND API-SM JASO MA2 (1L)', 'GOMECHANIC', 276, 345, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">RACEMAX PRO, 20W40 SYNTHETIC BLEND API-SM JASO MA2 (1L)</span><br>', '9.JPG', '10.JPG', '10.JPG', 40, 'In Stock', '2021-03-06 10:02:08', NULL),
(103, 3, 29, 'SPEED TURBO ,15W40 HEAVY DUTY DIESEL ENGINE OIL API-CI-4/SL (3.5L)', 'GOMECHANIC', 1090, 1290, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SPEED TURBO ,15W40 HEAVY DUTY DIESEL ENGINE OIL API-CI-4/SL (3.5L)</span><br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 10:03:20', NULL),
(104, 3, 29, 'RACEMAX SCOOTER, 10W30 SYNTHETIC BLEND API-SL JASO MB2 (0.8L)', 'GOMECHANIC', 224, 280, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">RACEMAX SCOOTER, 10W30 SYNTHETIC BLEND API-SL JASO MB2 (0.8L)</span><br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 10:04:18', NULL),
(105, 3, 29, 'MOBIL DEL TRACTOR SONA 20W-40 PL 7.5L:IN', 'EXXONMOBIL', 1688, 1875, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">MOBIL DEL TRACTOR SONA 20W-40 PL 7.5L:IN</span><br>', '15.JPG', '15.JPG', '15.JPG', 40, 'In Stock', '2021-03-06 10:05:25', NULL),
(106, 3, 27, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (5L)', 'GOMECHANIC', 1550, 2000, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (5L)</span><br>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-06 10:09:57', NULL),
(107, 3, 27, 'SMART SHIFT ,GEAR OIL 80W-90 EP -4 (5L)', 'GOMECHANIC', 1340, 2550, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SMART SHIFT ,GEAR OIL 80W-90 EP -4 (5L)</span><br>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-06 10:11:07', NULL),
(108, 3, 27, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (1L)', 'GOMECHANIC', 312, 550, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (1L)<br>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-06 10:12:23', NULL),
(109, 3, 27, 'SMART SHIFT ,GEAR OIL 80W-90 EP -4 (1L)', 'GOMECHANIC', 281, 400, 'SMART SHIFT ,GEAR OIL 80W-90 EP -4 (1L)<br>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-06 10:13:38', NULL),
(110, 3, 24, 'BOSCH Brake Fluid (1L) DOT3', 'BOSCH', 335, 400, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 13.125px; letter-spacing: 0.08px;\">BOSCH BRAKE FLUID (1L) DOT3</span><br>', '7.jpg', '7.jpg', '7.jpg', 40, 'In Stock', '2021-03-06 16:30:42', NULL),
(111, 3, 24, 'TVS Brake Oil DOT 3 (0.5L))', 'GOMECHANIC', 177, 250, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">TVS Brake Oil DOT 3 (0.5L))</span><br>', '8.jpg', '8.jpg', '8.jpg', 40, 'In Stock', '2021-03-06 16:37:22', NULL),
(112, 3, 24, 'BOSCH Brake Fluid (5L) DOT3', 'BOSCH', 1675, 1850, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">BOSCH Brake Fluid (5L) DOT3</span><br>', '10.jpg', '10.jpg', '10.jpg', 40, 'In Stock', '2021-03-06 16:40:06', NULL),
(113, 3, 24, 'BRAKE PAD KIT', 'GOMECHANIC', 350, 550, 'BRAKE PAD KIT<br>', '9.jpg', '9.jpg', '9.jpg', 40, 'In Stock', '2021-03-06 16:43:16', NULL),
(114, 3, 30, 'Red Coolant (1 ltr)', 'GOMECHANIC', 119, 250, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">ANTIFREEZE RED COOLANT 1 LTR</span><br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 16:47:55', NULL),
(115, 3, 30, 'Green Coolant (1 ltr)', 'GOMECHANIC', 119, 250, 'Green Coolant (1 ltr)<br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 16:48:55', NULL),
(116, 3, 30, 'Green Coolant (3 ltr)', 'GOMECHANIC', 720, 890, 'Green Coolant (3 ltr)<br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 16:50:36', NULL),
(117, 3, 30, 'Red Coolant (3 ltr)', 'GOMECHANIC', 720, 879, 'Red Coolant (3 ltr)<br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 16:52:03', NULL),
(118, 3, 30, 'Green Coolant (5 Ltr)', 'GOMECHANIC', 1165, 2550, 'Green Coolant (5 Ltr)<br>', '13.JPG', '14.JPG', '14.JPG', 40, 'In Stock', '2021-03-06 16:53:21', NULL),
(119, 3, 30, 'Red Coolant (5 ltr)', 'GOMECHANIC', 1165, 2550, 'Red Coolant (5 ltr)<br>', '11.JPG', '12.JPG', '12.JPG', 40, 'In Stock', '2021-03-06 16:54:31', NULL),
(120, 3, 31, 'SMART SHIFT ,GEAR OIL 80W-90 EP -4 (5L)', 'GOMECHANIC', 1340, 1566, '<span style=\"color: rgb(40, 40, 40); font-family: Gilroy, sans-serif; font-size: 14.0625px; letter-spacing: 0.08px;\">SMART SHIFT ,GEAR OIL 80W-90 EP -4 (5L)</span><br>', '1.JPG', '2.JPG', '2.JPG', 40, 'In Stock', '2021-03-06 16:59:01', NULL),
(121, 3, 31, 'SMART SHIFT ,GEAR OIL 80W-90 EP -4 (1L)', 'GOMECHANIC', 281, 550, 'SMART SHIFT ,GEAR OIL 80W-90 EP -4 (1L)<br>', '3.JPG', '4.JPG', '4.JPG', 40, 'In Stock', '2021-03-06 16:59:49', NULL),
(122, 3, 31, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (1L)', 'GOMECHANIC', 312, 550, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (1L)<br>', '5.JPG', '6.JPG', '6.JPG', 40, 'In Stock', '2021-03-06 17:01:07', NULL),
(123, 3, 31, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (5L)', 'GOMECHANIC', 1550, 2550, 'SMART SHIFT PRO ,GEAR OIL 80W-90 EP -4 (5L)<br>', '7.JPG', '8.JPG', '8.JPG', 40, 'In Stock', '2021-03-06 17:02:40', NULL);

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
(14, 3, 'oils for bikes and cars', '2021-02-27 12:09:29', NULL),
(15, 4, 'Exterior Light Bulbs', '2021-02-27 13:02:32', NULL),
(18, 5, 'Air filters', '2021-02-28 13:06:40', NULL),
(19, 5, 'Oil filters', '2021-02-28 13:06:56', NULL),
(20, 6, 'Wipers', '2021-02-28 13:46:16', NULL),
(21, 7, 'Tool Kit', '2021-03-06 06:57:41', NULL),
(23, 7, 'Jack', '2021-03-06 07:03:45', NULL),
(24, 3, 'Brake oil', '2021-03-06 07:05:13', NULL),
(28, 9, 'Tyres', '2021-03-06 07:08:36', NULL),
(30, 3, 'Coolant oil', '2021-03-06 16:46:37', NULL),
(31, 3, 'Transmission oil', '2021-03-06 16:55:26', NULL);

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
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, 'sheebabuloo1@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-12 07:13:14', '12-02-2021 12:47:12 PM', 1),
(25, 'sheebabuloo1@gmail.com', 0x3a3a3100000000000000000000000000, '2021-02-21 08:59:11', '21-02-2021 02:31:52 PM', 1);

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
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', ''),
(4, 'Sheetal Sreedhar', 'sheebabuloo1@gmail.com', 9025212196, '05ececfe261fa480032ced987bc17f48', 'No 16/17,Kamatchi flats\r\nAandal avenue 1st street\r\nThiru-vi-ka nagar', 'Tamil Nadu', 'chennai', 600082, 'No 16/17,Kamatchi flats\r\nAandal avenue 1st street\r\nThiru-vi-ka nagar', 'Tamil Nadu', 'chennai', 600082, '2021-02-12 07:12:53', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
