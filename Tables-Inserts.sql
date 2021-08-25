-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 18, 2020 at 10:10 AM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PROJECT`
--
CREATE DATABASE IF NOT EXISTS `PROJECT` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `PROJECT`;

-- --------------------------------------------------------

--
-- Table structure for table `Awards`
--

CREATE TABLE `Awards` (
  `award_id` int(6) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `target_user` varchar(30) DEFAULT NULL,
  `award_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Awards`
--

INSERT INTO `Awards` (`award_id`, `user_id`, `target_user`, `award_name`) VALUES
(1, 'p_2', 'p_1', 'Poop Master'),
(2, 'p_1', 'p_2', 'Things Doer'),
(3, 'p_2', 'p_3', 'Bird Chaser'),
(4, 'p_3', 'p_4', 'Mix Master'),
(5, 'p_4', 'p_5', 'Sit down and study'),
(6, 'p_1', 'p_2', 'Best Friend'),
(7, 'p_3', 'p_2', 'Best Teacher'),
(8, 'p_1', 'p_2', 'HasCutestPet'),
(9, 'p_3', 'p_4', 'BestChef'),
(10, 'p_3', 'p_5', 'The funniest');

-- --------------------------------------------------------

--
-- Table structure for table `CC_Info`
--

CREATE TABLE `CC_Info` (
  `cc_id` varchar(10) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `cc_name` varchar(30) DEFAULT NULL,
  `name_on_cc` varchar(30) DEFAULT NULL,
  `cc_number` varchar(20) DEFAULT NULL,
  `cc_expiry` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CC_Info`
--

INSERT INTO `CC_Info` (`cc_id`, `user_id`, `cc_name`, `name_on_cc`, `cc_number`, `cc_expiry`) VALUES
('cc_1', 'p_1', 'Amex', 'John Smith', '1111 1111 1111 1111', 2022),
('cc_2', 'p_2', 'VISA', 'Jane Doe', '2222 2222 2222 2222', 2030),
('cc_3', 'p_3', 'Mastercard', 'Donald Duck', '3333 3333 3333 3333 ', 2032),
('cc_4', 'p_4', 'Discover', 'Ned Flanders', '4444 4444 4444 4444', 2035),
('cc_5', 'p_5', 'VISA', 'Sherlock Holmes', '5555 5555 5555 5555', 2028);

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `comment_id` varchar(20) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `target_id` varchar(30) DEFAULT NULL,
  `target_type` varchar(30) DEFAULT NULL,
  `comment_content` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`comment_id`, `user_id`, `target_id`, `target_type`, `comment_content`) VALUES
('co_1', 'p_1', '1', 'post', 'Hey, nice picture!'),
('co_2', 'p_2', '345', 'groups', 'You have a cute dog!'),
('co_3', 'p_3', '2', 'post', 'That cat is evil!'),
('co_4', 'p_4', '131', 'page', 'That is a hoax!'),
('co_5', 'p_5', '1', 'post', 'Thank you!');

-- --------------------------------------------------------

--
-- Table structure for table `Friends`
--

