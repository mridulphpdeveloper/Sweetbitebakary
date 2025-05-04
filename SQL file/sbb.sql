-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 07:23 AM
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
-- Database: `sbb_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '1234', '2024-07-24 16:21:18', '25-07-2024 ');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Birthday', 'For Birthday', '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(2, 'Annivesary', 'For Anniversary', '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(3, 'Party', 'For Party', '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(4, 'Wedding', 'For Wedding', '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(5, 'Cookies', 'Daily', '2025-01-05 15:28:18', NULL),
(6, 'Sweets', 'Daily', '2025-01-05 15:30:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL,
  `ordernote` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`, `ordernote`) VALUES
(42, 2, '92', 1, '2024-10-13 20:48:01', 'COD', NULL, ''),
(43, 12, '94', 1, '2024-10-13 21:05:03', 'SSLCOMMERZ', NULL, ''),
(44, 12, '103', 1, '2024-10-13 21:05:03', 'SSLCOMMERZ', NULL, ''),
(45, 14, '99', 1, '2024-10-15 13:11:09', NULL, NULL, ''),
(51, 21, '93', 1, '2024-10-15 14:05:45', 'SSLCOMMERZ', NULL, ''),
(53, 1, '131', 1, '2024-10-16 12:41:29', 'COD', NULL, 'give me in 3 days '),
(54, 1, '138', 1, '2024-10-16 12:41:29', 'COD', NULL, 'give me in 3 days '),
(55, 3, '93', 1, '2024-10-16 12:42:07', 'SSLCOMMERZ', NULL, ''),
(56, 4, '100', 1, '2024-10-16 12:43:57', 'SSLCOMMERZ', NULL, 'red colur and give me at  28sept'),
(57, 4, '135', 1, '2024-10-16 12:43:57', 'SSLCOMMERZ', NULL, 'red colur and give me at  28sept'),
(58, 3, '102', 1000, '2025-01-05 16:34:24', 'COD', NULL, ''),
(59, 26, '144', 1, '2025-01-07 10:17:50', 'SSLCOMMERZ', 'in Process', ''),
(60, 26, '93', 1, '2025-01-08 06:19:33', 'SSLCOMMERZ', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 1, 'in Process', 'Order has been Shipped.', '2024-07-24 16:21:18'),
(2, 2, 'Delivered', 'Order Has been delivered', '2024-07-24 16:21:18'),
(3, 3, 'Delivered', 'Product delivered successfully', '2024-07-24 16:21:18'),
(4, 4, 'in Process', 'Product ready for Shipping', '2024-07-24 16:21:18'),
(11, 59, 'in Process', 'get at 12 am ', '2025-01-07 10:21:22');

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
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`, `status`) VALUES
(1, 112, 3, 3, 1, 'Momtahina Mohona', 'Good', 'Cake is too much tasty', '2024-10-09 06:55:43', 1),
(7, 117, 1, 3, 3, 'Siam Ahmed ', 'Satisfifed', 'Cake is good ', '2024-10-09 07:11:38', 1),
(8, 122, 5, 2, 1, 'Anabia Islam', 'Best', 'Cake tooo much good & Tasty', '2024-10-09 07:12:23', 1),
(9, 106, 5, 2, 1, 'Ayesha Siddika', 'Best', 'Tooo much good', '2024-10-09 07:15:53', 1);

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
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(93, 2, 4, 'Chocolate Truffle Cake', 'Yummy Delights', 3020, 3400, '3 pound Chocolate Truffle Cake - Dark, rich chocolate sponge with decadent ganache and a smooth, glossy finish. A must for chocolate lovers.', '02.jpg', '02.jpg', '02.jpg', 100, 'In Stock', '2024-10-13 18:29:21', NULL),
(94, 3, 7, 'Vanilla Bean Cake ', 'Yummy Delights', 3120, 3200, '3 pound Vanilla Bean Cake - Light yellow with pure vanilla bean infusion, soft layers, and creamy buttercream. Classic and comforting for any celebration.', '03.jpg', '03.jpg', '03.jpg', 100, 'In Stock', '2024-10-13 18:30:35', NULL),
(102, 1, 1, 'Mango Delight Cake', 'Yummy Delights', 3110, 3300, '3 pound Mango Delight Cake - Golden yellow with tropical mango flavor, soft sponge, and mango-infused cream. A vibrant summer choice.', '09.jpg', '09.jpg', '09.jpg', 100, 'In Stock', '2024-10-13 18:47:04', NULL),
(112, 2, 5, 'Chocolate Truffle Cake ', 'Yummy Delights', 1700, 1800, '2 pound Chocolate Truffle Cake - Dark, rich chocolate sponge with decadent ganache and a smooth, glossy finish. A must for chocolate lovers.\r\n\r\n', '02.jpg', '02.jpg', '02.jpg', 100, 'In Stock', '2024-10-13 19:10:24', NULL),
(114, 3, 8, 'Vanilla Bean Cake', 'Yummy Delights', 1650, 1800, '2 pound Vanilla Bean Cake - Light yellow with pure vanilla bean infusion, soft layers, and creamy buttercream. Classic and comforting for any celebration.', '03.jpg', '03.jpg', '03.jpg', 100, 'In Stock', '2024-10-13 19:13:42', NULL),
(120, 1, 2, 'Mango Delight Cake ', 'Yummy Delights', 1790, 1820, '2 pound Mango Delight Cake - Golden yellow with tropical mango flavor, soft sponge, and mango-infused cream. A vibrant summer choice. ', '09.jpg', '09.jpg', '09.jpg', 100, 'In Stock', '2024-10-13 19:24:56', NULL),
(123, 4, 11, 'Blueberry Cheesecake', 'Yummy Delights', 1640, 1800, '2 pound Blueberry Cheesecake - Purple swirls of blueberry compote over creamy cheesecake filling. Rich, smooth, and bursting with fresh flavor.', '12.jpg', '12.jpg', '12.jpg', 100, 'In Stock', '2024-10-13 19:29:11', NULL),
(125, 2, 6, 'Chocolate Truffle Cake ', 'Yummy Delights', 960, 1200, '1 pound Chocolate Truffle Cake - Dark, rich chocolate sponge with decadent ganache and a smooth, glossy finish. A must for chocolate lovers.', '02.jpg', '02.jpg', '02.jpg', 100, 'In Stock', '2024-10-13 19:34:59', NULL),
(126, 3, 9, 'Vanilla Bean Cake', 'Yummy Delights', 1000, 1100, '1 pound Vanilla Bean Cake - Light yellow with pure vanilla bean infusion, soft layers, and creamy buttercream. Classic and comforting for any celebration.', '03.jpg', '03.jpg', '03.jpg', 100, 'In Stock', '2024-10-13 19:36:29', NULL),
(132, 1, 3, 'Mango Delight Cake', 'Yummy Delights', 1070, 1230, '1 pound Mango Delight Cake - Golden yellow with tropical mango flavor, soft sponge, and mango-infused cream. A vibrant summer choice.', '09.jpg', '09.jpg', '09.jpg', 100, 'In Stock', '2024-10-13 19:45:18', NULL),
(135, 4, 12, 'Blueberry Cheesecake ', 'Yummy Delights', 1100, 1450, '1 pound Blueberry Cheesecake - Purple swirls of blueberry compote over creamy cheesecake filling. Rich, smooth, and bursting with fresh flavor. ', '12.jpg', '12.jpg', '12.jpg', 100, 'In Stock', '2024-10-13 19:49:00', NULL),
(138, 4, 10, 'Blueberry Cheesecake ', 'Yummy Delights', 3120, 3320, 'Blueberry Cheesecake - Purple swirls of blueberry compote over creamy cheesecake filling. Rich, smooth, and bursting with fresh flavor.', '12.jpg', '12.jpg', '12.jpg', 100, 'In Stock', '2024-10-13 20:32:47', NULL),
(144, 5, 13, 'Crave Cookies', 'SweetBite', 520, 500, '1 kg A cookie (American English) or biscuit (British English) is a baked snack or dessert that is typically small, flat, and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, or nuts.', 'cookies.jpg', 'cookies.jpg', 'cookies.jpg', 70, 'In Stock', '2025-01-07 09:34:11', NULL),
(145, 5, 1, 'Crave Cookies', 'SweetBite', 750, 720, '1.5kg A cookie (American English) or biscuit (British English) is a baked snack or dessert that is typically small, flat, and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, or nuts.', 'cookies.jpg', 'cookies.jpg', 'cookies.jpg', 80, 'In Stock', '2025-01-07 09:35:57', NULL),
(146, 5, 15, 'Crave Cookies', 'SweetBite', 1000, 950, '2kg A cookie (American English) or biscuit (British English) is a baked snack or dessert that is typically small, flat, and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter. It may include other ingredients such as raisins, oats, chocolate chips, or nuts.', 'cookies.jpg', 'cookies.jpg', 'cookies.jpg', 80, 'In Stock', '2025-01-07 09:36:59', NULL),
(147, 6, 16, 'Sondesh', 'SweetBite', 670, 650, '1 kg Desserts can be defined as a usually sweeter course that concludes a meal. This definition includes a range of courses ranging from fruits or dried nuts to multi-ingredient cakes and pies. Many cultures have different variations of dessert.', 'sweets.jpg', 'sweets.jpg', 'sweets.jpg', 80, 'In Stock', '2025-01-07 09:39:45', NULL),
(148, 6, 17, 'Sondesh', 'SweetBite', 975, 950, '1.5 kg Desserts can be defined as a usually sweeter course that concludes a meal. This definition includes a range of courses ranging from fruits or dried nuts to multi-ingredient cakes and pies. Many cultures have different variations of dessert.', 'sweets.jpg', 'sweets.jpg', 'sweets.jpg', 80, 'In Stock', '2025-01-07 09:43:15', NULL),
(149, 6, 18, 'Sondesh', 'SweetBite', 1300, 1200, '2 kg Desserts can be defined as a usually sweeter course that concludes a meal. This definition includes a range of courses ranging from fruits or dried nuts to multi-ingredient cakes and pies. Many cultures have different variations of dessert.', 'sweets.jpg', 'sweets.jpg', 'sweets.jpg', 80, 'In Stock', '2025-01-07 09:44:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sbb_contactusquery`
--

