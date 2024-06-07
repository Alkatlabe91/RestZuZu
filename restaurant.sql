-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 02:07 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'Nigiri en Gunkan', 'Nigiri of nigirizushi is sushirijst, met de hand gevormd tot een vingerdik blokje en belegd met een topping van rauwe vis, garnaal, krab, inktvis, zee-egel of een andere zeevrucht. Het gerecht is een van de traditionele vormen van sushi.', '2022-01-05 21:08:00'),
(2, 'Urumaki 8 st', 'Het Japanse gerecht uramaki is binnenstebuiten gekeerde maki, een sushirolletje bestaande uit sushirijst, twee of drie soorten vulling en een velletje zeewier, zo gerold dat het zeewier aan de binnenkant en de rijst aan de buitenkant zit.\r\n\r\n', '2022-01-05 21:40:16'),
(3, 'Hosomaki', 'Een hosomaki is een dunne rol met rijst en meestal 1 ingrediënt en nori aan de buitenkant.\r\n', '2022-01-05 21:40:16'),
(4, 'SIDES ORDERS', 'Complement your order with wide range of sides available at Zuzu Sushi Den Haag', '2022-01-05 21:42:12'),
(5, 'DRANKEN', 'Complement your order with wide range of sides available at Zuzu Sushi Den Haag', '2022-01-05 21:43:49');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `sushiId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `sushiId`, `itemQuantity`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 1),
(3, 1, 4, 1),
(4, 2, 1, 1),
(5, 2, 5, 1),
(6, 2, 7, 1),
(7, 2, 8, 1),
(8, 3, 31, 1),
(9, 3, 30, 1),
(10, 4, 17, 1),
(11, 4, 18, 1),
(12, 4, 19, 1),
(13, 5, 1, 5),
(14, 5, 38, 1),
(15, 6, 1, 1),
(16, 7, 9, 1),
(17, 7, 10, 1),
(18, 8, 1, 1),
(19, 9, 1, 1),
(20, 10, 1, 1),
(21, 11, 1, 1),
(22, 11, 29, 1),
(23, 12, 37, 1),
(24, 12, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` varchar(7) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(5, 3, 'Hengelolaan 1039, 1039', '2544 GH', 687231339, 12, '0', '0', '2022-01-10 00:11:44'),
(6, 3, 'Hengelolaan, 1039, 1039', '2544 GH', 687231339, 2, '0', '0', '2022-01-18 15:21:38'),
(7, 3, 'Hengelolaan, 1039, 1039', '2544 GH', 687231339, 21, '0', '0', '2022-01-18 15:23:54'),
(8, 3, 'Hengelolaan, 1039, 1039', '2544 GH', 687231339, 2, '0', '0', '2022-01-18 15:25:38'),
(9, 7, 'tinwerf 16, ', '2544AA', 1234567899, 2, '0', '0', '2022-03-15 12:02:52'),
(10, 7, 'HEt zicht, AKASDMA', '123456', 1234567890, 2, '0', '0', '2022-04-13 14:38:12'),
(11, 7, 'Amsterdamstraat, ', '1004AN', 1234567890, 5, '0', '0', '2022-04-17 02:06:26'),
(12, 9, 'rami1234, ', '1111aa', 1234567890, 5, '0', '0', '2022-05-15 06:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'ZuZu Sushi', 'Zuzusushi@nl.com', 1111111111, 2222222222, 'Tinwerf 16.<br> Den Haag', '2022-01-07 01:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `sushi`
--

CREATE TABLE `sushi` (
  `sushiId` int(12) NOT NULL,
  `sushiName` varchar(255) NOT NULL,
  `sushiPrice` float NOT NULL,
  `sushiDesc` text NOT NULL,
  `sushiCategorieId` int(12) NOT NULL,
  `sushiPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sushi`
--

INSERT INTO `sushi` (`sushiId`, `sushiName`, `sushiPrice`, `sushiDesc`, `sushiCategorieId`, `sushiPubDate`) VALUES
(1, 'Nigiri Sake', 1.8, 'zalm', 1, '2022-01-01 21:03:26'),
(2, 'Nigiri Maguro', 2, 'tonijn', 1, '2022-01-01 21:20:58'),
(3, 'Nigiri Saba', 1.6, 'makreel', 1, '2022-01-01 21:22:07'),
(4, 'Nigiri Suzuki', 1.8, 'zeebaars', 1, '2022-01-01 21:23:05'),
(5, 'Nigiri Tai', 1.8, 'dorade', 1, '2022-01-01 21:23:48'),
(6, 'Nigiri Tamago', 1.5, 'Japanse omelet', 1, '2022-01-01 21:24:38'),
(7, 'Nigiri Unagi', 3.2, 'gegrilde paling', 1, '2022-01-01 21:25:42'),
(8, 'Nigiri Inari', 1.5, 'tofubuidel', 1, '2022-01-01 21:26:31'),
(9, 'Unagi Roll (8st.)', 11, 'gegrilde paling', 2, '2022-01-01 21:27:21'),
(10, 'California Roll (8st.)', 10, 'krabstick , avocado en kuit', 2, '2022-01-01 21:28:06'),
(11, 'Ebi Furai Roll (8st.)', 11.5, 'gefrituurde garnalen', 2, '2022-01-01 21:28:49'),
(12, 'Spicy Tuna Roll (8st.)', 11.5, 'pittige tonijn', 2, '2022-01-01 21:29:41'),
(13, 'Spider Roll (8st.)', 12, 'gepaneerde soft shell krab', 2, '2022-01-01 21:34:37'),
(14, 'Tokyo Roll (8st.)', 11.5, 'zalm, komkommer', 2, '2022-01-01 21:35:31'),
(15, 'Tempura Roll (8st.)', 10, 'tempura garnalen met avocado', 2, '2022-01-01 21:36:36'),
(16, 'Fuji Roll (8st.)', 10.5, 'St. Jacobsschelp met rettich', 2, '2022-01-01 21:37:21'),
(17, 'Kappa Maki', 3.5, 'komkommer', 3, '2022-01-01 21:38:13'),
(18, 'Tekka Maki', 5.5, 'tonijn', 3, '2022-01-01 21:39:49'),
(19, 'Sake Maki', 5.2, 'zalm', 3, '2022-01-01 21:40:58'),
(20, 'Oshinko Maki', 3.8, 'Japanse rettich', 3, '2022-01-01 21:41:49'),
(21, 'Tamago Maki ', 3.8, 'Japanse omelet', 3, '2022-01-01 21:44:44'),
(22, 'Avocado Maki', 3.5, 'avocado', 3, '2022-01-01 21:45:34'),
(23, 'Unagi Maki', 5.8, 'gegrilde paling', 3, '2022-01-01 21:46:21'),
(24, 'Suzuki Maki', 4.5, 'zeebaars', 3, '2022-01-01 21:47:07'),
(29, 'Knoflook Breadsticks', 3.2, 'The endearing tang of garlic in breadstics baked to perfection.', 4, '2022-01-01 22:01:33'),
(30, 'Gevuld Knoflookbrood', 3.5, 'Versgebakken Knoflookbrood gevuld met mozzarella kaas, zoete likdoorns & pittige en pittige jalapeños', 4, '2021-03-17 22:02:50'),
(31, 'Vegetarische Pasta Italiano Wit', 8.5, 'Penne Pasta gemengd met extra vierge olijfolie, exotische kruiden en een royale portie nieuwe gearomatiseerde saus', 4, '2021-03-17 22:03:44'),
(32, 'Niet Vegetarische Pasta Italiano Wit', 7.5, 'Penne Pasta gemengd met extra vierge olijfolie, exotische kruiden en een royale portie nieuwe gearomatiseerde saus', 4, '2021-03-17 22:05:08'),
(33, 'Kaas Jalapeno Dip', 1.5, 'Een zachte romige kaasdip gekruid met jalapeno', 4, '2021-03-17 22:06:06'),
(34, 'Kaas dip', 1.1, 'Een dromerige romige kaasdip om je snack net dat beetje extra te geven', 4, '2021-03-17 22:06:59'),
(35, 'Lavacake', 3, 'Gevuld met heerlijke gesmolten chocolade van binnen', 4, '2021-03-17 22:08:13'),
(36, 'Butterscotch Mousse Taart', 7, 'Een romige en chocoladeachtige verwennerij met lagen rijke, donzige Butterscotch Cream en heerlijke donkere chocoladecake, gegarneerd met knapperige stukjes pure chocolade - voor een perfecte desserttraktatie!', 4, '2021-03-17 22:08:58'),
(37, 'Lipton Ice Tea', 2, ' 250ml', 5, '2021-03-17 22:12:53'),
(38, 'Mirinda', 3, '500ml', 5, '2021-03-17 22:13:38'),
(39, 'Pepsi Black Can', 1.5, 'PEPSI BLACK CAN', 5, '2021-03-17 22:14:24'),
(40, 'Pepsi\r\n', 3, '500ml', 5, '2021-03-17 22:16:29'),
(41, '7Up', 3, '500ml', 5, '2021-03-17 22:17:08'),
(53, 'Drinking Water', 1.5, 'Drinking Water	', 5, '2021-03-18 08:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(7, 'max', 'max', 'max', 'max@max.com', 123456789, '0', '$2y$10$ykJxpQxVX790dT/8uiFWbuAzHcohdElDxp8gtDBpyHyocRiZDoqd.', '2022-03-15 12:00:52'),
(8, 'Sam', 'Sam', 'Samo', 'sam@gmail.com', 123456789, '0', '$2y$10$gZT.pllXz4JwjpP29W.K/OcSbV4QAn/dHu4ykkGAWd7WjgPgpq.iC', '2022-04-04 00:56:56'),
(9, 'Rami', 'rami', 'rami', 'rami@gm.com', 123456789, '0', '$2y$10$Fz2t2S4LPmGXJkdx6xBMUeRfI0J00UchvwDYuMYlfpKj9UI/0.rtm', '2022-05-15 06:22:24'),
(10, 'admin', 'admin', 'admin', 'admin@admin.com', 687435756, '1', '$2y$10$mHZ8wIO.7x1Ove4Z0ocVn.oi7m8/z.xuQ8WOIsydwb.Dvqdo2JcBm', '2024-06-07 02:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `sushiId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `sushiId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(56, 1, 1, 7, '2022-05-11 23:46:57'),
(57, 2, 1, 7, '2022-05-11 23:46:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `sushi`
--
ALTER TABLE `sushi`
  ADD PRIMARY KEY (`sushiId`);
ALTER TABLE `sushi` ADD FULLTEXT KEY `pizzaName` (`sushiName`,`sushiDesc`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sushi`
--
ALTER TABLE `sushi`
  MODIFY `sushiId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
