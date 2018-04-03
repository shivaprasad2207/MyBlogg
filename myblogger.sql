-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 03, 2018 at 05:01 AM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myblogger`
--

-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

CREATE TABLE IF NOT EXISTS `discussion` (
  `qid` varchar(12) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mesg_text` varchar(2068) DEFAULT NULL,
  KEY `qid` (`qid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion`
--

INSERT INTO `discussion` (`qid`, `uid`, `msg_time`, `mesg_text`) VALUES
('oW3lJF6m', 2, '2013-02-16 01:45:20', 'askjvnksajvnlkasnf ksefhnkasdvjdfsvkjsdavvh sdakjsdfkjasdfk asdfjhashkjasfd sdkfjhaskfjh f jhsksjfhlkjasdfh dsd                                                        '),
('NjgeZQvX', 2, '2013-02-16 11:07:08', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('9__Giewx', 2, '2013-02-16 11:07:36', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('NZRmKldg', 2, '2013-02-16 11:07:39', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('X0SdSzK6', 2, '2013-02-16 11:07:48', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('X7zXsXYj', 2, '2013-02-16 11:08:02', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('DILEGGhG', 2, '2013-02-16 11:08:03', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('Qp9EwGvS', 2, '2013-02-16 11:08:04', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('q9o6ZG2y', 2, '2013-02-16 11:08:04', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('C2MyJsFC', 2, '2013-02-16 11:08:22', '                                                        ascascascascascascacasdcas zxvasvsavasvasdv sdcsadcasxcxasc fvsdfsdfgsdfg esgsdfgsdgsdgsd sdfgwdgseg eg werg werg wrre'),
('Y567ftxT', 2, '2013-02-16 11:08:40', '                                                        dsfgsdgsdfsdfgsfgsdfgsdfsdffgsdfgsdfgsdfgsdfgsdfg'),
('VXcdJ9LS', 2, '2013-02-16 11:09:03', '                                                        sdgsdfgsdgsdfgsdgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfgsdfg'),
('lJg0WLRN', 2, '2013-02-16 11:09:29', '                                                        ffasfasfwdgherhrtfjhrtjyktykukuoklkjvgdfgdsfgsegdfhrtureubdbfgjtjtyiuyoypo8ipui'),
('9__Giewx', 3, '2013-02-17 00:13:48', '     ddsgsegsd sdgsdsdfgsdgs gsdgsdgsdgsdfgsdfg rfgewergwer wegwergwertg'),
('9__Giewx', 3, '2013-02-17 00:17:29', '      aefaefwefqew ergwergewrg ergwergw ewrtwert wt'),
('9__Giewx', 3, '2013-02-17 00:37:52', '      trgertgerghrt tyyjhrtjtryj trjkty tyik68o688oop789o78969'),
('C2MyJsFC', 3, '2013-02-17 01:31:17', '      Hi what is the quesation , not able to understand. could you elobarate,'),
('9__Giewx', 1, '2013-02-17 01:34:33', '      I am Not Able to Understand What you have written'),
('sSgQd2oB', 2, '2013-02-17 12:12:53', '          I am pregnent Having little bit back pain, this happens not regular, sometime, what might be reason.                                               '),
('sSgQd2oB', 3, '2013-02-17 12:14:52', 'How many months you been pregnat. I could give you some suggestion and prescription.'),
('sSgQd2oB', 2, '2013-02-17 12:15:56', '      I am 4 monts.'),
('sSgQd2oB', 1, '2013-02-17 12:17:24', 'It is normal at this time'),
('ZQDredkX', 4, '2013-02-20 17:28:55', '                                                        For example our , my , local,  can somebody explain'),
('C7zUYF2w', 4, '2013-02-20 17:42:10', '                                                        Answer perl '),
('rTySuEqW', 4, '2013-02-20 17:44:01', 'A1-Perl                                                         '),
('fiAKvaWX', 4, '2013-02-20 17:48:08', 'AAAAA-Perl                                                        '),
('YXuzqqIv', 4, '2013-02-20 17:53:09', 'AAAAA-Perl                                                        '),
('KkKTa2eW', 4, '2013-02-20 17:56:14', '                                                        casdcascascascascascacasc********************************'),
('4dUjfyXz', 4, '2013-02-20 18:00:32', 'KKKKKKKKK                                                        '),
('YXuzqqIv', 4, '2013-02-20 18:14:40', '      WEWEWEWWEWEWEWEWEWEWEWE'),
('YXuzqqIv', 4, '2013-02-20 18:19:33', '      cvascvacddsca sdvasdvc sdcasd sdcasd asgff'),
('YXuzqqIv', 4, '2013-02-20 18:20:58', '      dvfsdfgvsdg wgergwerg wegwerfwerfgwe'),
('YXuzqqIv', 4, '2013-02-20 18:22:11', 'AAAAAAAAAAAAAAAAAAAA BBBBBBBBBBBBBBBBB CCCCCCCCCCCCCCCCCCCCCCCCCCC'),
('YXuzqqIv', 4, '2013-02-20 18:22:39', '      cvsavsdvfsdfv'),
('YXuzqqIv', 4, '2013-02-20 18:22:52', '      scdasdcacasdcasdc'),
('YXuzqqIv', 4, '2013-02-20 18:23:12', '      ascascascasdcascasc'),
('YXuzqqIv', 4, '2013-02-20 18:24:08', '      ggggggggg'),
('xhgcM5RJ', 2, '2013-02-20 18:28:27', 'AAAAAAAAAAAAA                                                        '),
('1KxPvA_U', 4, '2013-02-20 18:32:52', 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ                                                        '),
('ZcC6gjNN', 4, '2013-02-20 18:36:54', 'PPPPPPPPPPPPPPPPPPPPPPPPPP                                                        '),
('ZcC6gjNN', 4, '2013-02-20 18:39:24', '      SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS'),
('ZcC6gjNN', 2, '2013-02-20 18:42:20', '      KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK'),
('ZcC6gjNN', 2, '2013-02-20 18:42:36', '      LLLLLLLLLLLLLLLLLLLLLLLLLLLL'),
('ZcC6gjNN', 2, '2013-02-20 18:50:42', '      HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH'),
('ZcC6gjNN', 2, '2013-02-20 18:54:38', '      UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU'),
('ZcC6gjNN', 2, '2013-02-20 18:56:33', '      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'),
('ZcC6gjNN', 2, '2013-02-20 18:58:40', '    as'),
('ZcC6gjNN', 2, '2013-02-20 19:01:04', '      trerhtertherthjrjkrrthfwqefwqfewgfrgerhrtjrtjkoyullfwqfwqdqwdqwfwefgwgerhrgerherherhwergwergergwegwfwef'),
('ZcC6gjNN', 2, '2013-02-20 19:02:58', '      ggggggggggggggggggggggggggggggggggggggggggg'),
('ZcC6gjNN', 2, '2013-02-20 19:08:50', '      IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK'),
('1KxPvA_U', 2, '2013-02-20 20:09:19', '      bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'),
('1KxPvA_U', 2, '2013-02-20 20:23:38', '      CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC'),
('1KxPvA_U', 2, '2013-02-20 20:25:15', '      vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'),
('1KxPvA_U', 2, '2013-02-20 20:29:15', '      LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'),
('1KxPvA_U', 2, '2013-02-20 20:31:06', '      asfgsdgsdgsdfgsdfgsdgsdfgsdgwerg'),
('1KxPvA_U', 2, '2013-02-20 20:35:05', '      KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK'),
('1KxPvA_U', 2, '2013-02-20 20:39:18', '      BISLSLSLSLSLSLSLSLSLSLSSLSLSLSDLSL'),
('1KxPvA_U', 2, '2013-02-20 20:42:00', '      VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV'),
('1KxPvA_U', 2, '2013-02-20 20:44:12', '      BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'),
('1KxPvA_U', 2, '2013-02-20 20:50:42', '      dsfvfdsfgfdsfddfeweewewweew'),
('1KxPvA_U', 2, '2013-02-20 20:51:53', '      CCCCCCCCCCCVVVVVVVVVVVVVVCCCCCCCCCCCCCCVVVVVVVVVVVV'),
('ZcC6gjNN', 2, '2013-02-20 22:10:09', '      AABBBAAAAAAAAABBBBBBBAAAABBB'),
('ZcC6gjNN', 1, '2013-02-20 22:16:27', '      casdcasd sacvasdc assvcasdf afqwef qefqwfqwef'),
('ZcC6gjNN', 3, '2013-02-20 22:18:39', '      ABCDEFGHIJKLMN'),
('1KxPvA_U', 9, '2013-02-21 12:11:56', '      kjashckjasdfchajsd jasdfhjasdjcha sdjkahsdjc asdjkhfjaksdf c  jhjaskjdfjkasd fkjhasdjkfh asdfjkashdjkfha k'),
('rTySuEqW', 2, '2013-02-21 15:41:13', '      fegedgseg wegwegwergwergewgr'),
('rTySuEqW', 2, '2013-02-21 15:44:52', '      ASDCDCVASDCVASVSDFVSDFVSDFVSDFVSDFVSDVSDV'),
('rTySuEqW', 2, '2013-02-21 15:49:14', '      GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG'),
('rTySuEqW', 2, '2013-02-21 16:22:39', '      VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV'),
('rTySuEqW', 2, '2013-02-21 16:28:12', '      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'),
('rTySuEqW', 1, '2013-02-21 16:34:51', '      KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK'),
('rTySuEqW', 1, '2013-02-21 16:36:59', '      sadsdlcklasdkclasdc ldcklsdcklsdkc dskclksdalclsdkc kllkcdjkhajdschjkhdcjkashdc'),
('YXuzqqIv', 2, '2013-02-25 15:27:10', '      aaaaaaaaaaaaaaaaaaaaaaaaaa'),
('YXuzqqIv', 1, '2013-02-25 15:28:00', '      fefwefefweffwefwefwefwerfewfwerferf'),
('fiAKvaWX', 2, '2013-02-25 15:52:03', '      vcbxcvbxcbxcbxcbxcbcbxcvxcvbxcbcbxcbxcbxcbxcb'),
('fiAKvaWX', 2, '2013-02-25 15:55:08', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP'),
('fiAKvaWX', 2, '2013-02-25 15:58:01', '      ascawcasdcacascascascd'),
('ZQDredkX', 2, '2013-02-25 16:00:04', '      sdvsdvsdvsdvservwergwegwegwergweg'),
('fiAKvaWX', 2, '2013-02-25 16:01:40', '      cdasdcadcasdcadfscacacgewrge'),
('fiAKvaWX', 2, '2013-02-25 16:21:18', '      asaas'),
('fiAKvaWX', 2, '2013-02-25 16:25:46', '      asdcadcasdcasc'),
('rTySuEqW', 2, '2013-02-25 17:15:05', '      GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG'),
('rTySuEqW', 3, '2013-02-25 17:17:11', 'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP'),
('qgEyRUoQ', 1, '2013-02-25 17:22:06', '                                                        asdvasdvasdvasdvasdvsadvsadvasdvsadv'),
('1KxPvA_U', 1, '2013-02-25 17:28:16', '      zczxvxzbfdhfhsdfhdfhdfndfncfncfn'),
('1KxPvA_U', 1, '2013-02-25 17:30:21', '      vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'),
('ZQDredkX', 1, '2013-02-25 17:35:06', '      xXaxAaxaxAXaxaXaxAXaxXSxsXx');

-- --------------------------------------------------------

--
-- Table structure for table `main_page`
--

CREATE TABLE IF NOT EXISTS `main_page` (
  `mpid` int(11) NOT NULL AUTO_INCREMENT,
  `main_topic` varchar(70) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mpid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `main_page`
--

INSERT INTO `main_page` (`mpid`, `main_topic`, `css_class`) VALUES
(17, 'Health', 'primary'),
(18, 'Travel', 'success'),
(19, 'Life Style', 'warning'),
(20, 'Food', 'info'),
(21, 'Sports', 'primary'),
(22, 'Politics', 'success'),
(23, 'Architecture', 'warning'),
(24, 'Academic', 'info'),
(25, 'Plantaion', 'primary'),
(26, 'Mechanical Eng', 'success'),
(27, 'Electronics', 'warning'),
(28, 'Electricals', 'info'),
(29, 'Hardware', 'primary'),
(30, 'Computers', 'success'),
(31, 'software', 'warning'),
(32, 'Kids', 'info');

-- --------------------------------------------------------

--
-- Table structure for table `quesation`
--

CREATE TABLE IF NOT EXISTS `quesation` (
  `mpid` int(11) DEFAULT NULL,
  `spid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `qid` varchar(12) NOT NULL DEFAULT '',
  `que_text` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quesation`
--

INSERT INTO `quesation` (`mpid`, `spid`, `uid`, `qid`, `que_text`) VALUES
(31, 4, 4, '1KxPvA_U', 'YYYYYYYYYYYYYYYYYYYYYYYY'),
(31, 4, 4, '4dUjfyXz', 'JJJJJJJJ'),
(31, 4, 2, '9__Giewx', 'ascascascascasc'),
(31, 3, 2, 'C2MyJsFC', 'ascascascascasc'),
(31, 4, 4, 'C7zUYF2w', 'Quesation Perl '),
(31, 4, 2, 'DILEGGhG', 'ascascascascasc'),
(31, 4, 4, 'fiAKvaWX', 'QQQQ-Perl'),
(31, 4, 4, 'KkKTa2eW', 'acascdacda------------'),
(31, 4, 2, 'lJg0WLRN', 'sdgsdfgsdgsdfgdsdfnnfshfhjghjghjkghkghkghkghkjhylyulyulfaf'),
(31, 4, 2, 'NjgeZQvX', 'ascascascascasc'),
(31, 4, 2, 'NZRmKldg', 'ascascascascasc'),
(31, 2, 2, 'oW3lJF6m', 'Q1--------------------------------- awkjfnakjfnasncas askjdvbjkasdkljksaljv kj'),
(31, 4, 2, 'q9o6ZG2y', 'ascascascascasc'),
(31, 3, 1, 'qgEyRUoQ', 'vdasdasdvasvd'),
(31, 4, 2, 'Qp9EwGvS', 'ascascascascasc'),
(31, 4, 4, 'rTySuEqW', 'Q1-Perl '),
(17, 95, 2, 'sSgQd2oB', 'I am pregnent Having little bit back pain'),
(31, 4, 2, 'VXcdJ9LS', 'sdgsdsdgsdgsdfsdfsdgsdfgsdfgsd'),
(31, 4, 2, 'X0SdSzK6', 'ascascascascasc'),
(31, 4, 2, 'X7zXsXYj', 'ascascascascasc'),
(31, 4, 2, 'xhgcM5RJ', 'PPPPPPPP'),
(31, 4, 2, 'Y567ftxT', 'dfgsdgsdfgdffgsdgsdfgsdfsdfg'),
(31, 4, 4, 'YXuzqqIv', 'QQQQ-Perl'),
(31, 4, 4, 'ZcC6gjNN', 'OOOOOOOOOOOOOOOOOOO'),
(31, 4, 4, 'ZQDredkX', 'I have doubt on variable scope in perl ');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
  `mpid` int(11) DEFAULT NULL,
  `spid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `subscribe_status` int(11) DEFAULT NULL,
  KEY `mpid` (`mpid`),
  KEY `spid` (`spid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`mpid`, `spid`, `uid`, `subscribe_status`) VALUES
(31, 1, 2, 0),
(31, 4, 3, 1),
(31, 3, 3, 1),
(31, 4, 1, 1),
(17, 95, 2, 1),
(17, 95, 3, 1),
(17, 95, 1, 1),
(31, 5, 2, 1),
(31, 6, 2, 1),
(31, 9, 2, 1),
(31, 10, 2, 1),
(31, 2, 2, 0),
(31, 8, 2, 0),
(31, 7, 2, 0),
(31, 16, 2, 0),
(31, 3, 2, 1),
(31, 4, 2, 1),
(31, 4, 4, 1),
(31, 4, 9, 1),
(31, 3, 1, 1),
(31, 4, 11, 1),
(17, 90, 13, 1),
(17, 91, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_page`
--

CREATE TABLE IF NOT EXISTS `sub_page` (
  `spid` int(11) NOT NULL AUTO_INCREMENT,
  `sub_topic` varchar(70) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  `mpid` int(11) DEFAULT NULL,
  PRIMARY KEY (`spid`),
  KEY `mpid` (`mpid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `sub_page`
--

INSERT INTO `sub_page` (`spid`, `sub_topic`, `css_class`, `mpid`) VALUES
(1, 'C', 'primary', 31),
(2, 'C++', 'success', 31),
(3, 'Linux', 'warning', 31),
(4, 'Perl', 'info', 31),
(5, 'Shell Script', 'primary', 31),
(6, 'Java', 'success', 31),
(7, 'Unix', 'warning', 31),
(8, 'RDBMS', 'info', 31),
(9, 'MySql', 'primary', 31),
(10, 'Oracle', 'success', 31),
(11, 'Python', 'warning', 31),
(12, 'PHP', 'info', 31),
(13, 'Javascript', 'primary', 31),
(14, 'Jquery', 'success', 31),
(15, 'Android', 'warning', 31),
(16, 'iOS', 'info', 31),
(17, 'OOPS', 'primary', 31),
(18, 'DBMS', 'success', 31),
(19, 'Android', 'warning', 31),
(89, 'Pediatric', 'primary', 17),
(90, 'Cardiology', 'success', 17),
(91, 'Orthopedics', 'warning', 17),
(92, 'Diabetes', 'info', 17),
(93, 'Hyper Tension', 'primary', 17),
(94, 'ENT', 'success', 17),
(95, 'Obstetrics & Gynecology', 'warning', 17),
(96, 'Endocrynology', 'info', 17),
(97, 'Psychiatry', 'primary', 17),
(98, 'General', 'success', 17),
(99, 'Dental', 'warning', 17),
(100, 'Dermotology', 'info', 17),
(101, 'Pathology', 'primary', 17),
(102, 'NeoNatology', 'success', 17),
(103, 'Oncology', 'warning', 17),
(104, 'Surgery', 'info', 17),
(105, 'Gastroenterology', 'primary', 17),
(106, 'Allergology', 'success', 17),
(107, 'Endocrinology', 'warning', 17),
(108, 'Nephrology', 'primary', 17),
(109, 'Urology', 'success', 17),
(110, 'Radiology', 'warning', 17),
(111, 'Allergy and Immunology', 'info', 17);

-- --------------------------------------------------------

--
-- Table structure for table `t_persession`
--

CREATE TABLE IF NOT EXISTS `t_persession` (
  `sid` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `o_count` int(11) DEFAULT NULL,
  `logged_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_logged_in` int(11) DEFAULT NULL,
  `is_logged_out` int(11) DEFAULT NULL,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_persession`
--

INSERT INTO `t_persession` (`sid`, `uid`, `o_count`, `logged_time`, `is_logged_in`, `is_logged_out`) VALUES
('77d0978536330f2e302679fb7d81e6a4', 2, 0, '2013-02-14 01:36:33', 1, 0),
('77d0978536330f2e302679fb7d81e6a4', 2, 0, '2013-02-14 01:43:18', 1, 0),
('77d0978536330f2e302679fb7d81e6a4', 2, 0, '2013-02-14 02:26:49', 1, 0),
('3ac470fd71fcf7c37cffd1b40ae4490b', 2, 0, '2013-02-14 15:18:21', 1, 0),
('3ac470fd71fcf7c37cffd1b40ae4490b', 2, 0, '2013-02-14 15:45:20', 1, 0),
('3ac470fd71fcf7c37cffd1b40ae4490b', 2, 0, '2013-02-14 16:57:03', 1, 0),
('3ac470fd71fcf7c37cffd1b40ae4490b', 2, 0, '2013-02-14 16:58:49', 1, 0),
('3ac470fd71fcf7c37cffd1b40ae4490b', 2, 0, '2013-02-14 17:01:02', 1, 0),
('3ac470fd71fcf7c37cffd1b40ae4490b', 2, 0, '2013-02-14 17:02:25', 1, 0),
('b106cfcf987cd20b5c8b30e1af3ff752', 2, 0, '2013-02-15 00:55:47', 1, 0),
('fc74ee095da471649f379e1f25fc9f90', 2, 0, '2013-02-15 13:38:45', 1, 0),
('7e4df888c6e031393f6b3382e025c05f', 2, 0, '2013-02-15 18:37:02', 1, 0),
('3fb4198dedaf2339fd943ad88707890f', 2, 0, '2013-02-15 23:56:30', 1, 0),
('766519ed97d6dbe3ee3f9053fb88f8ae', 2, 0, '2013-02-16 11:03:49', 1, 0),
('9c9c9b55e5bd692c66098285c1c373af', 2, 0, '2013-02-16 20:07:14', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 3, 0, '2013-02-17 00:13:09', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 1, 0, '2013-02-17 01:32:53', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:40:49', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:40:59', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:41:11', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:41:31', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:41:49', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:42:44', 1, 0),
('b34f36847ff531a0ad4bdc28027ec3ca', 2, 0, '2013-02-17 01:43:56', 1, 0),
('d7158c8c5695177b809f4ae538968277', 2, 0, '2013-02-17 12:10:41', 1, 0),
('d7158c8c5695177b809f4ae538968277', 3, 0, '2013-02-17 12:13:25', 1, 0),
('d7158c8c5695177b809f4ae538968277', 3, 0, '2013-02-17 12:13:25', 1, 0),
('d7158c8c5695177b809f4ae538968277', 2, 0, '2013-02-17 12:15:12', 1, 0),
('d7158c8c5695177b809f4ae538968277', 1, 0, '2013-02-17 12:16:09', 1, 0),
('d7158c8c5695177b809f4ae538968277', 2, 0, '2013-02-17 12:18:01', 1, 0),
('bb4c645c142a4e4d6f2f894ca4e536bf', 2, 0, '2013-02-17 16:51:08', 1, 0),
('bb4c645c142a4e4d6f2f894ca4e536bf', 2, 0, '2013-02-17 17:45:52', 1, 0),
('bb4c645c142a4e4d6f2f894ca4e536bf', 2, 0, '2013-02-17 17:47:21', 1, 0),
('bb4c645c142a4e4d6f2f894ca4e536bf', 2, 0, '2013-02-17 17:52:26', 1, 0),
('bb4c645c142a4e4d6f2f894ca4e536bf', 2, 0, '2013-02-17 17:59:04', 1, 0),
('87c8469e3b8fcade3ad79fd45a3abed3', 2, 0, '2013-02-17 22:42:13', 1, 0),
('5d82d404c3ed718d5b3c021766439248', 2, 0, '2013-02-18 11:29:36', 1, 0),
('5d82d404c3ed718d5b3c021766439248', 2, 0, '2013-02-18 15:11:35', 1, 0),
('5d82d404c3ed718d5b3c021766439248', 2, 0, '2013-02-18 17:56:47', 1, 0),
('5d82d404c3ed718d5b3c021766439248', 2, 0, '2013-02-18 18:03:48', 1, 0),
('0aa412d5620c0326de2568e43318866a', 2, 0, '2013-02-18 22:11:39', 1, 0),
('6831273a4674ee34b34671d1a0c163d6', 2, 0, '2013-02-19 02:31:01', 1, 0),
('da1dc2720b663ef76bf155a6216d37cf', 2, 0, '2013-02-19 16:04:50', 1, 0),
('813c70d9707c28dcd95166e3a8bf0e49', 3, 0, '2013-02-19 22:29:54', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 2, 0, '2013-02-20 14:10:08', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 3, 0, '2013-02-20 17:27:19', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 1, 0, '2013-02-20 17:27:32', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 4, 0, '2013-02-20 17:27:46', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 2, 0, '2013-02-20 18:28:05', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 2, 0, '2013-02-20 18:41:58', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 2, 0, '2013-02-20 20:07:10', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 2, 0, '2013-02-20 20:41:38', 1, 0),
('f074f592df35ecdd56f1375fcd3d7c4d', 2, 0, '2013-02-20 22:09:46', 1, 0),
('8bb1fccbd84d7bf45c1fe8b7d3494eb2', 9, 0, '2013-02-21 12:11:20', 1, 0),
('cb00c40a365195891b39f322791d8c17', 9, 0, '2013-02-21 12:30:53', 1, 0),
('3420410cb525e07837f5a9204a394356', 9, 0, '2013-02-21 12:30:53', 1, 0),
('437de0f72245f148b02fde136eeac40d', 9, 0, '2013-02-21 12:30:54', 1, 0),
('e59ccd541584a059f0c3a53b872ebd99', 9, 0, '2013-02-21 12:30:54', 1, 0),
('25b44f5090903abf7df61aed6c2cf761', 9, 0, '2013-02-21 12:30:54', 1, 0),
('5d85f9d7143babfb2a25dca068ed8806', 9, 0, '2013-02-21 12:30:54', 1, 0),
('8ce1c79f1ea4f22f15c27b33fb156135', 9, 0, '2013-02-21 12:30:54', 1, 0),
('3b1fc0031608a8c718a95737fdfa0d2f', 9, 0, '2013-02-21 12:30:54', 1, 0),
('429163d63f8b6767e37ce250feba96ef', 9, 0, '2013-02-21 12:30:54', 1, 0),
('194795a94faa5b8ecac2f07e7810f0ef', 9, 0, '2013-02-21 12:30:55', 1, 0),
('82f3b13c4c1e7d9a6b6817e9f5df6842', 9, 0, '2013-02-21 12:30:55', 1, 0),
('5467ab1e753916f4104dd86749aa5e7f', 9, 0, '2013-02-21 12:30:55', 1, 0),
('3a9931596cfd262569e6b35de367231b', 9, 0, '2013-02-21 12:30:55', 1, 0),
('2d0a9cb738d66a688c42729e2789cc6c', 9, 0, '2013-02-21 12:30:55', 1, 0),
('0326b9e1b8543fe9911d149d4b2a229b', 9, 0, '2013-02-21 12:30:55', 1, 0),
('1ae69873d51bed2945305f44758d8aff', 9, 0, '2013-02-21 12:30:55', 1, 0),
('162bb880e3af802c462c51ce697732bb', 9, 0, '2013-02-21 12:30:55', 1, 0),
('b73061e0f8e33d2116091e10115c40a5', 9, 0, '2013-02-21 12:30:55', 1, 0),
('0e6d1a03ac3f8297701e6797fe9cb1a7', 9, 0, '2013-02-21 12:30:56', 1, 0),
('06f11b232cade66710b1ee1a48dc274b', 9, 0, '2013-02-21 12:30:56', 1, 0),
('1079cc618c23939334f58eae7a5dc0f9', 9, 0, '2013-02-21 12:30:56', 1, 0),
('921b501e75a90163695b80354173901f', 9, 0, '2013-02-21 12:30:56', 1, 0),
('2186e75a4a4fa51c7c21f413ad325c26', 9, 0, '2013-02-21 12:30:56', 1, 0),
('d2d03cb5f0cbf52e13019f4702836eac', 9, 0, '2013-02-21 12:30:56', 1, 0),
('301f963f349e569c682cf1b75385a076', 9, 0, '2013-02-21 12:30:56', 1, 0),
('302d5893bc4e216e3df86caa7e218f05', 9, 0, '2013-02-21 12:30:57', 1, 0),
('7b0bd61aaac2feffe5c6176a7e7914d4', 9, 0, '2013-02-21 12:30:57', 1, 0),
('876f9a1f3e0bfd12b6dd7b1d32a10d27', 9, 0, '2013-02-21 12:30:57', 1, 0),
('b1d9e89420d13ee7e63c2d49f20f2eaf', 9, 0, '2013-02-21 12:30:57', 1, 0),
('ace9e0c01a9bccc32bece8375f9125e5', 9, 0, '2013-02-21 12:30:57', 1, 0),
('2c909f109c92506d2bcf3a85108d3cd4', 9, 0, '2013-02-21 12:30:57', 1, 0),
('2c909f109c92506d2bcf3a85108d3cd4', 2, 0, '2013-02-21 12:33:08', 1, 0),
('2c909f109c92506d2bcf3a85108d3cd4', 10, 0, '2013-02-21 12:40:13', 1, 0),
('2c909f109c92506d2bcf3a85108d3cd4', 2, 0, '2013-02-21 14:44:42', 1, 0),
('2c909f109c92506d2bcf3a85108d3cd4', 2, 0, '2013-02-21 15:40:53', 1, 0),
('2c909f109c92506d2bcf3a85108d3cd4', 2, 0, '2013-02-21 19:19:03', 1, 0),
('b5739ac09fa62646977d516c36a26d29', 2, 0, '2013-02-25 15:10:25', 1, 0),
('b5739ac09fa62646977d516c36a26d29', 2, 0, '2013-02-25 15:21:03', 1, 0),
('b5739ac09fa62646977d516c36a26d29', 2, 0, '2013-02-25 15:51:47', 1, 0),
('b5739ac09fa62646977d516c36a26d29', 1, 0, '2013-02-25 17:21:38', 1, 0),
('b5739ac09fa62646977d516c36a26d29', 3, 0, '2013-02-25 18:57:42', 1, 0),
('cf8bf98cbdfc62ebab39f84672e2f5f0', 1, 0, '2013-04-22 13:00:23', 1, 0),
('fb3cd196d91f0a2cee5274b6ab359480', 1, 0, '2016-03-25 08:39:30', 1, 0),
('fb3cd196d91f0a2cee5274b6ab359480', 1, 0, '2016-03-25 09:02:30', 1, 0),
('422b3c7e177449fa4683daa2c63b64f2', 1, 0, '2016-04-14 12:36:32', 1, 0),
('a9c39b87e53ef314e5027f6d5071ea87', 11, 0, '2017-03-21 04:36:21', 1, 0),
('89d4713eff8b2f78e1a18936975185c3', 13, 0, '2017-09-18 10:36:25', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `user_passwd` varchar(30) DEFAULT NULL,
  `user_email` varchar(40) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `Address` varchar(120) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`uid`, `user_name`, `user_passwd`, `user_email`, `mobile`, `Address`, `FirstName`, `LastName`) VALUES
(1, 'shiva', 'shiva', 'nnsprasad@gmail.com', '+919900104439', '#28 11th Cross Sir MV Layout Tindlu, Vidyaranyapura Bangalore', 'Shivaprasad', 'Nanjundachari'),
(2, 'vidya', 'vidya', 'nnnsprasad@yahoo.com', '+919945012772', '#28 11th Cross Sir MV Layout Tindlu, Vidyaranyapura Bangalore', 'Srividya A', 'Ananthachar'),
(3, 'mayur', 'mayur', 'nnsprasad@yahoo.com', '918028381169', '#28 11th Cross Sir MV Layout Tindlu, Vidyaranyapura Bangalore', 'MAYUR', 'Shivaprasad'),
(4, 'nagesh', 'nagesh', 'nnsprasad@rediffmail.com', '+918028381169', '#10, 7th cross 1st main Srikanteshwara Nagar, Nandini Layout Bangalore-96', 'Nagesh', 'Nanjundachari'),
(5, 'gullu', 'gullu', 'gully@fways.in', '99099099090', '#10, 1st main Srikanteshwara Nagar 11th cross, Nandini layout Bangalore-96', 'Pavanshvandra', 'Nagesh'),
(6, 'chaitra', 'chaitra', 'chaitra@fways.in', ' 9009900990', '#10, 1st main Srikanteshwara Nagar, 11th cross, Nandini layout . Bangalore-96', 'Chaitra', 'Nagesh'),
(7, 'ananth', 'ananth', 'ananth@fways.in', '8971868132', '#74 4th block DB sandra Vidyaranyapura. Bangalore', 'ananthachar', 'Subrayachar'),
(8, 'shiva1', 'shiva1', 'nnsprasad@gmail.com', '9900104439', 'sdcasdc', 'Shivaprasad', 'Nanjundachari'),
(9, 'shiva2', 'shiva2', 'nnsprasad@gmail.com', '9900104439', 'sdcasdc', 'Shivaprasad', 'Nanjundachari'),
(10, 'veena', 'veena', 'veenavasanth@rediffmail.com', '9900104439', 'London', 'Veena', 'Anathachar'),
(11, 'natarjkumar1189@gmail.com', 'natarjkumar1189@gmail.com', '', '', '', 'Natraj', 'Kumar'),
(12, 'abc@gmail.com', 'abc@gmail.com', '', '', '', 'Shas', 'adcas'),
(13, 'nnnsprasad@yahoo.com', 'nnnsprasad@yahoo.com', 'nnsprasad@gmail.com', '9900104439', '#74 4th Block Doddabommasandra', 'Shivaprasad', 'Nanjundachari');

-- --------------------------------------------------------

--
-- Table structure for table `usr_roles`
--

CREATE TABLE IF NOT EXISTS `usr_roles` (
  `uid` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usr_roles`
--

INSERT INTO `usr_roles` (`uid`, `role`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discussion`
--
ALTER TABLE `discussion`
  ADD CONSTRAINT `discussion_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `quesation` (`qid`),
  ADD CONSTRAINT `discussion_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`);

--
-- Constraints for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `subscribe_ibfk_1` FOREIGN KEY (`mpid`) REFERENCES `main_page` (`mpid`),
  ADD CONSTRAINT `subscribe_ibfk_2` FOREIGN KEY (`spid`) REFERENCES `sub_page` (`spid`),
  ADD CONSTRAINT `subscribe_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`);

--
-- Constraints for table `sub_page`
--
ALTER TABLE `sub_page`
  ADD CONSTRAINT `sub_page_ibfk_1` FOREIGN KEY (`mpid`) REFERENCES `main_page` (`mpid`);

--
-- Constraints for table `t_persession`
--
ALTER TABLE `t_persession`
  ADD CONSTRAINT `usr_roles_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`);

--
-- Constraints for table `usr_roles`
--
ALTER TABLE `usr_roles`
  ADD CONSTRAINT `usr_roles_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
