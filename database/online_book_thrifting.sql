-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 03:38 AM
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
-- Database: `online_book_thrifting`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(1, '4', 'English Books', 'Durga Prasad Bhatta', 'SEE Grade X English Practice Book - Class 10 English Practice Book (New \r\nBased on the latest syllabus issued by CDC\r\n', 0, 450, '1732335360_english10.jpg', '2020-11-06 10:57:51'),
(2, '3,2', 'Python Programming', 'Anthony Brun', 'A Step by Step Guide from Beginner to  Expert', 0, 800, '1604631960_python_book.jpg', '2020-11-06 11:06:58'),
(3, '1', 'Biology', 'By: Alok Paudel, Dr. Narayan Prasad Ghimire, Mr. Alok Paudel, Rojan Tapol', 'Technical Biology with Practical Grade 11 (Plant/Animal Science)', 0, 400, '1732335600_Technical-Biology-With-Practical-11.jpg', '2024-11-23 10:05:16'),
(4, '2', 'Marketing Management', 'Sushil Awale, Biksah Shrestha, Pranay Raj Acharya & Bhushan Dahal', 'This book being the first book on services marketing with Nepalese perspective in Nepal, it will be very useful for all managers and practitioners to enhance their knowledge on service marketing management. And definitely this book has accommodated complete syllabus of Tribhuvan University BBA, Purbanchal University BBA, Tribhuvan University MBS, and major part of other bachelor and MBA programs.', 0, 600, '1732335780_marketing-management.jpg', '2024-11-23 10:08:06'),
(7, '1', 'Account', 'Dr. Yadav Raj Koirala', 'Specifications of Principles of Accounting Textbook for Class 11 Asmita New Syllabus', 0, 300, '1732354080_book2.jpg', '2024-11-23 15:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `book_id`, `qty`, `price`, `customer_id`) VALUES
(4, 1, 4, 2500, 2),
(6, 5, 2, 700, 3),
(8, 3, 5, 600, 1),
(9, 5, 5, 300, 1),
(10, 1, 1, 450, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, '+2 Books', '+2 books with different faculty'),
(2, 'Master books', 'Master books '),
(3, 'Bachelor Books', 'Bachelor Books with different faculty'),
(4, 'School Books', 'School Books From class 1 to 10');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(1, 'sush Tandan', 'kathmandu', '9878787870', 'sush@gmail.com', 'cfa6036ef7743ed8137014558101205d', '2020-11-06 12:59:12'),
(2, 'sushila', 'kathmandu', '9848080892', 'tandansushila16@gmail.com', 'fe3ec8a8cc95b4ae5e197d7f6575dde8', '2024-11-17 09:11:14'),
(3, 'sushila ', 'kathmandu-balkhu', '9848080888', 'sushila@gmail.com', 'fe3ec8a8cc95b4ae5e197d7f6575dde8', '2024-11-23 09:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(2, 3, 'kathmandu-balkhu', 0, 1, '2024-11-23 14:04:04'),
(3, 3, 'kathmandu-balkhu', 0, 0, '2024-11-23 14:04:24'),
(4, 1, 'kathmandu', 0, 0, '2024-11-23 14:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(3, 2, 3, 3, 600),
(4, 4, 3, 2, 600);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Online Book Thrifting', 'onlinebookthrifting@gmail.com', '07151511', '', '&lt;p&gt;Welcome to Online Book Thrifting, where every book finds its next adventure!&lt;/p&gt;&lt;p&gt;We&amp;rsquo;re passionate about connecting book lovers with affordable, pre-loved books that inspire, educate, and entertain. At the heart of what we do is a love for stories both the ones printed on pages and the ones behind the books themselves.&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://localhost/online_book_thrifting/admin/assets/uploads/1732353660_book3.jpg&quot; style=&quot;width: 1157px;&quot; class=&quot;fr-fic fr-dib&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
