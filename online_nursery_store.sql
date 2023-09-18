-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 23, 2023 at 02:43 PM
-- Server version: 5.7.41
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_nursery_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `category_image` longblob,
  `category_image_filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_title`, `category_description`, `category_image`, `category_image_filename`) VALUES
(1, 'Flower', 'Flower', NULL, 'flower seeds.jpeg'),
(2, 'Vegetable', 'Vegetable', NULL, 'vegetable.jpeg'),
(3, 'Grain', 'Grain', NULL, 'grain seeds.jpeg'),
(4, 'Organic Seeds', 'Organic Seeds\n', NULL, '3.jpeg'),
(5, 'Frozen Seeds', 'Frozen Seeds', NULL, 'Lettuce.jpeg'),
(6, 'Mimosa Seeds', 'Mimosa Seeds', NULL, 'mimosa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comments_id` bigint(20) NOT NULL,
  `comments_date` varchar(255) DEFAULT NULL,
  `comments_description` varchar(255) DEFAULT NULL,
  `comments_product_id` varchar(255) DEFAULT NULL,
  `comments_title` varchar(255) DEFAULT NULL,
  `comments_user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` bigint(20) NOT NULL,
  `company_description` varchar(255) DEFAULT NULL,
  `company_image_filename` varchar(255) DEFAULT NULL,
  `company_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_subject` text NOT NULL,
  `contact_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_name`, `contact_email`, `contact_subject`, `contact_message`) VALUES
(142, 'Kaushal Kishore', 'kaushal@gmail.com', 'Need to Learn PHP', 'Hello Team, I need to learn PHP'),
(143, 'Amit Kumar', 'amit@gmail.com', 'Need to Learn C', 'Hello Team, I need to learn C Language'),
(146, 'Sumit Singh', 'sumit@gmail.com', 'Need to Learn Angular', 'Hello Team, I need to learn Angular'),
(147, 'Rahul Kumar', 'rahul@gmail.com', 'Need to Learn NodeJS', 'Hello Team, I need to learn NodeJS');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` bigint(20) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` bigint(20) NOT NULL,
  `feedback_email` varchar(255) DEFAULT NULL,
  `feedback_message` varchar(255) DEFAULT NULL,
  `feedback_name` varchar(255) DEFAULT NULL,
  `feedback_rating` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `feedback_email`, `feedback_message`, `feedback_name`, `feedback_rating`) VALUES
(371, 'asdf@afds.com', 'asdf', 'sadf', '2');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(425);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` bigint(20) NOT NULL,
  `login_email` varchar(255) DEFAULT NULL,
  `login_employee_id` varchar(255) DEFAULT NULL,
  `login_level_id` varchar(255) DEFAULT NULL,
  `login_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int(11) NOT NULL,
  `month_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_user_id` varchar(255) NOT NULL,
  `order_total` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_tracking_id` varchar(255) DEFAULT NULL,
  `order_delivery_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_user_id`, `order_total`, `order_status`, `order_date`, `order_tracking_id`, `order_delivery_id`) VALUES
(338, '5', '200', '4', '06/06/2023, 12:56:10', '34543', '3'),
(342, '5', '480', '3', '06/06/2023, 13:55:50', 'etert', '3'),
(354, '5', '440', '3', '06/06/2023, 16:43:04', '35345345', '2'),
(362, '5', '170', '8', '06/06/2023, 18:07:21', '', '4'),
(366, '5', '620', '2', '06/06/2023, 18:07:57', '', '5'),
(369, '5', '100', '4', '06/06/2023, 18:08:41', '', '2'),
(372, '5', '320', '3', '06/06/2023, 18:27:05', '56456', '3'),
(374, '5', '80', '5', '06/06/2023, 18:29:20', '', '1'),
(378, '377', '140', '1', '06/06/2023, 19:28:35', '', '5'),
(383, '5', '580', '1', '06/06/2023, 20:44:11', '', '3'),
(386, '5', '420', '2', '06/06/2023, 20:51:56', '', '3'),
(391, '5', '0', '1', '06/06/2023, 20:52:45', '', '4'),
(397, '5', '0', '4', '10/07/2023, 23:58:39', 'dfgdfg', '2'),
(412, '5', '460', '7', '14/07/2023, 16:52:10', NULL, NULL),
(415, '5', '330', '7', '14/07/2023, 17:35:57', NULL, NULL),
(421, '5', '20000', '7', '22/08/2023, 22:29:18', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `payment_user_id` varchar(255) NOT NULL,
  `payment_date` varchar(255) NOT NULL,
  `payment_amount` varchar(255) NOT NULL,
  `payment_student_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_user_id`, `payment_date`, `payment_amount`, `payment_student_id`) VALUES
(165, '5', '2021-11-06', '10000', NULL),
(166, '5', '2021-11-06', '15000', NULL),
(167, '5', '2021-11-06', '12000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_vendor_id` varchar(255) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_category_id` varchar(255) NOT NULL,
  `product_image_filename` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` longblob,
  `product_cost` varchar(255) NOT NULL,
  `product_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_vendor_id`, `product_title`, `product_category_id`, `product_image_filename`, `product_description`, `product_image`, `product_cost`, `product_date`) VALUES
