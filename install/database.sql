-- phpMyAdmin SQL Dump
-- version 4.0.8
-- http://www.phpmyadmin.net
--
-- โฮสต์: localhost
-- เวอร์ชั่นของเซิร์ฟเวอร์: 5.1.73-log
-- รุ่นของ PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- โครงสร้างตาราง `{prefix}_language`
--

CREATE TABLE `{prefix}_language` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text COLLATE utf8_unicode_ci NOT NULL,
  `en` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `{prefix}_category`
--

CREATE TABLE `{prefix}_category` (
  `id` int(11) NOT NULL,
  `type` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `topic` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_category`
--

INSERT INTO `{prefix}_category` (`id`, `type`, `category_id`, `topic`) VALUES
(1, 3, 1, 'ชิ้น'),
(2, 3, 2, 'ชุด'),
(3, 3, 3, 'ลัง'),
(4, 3, 4, 'ห่อ'),
(5, 3, 5, 'อัน'),
(6, 3, 6, 'เครื่อง'),
(7, 3, 7, 'เรือน'),
(8, 3, 8, 'เส้น'),
(9, 0, 1, 'อุปกรณ์เสริม'),
(10, 0, 2, 'โทรศัพท์'),
(11, 0, 3, 'บริการ'),
(12, 3, 9, 'ครั้ง');

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_customer`
--

CREATE TABLE `{prefix}_customer` (
  `id` int(11) UNSIGNED NOT NULL,
  `company` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `branch` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `idcard` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `provinceID` smallint(3) UNSIGNED NOT NULL,
  `province` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `bank` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_customer`
--

INSERT INTO `{prefix}_customer` (`id`, `company`, `branch`, `name`, `idcard`, `tax_id`, `phone`, `fax`, `email`, `address`, `provinceID`, `province`, `zipcode`, `country`, `website`, `bank`, `bank_name`, `bank_no`, `discount`) VALUES
(1, 'ทดสอบ คู่ค้า', '', '', '', '', '03412345678', '', '', '123/45 อ.เมือง', 103, 'กาญจนบุรี', '71000', 'TH', '', '', '', '', '10.00'),
(2, 'ทดสอบ ลูกค้า', '', '', '', '', '03412456', '', '', '', 102, 'กรุงเทพมหานคร', '10000', 'TH', '', NULL, NULL, NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_number`
--

CREATE TABLE `{prefix}_number` (
  `id` int(11) NOT NULL,
  `product_no` int(11) DEFAULT '0',
  `order_no` int(11) DEFAULT '0',
  `billing_no` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_number`
--

INSERT INTO `{prefix}_number` (`id`, `product_no`, `order_no`, `billing_no`) VALUES
(1, 4, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_orders`
--

CREATE TABLE `{prefix}_orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `order_date` date NOT NULL,
  `member_id` int(11) UNSIGNED NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `stock_status` enum('IN','OUT') COLLATE utf8_unicode_ci NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `discount_percent` decimal(10,2) NOT NULL,
  `tax_status` decimal(10,2) NOT NULL,
  `vat_status` tinyint(1) UNSIGNED NOT NULL,
  `order` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_orders`
--

INSERT INTO `{prefix}_orders` (`id`, `order_no`, `customer_id`, `order_date`, `member_id`, `discount`, `vat`, `tax`, `total`, `status`, `stock_status`, `paid`, `discount_percent`, `tax_status`, `vat_status`, `order`, `due_date`, `payment_date`, `payment_method`, `comment`) VALUES
(1, 'inv00001', 0, '2016-02-08 00:00:00', 1, '0.00', '19.63', '0.00', '280.37', 6, 'OUT', '0.00', '0.00', '0.00', 2, NULL, NULL, NULL, NULL, ''),
(2, 'inv00002', 0, '2017-09-09 00:00:00', 1, '0.00', '19.63', '0.00', '280.37', 6, 'OUT', '0.00', '0.00', '0.00', 2, NULL, NULL, NULL, NULL, ''),
(3, 'inv00003', 0, '2017-09-17 00:00:00', 11, '10.00', '0.00', '0.00', '990.00', 1, 'OUT', '0.00', '0.00', '0.00', 0, NULL, NULL, NULL, NULL, ''),
(4, 'inv00004', 0, '2017-02-03 00:00:00', 1, '0.00', '875.00', '0.00', '12500.00', 6, 'OUT', '0.00', '0.00', '0.00', 1, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_product`
--

CREATE TABLE `{prefix}_product` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_no` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `topic` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_update` int(11) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `count_stock` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_product`
--

INSERT INTO `{prefix}_product` (`id`, `product_no`, `topic`, `description`, `last_update`, `price`, `vat`, `unit`, `category_id`, `count_stock`) VALUES
(1, 'P00001', 'iPhone 7SE case', 'iPhone 7SE เคสสีขาวใส มีลายกาตูน', 1505657641, '500.00', 1, 'เครื่อง', 2, 1),
(2, 'P00002', 'iPhone film', 'iPhone film แบบใส่สุด ป้องกันรอย', 1505657573, '200.00', 2, 'ชิ้น', 1, 1),
(3, 'P00003', 'บริการติดตั้ง', 'ติดฟิลม์ และเช็คความสะอาดเครื่อง', 1505657838, '500.00', 2, 'ครั้ง', 3, 0),
(4, 'P00005', 'Cake A', '', 1505659395, '30.00', 2, 'ชิ้น', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_stock`
--

CREATE TABLE `{prefix}_stock` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `member_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `status` enum('IN','OUT') COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `topic` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_stock`
--

INSERT INTO `{prefix}_stock` (`id`, `order_id`, `member_id`, `product_id`, `status`, `create_date`, `topic`, `quantity`, `price`, `vat`, `discount`, `total`) VALUES
(1, 0, 1, 1, 'IN', '2017-01-10 21:10:41', NULL, 100, '100.00', '700.00', '0.00', '10000.00'),
(2, 0, 1, 2, 'IN', '2017-01-11 21:12:53', NULL, 50, '50.00', '175.00', '0.00', '2500.00'),
(3, 0, 1, 4, 'IN', '2016-01-01 21:18:36', NULL, 100, '10.00', '65.42', '0.00', '934.58'),
(4, 1, 1, 4, 'OUT', '2016-02-08 00:00:00', 'Cake A', 10, '30.00', '19.63', '0.00', '300.00'),
(5, 2, 1, 4, 'OUT', '2017-09-09 00:00:00', 'Cake A', 10, '30.00', '19.63', '0.00', '300.00'),
(6, 3, 11, 1, 'OUT', '2017-09-17 00:00:00', 'iPhone 7SE case iPhone 7SE เคสสีขาวใส มีลายกาตูน', 1, '500.00', '0.00', '0.00', '500.00'),
(7, 3, 11, 3, 'OUT', '2017-09-17 00:00:00', 'บริการติดตั้ง ติดฟิลม์ และเช็คความสะอาดเครื่อง', 1, '500.00', '0.00', '0.00', '500.00'),
(8, 4, 1, 1, 'OUT', '2017-02-03 00:00:00', 'iPhone 7SE case iPhone 7SE เคสสีขาวใส มีลายกาตูน', 25, '500.00', '875.00', '0.00', '12500.00');

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_user`
--

CREATE TABLE `{prefix}_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `permission` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceID` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visited` int(11) UNSIGNED DEFAULT '0',
  `lastvisited` int(11) DEFAULT '0',
  `session_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `social` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_user`
--

INSERT INTO `{prefix}_user` (`id`, `username`, `salt`, `password`, `social`, `active`, `name`, `phone`, `fax`, `create_date`, `visited`, `lastvisited`, `status`, `ip`, `session_id`, `permission`, `website`, `email`, `type`) VALUES
(2, 'demo@localhost', 'demo@localhost', 'db75cdf3d5e77181ec3ed6072b56a8870eb6822d', 0, 1, 'พนักงาน', '', NULL, '2017-09-16 10:38:02', 91, 1505659350, 0, '223.24.90.121', '16m0q0bd2tae0dg5bkd0692sb7', 'can_customer,can_stock,can_sell,can_buy,can_manage_inventory', '', '', 0),
(1, 'admin@localhost', 'admin@localhost', 'b620e8b83d7fcf7278148d21b088511917762014', 0, 1, 'แอดมิน', '', NULL, '2017-09-17 21:07:06', 1, 1505660615, 1, '119.76.143.13', '9n4572970bq87ee1gin5ip2bh5', 'can_config,can_customer,can_stock,can_sell,can_buy,can_manage_inventory', '', '', 0);
--
-- Indexes for dumped tables
--

--
-- Indexes for table `{prefix}_category`
--
ALTER TABLE `{prefix}_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_customer`
--
ALTER TABLE `{prefix}_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_number`
--
ALTER TABLE `{prefix}_number`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_orders`
--
ALTER TABLE `{prefix}_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_product`
--
ALTER TABLE `{prefix}_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_no` (`product_no`);

--
-- Indexes for table `{prefix}_stock`
--
ALTER TABLE `{prefix}_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`order_id`) USING BTREE;

--
-- Indexes for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `{prefix}_category`
--
ALTER TABLE `{prefix}_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `{prefix}_customer`
--
ALTER TABLE `{prefix}_customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `{prefix}_orders`
--
ALTER TABLE `{prefix}_orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `{prefix}_product`
--
ALTER TABLE `{prefix}_product`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `{prefix}_stock`
--
ALTER TABLE `{prefix}_stock`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `oas_user`
--
ALTER TABLE `{prefix}_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;