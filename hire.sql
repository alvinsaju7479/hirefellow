-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 08:32 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hire`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add hrreg', 7, 'add_hrreg'),
(26, 'Can change hrreg', 7, 'change_hrreg'),
(27, 'Can delete hrreg', 7, 'delete_hrreg'),
(28, 'Can view hrreg', 7, 'view_hrreg'),
(29, 'Can add employeereg', 8, 'add_employeereg'),
(30, 'Can change employeereg', 8, 'change_employeereg'),
(31, 'Can delete employeereg', 8, 'delete_employeereg'),
(32, 'Can view employeereg', 8, 'view_employeereg'),
(33, 'Can add candidatereg', 9, 'add_candidatereg'),
(34, 'Can change candidatereg', 9, 'change_candidatereg'),
(35, 'Can delete candidatereg', 9, 'delete_candidatereg'),
(36, 'Can view candidatereg', 9, 'view_candidatereg'),
(37, 'Can add department', 10, 'add_department'),
(38, 'Can change department', 10, 'change_department'),
(39, 'Can delete department', 10, 'delete_department'),
(40, 'Can view department', 10, 'view_department'),
(41, 'Can add addjobvacancy', 11, 'add_addjobvacancy'),
(42, 'Can change addjobvacancy', 11, 'change_addjobvacancy'),
(43, 'Can delete addjobvacancy', 11, 'delete_addjobvacancy'),
(44, 'Can view addjobvacancy', 11, 'view_addjobvacancy'),
(45, 'Can add qualification', 12, 'add_qualification'),
(46, 'Can change qualification', 12, 'change_qualification'),
(47, 'Can delete qualification', 12, 'delete_qualification'),
(48, 'Can view qualification', 12, 'view_qualification'),
(49, 'Can add applyjob', 13, 'add_applyjob'),
(50, 'Can change applyjob', 13, 'change_applyjob'),
(51, 'Can delete applyjob', 13, 'delete_applyjob'),
(52, 'Can view applyjob', 13, 'view_applyjob'),
(53, 'Can add interview', 14, 'add_interview'),
(54, 'Can change interview', 14, 'change_interview'),
(55, 'Can delete interview', 14, 'delete_interview'),
(56, 'Can view interview', 14, 'view_interview'),
(57, 'Can add complaints', 15, 'add_complaints'),
(58, 'Can change complaints', 15, 'change_complaints'),
(59, 'Can delete complaints', 15, 'delete_complaints'),
(60, 'Can view complaints', 15, 'view_complaints'),
(61, 'Can add complaints_emp', 16, 'add_complaints_emp'),
(62, 'Can change complaints_emp', 16, 'change_complaints_emp'),
(63, 'Can delete complaints_emp', 16, 'delete_complaints_emp'),
(64, 'Can view complaints_emp', 16, 'view_complaints_emp'),
(65, 'Can add feedbacks', 17, 'add_feedbacks'),
(66, 'Can change feedbacks', 17, 'change_feedbacks'),
(67, 'Can delete feedbacks', 17, 'delete_feedbacks'),
(68, 'Can view feedbacks', 17, 'view_feedbacks'),
(69, 'Can add placedcandidate', 18, 'add_placedcandidate'),
(70, 'Can change placedcandidate', 18, 'change_placedcandidate'),
(71, 'Can delete placedcandidate', 18, 'delete_placedcandidate'),
(72, 'Can view placedcandidate', 18, 'view_placedcandidate'),
(73, 'Can add promotions', 19, 'add_promotions'),
(74, 'Can change promotions', 19, 'change_promotions'),
(75, 'Can delete promotions', 19, 'delete_promotions'),
(76, 'Can view promotions', 19, 'view_promotions'),
(77, 'Can add transfer_dept', 20, 'add_transfer_dept'),
(78, 'Can change transfer_dept', 20, 'change_transfer_dept'),
(79, 'Can delete transfer_dept', 20, 'delete_transfer_dept'),
(80, 'Can view transfer_dept', 20, 'view_transfer_dept'),
(81, 'Can add transfer_branch', 21, 'add_transfer_branch'),
(82, 'Can change transfer_branch', 21, 'change_transfer_branch'),
(83, 'Can delete transfer_branch', 21, 'delete_transfer_branch'),
(84, 'Can view transfer_branch', 21, 'view_transfer_branch'),
(85, 'Can add tbl_leave', 22, 'add_tbl_leave'),
(86, 'Can change tbl_leave', 22, 'change_tbl_leave'),
(87, 'Can delete tbl_leave', 22, 'delete_tbl_leave'),
(88, 'Can view tbl_leave', 22, 'view_tbl_leave'),
(89, 'Can add emp_attendance', 23, 'add_emp_attendance'),
(90, 'Can change emp_attendance', 23, 'change_emp_attendance'),
(91, 'Can delete emp_attendance', 23, 'delete_emp_attendance'),
(92, 'Can view emp_attendance', 23, 'view_emp_attendance'),
(93, 'Can add jobassign', 24, 'add_jobassign'),
(94, 'Can change jobassign', 24, 'change_jobassign'),
(95, 'Can delete jobassign', 24, 'delete_jobassign'),
(96, 'Can view jobassign', 24, 'view_jobassign'),
(97, 'Can add basic', 25, 'add_basic'),
(98, 'Can change basic', 25, 'change_basic'),
(99, 'Can delete basic', 25, 'delete_basic'),
(100, 'Can view basic', 25, 'view_basic'),
(101, 'Can add salary_tb', 26, 'add_salary_tb'),
(102, 'Can change salary_tb', 26, 'change_salary_tb'),
(103, 'Can delete salary_tb', 26, 'delete_salary_tb'),
(104, 'Can view salary_tb', 26, 'view_salary_tb');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'hirefellow', 'addjobvacancy'),
(13, 'hirefellow', 'applyjob'),
(25, 'hirefellow', 'basic'),
(9, 'hirefellow', 'candidatereg'),
(15, 'hirefellow', 'complaints'),
(16, 'hirefellow', 'complaints_emp'),
(10, 'hirefellow', 'department'),
(8, 'hirefellow', 'employeereg'),
(23, 'hirefellow', 'emp_attendance'),
(17, 'hirefellow', 'feedbacks'),
(7, 'hirefellow', 'hrreg'),
(14, 'hirefellow', 'interview'),
(24, 'hirefellow', 'jobassign'),
(18, 'hirefellow', 'placedcandidate'),
(19, 'hirefellow', 'promotions'),
(12, 'hirefellow', 'qualification'),
(26, 'hirefellow', 'salary_tb'),
(22, 'hirefellow', 'tbl_leave'),
(21, 'hirefellow', 'transfer_branch'),
(20, 'hirefellow', 'transfer_dept'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-10 11:33:18.720621'),
(2, 'auth', '0001_initial', '2023-03-10 11:33:19.447448'),
(3, 'admin', '0001_initial', '2023-03-10 11:33:19.595779'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-10 11:33:19.600467'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-10 11:33:19.607821'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-10 11:33:19.679821'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-10 11:33:19.712049'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-10 11:33:19.752046'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-10 11:33:19.760049'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-10 11:33:19.800145'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-10 11:33:19.800145'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-10 11:33:19.808163'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-10 11:33:19.840148'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-10 11:33:19.872149'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-10 11:33:19.912250'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-10 11:33:19.920251'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-10 11:33:19.952250'),
(18, 'hirefellow', '0001_initial', '2023-03-10 11:33:20.032362'),
(19, 'sessions', '0001_initial', '2023-03-10 11:33:20.136513'),
(20, 'hirefellow', '0002_hrreg_status', '2023-03-10 11:50:09.510514'),
(21, 'hirefellow', '0003_employeereg', '2023-03-10 12:20:52.912339'),
(22, 'hirefellow', '0004_candidatereg', '2023-03-10 16:28:24.504032'),
(23, 'hirefellow', '0005_department', '2023-03-10 17:25:11.423719'),
(24, 'hirefellow', '0006_addjobvacancy', '2023-03-10 17:48:26.460514'),
(25, 'hirefellow', '0007_qualification', '2023-03-11 06:42:53.902591'),
(26, 'hirefellow', '0008_applyjob', '2023-03-11 10:33:43.214813'),
(27, 'hirefellow', '0009_interview', '2023-03-11 12:31:16.805194'),
(28, 'hirefellow', '0010_complaints', '2023-03-13 04:32:13.254999'),
(29, 'hirefellow', '0011_complaints_emp', '2023-03-13 05:58:43.420965'),
(30, 'hirefellow', '0012_feedbacks', '2023-03-13 07:48:33.824270'),
(31, 'hirefellow', '0013_placedcandidate', '2023-03-13 09:15:42.312801'),
(32, 'hirefellow', '0014_promotions', '2023-03-13 09:58:28.370953'),
(33, 'hirefellow', '0015_promotions_status', '2023-03-13 10:26:43.390723'),
(34, 'hirefellow', '0016_transfer_dept', '2023-03-13 11:39:56.381539'),
(35, 'hirefellow', '0017_transfer_branch', '2023-03-13 16:55:53.287360'),
(36, 'hirefellow', '0018_tbl_leave', '2023-03-13 17:37:13.563831'),
(37, 'hirefellow', '0019_emp_attendance', '2023-03-14 06:03:57.187117'),
(38, 'hirefellow', '0020_jobassign', '2023-03-14 09:37:37.856282'),
(39, 'hirefellow', '0021_employeereg_designation', '2023-03-15 16:29:08.762609'),
(40, 'hirefellow', '0022_basic', '2023-03-17 11:38:28.141963'),
(41, 'hirefellow', '0023_salary_tb', '2023-03-17 12:07:53.119929'),
(42, 'hirefellow', '0024_salary_tb_salary', '2023-03-17 12:09:03.760230');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7aqxlom1bwyp5ccclkg38cazaednjppn', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3MU9KB0jB-LQAjNg3E:1q3ZRl:L5L30zeOREIz-wGLp9TbwspsOjDbFOlrAKpVh6457zc', '2023-06-12 09:45:49.840876'),
('h1us09xjcridbwt9vxo7yp7ho9icalxo', 'eyJlaWQiOjEsImVtYWlsIjoiZEBnbWFpbC5jb20ifQ:1qY08v:QkoP7GEdpwGwYQWwxiZBaSZRNy8miECOmUlVyi3Zdk8', '2023-09-04 08:20:09.216420'),
('i538gssb97n6aslb3jbcg3n6vmsae6i3', 'e30:1pdaSe:5PklFNczQHwSPQSU2KIoGEd5ODBuzMQZMFVqD11gbxk', '2023-04-01 17:35:20.215628'),
('luiurzakudrzqaivimqhbvgowvb5v8uh', 'eyJoaWQiOjF9:1pd905:VlTcSe5I7TOA-dadLnoarGSKaJ4u-VtSJp4CYFS_Kdc', '2023-03-31 12:16:01.414023'),
('q1fk3lwl0dgplbues091fcm4vvivhg2y', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3MU9KB0jB-LQAjNg3E:1pc1Py:ayvnaebRdZpdWkmgvDll3IJSzd86B_rMBzu_nR3Kplw', '2023-03-28 09:58:06.075197'),
('rz2dzkr0ba0kpl9ebzaew2g2oqt59gzq', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3MU9KB0jB-LQAjNg3E:1pcUF0:Nkhkj-oPQlNG82taRt4Pmgv-wIJd2LseebO5VYlia6Y', '2023-03-29 16:44:42.542639'),
('xjvi0tvzehhzqbgihck4ykzgqu5zcc4v', 'eyJoaWQiOjF9:1pax2z:L3QZPlXbG1-RtGOuHEBKoBZdzzZaXGL6KhMN5AZFNZM', '2023-03-25 11:05:57.306375'),
('y14smf6qkxmzh35q7vglnqgwlojraaey', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3MU9KB0jB-LQAjNg3E:1pdSOW:Hvui5Le5eOfvIfNR6ingjx9XSPA69nzuTtURHzuQuio', '2023-04-01 08:58:32.758827'),
('zswg95pkuims0l6w50rj1d499j2kwzya', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3MU9KB0jB-LQAjNg3E:1pdPS8:_bqHSBp_IIYDTNCNCsILvgUokp0tKtQKzyeOf3m5exE', '2023-04-01 05:50:04.284759');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_addjobvacancy`
--

