-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2017 at 07:05 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--
DROP DATABASE IF EXISTS `library`;
CREATE DATABASE `library` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `isbn` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `pubYear` year(4) NOT NULL,
  `edition` varchar(6) NOT NULL,
  `quntity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `available` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`isbn`, `title`, `author`, `publisher`, `pubYear`, `edition`, `quntity`, `image`, `available`) VALUES
('9780007202300', 'Prince Caspian', 'C.S. Lewis', 'HarperCollins Publishers', 1951, '2nd', 3, 'img/book_covers/9780007202300.jpg', 0),
('9780060155476', 'The Intelligent Investor', 'Benjamin Graham', 'Harper & Row Publishers', 2006, '3th', 4, 'img\\book_covers\\978-0060155476.jpg', 0),
('9780060256654', 'The Giving Tree', ' Shel Silverstein ', 'HarperCollins Publishers', 1964, '1st', 3, 'img/book_covers/9780060256654.jpg', 0),
('9780060531041', 'One Hundred Years of Solitude', 'Gabriel GarcÃ­a MÃ¡rquez, Gregory Rabassa', 'Harper', 2003, '1st', 3, 'img/book_covers/9780060531041.jpg', 0),
('9780060929879', 'Brave New World', 'Aldous Huxley', 'Harper Perennial', 1998, '1st', 1, 'img/book_covers/9780060929879.jpg', 0),
('9780061120084', 'To Kill a Mockingbird', 'Harper Lee', 'Harper Perennial Modern Classics ', 1960, '1st', 8, 'img/book_covers/9780061120084.jpg', 0),
('9780062024039', 'Divergent', 'Veronica Roth', 'Katherine Tegen Books', 2011, '1st', 4, 'img/book_covers/9780062024039.jpg', 0),
('9780140127928', 'One Up On Wall Street', 'Peter Lynch  (Author),? John Rothchild', 'Simon & Schuster', 2000, '6th', 4, 'img\\book_covers\\978-0140127928.jpg', 0),
('9780142000670', 'Of Mice and Men', 'John Steinbeck ', 'Penguin', 2002, '1st', 4, 'img/book_covers/9780142000670.jpg', 0),
('9780156012195', 'The Little Prince', 'Antoine de Saint-ExupÃ©ry', 'Harcourt, Inc', 2000, '1st', 3, 'img/book_covers/9780156012195.jpg', 0),
('9780307277671', 'The Da Vinci Code', 'Dan Brown', 'Anchor ', 2003, '2nd', 2, 'img/book_covers/9780307277671.jpg', 0),
('9780314189578', 'Broker-Dealer Regulation in a Nutshell ', 'Thomas Hazen ', 'West Academic Publishing', 2016, '2nd', 4, 'img\\book_covers\\978-0314189578.jpg', 0),
('9780316015844', 'Twilight ', 'Stephenie Meyer', 'Little, Brown and Company ', 2005, '1st', 3, 'img/book_covers/9780316015844.jpg', 0),
('9780316166683', 'The Lovely Bones', ' Alice Sebold ', 'Little, Brown and Company', 2006, '1st', 2, 'img/book_covers/9780316166683.jpg', 0),
('9780345418265', 'The Princess Bride', 'William Goldman ', 'Ballantine Books', 2003, '1st', 4, 'img/book_covers/9780345418265.jpg', 0),
('9780375831003', 'The Book Thief', ' Markus Zusak ', 'Knopf Books for Young Readers', 2005, '1st', 2, 'img/book_covers/9780375831003.jpg', 0),
('9780385732536', 'Messenger', 'Lois Lowry', 'Ember', 2006, '3th', 3, 'img/book_covers/9780385732536.jpg', 0),
('9780385732550', 'The Giver', 'Lois Lowry', 'Ember', 2006, '1st', 3, 'img/book_covers/9780385732550.jpg', 0),
('9780385732567', 'Gathering Blue', 'Lois Lowry', 'Delacorte Press', 2000, '2nd', 3, 'img/book_covers/9780385732567.jpg', 0),
('9780393330335', 'A Random Walk down Wall Street', 'Burton G. Malkiel', 'W. W. Norton & Company', 2016, '9th', 5, 'img\\book_covers\\978-0393330335.jpg', 2),
('9780393970128', 'Dracula', ' Bram Stoker, Nina Auerbach', 'W.W. Norton & Company', 1986, '1st', 3, 'img/book_covers/9780393970128.jpg', 3),
('9780439023481', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Press ', 2008, '1st', 5, 'img/book_covers/9780439023481.jpg', 5),
('9780439358071', 'Harry Potter and the Order of the Phoenix', 'J.K. Rowling, Mary GrandPrÃ© ', 'Scholastic Inc', 2003, '5th', 7, 'img/book_covers/9780439358071.jpg', 7),
('9780439861366', 'The Horse and His Boy', 'C.S. Lewis', 'Scholastic Inc', 1954, '5th', 4, 'img/book_covers/9780439861366.jpg', 4),
('9780440238157', 'The Amber Spyglass', ' Philip Pullman ', 'Laurel Leaf', 2003, '3th', 3, 'img/book_covers/9780440238157.jpg', 3),
('9780446584142', 'Personal Injuries', 'Vincent L. Scarsella', 'Grand Central', 2011, '3th', 4, 'img\\book_covers\\978-0446584142.jpg', 3),
('9780446675536', 'Gone with the Wind ', ' Margaret Mitchell ', 'Grand Central Publishing', 1936, '1st', 3, 'img/book_covers/9780446675536.jpg', 3),
('9780451528827', 'Anne of Green Gables', 'L.M. Montgomery', 'Signet Book', 2003, '1st', 2, 'img/book_covers/9780451528827.jpg', 2),
('9780452284241', 'Animal Farm', 'George Orwell', 'NAL ', 1945, '1st', 4, 'img/book_covers/9780452284241.jpg', 4),
('9780525478812', 'The Fault in Our Stars', 'John Green', 'Dutton Books', 2012, '1st', 1, 'img/book_covers/9780525478812.jpg', 0),
('9780547887203', 'Son', ' Lois Lowry', 'HMH Books for Young Readers', 2012, '4th', 3, 'img/book_covers/9780547887203.jpg', 3),
('9780553213157', 'Anne of Ingleside', 'L.M. Montgomery', 'Starfire', 1984, '6th', 2, 'img/book_covers/9780553213157.jpg', 2),
('9780553213171', 'Anne of the Island', 'L.M. Montgomery', 'Starfire', 1983, '3th', 2, 'img/book_covers/9780553213171.jpg', 2),
('9780553269215', 'Rainbow Valley', 'L.M. Montgomery', 'Starfire', 1985, '7th', 2, 'img/book_covers/9780553269215.jpg', 2),
('9780553269222', 'Rilla of Ingleside', 'L.M. Montgomery', 'Bantam Books', 1997, '8th', 2, 'img/book_covers/9780553269222.jpg', 2),
('9780553560688', 'The Road to Yesterday', 'L.M. Montgomery', 'Laurel Leaf', 1993, '9th', 2, 'img/book_covers/9780553560688.jpg', 2),
('9780618346257', 'The Fellowship of the Ring', ' J.R.R. Tolkien ', 'Houghton Mifflin Harcourt ', 1954, '1st', 4, 'img/book_covers/9780618346257.jpg', 4),
('9780618346264', 'The Two Towers', 'J.R.R. Tolkien', 'Mariner Books ', 1954, '2nd', 5, 'img/book_covers/9780618346264.jpg', 5),
('9780679879251', 'The Subtle Knife', 'Philip Pullman ', 'Knopf Books for Young Readers ', 1997, '2nd', 3, 'img/book_covers/9780679879251.jpg', 3),
('9780743273565', 'THE GREAT GATSBY', 'F. Scott Fitzgerald', 'Scribner ', 2004, '1st', 10, 'img/book_covers/9780743273565.jpg', 9),
('9780743477116', 'Romeo and Juliet ', ' William Shakespeare, Barbara A. Mowat (editor), Paul Werstine', 'Washington Square Press', 2004, '1st', 1, 'img/book_covers/9780743477116.jpg', 0),
('9780808516965', 'Anne of Windy Poplars', 'L.M. Montgomery', 'Turtleback Books', 1983, '4th', 2, 'img/book_covers/9780808516965.jpg', 2),
('9781137530196', 'The Middleman Economy', 'Marina Krakovsky', 'Palgrave Macmillan', 2015, '1st ', 5, 'img\\book_covers\\978-1137530196.jpg', 4),
('9781416914280', 'City of Bones', 'Cassandra Clare', 'Margaret K. McElderry Books', 2007, '1st', 2, 'img/book_covers/9781416914280.jpg', 2),
('9781416914297', 'City of Ashes', 'Cassandra Clare', 'Margaret K. McElderry Books', 2008, '2nd', 2, 'img/book_covers/9781416914297.jpg', 2),
('9781449370190', 'Learning Web App Development', 'Semmy Purewal', 'O''Reilly Media', 2014, '1st', 4, 'img\\book_covers\\9781118531648.jpg', 3),
('9781491918661', 'Learning PHP, MySQL and JavaScript', 'Robin Nixon', 'OReilly Media', 2014, '4th', 4, 'img\\book_covers\\9781491918661.jpg', 2),
('9781517318086', 'Fix and Flip Your Way To Financial Freedom', 'Mark Ferguson & Gregory Helmerick ', 'West Academic Publishing', 2017, '1st', 4, 'img\\book_covers\\9781517318086.jpg', 2),
('9781533661609', 'How to Make it Big as a Real Estate Agent', 'Mark Ferguson', ' McGraw-Hill Education', 2004, '2nd', 5, 'img\\book_covers\\97815173180.jpg', 3),
('9781595141743', 'Vampire Academy', ' Richelle Mead', 'Razorbill', 2007, '1st', 4, 'img/book_covers/9781595141743.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `bookISBN` varchar(20) NOT NULL,
  `studentID` varchar(20) NOT NULL,
  `studentName` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `returnDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `bookISBN`, `studentID`, `studentName`, `date`, `returnDate`) VALUES