CREATE TABLE `Friends` (
  `user_1_id` varchar(30) DEFAULT NULL,
  `user_2_id` varchar(30) DEFAULT NULL,
  `date_or_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Friends`
--

INSERT INTO `Friends` (`user_1_id`, `user_2_id`, `date_or_creation`) VALUES
('p_1', 'p_2', '2020-12-14 19:12:24'),
('p_2', 'p_3', '2020-12-14 19:12:24'),
('p_3', 'p_4', '2020-12-14 19:12:24'),
('p_4', 'p_5', '2020-12-14 19:12:24'),
('p_5', 'p_1', '2020-12-14 19:12:24'),
('p_5', 'p_2', '2020-12-14 19:12:24');

-- --------------------------------------------------------

--
-- Table structure for table `groupMembers`
--

CREATE TABLE `groupMembers` (
  `group_id` varchar(30) DEFAULT NULL,
  `member_id` varchar(30) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupMembers`
--

INSERT INTO `groupMembers` (`group_id`, `member_id`, `time_stamp`) VALUES
('345', 'p_4', '2020-12-16 19:18:22'),
('567', 'p_3', '2020-12-16 19:18:22'),
('789', 'p_2', '2020-12-16 19:18:22'),
('1011', 'p_1', '2020-12-16 19:18:22'),
('123', 'p_1', '2020-12-16 19:18:22'),
('123', 'p_2', '2020-12-16 19:18:22'),
('345', 'p_3', '2020-12-18 02:38:00'),
('345', 'p_5', '2020-12-18 02:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `user_id` varchar(30) DEFAULT NULL,
  `group_id` int(8) NOT NULL,
  `group_name` varchar(30) DEFAULT NULL,
  `date_of_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`user_id`, `group_id`, `group_name`, `date_of_creation`) VALUES
('p_1', 123, 'Family', '2020-12-01 14:30:30'),
('p_2', 345, 'BookClub', '2020-12-01 16:30:30'),
('p_3', 567, 'Neighbors', '2018-11-01 12:30:30'),
('p_4', 789, 'MySQL_supportgroup', '2019-08-01 11:30:30'),
('p_5', 1011, 'PythonGroup', '2000-09-01 16:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `Likes`
--

CREATE TABLE `Likes` (
  `user_id` varchar(30) DEFAULT NULL,
  `target_id` varchar(30) DEFAULT NULL,
  `target_type` varchar(30) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Likes`
--

INSERT INTO `Likes` (`user_id`, `target_id`, `target_type`, `time_stamp`) VALUES
('p_1', '1', 'post', '2019-08-01 16:54:06'),
('p_1', 'co_2', 'comment', '2019-08-01 16:54:06'),
('p_2', 'co_1', 'comment', '2020-07-01 13:04:06'),
('p_2', '130', 'page', '2020-07-01 13:04:06'),
('p_3', 'co_4', 'comment', '2020-12-15 16:54:06'),
('p_3', 'co_5', 'comment', '2020-12-15 16:54:06'),
('p_4', '2', 'post', '2020-10-06 12:54:06'),
('p_1', 'co_1', 'comment', '2020-12-16 18:47:13'),
('p_5', '1', 'post', '2020-12-17 20:03:41'),
('p_4', '1', 'post', '2020-12-17 20:03:41'),
('p_3', '1', 'post', '2020-12-17 20:03:41'),
('p_2', '1', 'post', '2020-12-17 20:03:41'),
('p_1', '2', 'post', '2020-12-17 20:03:41'),
('p_3', '2', 'post', '2020-12-17 20:03:41'),
('p_5', '2', 'post', '2020-12-17 20:03:41'),
('p_5', '3', 'post', '2020-12-17 20:03:41'),
('p_5', '6', 'post', '2020-12-17 20:18:14'),
('p_4', '6', 'post', '2020-12-17 20:18:14'),
('p_3', '7', 'post', '2020-12-17 20:18:14'),
('p_2', '8', 'post', '2020-12-17 20:18:14'),
('p_1', '8', 'post', '2020-12-17 20:18:14'),
('p_3', '9', 'post', '2020-12-17 20:18:14'),
('p_5', '9', 'post', '2020-12-17 20:18:14'),
('p_1', '9', 'post', '2020-12-17 20:18:14'),
('p_2', '9', 'post', '2020-12-17 20:18:14'),
('p_5', '4', 'post', '2020-12-17 21:12:49'),
('p_1', '10', 'post', '2020-12-17 21:21:46'),
('p_2', '5', 'post', '2020-12-17 21:21:46'),
('p_1', '5', 'post', '2020-12-17 21:21:46'),
('p_3', '5', 'post', '2020-12-17 21:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `pass` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`pass`, `email`) VALUES
('password1', 'john_smith@test.com'),
('password2', 'jane_doe@test.com'),
('password3', 'donald_duck@test.com'),
('password4', 'ned_flanders@test.com'),
('password5', 'sherlock_holmes@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `Money_Transactions`
--

CREATE TABLE `Money_Transactions` (
  `user_1_id` varchar(30) NOT NULL,
  `user_2_id` varchar(30) DEFAULT NULL,
  `cc_id` varchar(20) DEFAULT NULL,
  `Transaction_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Money_Transactions`
--

INSERT INTO `Money_Transactions` (`user_1_id`, `user_2_id`, `cc_id`, `Transaction_time`) VALUES
('p_1', 'p_2', 'cc_1', '2019-08-01 16:54:06'),
('p_2', 'p_3', 'cc_2', '2020-07-01 13:04:06'),
('p_3', 'P_4', 'cc_3', '2020-12-15 16:54:06'),
('p_4', 'p_5', 'cc_4', '2020-10-06 12:54:06'),
('p_5', 'p_1', 'cc_1', '2020-12-01 21:50:06'),
('p_1', 'p_2', 'cc_1', '2020-12-16 18:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE `Pages` (
  `user_id` varchar(30) DEFAULT NULL,
  `page_id` int(100) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `topic` varchar(30) DEFAULT NULL,
  `subtopic` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`user_id`, `page_id`, `time_stamp`, `topic`, `subtopic`) VALUES
('p_1', 130, '2020-12-01 14:30:30', 'Python', 'Functions'),
('p_2', 131, '2020-12-16 05:03:44', 'MySQL', 'Types of data'),
('p_3', 132, '2010-03-01 19:31:30', 'Cars', 'Prices'),
('p_4', 133, '2020-12-27 01:10:30', 'Classes', 'Required reading books'),
('p_5', 134, '2020-12-11 09:20:30', 'Mammals', 'Dolphins');

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `post_id` varchar(30) NOT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `post_content` mediumtext,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`post_id`, `user_id`, `post_content`, `time_stamp`) VALUES
('1', 'p_1', 'Man tries to hug a wild lion (omg! why did he do that?)', '2020-12-15 01:42:37'),
('10', 'p_5', 'This is how parents can relieve stress throughout the day', '2020-12-18 01:16:01'),
('2', 'p_2', 'You wont believe what happened next(Oh god! I have to know what happened next!)', '2020-12-15 01:42:37'),
('3', 'p_3', 'Mycha started drinking two glasses of bitter-guard juice everyday for seven days and the results are amazing.', '2020-12-15 01:42:37'),
('4', 'p_4', 'A school girl gave her lunch to a homeless man. What he did next will leave you in tears!', '2020-12-15 01:42:37'),
('5', 'p_5', '21 stars who ruined their face due to plastic surgery. Talk about regrets!', '2020-12-15 06:42:37'),
('6', 'p_1', 'They Laughed When I Sat Down at the Computer, But When I Started to Type…)', '2020-12-18 01:16:01'),
('7', 'p_2', 'Forbes Entrepreneur Shares 10 Tips…)', '2020-12-18 01:16:01'),
('8', 'p_3', 'This Is Why You’re Losing Money', '2020-12-18 01:16:01'),
('9', 'p_4', 'This Is Why Business Owners are Investing in Bitcoin', '2020-12-18 01:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `Tags`
--

CREATE TABLE `Tags` (
  `user1_id` varchar(30) DEFAULT NULL,
  `user2_id` varchar(30) DEFAULT NULL,
  `tag_id` int(10) NOT NULL,
  `tag_comment` varchar(30) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `target_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Tags`
--

INSERT INTO `Tags` (`user1_id`, `user2_id`, `tag_id`, `tag_comment`, `time_stamp`, `target_id`) VALUES
('p_4', 'p_3', 328277, 'Vaccine for President.', '2020-12-18 09:29:39', '3'),
('p_3', 'p_2', 987432, 'Fake news 2020.', '2020-12-18 09:29:39', '2'),
('p_4', 'p_5', 4565890, 'Final project of the year!!', '2020-12-18 09:29:39', '4'),
('p_2', 'p_1', 5559038, 'Yo check this out!', '2020-12-18 09:29:39', '1'),
('p_5', 'p_4', 5654774, 'Cheap Flights.', '2020-12-18 09:29:39', '4'),
('p_5', 'p_1', 9084763, 'Hi, I\'m 12!!', '2020-12-18 09:29:39', '5'),
('p_1', 'p_2', 12345678, 'Rashaan is winning', '2020-12-18 09:29:39', '1'),
('p_3', 'p_4', 87463533, 'Be like Mike!!', '2020-12-18 09:29:39', '3'),
('p_2', 'p_3', 98765432, 'Andrea is our leader!', '2020-12-18 09:29:39', '2'),
('p_1', 'p_5', 904836124, 'viajar y vivir la vida!', '2020-12-18 09:29:39', '5');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` varchar(30) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `first_name`, `last_name`, `dob`, `address`, `email`, `created_at`) VALUES
('p_1', 'John', 'Smith', '01/01/1999', '805 St Cloud Road, Bel Air, Los Angeles, CA.', 'john_smith@test.com', '2020-12-15 16:34:21'),
('p_2', 'Jane', 'Doe', '02/02/2000', '1938 Sulivan Ln, Metropolis, U.S.A.', 'jane_doe@test.com', '2020-12-15 16:34:21'),
('p_3', 'Donald', 'Duck', '09/06/1934', '1313 Webfoot Walk, Duckburg, Calisota', 'donald_duck@test.com', '2020-12-15 16:34:21'),
('p_4', 'Ned', 'Flanders', '12/17/1989', '740 Evergreen Terrace, Springfield', 'ned_flanders@test.com', '2020-12-15 16:34:21'),
('p_5', 'Sherlock', 'Holmes', '05/22/1859', '221B Baker Street, London, U.K.', 'sherlock_holmes@test.com', '2020-12-15 16:34:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Awards`
--
ALTER TABLE `Awards`
  ADD PRIMARY KEY (`award_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `target_user` (`target_user`);

--
-- Indexes for table `CC_Info`
--
ALTER TABLE `CC_Info`
  ADD PRIMARY KEY (`cc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Friends`
--
ALTER TABLE `Friends`
  ADD KEY `user_1_id` (`user_1_id`),
  ADD KEY `user_2_id` (`user_2_id`);

--
-- Indexes for table `groupMembers`
--
ALTER TABLE `groupMembers`
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Likes`
--
ALTER TABLE `Likes`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD KEY `email` (`email`);

--
-- Indexes for table `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Tags`
--
ALTER TABLE `Tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `user1_id` (`user1_id`,`user2_id`),
  ADD KEY `user2_id` (`user2_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Awards`
--
ALTER TABLE `Awards`
  ADD CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `awards_ibfk_2` FOREIGN KEY (`target_user`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `CC_Info`
--
ALTER TABLE `CC_Info`
  ADD CONSTRAINT `cc_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Friends`
--
ALTER TABLE `Friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_1_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`user_2_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groupMembers`
--
ALTER TABLE `groupMembers`
  ADD CONSTRAINT `groupmembers_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Groups`
--
ALTER TABLE `Groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Likes`
--
ALTER TABLE `Likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Users` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `Pages`
--
ALTER TABLE `Pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `Tags`
--
ALTER TABLE `Tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`target_id`) REFERENCES `Posts` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_ibfk_2` FOREIGN KEY (`user1_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_ibfk_3` FOREIGN KEY (`user2_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;