CREATE TABLE IF NOT EXISTS `hirefellow_addjobvacancy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `venue` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `time` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_addjobvacancy`
--

INSERT INTO `hirefellow_addjobvacancy` (`id`, `title`, `venue`, `date`, `time`, `description`) VALUES
(1, 'Job Fair', 'Kochi', '2023-04-01', '15:26', 'njhgfgchn');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_applyjob`
--

CREATE TABLE IF NOT EXISTS `hirefellow_applyjob` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(150) NOT NULL,
  `c_email` varchar(150) NOT NULL,
  `j_id` varchar(150) NOT NULL,
  `cuname` varchar(150) NOT NULL,
  `file` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_applyjob`
--

INSERT INTO `hirefellow_applyjob` (`id`, `c_name`, `c_email`, `j_id`, `cuname`, `file`) VALUES
(1, '1', 'b@gmail.com', '1', 'babu', 'E_voting_1u7vMUv.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_basic`
--

CREATE TABLE IF NOT EXISTS `hirefellow_basic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `designation` varchar(150) NOT NULL,
  `basicpay` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hirefellow_basic`
--

INSERT INTO `hirefellow_basic` (`id`, `designation`, `basicpay`) VALUES
(1, 'manager', '500'),
(2, 'seniorstaff', '300'),
(3, 'juniorstaff', '200');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_candidatereg`
--

CREATE TABLE IF NOT EXISTS `hirefellow_candidatereg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `mname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `age` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `department` varchar(150) NOT NULL,
  `semester` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_candidatereg`
--

INSERT INTO `hirefellow_candidatereg` (`id`, `name`, `mname`, `lname`, `gender`, `age`, `address`, `department`, `semester`, `district`, `password`, `username`, `status`, `image`) VALUES
(1, 'Babu', 's', 'v', 'male', '23', 'njdwned', 'BCA', '2', 'Ernakulam', '123', 'babu', 'approved', 'author-01.png');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_complaints`
--

CREATE TABLE IF NOT EXISTS `hirefellow_complaints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(150) NOT NULL,
  `complaint` varchar(150) NOT NULL,
  `reply` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_complaints`
--

INSERT INTO `hirefellow_complaints` (`id`, `c_id`, `complaint`, `reply`) VALUES
(1, '1', 'hjgfdsas', 's2jn');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_complaints_emp`
--

CREATE TABLE IF NOT EXISTS `hirefellow_complaints_emp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` varchar(150) NOT NULL,
  `complaint` varchar(150) NOT NULL,
  `reply` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_complaints_emp`
--

INSERT INTO `hirefellow_complaints_emp` (`id`, `e_id`, `complaint`, `reply`) VALUES
(1, '1', 'fnjkrf', 'wewe');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_department`
--

CREATE TABLE IF NOT EXISTS `hirefellow_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hirefellow_department`
--

INSERT INTO `hirefellow_department` (`id`, `name`) VALUES
(1, 'MCA'),
(2, 'BCA'),
(3, 'B-Tech Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_employeereg`
--

CREATE TABLE IF NOT EXISTS `hirefellow_employeereg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `dob` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `mob` varchar(150) NOT NULL,
  `qualification` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `nationality` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `designation` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hirefellow_employeereg`
--

INSERT INTO `hirefellow_employeereg` (`id`, `name`, `lname`, `gender`, `dob`, `address`, `mob`, `qualification`, `email`, `nationality`, `password`, `username`, `status`, `designation`) VALUES
(1, 'Davood', 'Kh', 'male', '2023-03-08', 'njkhbedc', '2343213232', 'Mechanic', 'd@gmail.com', 'indian', '123', 'davood', 'active', 'seniorstaff'),
(2, 'sam', 's', 'male', '2022-12-27', 'sam villa kottayam', '9674653547', 'MCA', 's@gmail.com', 'Indian', '123', 'sam', 'active', 'juniorstaff'),
(3, 'samson', 'Kh', 'male', '2023-02-15', 'fwerg', '9674653547', 'Mtech', 'sa@gmail.com', 'indian', '123', 'sam', 'active', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_emp_attendance`
--

CREATE TABLE IF NOT EXISTS `hirefellow_emp_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empid` varchar(150) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `hirefellow_emp_attendance`
--

INSERT INTO `hirefellow_emp_attendance` (`id`, `empid`, `date`, `status`) VALUES
(1, '1', '2023-03-14', 'present'),
(2, '2', '2023-03-14', 'absent'),
(3, '1', '2023-03-15', 'present'),
(4, '2', '2023-03-15', 'present'),
(5, '1', '2023-03-18', 'absent'),
(6, '3', '2023-03-19', 'present'),
(7, '3', '2023-03-20', 'present'),
(8, '3', '2023-04-01', 'present'),
(9, '3', '2023-04-02', 'absent');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_feedbacks`
--

CREATE TABLE IF NOT EXISTS `hirefellow_feedbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(150) NOT NULL,
  `feedback` varchar(150) NOT NULL,
  `message` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_feedbacks`
--

INSERT INTO `hirefellow_feedbacks` (`id`, `c_id`, `feedback`, `message`) VALUES
(1, '1', 'good ', 'nice service');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_hrreg`
--

CREATE TABLE IF NOT EXISTS `hirefellow_hrreg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `dob` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `mob` varchar(150) NOT NULL,
  `qualification` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `nationality` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_hrreg`
--

INSERT INTO `hirefellow_hrreg` (`id`, `name`, `lname`, `gender`, `dob`, `address`, `mob`, `qualification`, `email`, `nationality`, `password`, `username`, `status`) VALUES
(1, 'jerin', 'james', 'male', '2023-02-28', 'lkmwnjdk', '9674653547', 'Mechanic', 'j@gmail.com', 'indian', '123', 'jerin', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_interview`
--

CREATE TABLE IF NOT EXISTS `hirefellow_interview` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `time` varchar(150) NOT NULL,
  `venue` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_interview`
--

INSERT INTO `hirefellow_interview` (`id`, `c_name`, `date`, `time`, `venue`) VALUES
(1, '1', '2023-03-24', '14:56', 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_jobassign`
--

CREATE TABLE IF NOT EXISTS `hirefellow_jobassign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `empid` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hirefellow_jobassign`
--

INSERT INTO `hirefellow_jobassign` (`id`, `empid`, `title`, `description`, `status`) VALUES
(1, '1', 'Web Design', 'mnduh test', 'pending'),
(2, '2', 'Test', 'Testing', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_placedcandidate`
--

CREATE TABLE IF NOT EXISTS `hirefellow_placedcandidate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(150) NOT NULL,
  `i_id` varchar(150) NOT NULL,
  `department` varchar(150) NOT NULL,
  `year` varchar(150) NOT NULL,
  `company` varchar(150) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_placedcandidate`
--

INSERT INTO `hirefellow_placedcandidate` (`id`, `c_id`, `i_id`, `department`, `year`, `company`, `image`) VALUES
(1, '1', '1', 'Development', '2023', 'Nextgen', 'Planet9_3840x2160_M7LfnG6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_promotions`
--

CREATE TABLE IF NOT EXISTS `hirefellow_promotions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` varchar(150) NOT NULL,
  `department` varchar(150) NOT NULL,
  `job` varchar(150) NOT NULL,
  `company` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hirefellow_promotions`
--

INSERT INTO `hirefellow_promotions` (`id`, `e_id`, `department`, `job`, `company`, `status`) VALUES
(1, '2', 'Development', 'Web Development', 'Nextgen', 'rejected'),
(2, '1', 'Designer', 'Web Designer', 'Nextgen', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_qualification`
--

CREATE TABLE IF NOT EXISTS `hirefellow_qualification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cid` varchar(150) NOT NULL,
  `university` varchar(150) NOT NULL,
  `marks` varchar(150) NOT NULL,
  `qual` varchar(150) NOT NULL,
  `file` varchar(150) NOT NULL,
  `university1` varchar(150) NOT NULL,
  `marks1` varchar(150) NOT NULL,
  `qual1` varchar(150) NOT NULL,
  `file1` varchar(150) NOT NULL,
  `university2` varchar(150) NOT NULL,
  `marks2` varchar(150) NOT NULL,
  `qual2` varchar(150) NOT NULL,
  `file2` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hirefellow_qualification`
--

INSERT INTO `hirefellow_qualification` (`id`, `cid`, `university`, `marks`, `qual`, `file`, `university1`, `marks1`, `qual1`, `file1`, `university2`, `marks2`, `qual2`, `file2`) VALUES
(1, '1', 'Kerala', '78%', 'Pass out 2022', 'E_voting.pdf', 'MG ', '89%', 'Pass out 2021', 'E_voting_EEp7Stx.pdf', 'Calicut', '90%', 'Pass out 2021', 'logo  a.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_salary_tb`
--

CREATE TABLE IF NOT EXISTS `hirefellow_salary_tb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` varchar(150) NOT NULL,
  `month` date NOT NULL,
  `salary` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hirefellow_salary_tb`
--

INSERT INTO `hirefellow_salary_tb` (`id`, `e_id`, `month`, `salary`) VALUES
(1, '1', '2023-03-30', '600'),
(2, '2', '2023-03-31', '200'),
(3, '3', '2023-03-31', '1000'),
(5, '3', '2023-04-30', '500');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_tbl_leave`
--

CREATE TABLE IF NOT EXISTS `hirefellow_tbl_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` varchar(150) NOT NULL,
  `date` varchar(150) NOT NULL,
  `purpose` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hirefellow_tbl_leave`
--

INSERT INTO `hirefellow_tbl_leave` (`id`, `e_id`, `date`, `purpose`, `status`) VALUES
(1, '2', '2023-03-17', 'nnjhsk', 'approved'),
(2, '1', '2023-03-18', 'aaswdq', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_transfer_branch`
--

CREATE TABLE IF NOT EXISTS `hirefellow_transfer_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` varchar(150) NOT NULL,
  `from_b` varchar(150) NOT NULL,
  `to_b` varchar(150) NOT NULL,
  `remark` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hirefellow_transfer_branch`
--

INSERT INTO `hirefellow_transfer_branch` (`id`, `e_id`, `from_b`, `to_b`, `remark`, `status`) VALUES
(1, '1', 'cs', 'mech', 'jnsc', 'rejected'),
(2, '2', 'Accounting', 'Computer', 'sadjkj', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `hirefellow_transfer_dept`
--

CREATE TABLE IF NOT EXISTS `hirefellow_transfer_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_id` varchar(150) NOT NULL,
  `from_id` varchar(150) NOT NULL,
  `to_id` varchar(150) NOT NULL,
  `remark` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hirefellow_transfer_dept`
--

INSERT INTO `hirefellow_transfer_dept` (`id`, `e_id`, `from_id`, `to_id`, `remark`, `status`) VALUES
(1, '1', 'Mca', 'Bca', 'hqwg', 'approved'),
(2, '2', 'Web Development', 'Software Development', 'dwjhbd', 'rejected');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