(1, '9781491918661', '200504', 'Ahmed', '2017-12-01 04:16:19', '2017-12-02 04:13:22'),
(2, '9780393330335', '200505', 'Ali', '2017-12-19 12:00:20', '2017-12-21 17:31:31'),
(3, '9780314189578', '200504', 'Omar', '2017-12-04 10:54:31', '2017-12-05 20:00:19'),
(4, '9781491918661', '213772512', 'Haussain', '2017-12-13 06:00:00', '2017-12-13 04:19:52'),
(5, '9781517318086', '213477096', 'Khaled', '2017-12-10 08:00:30', '2017-12-13 00:30:00'),
(6, '9781137530196', '213772556', 'Tammam', '2017-12-12 22:47:48', NULL),
(7, '9781533661609', '213772586', 'Salah', '2016-10-10 00:12:00', NULL),
(8, '9780314189578', '213772532', 'Mohammed', '2017-12-19 19:43:00', NULL),
(9, '9781449370190', '214778579', 'Hassain', '2017-11-05 08:22:24', NULL),
(10, '9780140127928', '213772586', 'Majed', '2017-10-03 18:31:22', NULL),
(11, '9780446584142', '213772586', 'Fahed', '2017-08-09 04:30:45', NULL),
(16, '9780525478812', '214018358', 'Hussein', '2017-06-20 18:27:37', NULL),
(17, '9780007202300', '21487543', 'Ali', '2017-06-20 18:28:50', NULL),
(18, '9780007202300', '21456853', 'Haider', '2017-06-13 18:30:37', NULL),
(19, '9780007202300', '214012221', 'Mujtaba', '2017-06-13 18:31:29', NULL),
(20, '9780060929879', '21207899', 'Fatima', '2017-06-13 18:37:46', NULL),
(21, '9780743477116', '21355555', 'Abdallah', '2017-06-13 18:39:05', NULL),
(22, '9780060155476', '21407766', 'Abdulella', '2017-06-13 18:39:57', NULL),
(23, '9780060256654', '214013322', 'ramsey', '2017-06-13 18:41:51', NULL),
(24, '9780060531041', '2140654', 'Tawfiq', '2017-06-13 18:43:59', NULL),
(25, '9780060155476', '2140652', 'mariam', '2017-06-13 18:45:11', NULL),
(26, '9780060155476', '21305554', 'Haider', '2017-06-20 18:46:25', NULL),
(27, '9780060155476', '21401234', 'jassem', '2017-06-13 18:47:31', NULL),
(28, '9780060256654', '21501234', 'Jamil', '2017-06-20 18:50:09', NULL),
(29, '9780060256654', '21609832', 'Kasim', '2017-06-13 18:51:00', NULL),
(30, '9780060531041', '21208654', 'Jafer', '2017-06-20 18:52:13', NULL),
(31, '9780060531041', '214019221', 'Salman', '2017-06-20 18:53:03', NULL),
(32, '9780061120084', '21001221', 'Abdel Azeez', '2017-06-13 18:54:19', NULL),
(33, '9780061120084', '21503323', 'Noura', '2017-06-20 18:55:48', NULL),
(34, '9780061120084', '21205432', 'Sami', '2017-06-21 18:56:34', NULL),
(35, '9780061120084', '21601244', 'Othman', '2017-06-14 18:57:46', NULL),
(36, '9780061120084', '21406943', 'Omar', '2017-06-20 18:58:30', NULL),
(37, '9780061120084', '21459032', 'Mamdouh', '2017-06-20 19:00:10', NULL),
(38, '9780061120084', '21305432', 'Hamed', '2017-06-20 19:01:40', NULL),
(39, '9780061120084', '213022122', 'Mustafa', '2017-06-03 19:02:46', NULL),
(40, '9780062024039', '21344543', 'Sadhan', '2017-01-16 19:11:39', NULL),
(41, '9780062024039', '214013234', 'Mekdad', '2017-02-21 19:13:29', NULL),
(42, '9780062024039', '2135644', 'Kamel', '2017-03-21 19:14:42', NULL),
(43, '9780062024039', '21406923', 'Neymar', '2017-04-25 19:16:17', NULL),
(44, '9780140127928', '21304565', 'Hamed', '2017-09-19 19:18:11', NULL),
(45, '9780140127928', '21501285', 'Khalifeh', '2017-07-18 19:20:26', NULL),
(46, '9780140127928', '21401432', 'Jasim', '2017-05-24 19:22:24', NULL),
(47, '9780142000670', '21301457', 'hassan', '2017-01-24 03:47:44', NULL),
(48, '9780142000670', '21307653', 'Kasim', '2017-01-17 03:49:03', NULL),
(49, '9780142000670', '21207632', 'Hassein', '2017-01-24 03:50:02', NULL),
(50, '9780142000670', '21104312', 'remsey', '2017-01-24 03:51:00', NULL),
(51, '9780156012195', '21103322', 'Abdol-Ellah', '2017-01-19 03:51:58', NULL),
(52, '9780156012195', '21101234', 'Makdad', '2017-01-05 03:53:20', NULL),
(53, '9780156012195', '211018358', 'Mohammed', '2017-01-26 03:56:17', NULL),
(54, '9780307277671', '21103570', 'Mostafa', '2017-01-26 03:58:31', NULL),
(55, '9780314189578', '21100123', 'Jasmine', '2017-01-20 03:59:38', NULL),
(56, '9780314189578', '21100567', 'Ahmad', '2017-01-06 04:00:21', NULL),
(57, '9780307277671', '211001832', 'Blake', '2017-01-01 04:02:24', NULL),
(58, '9780316015844', '21102854', 'Balik', '2017-01-13 04:03:17', NULL),
(59, '9780316015844', '21110421', 'Tawfeq', '2017-01-13 04:04:42', NULL),
(60, '9780316015844', '21109756', 'Magid', '2017-01-26 04:06:07', NULL),
(61, '9780316166683', '213005419', 'Maged', '2017-01-25 04:07:00', NULL),
(62, '9780316166683', '21109734', 'Rabih', '2017-01-11 04:08:12', NULL),
(63, '9780345418265', '211097521', 'Rame', '2017-01-12 04:09:04', NULL),
(64, '9780345418265', '211001345', 'Rabeh', '2017-01-13 04:10:02', NULL),
(65, '9780345418265', '211005623', 'Adnan', '2017-01-08 04:10:56', NULL),
(66, '9780345418265', '210001235', 'Allam', '2017-02-23 04:12:25', NULL),
(67, '9780375831003', '21109752', 'Mostafa', '2017-02-16 04:13:31', NULL),
(68, '9780375831003', '211007654', 'Namik', '2017-02-21 04:14:48', NULL),
(69, '9780385732536', '21405432', 'Mohammed', '2017-02-22 04:16:21', NULL),
(70, '9780385732536', '2100235', 'Neymar', '2017-02-16 04:17:28', NULL),
(71, '9780385732536', '211157321', 'Ahmid', '2017-02-22 04:18:22', NULL),
(72, '9780385732550', '21105421', 'Mekdad', '2017-02-16 04:20:12', NULL),
(73, '9780385732550', '211097543', 'Fatema', '2017-02-23 04:20:53', NULL),
(74, '9780385732550', '21109213', 'Haider', '2017-02-16 04:22:16', NULL),
(75, '9780385732567', '211402942', 'Hamodey', '2017-01-19 04:23:08', NULL),
(76, '9780385732567', '21012342', 'Tarazan', '2017-02-14 04:24:23', NULL),
(77, '9780385732567', '214021431', 'gamel', '2017-02-06 04:25:36', NULL),
(78, '9780393330335', '21345322', 'Mustifa', '2017-02-13 04:26:35', NULL),
(79, '9780393330335', '2001453', 'Mortaka', '2017-02-13 04:28:30', NULL),
(80, '9781595141743', '21444322', 'Malike', '2017-12-24 04:29:53', NULL),
(81, '9781595141743', '21345432', 'Mujteba', '2017-11-23 04:31:12', NULL),
(82, '9781595141743', '21103743', 'Hasson', '2017-12-24 04:31:59', NULL),
(83, '9781595141743', '21043221', 'Hussam', '2017-12-24 04:32:29', NULL),
(84, '9780743273565', '213012214', 'Hamam', '2017-12-24 04:33:10', NULL),
(85, '9781533661609', '21300121', 'Fawzwya', '2017-11-22 04:42:42', NULL),
(86, '9781517318086', '21001912', 'Muhammed', '2017-11-23 04:43:22', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookISBN` (`bookISBN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`bookISBN`) REFERENCES `book` (`isbn`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