CREATE TABLE `sbb_contactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sbb_contactusquery`
--

INSERT INTO `sbb_contactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Polash Bhuiyan', 'polash@gmail.com', '01819707063', 'Can I get a cake for the weekend', '2024-07-24 16:21:18', 1),
(2, 'Nahid Islam', 'nahid@gmail.com', '01785237465', 'Give me the cake in two days', '2024-07-24 16:21:18', 1),
(3, 'Kohinur Akter', 'kohinur@gmail.com', '01843293057', 'Can I book a cake for the coming weekend, weeding cake 2KG ', '2024-07-24 16:21:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sbb_testimonial`
--

CREATE TABLE `sbb_testimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'B_Large', '2024-09-27 18:36:17', NULL),
(2, 1, 'B_Medium', '2024-07-24 16:21:18', NULL),
(3, 1, 'B_Small', '2024-07-24 16:21:18', NULL),
(4, 2, 'A_Large', '2024-09-27 18:35:42', NULL),
(5, 2, 'A_Medium', '2024-09-27 18:35:45', NULL),
(6, 2, 'A_Small', '2024-09-27 18:35:52', NULL),
(7, 3, 'P_Large', '2024-09-27 18:35:55', NULL),
(8, 3, 'P_Medium', '2024-09-27 18:36:03', NULL),
(9, 3, 'P_Small', '2024-09-27 18:36:05', NULL),
(10, 4, 'W_Large', '2024-09-27 18:36:12', NULL),
(11, 4, 'W_Medium', '2024-09-27 18:36:10', NULL),
(12, 4, 'W_Small', '2024-07-24 16:21:18', NULL),
(13, 5, 'C_1kg', '2025-01-06 16:12:56', NULL),
(14, 5, 'C_1.5kg', '2025-01-06 16:13:02', NULL),
(15, 5, 'C_2kg', '2025-01-06 16:13:08', NULL),
(16, 6, 'S_1kg', '2025-01-06 16:13:15', NULL),
(17, 6, 'S_1.5kg', '2025-01-06 16:13:33', NULL),
(18, 6, 'S_2kg', '2025-01-06 16:13:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'ayesha@gmail.com', 0x3132372e302e302e3100000000000000, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM', 1),
(2, 'mohonagmail.com', 0x3132372e302e302e3100000000000000, '2024-07-24 16:21:18', NULL, 1),
(3, 'siam@gmail.com', 0x3132372e302e302e3100000000000000, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM', 1),
(4, 'anabi@gmail.com', 0x3132372e302e302e3100000000000000, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM', 1),
(83, 'ayesha@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-16 12:40:33', '16-10-2024 06:11:36 PM', 1),
(84, 'siam@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-16 12:41:50', NULL, 1),
(85, 'anabi@gmail.com', 0x3a3a3100000000000000000000000000, '2024-10-16 12:42:52', NULL, 1),
(86, 'siam@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-05 16:31:37', NULL, 1);

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
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Ayesha Siddiqa', 'ayesha@gmail.com', 1850333572, '12345', 'Chankharpul', 'Puran Dhaka', 'Bokshibazar', 777777, 'Nimtoli', 'Dhaka', 'Newmarket', 65432, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(2, 'Momtahina Mohona', 'mohona@gmail.com', 1729710071, '12345', 'Dholia', 'Chowmuhoni', 'Feni', 33333, 'Bhuiyanbari', 'Chowmuhoni', 'feni town', 634963, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(3, 'Siam Haque', 'siam@gmail.com', 1325161480, '12345', 'Kholil Gate', 'Gazipur', 'College gate', 55555, 'Cerakali', 'Gazipura', 'College road', 76543, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM'),
(4, 'Anabia Islam', 'anabi@gmail.com', 1707114474, '12345', 'Faridganj', 'Rupsha', 'chadpur', 444444, 'Cumilla', 'Chairmain road', 'Cumilla', 87654, '2024-07-24 16:21:18', '25-07-2024 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 97, '2024-07-24 16:21:18'),
(2, 1, 96, '2024-07-24 16:21:18'),
(3, 5, 81, '2024-07-24 16:21:18');

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
-- Indexes for table `sbb_contactusquery`
--
ALTER TABLE `sbb_contactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sbb_testimonial`
--
ALTER TABLE `sbb_testimonial`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `sbb_contactusquery`
--
ALTER TABLE `sbb_contactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sbb_testimonial`
--
ALTER TABLE `sbb_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11118;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