(1, '4', 'Vegetable Plants', '2', 'zukur seeds.jpeg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '10000', NULL),
(4, '419', 'Native Plant', '3', 'native plant.png', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '9000', NULL),
(5, '419', 'Ecom', '1', 'ecom.jpeg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '8000', NULL),
(6, '4', 'Bog Plant', '2', 'bog plant.jpg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '6000', NULL),
(7, '419', 'Orange Star', '1', 'orange-star plant.jpg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '12000', NULL),
(9, '419', 'Star Plant', '1', 'Ornamental Grass.jpg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '30000', NULL),
(10, '4', 'Aqarium', '2', 'aqarium plant.jpg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '8000', NULL),
(11, '419', 'Outdoors', '5', 'outdoors plant.jpg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '3000', NULL),
(12, '419', 'Indoor House', '6', 'indoor-house-plants-.jpg', 'A seed is an embryonic plant enclosed in a protective outer covering. The formation of the seed is part of the process of reproduction in seed plants, the spermatophytes, including the gymnosperm and angiosperm plants.', NULL, '4000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(11) NOT NULL,
  `roles_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roles_id`, `roles_name`) VALUES
(1, 'Admin'),
(2, 'Employee');

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `sell_id` int(11) NOT NULL,
  `sell_order_id` varchar(255) NOT NULL,
  `sell_product_id` varchar(255) NOT NULL,
  `sell_units` varchar(255) NOT NULL,
  `sell_price_per_unit` varchar(255) NOT NULL,
  `sell_total_cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sell`
--

INSERT INTO `sell` (`sell_id`, `sell_order_id`, `sell_product_id`, `sell_units`, `sell_price_per_unit`, `sell_total_cost`) VALUES
(307, 'undefined', '1', '1', '100', '100'),
(308, 'undefined', '5', '1', '80', '80'),
(309, 'undefined', '5', '1', '80', '80'),
(310, 'undefined', '4', '1', '90', '90'),
(311, 'undefined', '4', '1', '90', '90'),
(312, 'undefined', '4', '1', '90', '90'),
(314, 'undefined', '4', '1', '90', '90'),
(315, 'undefined', '4', '1', '90', '90'),
(316, 'undefined', '4', '1', '90', '90'),
(318, '306', '4', '1', '90', '90'),
(320, '306', '4', '1', '90', '90'),
(322, '306', '4', '1', '90', '90'),
(323, '306', '5', '1', '80', '80'),
(324, '306', '10', '1', '80', '80'),
(325, '306', '9', '1', '30', '30'),
(326, '306', '5', '1', '80', '80'),
(333, '332', '5', '1', '80', '80'),
(334, '332', '7', '1', '120', '120'),
(335, '332', '7', '1', '120', '120'),
(336, '332', '4', '1', '90', '90'),
(339, '338', '4', '1', '90', '90'),
(340, '338', '5', '1', '80', '80'),
(341, '338', '9', '1', '30', '30'),
(352, '342', '9', '4', '30', '120'),
(353, '342', '4', '4', '90', '360'),
(355, '354', '5', '2', '80', '160'),
(358, '354', '10', '2', '80', '160'),
(360, '354', '9', '1', '30', '30'),
(361, '354', '4', '1', '90', '90'),
(363, '362', '5', '1', '80', '80'),
(364, '362', '6', '1', '60', '60'),
(365, '362', '9', '1', '30', '30'),
(367, '366', '10', '1', '80', '80'),
(368, '366', '4', '6', '90', '540'),
(370, '369', '1', '1', '100', '100'),
(373, '372', '5', '4', '80', '320'),
(375, '374', '5', '1', '80', '80'),
(379, '378', '5', '1', '80', '80'),
(380, '378', '9', '1', '30', '30'),
(381, '378', '9', '1', '30', '30'),
(384, '383', '1', '4', '100', '400'),
(385, '383', '6', '3', '60', '180'),
(387, '386', '4', '1', '90', '90'),
(388, '386', '1', '3', '100', '300'),
(390, '386', '9', '1', '30', '30'),
(392, '391', '4', '1', '90', '90'),
(398, '397', '4', '1', '90', '90'),
(413, '412', '1', '4', '100', '400'),
(414, '412', '6', '1', '60', '60'),
(416, '415', '1', '3', '100', '300'),
(418, '415', '9', '1', '30', '30'),
(422, '421', '1', '1', '10000', '10000'),
(423, '421', '6', '1', '6000', '6000'),
(424, '421', '12', '1', '4000', '4000');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL,
  `state_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` bigint(20) NOT NULL,
  `status_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Order Processing'),
(2, 'Order Packed'),
(3, 'On the Way'),
(4, 'Delivered'),
(5, 'Returned'),
(6, 'Replaced'),
(7, 'Paid'),
(8, 'In Progress');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_level_id` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_state` varchar(255) NOT NULL,
  `user_country` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_nationalty` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_level_id`, `user_email`, `user_password`, `user_first_name`, `user_last_name`, `user_dob`, `user_address`, `user_city`, `user_state`, `user_country`, `user_mobile`, `user_nationalty`) VALUES
(1, '1', 'admin@admin.com', 'test', 'Aman', 'Kumar', '2021-10-15', 'gjhg', 'Mumbai', 'Maharastra', 'India', '9899786756', 'Indian'),
(2, '3', 'delivery@gmail.com', 'test', 'Pawan', 'Kumar', '2021-10-15', 'jhjk', 'Jaipur', 'Rajasthan', 'India', '9878765434', 'jb'),
(3, '3', 'rahul@gmail.com', 'test', 'Rahul', 'Kumar', '2021-10-08', 'jhg', 'Mumbai', 'Mahastra', 'India', '8987676567', 'g'),
(4, '4', 'sumit@gmail.com', 'test', 'Sumit', 'Kumar', '2021-10-16', 'jk', 'Delhi', 'Delhi', 'India', '7689876567', 'kh'),
(5, '2', 'amit@gmail.com', 'test', 'Amit', 'Kumar', '2021-10-26', 'gg1', 'Kanpur', 'Uttar Pradesh', 'India', '9123321289', 'gg1'),
(419, '4', 'vendor@gmail.com', 'test', 'Prateek', 'Kumar', '2023-08-15', 'Addresss 1', 'Mumbai', 'Maharastra', 'India', '9876543212', 'Indian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comments_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`sell_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sell`
--
ALTER TABLE `sell`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
