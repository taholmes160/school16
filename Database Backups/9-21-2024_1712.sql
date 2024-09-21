-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Sep 21, 2024 at 09:12 PM
-- Server version: 11.2.2-MariaDB-1:11.2.2+maria~ubu2204
-- PHP Version: 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school16`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('5aaf71c3e848');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Alumni'),
(2, 'Attendance Officer'),
(3, 'Board Member'),
(4, 'Coach'),
(5, 'Counselor'),
(6, 'Department Chairperson'),
(7, 'Facilities'),
(8, 'Finance Officer'),
(9, 'Food Service'),
(10, 'Health Staff'),
(11, 'IT Support'),
(12, 'Librarian'),
(13, 'Office Staff'),
(14, 'Parent'),
(15, 'Pastor'),
(16, 'Principal'),
(17, 'Student'),
(18, 'Substitute Teacher'),
(19, 'Teacher'),
(20, 'Vice Principal'),
(21, 'Volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(1, 'Alabama'),
(2, 'Alaska'),
(52, 'American Samoa'),
(3, 'Arizona'),
(4, 'Arkansas'),
(5, 'California'),
(6, 'Colorado'),
(7, 'Connecticut'),
(8, 'Delaware'),
(9, 'District of Columbia'),
(10, 'Florida'),
(11, 'Georgia'),
(53, 'Guam'),
(12, 'Hawaii'),
(13, 'Idaho'),
(14, 'Illinois'),
(15, 'Indiana'),
(16, 'Iowa'),
(17, 'Kansas'),
(18, 'Kentucky'),
(19, 'Louisiana'),
(20, 'Maine'),
(21, 'Maryland'),
(22, 'Massachusetts'),
(23, 'Michigan'),
(24, 'Minnesota'),
(25, 'Mississippi'),
(26, 'Missouri'),
(27, 'Montana'),
(28, 'Nebraska'),
(29, 'Nevada'),
(30, 'New Hampshire'),
(31, 'New Jersey'),
(32, 'New Mexico'),
(33, 'New York'),
(34, 'North Carolina'),
(35, 'North Dakota'),
(54, 'Northern Mariana Islands'),
(36, 'Ohio'),
(37, 'Oklahoma'),
(38, 'Oregon'),
(39, 'Pennsylvania'),
(55, 'Puerto Rico'),
(40, 'Rhode Island'),
(41, 'South Carolina'),
(42, 'South Dakota'),
(43, 'Tennessee'),
(44, 'Texas'),
(56, 'U.S. Virgin Islands'),
(45, 'Utah'),
(46, 'Vermont'),
(47, 'Virginia'),
(48, 'Washington'),
(49, 'West Virginia'),
(50, 'Wisconsin'),
(51, 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `student_profile`
--

CREATE TABLE `student_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `grade` varchar(64) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `state_id` int(11) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(2048) DEFAULT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `role_id`) VALUES
(1, 'taholmes160', 'taholmes160@school.edu', 'scrypt:32768:8:1$5JxJT3xtZ03dPunt$d7666fc3d2fa3eeacfee32207899885ec6f140521f4aedf25692bf310374674543cda52fc5487d7b7e7389e9c7350ef66a2ae4a054a51f5d5941675d08b4cbb7', 'Tim', 'Holmes', 11),
(2, 'stu2024001', 'stu2024001@school.edu', 'scrypt:32768:8:1$pryihy9XPXBCwoFp$883bc8eaef86a2c41ab520944ca4b4e2d8d30f019691637bc49882fc1c71a54fabd0423e7cfbaa8a034d52caddf4118453a644a91101af29acc2028dd81880aa', 'Jeremy', 'Stitch', 17),
(3, 'stu2024002', 'stu2024002@school.edu', 'scrypt:32768:8:1$bZ14A9QC8uDHN7Sh$ab75a696ad5f521ad0db83713ccb9ecd0f378c8093c8b607bb7c6256d006d97c83dc8a00b3d424c92ac3cf9f0a92fb4b1789efe0213e8fd90348c229204697b6', 'Quinton', 'Kocher', 17),
(4, 'stu2024003', 'stu2024003@school.edu', 'scrypt:32768:8:1$4zjh8qtKbWYpwxsM$4169b226a5e90f665781e43fc8edb43dcd28fe04126e3e1e54c4b8e379acf790d822b6697f690b5c82b4b2e1f42c1fa8bbb5cb1644d4af1e56f237e9aa8fec3f', 'Lander', 'Busse', 17),
(5, 'stu2024004', 'stu2024004@school.edu', 'scrypt:32768:8:1$eJVvwwn6uPRYDthK$9beeec96134950f414c62839aabd5da4d615c887a02a4391ef5caebc0081a50e8fed83286d575514a391b25a59052731924057714b882b7eb42d935e5c9e9b34', 'Badge', 'Busse', 17),
(6, 'stu2024005', 'stu2024005@school.edu', 'scrypt:32768:8:1$Wp1MNPxDSg2EtBDn$b89c9a6bbe1857969a011485b474129b8bf3860473f961ae45f49836f57165029169abdfb1742869322e02f5c819723dfd87369cd247e2f766a7e89df28e09a8', 'Daniel', 'Beresky', 17),
(7, 'stu2024006', 'stu2024006@school.edu', 'scrypt:32768:8:1$YvC07xdiR7fOAwzS$a5aa8d1c3fdc4bc8efa509140f6ee53259f405d021a4af7ee8a2435ba8705706426f92caa6ca1ac2981b2990ce2cf6e9e7da07f51170a240e6e5bbb6c44fde0d', 'David', 'Beresky', 17),
(8, 'stu2024007', 'stu2024007@school.edu', 'scrypt:32768:8:1$y1gHNqlaviGUJipO$41fd0b510fe23917d9ff1c472ce150cf388d589e1e74364c3ec29b642479abdeb4cc257541ae2081272208a555405b283e3b8023e2431ee8f65f8c99d2694195', 'Derek', 'Beresky', 17),
(9, 'stu2024008', 'stu2024008@school.edu', 'scrypt:32768:8:1$j6TJ3pcOKWpo0HSb$6f74a50306ea66b3c002d5ea88bf5a134cb89cb004614e8db51f354ce3a0e85680ec53792df2476811eafd9fe7ace5d64693b509d5cd9a238b3a3867f3da37a9', 'Ron', 'Allen', 17),
(10, 'stu2024009', 'stu2024009@school.edu', 'scrypt:32768:8:1$UtvO8tNsFYaYJ7FQ$6c927fe2ab192d008e4aac4042f1667fdefdca24de08322e2773f0a25fb575068418113d43a93efda0abbc67b2cc77ff0a5d93ea9ebdac2c13f5e2d912343332', 'William', 'Arthur', 17),
(11, 'stu2024010', 'stu2024010@school.edu', 'scrypt:32768:8:1$sb3lAZgRR03udJ10$4e09ee3fc07b55f22fc35a7fc2ac0e108883762da3ebd41587ab3e7dd285c48cef67034f44bbf4c0da98b1fd92afff1d97c479d34fbd28702c0e81efb7423e42', 'Jeff', 'Bania', 17),
(12, 'stu2024011', 'stu2024011@school.edu', 'scrypt:32768:8:1$mRNAWbMW9Yq1b55Q$599785fdb8f5332844fa80feeb2cc4152c90b168fbdf0d59d19a0fc8b76111f85f4ed6723b9797a2406c135edac038b89249c63df619328efd3c05cb0b4563f0', 'Thomas', 'Brown', 17),
(13, 'stu2024012', 'stu2024012@school.edu', 'scrypt:32768:8:1$MXK6TbiNjLPzHIvv$4d4143afff0ec4cb4862f10f70a784cd0f0173ffb826c9a15735a366f950441354711593785bc8acade49b5bbcc580c5b6d1efb57d5b645e5de2bf7b1d3bcd87', 'Jeff', 'Clay', 17),
(14, 'stu2024013', 'stu2024013@school.edu', 'scrypt:32768:8:1$7o97eIsGgYVdHMY7$51b593d3a053be9cdcdd7dd3df8c1ebb488cadcc191c38475b1db848a70048ac3a09c62169db30c176d7ac9fb67ede090cad02b944063eeb069f2c57a90dbb2b', 'Greg', 'Hochstetler', 17),
(15, 'stu2024014', 'stu2024014@school.edu', 'scrypt:32768:8:1$roDAP30aIrTAD5eJ$cb3a6d070ab2d98fee1e4b17927f60ee4c88ab0bc463addbc5900c50d9fabc1d4b466d7c67481d6e775ec641698e01363a34b06914897ad257aa1fbdfe858b64', 'Tim', 'Johnson', 17),
(16, 'stu2024015', 'stu2024015@school.edu', 'scrypt:32768:8:1$4gkd9P0TVw6lbi5s$65268351aca78a25d8ce4b02814f02c379c686ac017de1cda93053549fe788ea8ff23cfdfa340c1e89887d7181496fa8948edebd5da0d341d406fb5500003512', 'Eric', 'Johnson', 17),
(17, 'stu2024016', 'stu2024016@school.edu', 'scrypt:32768:8:1$2P9pefAnH1XfsxbN$9ae937484195be414b5bac9b43e456cf979f43123e5e027e8adf9b55ee628a458da4605812a5f92bf5a9c7be856ce4bf380a6011f22c2497b884cd334afa2f52', 'Jerry', 'King', 17),
(18, 'stu2024017', 'stu2024017@school.edu', 'scrypt:32768:8:1$zLYYidQV3M0UQfXV$a73da0b8ba9c4654afeb05d76191150481aa32099f72ec6fd77df32d9e7b587d2d61aec168f50d7b620f08887f9b7a807559986e072a28fff5b5d36feb4d4210', 'James', 'Lambright', 17),
(19, 'stu2024018', 'stu2024018@school.edu', 'scrypt:32768:8:1$8QeOS5ZONsIPBPAX$72d0e627acd4e2700c74a41ee0458910cf5db02d8ede00a6b6a67a4ae82c0e4d0949bfd085f219d052294ff3f25485f1ba117d41743fd97cc4d3efa2c82e3f23', 'Heath', 'Lambright', 17),
(20, 'stu2024019', 'stu2024019@school.edu', 'scrypt:32768:8:1$cEJZo1DhwH0jsJYb$192c59c7515595ce54e57c7f92337b118c291417bb34afdade8895f6c0562766ff24dca39f639d503d72b3784f74053a4c81dba83b08a45382043f9925f6dfbc', 'Rod', 'Linville', 17),
(21, 'stu2024020', 'stu2024020@school.edu', 'scrypt:32768:8:1$fhjtQ0eXzuxzp8ub$61cac0b55ffc9063c8d354f24186764fa34a681c26b8b9b78fef4c1439af9954fa79e349fee04ef126d5fce72be0141f806417bb839bc2cf10b53eb721d3ccd5', 'Brent', 'Lowe', 17),
(22, 'stu2024021', 'stu2024021@school.edu', 'scrypt:32768:8:1$hcX9qtzpbCZQPGQp$9f23c2c7582b2d6dc29b9e9742044063de7481fbcd8f122576d5119341f38091dc2290760ae13e7142e6902b51394ce2816c15a7e96d3cec151f213bc3266eb2', 'Rex', 'Lowe', 17),
(23, 'stu2024022', 'stu2024022@school.edu', 'scrypt:32768:8:1$YDMxP50mL0YKpCSN$36a3b85cdd60192a412802d35664dac820f4e8f520733e3bca5e5d12d5df3c4219fcb8d090eb909f170c1fbc447bd0aef58bd4ebfba5669261e363d5b66985bd', 'Brian', 'Miller', 17),
(24, 'stu2024023', 'stu2024023@school.edu', 'scrypt:32768:8:1$LJkiDwMQ1j26Dzod$9792805bdf884f03a01d76aca671d75a0a7c802294223815d94b156804d8766a88bcd0304aab5d13d6f3fcddd7fa0c7d95a1ff2c3d9462eb7acdaf7f435fe664', 'Frank', 'Oren', 17),
(25, 'stu2024024', 'stu2024024@school.edu', 'scrypt:32768:8:1$C4ayBs6Bi7cvK4iD$dd73127d1c1061654c8ac97bf4e71631b405624cb4a27c448880ab0524a6b00ba7333f133a47374592b147ea53a4b2a3c1f11d8251c09e329261974097ad0c78', 'Matthew', 'Patsch', 17),
(26, 'stu2024025', 'stu2024025@school.edu', 'scrypt:32768:8:1$IZaoWBnY4LW5VvO6$1085dac9d213d24cd45d16b2c44160acf13a25979c52d175bd5c0ec58ded24e016fe025527f153f6f16a1f585c14697f737055820600c25dbb3c40139cbc66d1', 'Chris', 'Ricker', 17),
(27, 'stu2024026', 'stu2024026@school.edu', 'scrypt:32768:8:1$MoZ9hxbGqB45gUff$e55afb8a6e5b69120af15df1839322ada0a3a24231c95e529823e53632c0faf5d497f8fd586dcd1e70ad7c1d879389b663dc15f58bf4f081057148a4e40aae7f', 'Alan', 'Ripper', 17),
(28, 'stu2024027', 'stu2024027@school.edu', 'scrypt:32768:8:1$BOPnO6m6JhNZX604$b00722be430ef59d4aa9f935842f74221250265ce3259170d1cf477723e51ef67fa564c011f4fe5b2e77d42eb42525db1959d553572c719c82151423e9c1319e', 'Adam', 'Ripper', 17),
(29, 'stu2024028', 'stu2024028@school.edu', 'scrypt:32768:8:1$WEjNu4nYgSxm6y5d$7824361fa8a5f4d7ed0bd11e3eea5484ba14b259aa2c5a0b4a58402d35f3b9ae3451acdfa662775f0143c1d07d52304f42fc5c6893aa0aaa31044bba3356e6ef', 'Tim', 'Scheutzow', 17),
(30, 'stu2024029', 'stu2024029@school.edu', 'scrypt:32768:8:1$HvQbcDygbMoWryGy$cc968f0aae5b25240a6d0e4c0d1cb7809ed6c4a170fe1f882b16717aedf19d2a2c9cd0648ea5ca315950cc4cd93d66235356f2c57fa37410b3e1dc7ac59477d6', 'Jim', 'Surratt', 17),
(31, 'stu2024030', 'stu2024030@school.edu', 'scrypt:32768:8:1$jaGrNf56Ds3MjGoU$a6d4678dd686cb90adef2b02e2dfbf71e808d7bc498251f2e213962c7286a2548176a4aa3ab8b07fd2e002a6227f43e78e31acc19563d63ec790138b54849904', 'George', 'Vermilyea', 17),
(32, 'stu2024031', 'stu2024031@school.edu', 'scrypt:32768:8:1$CRwjp1VUSD5e45uw$a2cb8aeec645cadd5bb15ddcda587121cf80e37ca97f4e2acbf441159d4c908a33d3dd6d6af4bb5f2ff5484fe71f0488574e51173ffefee61d4b13e2488c51e0', 'Michael', 'Winter', 17),
(33, 'stu2024032', 'stu2024032@school.edu', 'scrypt:32768:8:1$rls1D8KnTWeieGsQ$b2c35cfbb38f801ff750603b3e04cdd09a84a7d8c82220de6ad0482c89e3f4a5f86410364b9dfa6b3b46514ff8f3696109b1d3e7c670a0dd4222a67ec2fe7219', 'David', 'Winter', 17),
(34, 'stu2024033', 'stu2024033@school.edu', 'scrypt:32768:8:1$ZrsBBym0C2CZyRSf$85d1e569ad9aad915d072b0221d60a71f309237d731883ad12545e41c33171a299b92ed17d7affce24b9e2e517274aa91f724337a8efdb295c25258012cc88fb', 'Bill', 'Bixby', 17),
(35, 'stu2024034', 'stu2024034@school.edu', 'scrypt:32768:8:1$fYdBOa6DiQxPDX3p$d8530284be9c30568a3c4c1dc40ea6e3e925276e587531f342e94cf17e3714218625ac16e550568c1a7f94caa3effcbb8ebe57be1f4704ff4521724088ba37c8', 'Justin', 'Brenenstuhl', 17),
(36, 'stu2024035', 'stu2024035@school.edu', 'scrypt:32768:8:1$5y8wq9HmRsayw3Vw$8eadf9630a06287bf72d3e472d5858b9e75f49e2cd259b6fce13189e6e0c6614e5f9cf5fec485158144fc7b50ba62d6fc3a9d55380aacacf797d43a797a30605', 'Bruce', 'Collier', 17),
(37, 'stu2024036', 'stu2024036@school.edu', 'scrypt:32768:8:1$1t2XJeT74jKPfxvV$ef8aa7d7ddf7d5ae1f3170ff10e5822ca8f8b0fb0a3420781af56038c864d115cdd1d91bef4acbc8e44fecd9090b99db3aa15eb651619c9ba8757c10d81fa500', 'Matthew', 'Hoert', 17),
(38, 'stu2024037', 'stu2024037@school.edu', 'scrypt:32768:8:1$1t1p3vXnB6UI79tj$952b87b445d6ed3c0d28ec1de64125d52fd1df93b97bf45bef8c7e01002b589be6d6b2ad9079b6e4e2bcc27cf89688a4aea2a3085bc8520203d68f5cf0ebc5f2', 'Chad', 'Hoert', 17),
(39, 'stu2024038', 'stu2024038@school.edu', 'scrypt:32768:8:1$41hEsirsqwq18DrU$cdc6ad5ced1bf14b6cb4217114f557fdeb66789c4f550f4330bc35d0a25a566a875d60936d3f7bc2f41c442d5a8c5463cb6382eff335bd890de01e6378b791f7', 'Joshua', 'Hoert', 17),
(40, 'stu2024039', 'stu2024039@school.edu', 'scrypt:32768:8:1$xso9jvZIQ8tHHHoV$ee4c77b5937674066d9577b1f0ed484759403062ac59bc4a33eb134ea6eb9e3c412ce51f33a0caf943ae667c98b42e866ffce541c57cb22dea724478f9284281', 'Zach', 'Misenko', 17),
(41, 'stu2024040', 'stu2024040@school.edu', 'scrypt:32768:8:1$jlciMKtUezZPwr61$b91323405603e76a5a617676f7334ca8585e8ca77f185caef486d4c8909b5813eb4e608ed209e251f1ccef6225a46f338318276f9dc1886765b5b6fc6fc65f0a', 'Adam', 'Misenko', 17),
(42, 'stu2024041', 'stu2024041@school.edu', 'scrypt:32768:8:1$P1nvBB0lBCDvimBG$537571fa9a5f0de571747fda82a4550477a124e8a20cc0f95034994b297d75030c0eb4e48a97ad5ecb3c6b0b57ca284fb042290bb47c36a62ca016abe0e08b45', 'Seth', 'Misenko', 17),
(43, 'stu2024042', 'stu2024042@school.edu', 'scrypt:32768:8:1$89Cc8ywWwyBKQGfq$24ee29cee893a3b411c034b5f92eb97435c112607f18d8e9310a2747759be07c1430c7ad0a09bb6fdfd31acf4fda2cede749fb04b6a31a47c5eb9a355c2dbaee', 'Rob', 'Cook', 17),
(44, 'stu2024043', 'stu2024043@school.edu', 'scrypt:32768:8:1$uTYHeoJqV1pahwVw$74df627c5471860fa4f76c0fd2f15453c7c7e25185e56ef9f177904a1ef0d70a2b6d5a607b6808a86bcb7cfe01e509c347a3e1a77f460ccb9180e7d2935089da', 'Shawn', 'Gebbie', 17),
(45, 'stu2024044', 'stu2024044@school.edu', 'scrypt:32768:8:1$AhRBLBBEgUI32fQE$a17537cf0b83ae671a4d3c757789380f1d0ec98c4f5e6290153092a859b6f716b3c7be1945a51e8858957cba1ec4113db9d86b26b513b27a19356c29a7258cbb', 'Christopher', 'Conwill', 17),
(46, 'stu2024045', 'stu2024045@school.edu', 'scrypt:32768:8:1$j07qcFvf1yjk8s9O$ffe46b973e13efa0002223c8667e487cb875f71d98dd9b7bd3eb81b1f1833b8df53f006f4a1d1bf087e525e0d92b31782edc33923898dedb1f7b3bca22157caf', 'David', 'Conwill', 17),
(47, 'stu2024046', 'stu2024046@school.edu', 'scrypt:32768:8:1$idNRrtX8wYWV51Yn$77d78582dd63bb081f3dd94d178560504019c744e641293d54ab02b4f5aac0e477fb086daa6f056e16325a09405fb87626c9bd21e8be51db8a5d5c80e9549457', 'David', 'Gillespie', 17),
(48, 'stu2024047', 'stu2024047@school.edu', 'scrypt:32768:8:1$ptlmRwS6zyjWt3sP$bcce957d53ca116c8eb2a23e4bcd51fe0fec6fbfd02c62d5cecd9ba005d54b13b0c8d54b57dfb4006da19e85b8d1b6558cd5c3f484a493f8bfcdbcdc646ccefc', 'John Mark', 'Hershberger', 17),
(49, 'stu2024048', 'stu2024048@school.edu', 'scrypt:32768:8:1$UMdfHi0n9BSc2M5O$94e07f4aca97faa05a37d616ae0ad1bc730a6eba3adcd7e86d8566098f5132da3a8f29ce1bc4801ca7723f8690c88c3e4eff444fe4e309d1fd877271768661a1', 'Kurt', 'Kramer', 17),
(50, 'stu2024049', 'stu2024049@school.edu', 'scrypt:32768:8:1$Ln53PXUgYyLefa8Q$e2a667f4cbed396336029afefd9cf673f3e0c7b1908d0352b8800dde561d3454ca7e439dcea5356dc3a616242b87a4066d865b5c68b9b920cdb6a9db9acb6960', 'Kenton', 'Kramer', 17),
(51, 'stu2024050', 'stu2024050@school.edu', 'scrypt:32768:8:1$sLw2XPlgAayZb0kg$33001949eda6b52daf71005fb3224ce4f99c24a5895b5b8f975bdc68aa1735ed824a6ec2d5438687747288e450c778f2daf78ca92587f17caa7c27fc19815afe', 'Tommy', 'Lamborn', 17),
(52, 'stu2024051', 'stu2024051@school.edu', 'scrypt:32768:8:1$ldSxvmRXtlvKGNqB$aaa2a397139d6d2ad3a5c6ef6c5db2b055aa8b6119543f0482819084f7ab0be2a37d01c99d998b9c0f88fec8fd532e511f48625b34321c46df7b4946d090b625', 'David', 'Lamborn', 17),
(53, 'stu2024052', 'stu2024052@school.edu', 'scrypt:32768:8:1$DSqgYjP8qkL4vKFT$daa08b89f89d7917b561e6ae87b2bfaeafc56a043626f0837958c8f5cd88a90eec73153b9d939b197a6136a7f6ba90a1278874856af10f18fe0fce5eec6661db', 'Michael', 'Leach', 17),
(54, 'stu2024053', 'stu2024053@school.edu', 'scrypt:32768:8:1$ZcwHaggB9OoL9hKE$cae815744881e7b3c37237d6feecf3004c430373dba81695592af75937c59fb4dfeb1bb74fae4784627c7e70287bb056d3ee11c1b54cb2d39cdc1e03769e9bdc', 'Jonathan', 'Sommer', 17),
(55, 'stu2024054', 'stu2024054@school.edu', 'scrypt:32768:8:1$XftVHKBNc75OLp0u$d13745106b3dc03a5200c1718f98065d2226041e5ab24614284bcdcbb62d67cb2dae0f56ab25aab7c293e0153032697b8750d58122954fdb50f6bdf2a14fae4c', 'Timothy', 'McQuerry', 17),
(56, 'stu2024055', 'stu2024055@school.edu', 'scrypt:32768:8:1$Lx900npN3xKX1fLJ$e887f238ba5af26075ecc2b5624bf5e1a13fc339011ba0ef7c4130e30a1b7d8705fa579058dbc7ebe47e19946576164da6bbb77cda8ec7f7ee94e219eaad0c71', 'Todd', 'Meridith', 17),
(57, 'stu2024056', 'stu2024056@school.edu', 'scrypt:32768:8:1$tlFzKs72Z1ZS9MEf$db7958ea462276d3301846b1c2649a729143e6008e8fc8b375bc25b748f69a857d0a6dfe58a657332052b02b35c064bcfad500e076f73a1b263619ae5480f27c', 'Sean', 'Miller', 17),
(58, 'stu2024057', 'stu2024057@school.edu', 'scrypt:32768:8:1$1Ztq9LEf40OWRnMY$053c2f0dd38498a9f8715a3bb2923bb5bcb461e30cd260ef1aeeb6dbd626abc152a967a4487b00a70dff8bfbb6a0de2421d739ec3c3253b77a9971a3e6a8c333', 'Reed', 'Monegan', 17),
(59, 'stu2024058', 'stu2024058@school.edu', 'scrypt:32768:8:1$aIdoEBfT3m5RHpey$79727240e5c5d551772ed45a1114e18ce424986d3f8dccb5bfe24a8e415878a6164cf68d1855734af9dfc3f21fc63586d2ad22a828a16bea60fd43eb72ddc756', 'Steve', 'Nowack', 17),
(60, 'stu2024059', 'stu2024059@school.edu', 'scrypt:32768:8:1$F4ewyBNgmRHl6lM4$a6ef061a4499cb4884a1025f8a08c48bcb0dd72435fcd7a3e42a97d28dd7eabd1eeb0ecd898766dd9dc14e28ad664b54c647af311eb2802e85c2ad00d0fe0691', 'Matthew', 'Oates', 17),
(61, 'stu2024060', 'stu2024060@school.edu', 'scrypt:32768:8:1$J6iLY8PC9l7VSrlB$ccf7c00b6a7a5f3042430d8a59131be01af58050eab88a976e1f213acb491d0b9d63bf02c4b837a37ebc5290b3e51f4d6cbea86b284bbf91321cff29628ab345', 'Kevin', 'Payne', 17),
(62, 'stu2024061', 'stu2024061@school.edu', 'scrypt:32768:8:1$yXtaJsbS4Mayc8fd$34597fc54fae5b9b0e8624331fc862fb954176530a4a0df4644dd9e8d2b7ab10f7471520f788d3c3bc47927d2e1d2275a024ce4ee24838a2204c807a506edf0c', 'Rick', 'Powers', 17),
(63, 'stu2024062', 'stu2024062@school.edu', 'scrypt:32768:8:1$Jc5UvFzQG8O0gAzt$71ba282bd813e14f52b21944292f4236948a1c34018698d4bc6ba069a42a3275a1abe42d5489ba171a736cadf908951e8d3c65e684786c10fca32e0b20852113', 'Joshua', 'Powers', 17),
(64, 'stu2024063', 'stu2024063@school.edu', 'scrypt:32768:8:1$2foYZCs3hQdDsZZf$1006abcd0a8c03533f5eea60e76417e7a4b3cdf94e1efaaaeccc1812d74198845345c223d489b2fe5cfe876848743c21950d1e99552e6566145c38b1c3cea8b8', 'Ryan', 'Roberts', 17),
(65, 'stu2024064', 'stu2024064@school.edu', 'scrypt:32768:8:1$oOmgUsZf3eba46DF$423a95f84cbe3b4d0e31a543c4a252cb4fb398bf20be1cfaa3c0902f713424be255578d958e66f06f4c45a100b3f9219e8e2493c33735536a870071ff2b5d400', 'Darin', 'Rosenvold', 17),
(66, 'stu2024065', 'stu2024065@school.edu', 'scrypt:32768:8:1$3OMeVsESjvm0rgpB$d6d40a14df049ff968874087cb5b6c1d8155ea872b3842b60b03d806fcbe099da6e5b07698eb4bdcfceca7be44d8bdfb2d05d8929f54108a66cbd4aa82b06325', 'Jeff', 'Roth', 17),
(67, 'stu2024066', 'stu2024066@school.edu', 'scrypt:32768:8:1$mfkVoO9ohQ9HZA7C$831fe8d04982aa363004d65133705cac8ab6f05cf4547ee106ad51be924e9688682d5a68fd43ed1544f8590ed33720c30e5391cbcae27fd051d06749e23fc7b3', 'Jonathan', 'Roth', 17),
(68, 'stu2024067', 'stu2024067@school.edu', 'scrypt:32768:8:1$SskJX2jwayGaB2A8$8d8e125fe4609a31d5261dc792976a53bea74ca82c135253373131ff8980c9513badfa210b91a1a6794461c9ee14dbcde544cfa1c343dd94572886226dcb354e', 'John', 'Sebestyen', 17),
(69, 'stu2024068', 'stu2024068@school.edu', 'scrypt:32768:8:1$Qhx2hm4mzpxo1sGY$a2f44068bbc01703e66f6278e9b441db87343487e0ed7dfb1cf31eb28f4dd2d3f700f5558fd8df44cffa6496b807ef9782fb12241c29c7995e1e0ad941f786d4', 'David', 'Snyder', 17),
(70, 'stu2024069', 'stu2024069@school.edu', 'scrypt:32768:8:1$Zt0CfGlxdhze6LWL$ef2a1519880493bd6c1db2f1c1667f3e1c63971769c3e983b1da506ac79b81269b0072b2ddfa65ee0ad69b40e62cdc9816fc8a94f86de7cee8f767f0df9d9e8f', 'Timothy', 'Work', 17),
(71, 'stu2024070', 'stu2024070@school.edu', 'scrypt:32768:8:1$YkFVhPGKRylt0Ex8$abe3ffbf7af1367a797c9fdc54f75ea0634ad47a4c36569e284faa3d6134cb2342d74b163e3ddca18ae2658addd14947d34ba781c52923c1ce84e56929460031', 'Andrew', 'Male', 17),
(72, 'stu2024071', 'stu2024071@school.edu', 'scrypt:32768:8:1$ic0KgvywSK9AQgVJ$7321da42dcf2fe4ce67db9d3ecd3b79d24410c2460983ec9c4e7d49ec8601c1fc4a78b141c8dc4408328d7062405f22a9da9e9c4c95d953e59231a809a6f447f', 'William', 'Surgeon', 17),
(73, 'stu2024072', 'stu2024072@school.edu', 'scrypt:32768:8:1$sQoogX5qSBKfCSCD$e323de4feb0a139d6a43e18c23e0cf0ae709da6284151d9db748728a13005e0c8342886b6db7a452a407788a0265e43656a20886b33bcd66c47a7978c5bf0176', 'Ben', 'toot', 17),
(74, 'stu2024073', 'stu2024073@school.edu', 'scrypt:32768:8:1$3yG6oAiruBBmOBD4$9b50d55ba7746ed81da46fd1c688bebfcebac69cf8a4dde2158cbb4a0ecf22be1efad1d22430b38a6ccf8b5241a45dfee6f193a13a85efd379496ff19cf24577', 'Michael', 'Smith', 17),
(75, 'stu2024074', 'stu2024074@school.edu', 'scrypt:32768:8:1$wTdkWrbaA7ScsFH1$a89ac7cd20abb4c18d429bf83b0b3e0b39f96ba176329ad9196fa94c79908edcfa1bc9288310940d77085ef256100e04dcb74a9c2f79c687a38c2a8d67079f43', 'Robert', 'Ward', 17),
(76, 'stu2024075', 'stu2024075@school.edu', 'scrypt:32768:8:1$2CPFxMXloNm0ouGQ$bce393f37d4357b22392e9c529586fc2b5bc2cac6d0ade33965ee7b3da3df367940e118b487cc9b6ca74ad8ed4800d84f917e12c755e703db60abf7e20defbf3', 'Bob', 'Weinerheimer', 17),
(77, 'stu2024076', 'stu2024076@school.edu', 'scrypt:32768:8:1$NNHruUb8PoMivZZR$eb4e0fc08532fe1356f7d4ec3788f1e66eac26f5dd85b7058d893d6b6d042f0478fb8f99c128f0ce915e00859d4f37eb5d4ecec5ea7422bfcf5c6faad8ad8d2c', 'Jeff', 'Williams', 17),
(78, 'stu2024077', 'stu2024077@school.edu', 'scrypt:32768:8:1$nDXa4jycRmWksmys$caca2b887b10f88331ee00db98c53ec932b94d54c22eee118478297e1e625c72facf2c042d91f4d65138b85c9af15d6d6b885e705f81e95dc472bb2aa61a49eb', 'Bo', 'Wilson', 17),
(79, 'stu2024078', 'stu2024078@school.edu', 'scrypt:32768:8:1$q3F56Of5Im2RalMO$e8f898116f787ea90c11b5d226d75f7898926b4bbc4eec963660265da67383629cf2bdb69d1643dbdb0e2953d206e02def22d1b8ac58dd66a74ae42570f143a7', 'Bill', 'Wilson', 17),
(80, 'stu2024079', 'stu2024079@school.edu', 'scrypt:32768:8:1$S0YFczBeVzXBWz4P$4257e7776bb3a235128732d4a2db6ffdbd64e0c476589e74f53f23683b811a6866f2fa0af6669ea285ab644052365b891b89e162aa5b15bb49e2c7873c949cdd', 'Brian', 'Wolf', 17),
(81, 'stu2024080', 'stu2024080@school.edu', 'scrypt:32768:8:1$WW6LpHUxDmS7f4vZ$3ba1c1815ad1e0caa26e34f66a61d49e0f693a1bc530c8af8a9ecb33fa7ff97d355e9370fc0d85db0e380a3d7656ae2f1d610c2fd098e31004eff7380f1d2cea', 'Jay', 'Hardback', 17),
(82, 'stu2024081', 'stu2024081@school.edu', 'scrypt:32768:8:1$hflfqf42jCwjKgHe$d033349c620c176a91ea82dc08772d067a2c297a3263152acc3ac38950fc846a098e8f90d364a567ca31df6e82a5b3171f88dc678b3c0c494ba95ed54d49dde6', 'Joe', 'Phillips', 17),
(83, 'stu2024082', 'stu2024082@school.edu', 'scrypt:32768:8:1$m02mTqCxzvWj4zhi$932ac51ddc54f94d051c6d215009569cdd59eb29bc8023859dcd40b2e0dfdde890186d80eabe525307d50ee8adc018fa7a6775add79465e997bc01bba9ab1d2d', 'Linden', 'Phillips', 17),
(84, 'stu2024083', 'stu2024083@school.edu', 'scrypt:32768:8:1$XvgHkWr4TDvHFRY3$a35e53c82003ee09e5827de921cd437742bb44aba4d150ecfe51dd1f3805dd418ee11afb39c077a9b91a53342a280c06dac8bddf9c7a09bea3481842a80dd89c', 'Tom', 'Smith', 17),
(85, 'stu2024084', 'stu2024084@school.edu', 'scrypt:32768:8:1$IwsJEtgC5OjDZR1s$8b2ba18e239309b1aac99da58f54e918f244ea88454230525073b22b19fa183fe141dced3ebe8cb717b8f78d5373ca86b0eced3c674b1bd739561df30e6debdc', 'Thomas', 'Ellison', 17),
(86, 'stu2024085', 'stu2024085@school.edu', 'scrypt:32768:8:1$69ipc05xp8u8vpWP$a2de14b3c3982d3f81b421d9ce3913b318525ba5a65835ccc5d97201ee9db48b97a910bea294de6ff66cf16c03f49845a8880830fa7f1f48b04c7a748451efbd', 'Ben', 'Legg', 17),
(87, 'stu2024086', 'stu2024086@school.edu', 'scrypt:32768:8:1$JdxmVJ7UP8IPecyx$de4f06deb3bebecc2fa3b836ab760d7b553469575c9111239d8ffd4baf326dad8ebf4f91008b0615fc032225d1b05fdbae40a7ef69fdef7cb813c1c99a7478f3', 'Marty', 'Walker', 17),
(88, 'stu2024087', 'stu2024087@school.edu', 'scrypt:32768:8:1$FB8X2qr0YM8x7eMq$e9ab4bdeb468bba0dc99b5a2f68298633cbca560a9457420e5ee5c4e746c3abfd49bf0a18485b21901b66581ee3cf0bdefa32452dc19a9712fa8339b5c4ce234', 'Bobby', 'Scandlon', 17),
(89, 'stu2024088', 'stu2024088@school.edu', 'scrypt:32768:8:1$ctKD2oaxftP0eZTi$a5e3f3131b33051e81efe076c4e4c4aa3c3717a770cbd7363596e22fa95a2f72f8e590ec06f27d3b20995e60eb5a7b52505105a18e9c3f3dc3714651ff83df26', 'Patrick', 'Scandlon', 17),
(90, 'stu2024089', 'stu2024089@school.edu', 'scrypt:32768:8:1$MbeL772foJPdIaFv$1be3244b20c579af842df073f75767c9afadf6b9f32f5df9af745be159ff3c1aac3d995be81da127ef47c9db46479721f005cc42d4c27c5883bfef266d260bd5', 'Willard', 'Scandlon', 17),
(91, 'stu2024090', 'stu2024090@school.edu', 'scrypt:32768:8:1$X8k1hYCkirCiL4Zn$945b26af67ffacf664c365a9c3dd35a59a08ae31fb7279f1f214a80793315b5c5556dcdb9669b7222dcd00d59a8ba1f7e817c1efbad7a1fd3340885fbf9d133a', 'Austin', 'Scandlon', 17),
(92, 'stu2024091', 'stu2024091@school.edu', 'scrypt:32768:8:1$mHaAj1Z57c066Cze$898e478ade9a0f0b7aac10d70e3c36b62ff424fd5deafdd53dddcfa3274d5de34b0814559fcb423460e214cb45ee9433d218c862b8512b63d365e635823745c7', 'Jimmy', 'Myers', 17),
(93, 'stu2024092', 'stu2024092@school.edu', 'scrypt:32768:8:1$wOKuAcd6P3DaUGqh$07979e9c1390beafc67a7d22a2975d9313e300d438aee4d456bd12a8606943c49f00ecb58c0f7ca804a9cb9dccae2a868e964e5fb6ed8dc0330b247c3a1afd39', 'Tony', 'Dulgar', 17),
(94, 'stu2024093', 'stu2024093@school.edu', 'scrypt:32768:8:1$RQAIBCCIaeOZSYqb$0b18d10979d0501a47c0a49dd91ffa1e92a71bd2dce6ba27471b3312cecdba333c8f060792ca2923f8ebe888a3c733011f5dd5dca19759c1e212fdeda67c2791', 'Clifford', 'Phillips', 17),
(95, 'stu2024094', 'stu2024094@school.edu', 'scrypt:32768:8:1$lLZrJIuhjYpDnVDS$5ddc16e374194f38a90944b300660088025e076e37bd94eef0099550a1fe942954b31665463372149c3383fc079dd55f9e2e6514a4fd28b34558bbdadb736798', 'Scott', 'Phillips', 17),
(96, 'stu2024095', 'stu2024095@school.edu', 'scrypt:32768:8:1$exMRtclAEAUyZ3y8$d87f69a05428cddf7dd02834bf381b44b2f14a43eaeb394f51a42621b755d86f9747d5e964877e9bab455926b758783587b9648abfa2bf1ccf5437fc100ce09c', 'Rodge', 'Campbel', 17),
(97, 'stu2024096', 'stu2024096@school.edu', 'scrypt:32768:8:1$TfhXxj93gQ2EYDda$ea095334c30ac85b49c87d075cc12b6a22bfff9e64aa8b538078e97319291055d5be095def9fd3909e7988ee89addecda473c6aa4d681880be30b1afb86e09d5', 'Matthew', 'Perkins', 17),
(98, 'stu2024097', 'stu2024097@school.edu', 'scrypt:32768:8:1$yMYzdCx22QUlZGh2$339ce1b86b80eda6f62826fd3ce2b0271b9f2330cbef206cef8b46e264993575f1fd6e1d204791592af5def4e12e75e82dcc01ee684504096029945aa1eee6e4', 'Leroy', 'Meadows', 17),
(99, 'stu2024098', 'stu2024098@school.edu', 'scrypt:32768:8:1$blSWqt3KLjpiS0bo$f47d4b172625ff2b11e6ab6e9d642622d416a952d741e33a5395ce2e892292f375c0046f91c753f609deff0adb81f107f159f4f7076bb0ea04e448ef109652a5', 'John', 'Mullins', 17),
(100, 'stu2024099', 'stu2024099@school.edu', 'scrypt:32768:8:1$CZxUQOsWoMdJ2raB$88f64bbc032fa74ce9a77dcd6da6470e74dd3ebe13fd92ee87adba82ff1c61c92c31311dec11dacaa3c1a946b3e3462819774c73b2ecd6afd286dae6feb56303', 'Clifford', 'Roop', 17),
(101, 'stu2024100', 'stu2024100@school.edu', 'scrypt:32768:8:1$5rkiwuyZ2UjEq4sh$82470fd5cf279d32c34ee08f01fb65a4cc9ca171a02e789f138831faf9ccc3646f4952e447b635daee058ff74163df5c125896cd1cd91ad35ada9f5c6a28427d', 'Timothy', 'Roop', 17),
(102, 'stu2024101', 'stu2024101@school.edu', 'scrypt:32768:8:1$xG5vNJCOwTkANnDh$fb2842267ffa37dcae6e6d5dc2fdac3932c755ea711a2d6fe32381fd115e1ccd78d53632c740cfe0cd4a9e53329179835364b159fb1ebd36f756fd98f5a0f381', 'Kim', 'Roose', 17),
(103, 'stu2024102', 'stu2024102@school.edu', 'scrypt:32768:8:1$vwdsHVjinWbSBWqZ$728ceed97ffef199b928a3421a4c7ce175d14e21b1c176b6ff2abe4e0801c22de6ea6f3ec8bed170dc25adc722efe84b6d237faeb802beb7da0f8f1c08644aad', 'Michael', 'Tanner', 17),
(104, 'stu2024103', 'stu2024103@school.edu', 'scrypt:32768:8:1$m0iYzs7qVDzSvaBD$bbb1fb22eca7a75a2eb4f55fefe5e8a22da3d3a99fafefd99b4de4fae2f87812d20aa7d868d4f42dd6cd0a272137e525a949c43f1119e4980b0fb32fdc78a4a5', 'Michael', 'Vanek', 17),
(105, 'stu2024104', 'stu2024104@school.edu', 'scrypt:32768:8:1$OEm6zKDMaeIZfY8c$45aee2dba152b74c0608fc5cedd3951008a1c38a4612558a06ab92fe408c10380d9ad7c94de4f3ce8db2900f37616970363918f80f70882b185206132cbfbcf8', 'Paul', 'Brentlinger', 17),
(106, 'stu2024105', 'stu2024105@school.edu', 'scrypt:32768:8:1$gV7iFZZj5Se5XBHq$e04077f32974d691a021aabed379e341f97ad15c05ea1c3b85a08e7121a0f8e1110ca1007bf490932c019274f99898b83f72b6e84eebd688f6065e008d2fa5a3', 'Paul', 'DeHart', 17),
(107, 'stu2024106', 'stu2024106@school.edu', 'scrypt:32768:8:1$6zpgreTWzL03WjP7$abb93f97c6d87aed6322233e049f76684aadf89d95d863c817764eca684c2c52dd84363ada1fa66dc785840fadcb180d2f7b09583a93726e063bb87ba38cc59d', 'Nate', 'DeHart', 17),
(108, 'stu2024107', 'stu2024107@school.edu', 'scrypt:32768:8:1$0cD8sTwIiZzWX8so$9245d6caebfab8f4cddb84b8c46ab0b0f065ed0cea0a658fd72350e35d9c7478639beda8d94265521e2ad8569270906ef773c5c462cc23b2e040c099925ac0a7', 'Nate', 'Wolf', 17),
(109, 'stu2024108', 'stu2024108@school.edu', 'scrypt:32768:8:1$4PzG05u3234OZ7TF$3273174babf0ce63c1322a815da2ec67a1a52ea45c7128c1353d881d4515442894f32a2e4e1e54c6e88a2a9640349edebd6d1557a6f372953c2c2166ae32b5cf', 'Grant', 'Steyer', 17),
(110, 'stu2024109', 'stu2024109@school.edu', 'scrypt:32768:8:1$PR62x0H0KtAm6XNG$a3d47959c2be67c58d9b6dbaaf65578c3a7efd86622faf7dbfd9c0883f416531c78bac072ef4822e8cbc1dbcbd907aa8fe1dd6c552028512bb61a49af3171d3f', 'Todd', 'Steyer', 17),
(111, 'stu2024110', 'stu2024110@school.edu', 'scrypt:32768:8:1$yBdrc10o6L6v9Sc6$08b1a8e4c7916098858ca88a8d83a233ec8f393bfdd3e816d2027bc65144070cc1ab1a349848314b225dbbf7f25f25211d2443461e9a1732c710424ed72d03b8', 'Teddy', 'Guyulas', 17),
(112, 'stu2024111', 'stu2024111@school.edu', 'scrypt:32768:8:1$3GHp2ZNMGkI5uQnl$9a414b86e9a9d30157d9ea4a85cda79a81e694dd1221a9c5ef76bbee4796075de396a2f698bd96c3ef3cad7de0b96fb6a8c254266be77b0835970b7658d31422', 'Tommy', 'Guyulas', 17),
(113, 'stu2024112', 'stu2024112@school.edu', 'scrypt:32768:8:1$o6MGOO23iRDk0cLj$fd71edddf1b051996bb6899fbd53a0926c3a19016b149c97118b281e36664a0ff5217f394dfc5c1dc288f910c1e37377cff30af9077efc21ab14857f84754a8b', 'Wyatt', 'Cravatas', 17),
(114, 'stu2024113', 'stu2024113@school.edu', 'scrypt:32768:8:1$DQLfuCG68SNMprfk$20c7677080cedb6cdb68e03262a0aa4c467e770eeebc4f8221aa38e30524f7cb9216d071d180d0feaa975b14c3d3234079ffdebe7f81694fbc457757f20fc18e', 'Michael', 'Deuring', 17),
(115, 'stu2024114', 'stu2024114@school.edu', 'scrypt:32768:8:1$fiBxRZvsaTTO1ILa$568edb7588f053006364f56011c71e356dc75197ca992a287addc9ce2ce6a87f78a22e2c841a6babfecd842562c25662441fc2daaa9f18d963ea98417f046908', 'Aaron', 'Hicks', 17),
(116, 'stu2024115', 'stu2024115@school.edu', 'scrypt:32768:8:1$zG4zwnUKbj6FJ9Aw$a1c0ef4fb9949aa918138c1814ba5272e595c6186b4c5b78fd7558564cd4fbef73c8ec826cc05a51fd382c9fbb92e13871978ed35fe2f0e3342898c2c9289921', 'Doug', 'Dougherty', 17),
(117, 'stu2024116', 'stu2024116@school.edu', 'scrypt:32768:8:1$LqLCudYxT2TZlMcs$26e7ed3195c5c9240eb5632a55e2dac6587de41b1074d4331b2bb6e224e9bad44aed0e91a0b9807fa01124f57a31890d4626a0c75549a7a3ecee35b1b0f4194c', 'Matthew', 'Honaker', 17),
(118, 'stu2024117', 'stu2024117@school.edu', 'scrypt:32768:8:1$W5KpoUGdRRxK3d79$23d8208506353e9045888980eba19aa78d2ee718d6d2a8b442850d88493f9a1dff9d60a63ffbc47b925713671d4cf1d9bc786f81f7e65df0816d8401f3d2cfc7', 'Andrew', 'Konya', 17),
(119, 'stu2024118', 'stu2024118@school.edu', 'scrypt:32768:8:1$6gK5QWPxQhdSZmHt$053c31fb08e2ed484cfb83b2dfa9dec224de94de97e5783976624aac5906409e7a3195f6c03376740d50e7f0f765850586cd2d459af5d72993cfdfb0908b9ec5', 'Fred', 'Leach', 17),
(120, 'stu2024119', 'stu2024119@school.edu', 'scrypt:32768:8:1$4tNJLnFmNXwIg2nW$f6a9f21b66b208567486e1254fa24ffbf90e561c2e71306502bf04625443cec82850653fbff70264de98338e17534cdf2168e45ece3fb03c3172b89187d6cbe3', 'Cole', 'Morgan', 17),
(121, 'stu2024120', 'stu2024120@school.edu', 'scrypt:32768:8:1$DUrHhqv3RyFXZfR3$5ef906672591cef492bf8bc626f4fca60454b2f09922ca28dfebcd03f38c1501ac87a60f90cabef33929140e0bb12479dbae11bdb8ee3c18f51d739af5fd644a', 'Keeler', 'North', 17),
(122, 'stu2024121', 'stu2024121@school.edu', 'scrypt:32768:8:1$AP6FUKnGci5cqjBA$4eaeb667baedcb343b7f20d507b8c0c9e7c2f8f5ddd774e4bce51c0911f5ca59518746fe3849371ebc55aa92c4fe322d833185a84e8249c68aca7befd3e5b92c', 'Jason', 'Routzon', 17),
(123, 'stu2024122', 'stu2024122@school.edu', 'scrypt:32768:8:1$zwF3yV8yFc8bnF1V$54a88aca12c86fc668fb501fa894e6159ad3032fa2075e60e7f1ffb5a579d9964349aceea567d9b907077836d2a6af1468c2993ac3937ff4f11c44eab68b7fac', 'Jim', 'Shimer', 17),
(124, 'stu2024123', 'stu2024123@school.edu', 'scrypt:32768:8:1$Es57Kt4o334HmQ5O$ff2eeb98d186431ede7bbc2f66c75a808546a2b636f23354a79a9b27bf7ea65d7384bb94fb67ca8da703ad7be2cf6efa07d15a5b967c91d737ca9f2db6f335dc', 'Kevin', 'Tinter', 17),
(125, 'stu2024124', 'stu2024124@school.edu', 'scrypt:32768:8:1$qFLL2avRkmq4ZqV3$3f900506d0e6fc8d425f7dbb26f93577d7b52a090ba7e4ba2e18830f28519a0a57be4f9e4944bfc6878bf1061b6bbe84e1efff68955fa2a899629821b1e40cd8', 'Daniel', 'Tousley', 17),
(126, 'stu2024125', 'stu2024125@school.edu', 'scrypt:32768:8:1$olYEn0NxlYa0HKl9$d11538acb67037d35a1b6aa057635411badc96aef154203f329f4ebaa35c99b03d5ca1558ffdcf73eaab56271137f8869692e1a7514cb8ee9a5ff9b72e55b280', 'Paul', 'Tousley', 17),
(127, 'stu2024126', 'stu2024126@school.edu', 'scrypt:32768:8:1$FqB70U3ECtGGm6WI$cd1daa0bf843aadad0582c8f5beaf1403f0de0288b0b23f60c88aaf05d8f0cd433ee868a208f64978f581c51d3b1ce7853269624e71b905771548203f033470d', 'Adam', 'Whitney', 17),
(128, 'stu2024127', 'stu2024127@school.edu', 'scrypt:32768:8:1$L6Pl8hap9QObYy9P$84d7de141b6027c1898df569febb0b749694c2852d9e66849996873a79b1895cf72fa559729b746ab2df2d2546557df2157d34992ed0598f500e91c9ece3abb7', 'Seth', 'Whitney', 17),
(129, 'stu2024128', 'stu2024128@school.edu', 'scrypt:32768:8:1$dRzlJVlajmdrNC2H$9f04c1ff34875756c9ef94da398cd1f96cf57ec8e26a8f993e3164d516c832c26e7818fc523cb2a767db7e4a0e168eac4d7eb7f7167c9bd9cd550843cdbff340', 'Wesley', 'Loudermilk', 17),
(130, 'stu2024129', 'stu2024129@school.edu', 'scrypt:32768:8:1$PZZlOTVSoEhCQOO0$55a8964fc7a7fcc33d2ba01e34646fa8423c86d6dff34ef06bdeed783245e33d32d45f17cc7ec1b461627d518a41e4a986c67b9c72d1647f801bcc583afe28dd', 'Wesley', 'Ziegler', 17),
(131, 'stu2024130', 'stu2024130@school.edu', 'scrypt:32768:8:1$51WZsPUIsYY5rfgd$a49f7e7971f1ab4cb229cbe4cc6bfc113f09e2caae50dab9452318edab68205f6ed583581026f885a98dd3439a2a26f2f62b3901c1f9b014cee4f3f5457c0ce9', 'Charles', 'Ziegler', 17),
(132, 'stu2024131', 'stu2024131@school.edu', 'scrypt:32768:8:1$CrrdwWJMXuikl4S7$e3d89098ebcbd666a2191815eb147d06d7583c5ff4117e9dd83e1883ea179903bf97fbaf520d20107520e7b13178b28655d571138acb60231b27805cafb25dfc', 'David', 'Mullins', 17),
(133, 'stu2024132', 'stu2024132@school.edu', 'scrypt:32768:8:1$2b8avfrmGbayGLsM$c3ae06debaf5d7ad00b8c99aa4391e25f09bc05e20e918b4df738ef21d5cdfd9d298ceb6532040106271f961f44fe14ddd62059b44419fe1bfac719725edbebf', 'Scott', 'Severence', 17),
(134, 'stu2024133', 'stu2024133@school.edu', 'scrypt:32768:8:1$Vm9oi2rUv2W9BiGX$839de175356f180730dae87c8b3963fc42d13b7dd5568fd089611f511b50ba24fac03343d33fbc1ff90f93be3f65ec64d8d29529864ca20869c08f363a8690e9', 'Jason', 'Stephens', 17),
(135, 'stu2024134', 'stu2024134@school.edu', 'scrypt:32768:8:1$I4j4qzBPEJBxAZGx$780df21eb72b7f0c45d14cff0997e3a02733b9a752f40c37cfd34e729ca2666b2068fefc9222dedfb579fd55fcf0504c9d347e8b9ed6b0b7601935c3df14cb07', 'Brad', 'Seivers', 17),
(136, 'stu2024135', 'stu2024135@school.edu', 'scrypt:32768:8:1$Yo0dT98lTsT9xeQe$206208765784987b932986a8fbec42d994b83180db128da430645328073ef426ea851aa43fed2bcf175d67c33780a4c3e4ae55f360f2bde913aa2108e144cab8', 'Zach', 'Oswold', 17),
(137, 'stu2024136', 'stu2024136@school.edu', 'scrypt:32768:8:1$vh6rJ0ZrH9CzzVaP$a4926e57ab1d0f3cfd53bde48e5731a97c4103e0a32c2e6180b099e79a451395ba241b32431fdd7959a2d166ce2de329866286ace3730184b03426d50e359eae', 'Wes', 'Boggs', 17),
(138, 'stu2024137', 'stu2024137@school.edu', 'scrypt:32768:8:1$0bgE6fjDfygD66ok$f5efef5d9dc9f23f39fd89a4ff01750de76a4e054edd3238afd6e6598386e58c70e3df8824cc3bd0609f4cea80dc72486c1233f20aaaf611f4f27d950a30e16d', 'Matthew', 'Strang', 17),
(139, 'stu2024138', 'stu2024138@school.edu', 'scrypt:32768:8:1$4xsNBGOkNxjaEvnn$21047858613b5470e28c3bf2e7e1af6e24bbaf63d203f5030069b6abb965c256ea3387b7ac7dd51e6dd2aafeab8028833ebb7f98a873361f480c700064de12eb', 'David', 'Meisner', 17),
(140, 'stu2024139', 'stu2024139@school.edu', 'scrypt:32768:8:1$YEB9IEZQrgeSOeJ6$51f227cfa903fa6bc04561d439ebbce65f8fccd64f0c6ca30a071b9dadf63ec1d3dcf42870e483cf03d88754fdf058444bd92ffc7534936738dd49cd91783da4', 'Wyatt', 'Henderson', 17),
(141, 'stu2024140', 'stu2024140@school.edu', 'scrypt:32768:8:1$LOH3pkhZmUJiqfwr$6f1bde21de97e9c1f26b834442ecb68a0171d5b5b8f2039b7c0ca48eb414b7d0053c430c4a672031d0c8cdfe60e32cbe4d5309378fa92360662598f1ff0ccff6', 'Adam', 'Wonus', 17),
(142, 'stu2024141', 'stu2024141@school.edu', 'scrypt:32768:8:1$oBkOaP1q7XZYdIAo$a473bdda1e3aa9eefd6874a392449f6e2a1b3a95c290131a1328fb4efcb4cbf40db5e3375586a8f0b26955904981c6abf7c99bc0e2dc4f441f4aeb0c13189f36', 'Matthew', 'McCleese', 17),
(143, 'stu2024142', 'stu2024142@school.edu', 'scrypt:32768:8:1$arYTPDr9WoEwguot$b9d6ee82868e9b8745bf498c2a6052234472a97790da5b0eeead510481e4e456c002c3bfdcdd51dc2fcac1d03170581606d1ac3f384d6d1dcdec1123a57faf78', 'Cameron', 'Vogle', 17),
(144, 'stu2024143', 'stu2024143@school.edu', 'scrypt:32768:8:1$gruY5sHkWYei4PDi$97fb773d6c53176e19029b055b5d38634a99db95659db842008629d1323a00c2a8b91755307f7aaaabd81af6d995848eadc1fb620f4b869c6c76eced67eb66e4', 'Bodie', 'Hillwig', 17),
(145, 'stu2024144', 'stu2024144@school.edu', 'scrypt:32768:8:1$Jg0RW9Epw5pVJxi8$56f4a8c49bb2fadad98c79ab7c9d8954e930c3cd305def863f891d2b8dff43c17f4afd3c7c39fa9d96cabfff5833a14c21cbf524e2f9bb6c5b40ed68d6139afa', 'Kevin', 'Pesheck', 17),
(146, 'stu2024145', 'stu2024145@school.edu', 'scrypt:32768:8:1$zKOPvtVvIabPcZ2j$c7bf41258f034a9da59cf7749f20ed2ac62b76db9f55ad20811711c595d15829814c4e458ab2e96b5b2ec1030d2863d154761df23591c22f19ce938402f47004', 'Ian', 'Pesheck', 17),
(147, 'stu2024146', 'stu2024146@school.edu', 'scrypt:32768:8:1$PDgnl50NSYDW8UgE$1de16531311887c2069f9e8a220f8038709a028e07fc5af90a1bf809775b7b832ea20a81545e715833313660a0b8ba64d2759aeac15f7cc1a1d11d85ee72860d', 'Christian', 'Pesheck', 17),
(148, 'stu2024147', 'stu2024147@school.edu', 'scrypt:32768:8:1$Tx1EUGLPsm5C6nIn$8ca8d629774adba98f2bc27ccdd3c7828eb1bf4f699812653128c13cdce050b21293506e6b1e12b86489dc286013ae1bbaffc91c7a9b0fddf0ac62e4af213915', 'Andy', 'Zywick', 17),
(149, 'stu2024148', 'stu2024148@school.edu', 'scrypt:32768:8:1$NsrSMFZkmKw50Fgl$f963279fd4628eca7fb72fae67938f2912741b82359e1f13f9fb442a59f0fed016efb8551b3b2b64a8ea0d45b89a79ff96c0a1c69d2d6be3e809f7798e931cf9', 'John', 'Zywick', 17),
(150, 'stu2024149', 'stu2024149@school.edu', 'scrypt:32768:8:1$NoXghDKVkU7Hykpd$2b3a1da3bc9e24705b93a229b3f0ef2b16df22555bdffb5658ca096aede46d73333b52e7790989fde06b187526bb7656ab89d8d6ff31965d2df525f67fc5973f', 'David', 'Brown', 17),
(151, 'stu2024150', 'stu2024150@school.edu', 'scrypt:32768:8:1$zrkRO3XxhYGOctZD$ceee2ee97ecf93dfa2b800c417a06ea835fb0f7d497e868f466b6b99758d018701460759946c6543a4d94b1dd9be02f468ac1620305a5255c8f692e16b1d7be3', 'Andrew', 'Stefan', 17),
(152, 'stu2024151', 'stu2024151@school.edu', 'scrypt:32768:8:1$pj28TlPfjGsXQ1OD$1ad6322a6ddd7c30bab4e3992adc6100e649d303e557c60f3f7f07fd8f9ae4273f0facad4ad84511e2bed7d3417d1787389b4e2c846fe2c133597853b3401a6d', 'Matthew', 'Stefan', 17),
(153, 'stu2024152', 'stu2024152@school.edu', 'scrypt:32768:8:1$FQTS9ZLTecUCaf8D$08f09eddcee6b0404238b49f7ad4a67bc60680bba767d3f6c5ab9279cfcb3943a40da2293f43ffeed68fa165a4672b883c39b76d914c572c4b515472404ecc42', 'Christopher', 'Brown', 17),
(154, 'stu2024153', 'stu2024153@school.edu', 'scrypt:32768:8:1$LHxFIwO9lJ2ExBrN$22800176db8132988a6dbb9aeb325c0c973d2f2abe6fd299accb72ffbe4bcf4078ed2f49467502f91d285593096acf0a8514183973d9eb552ef264dd605c2555', 'Ben', 'Olsen', 17),
(155, 'stu2024154', 'stu2024154@school.edu', 'scrypt:32768:8:1$folybhriFyBUiAQD$939ca68b0d5dea6692af84f560dfc9dde50ed46841cc71477a34f123dd5e9cdf9c7809e5b55766dc1ded9ac3f8d6199953aef2e521e39dbe2688b11ac6dfb381', 'Bryce', 'Sedio', 17),
(156, 'stu2024155', 'stu2024155@school.edu', 'scrypt:32768:8:1$AjhivYyddhj8j3Lw$8aea56e5c067628bf2f8fdc659bc8d5a2a80cf9f8c4bc7994420695a74246a52c33c6128f95624e6df82f908438960bd36182c0cdcc520e3a069b3770f508ae0', 'Jared', 'Wills', 17),
(157, 'stu2024156', 'stu2024156@school.edu', 'scrypt:32768:8:1$ZCM9LGPfLaiY2uuD$5e325aece10e21dec9b160ee76c774d71cc70c36e100827c721e476d4d7676f4f9464c1becdd51aea432ef08ea5fdb254c2013782fc9971de2b807d6c3c11c88', 'Nick', 'WIlls', 17),
(158, 'stu2024157', 'stu2024157@school.edu', 'scrypt:32768:8:1$g0pjM1k0CPmdDnWj$95ff7c5a8c105d7cc6a6785a081acb3100396ab7f448ba7fdd397128d7e50b1c5cffc1dcbfda86fddc69104c09b4db6f5252722b1fa14200888ce7e2007bb64c', 'Casey', 'O\'Brian', 17),
(159, 'stu2024158', 'stu2024158@school.edu', 'scrypt:32768:8:1$TneuxVHzBzuP7czB$b7bdb76003db770c1082662b22a98145ef7040ede07bb5e0a7a20a168685e73a1b21823e419c1d5b95e228ca8d0779136f8a699e2a0b2f7a890e442cdaa9ee93', 'Shawn', 'O\'Brian', 17),
(160, 'stu2024159', 'stu2024159@school.edu', 'scrypt:32768:8:1$hXjDRkniJNKl78Tj$bdd7bd240cc9700ac63fa79bd0dda681f29768bfb11b8eb40033a631326f9351783c39db19dc4c6b47a11c3ab9bc296e0e9d955214d80d6b6fc529847e2bacc1', 'Jason', 'Linden', 17),
(161, 'stu2024160', 'stu2024160@school.edu', 'scrypt:32768:8:1$OFW25cvxkFWQt9Z1$f24972bf678b6eb83b4b5af46403047758e79a2500633229f3c958b19d253ab74fe85edf6337540cc7942d31f40658a2cf2a59ce4c224fdf0aaee1d14a88951f', 'Perry', 'Cohen', 17),
(162, 'stu2024161', 'stu2024161@school.edu', 'scrypt:32768:8:1$nC09WYAV95AKZ1vs$d394bd2864c75b1324438596ab8ee9b666e8eccf5b34a172e4959b4a422363122c503db0323af91f9307ed85ff2febfca09993551ebf71c660c18907b90af04b', 'Austin', 'Stephanos', 17),
(163, 'stu2024162', 'stu2024162@school.edu', 'scrypt:32768:8:1$z9EfkNsFTnQZ8hKc$56e02c6d584f2ed1132068ae604cb95e3101f334835a786598a2b235a972d588a7b0f00c6ea8dc2ce96fdc8543238cf2360d16281c5333aef96d3a4555b09440', 'Steven', 'Roque', 17),
(164, 'stu2024163', 'stu2024163@school.edu', 'scrypt:32768:8:1$cRKNavcz9VRVUeez$5fd7d6e37e63e6e0e3742aa3208cb7b022ee4d33ba464d34916d6356b79d77e99fe553c3f9f307d2c4c7ade1a8844a07aaaa857104527f27ac83737d08e10513', 'Nathan', 'Roque', 17),
(165, 'stu2024164', 'stu2024164@school.edu', 'scrypt:32768:8:1$q7tCrYxEGEI9ongO$06a6e1a1b823e9cdb41f2951dfdc4b9d02606db8d862c1167d959a5c3253b809d2e32b1213901611ab5acb4c0e31196322b628df7254acfaa6ffeaa160f39c67', 'Geoffry', 'Martel', 17),
(166, 'stu2024165', 'stu2024165@school.edu', 'scrypt:32768:8:1$in1AJBwdc4zUtHzA$ff6b605c096de21cedee73c341c9a1823c71c99c91b7526c7e3ea512f7071bd2e3c640ab2a8277997f94e2948beac0fb6a615478a30b401a97ab4b34948e1457', 'Gregory', 'Martel', 17),
(167, 'stu2024166', 'stu2024166@school.edu', 'scrypt:32768:8:1$yymSWOFGcVlePd8T$4f54709e4a1d4570d8acb9fd4b8764d5b119e664a836440df1aba66653cb2357ef2810f14055fb93ac0c0561175ef194b3e90790dd267e4f13204457c4df1263', 'Grant', 'Martel', 17),
(168, 'stu2024167', 'stu2024167@school.edu', 'scrypt:32768:8:1$uYmfUBhMZ7YRJbP0$5fe0dfd7cbdf7d48c273be3a278c2557beba278a92790eabd65ae7b268bf21bdf8944fbf1bec8bf920dda20379f74f7e7c92c4612a13ff977b955c3312e47f52', 'Eric', 'Clinton', 17),
(169, 'stu2024168', 'stu2024168@school.edu', 'scrypt:32768:8:1$smkdBgfOEui4nEtl$38a2616ebdd5fa664ca0a5c06e6d95eec850ade14b720cb9ac8ab93f4e6d7ffaeb8a82d353b383eb59053a63f125bd70f37ecb272edeb032bdc25ab506fc70eb', 'J\'mark', 'Boliver', 17),
(170, 'stu2024169', 'stu2024169@school.edu', 'scrypt:32768:8:1$uyZrNOQvsHo9CO58$1f90f083fa7936f0692e54edd9820d19ce22b3883fdd4943b4fb752e26ed110dc441e3edf526488a6e341fa86aa3a9354e490659c1412c992455735c04aa646c', 'J\'Herne', 'Boliver', 17),
(171, 'stu2024170', 'stu2024170@school.edu', 'scrypt:32768:8:1$2PVn0QhHRnkJTlQs$82a1330ca781c6bba9c05b8937238d714d22a3a5cd9656c09e591e0ce0f815f1023e12177fee41259b3c6220335525868b416295019bc21b709554b3f63b6faf', 'Mark', 'Zurowski', 17),
(172, 'stu2024171', 'stu2024171@school.edu', 'scrypt:32768:8:1$YOHYPEWqleZ51W7J$96cccb46d0e0f7b34708126642b23af7976bc8ba94a230dbd78f800d197267707a8dc60c61396acf4c8d6144827f0f3d5bad3b19a95676ece02fe6ca2d49776d', 'Matthew', 'Zurowski', 17),
(173, 'stu2024172', 'stu2024172@school.edu', 'scrypt:32768:8:1$FL2GrBnURSJc35iP$08ff3c80563878b60917c1a2a355511f46c5fbbfeb38d6afbab7111207c5151126b5fcd4056e2d62d1ff6e897583f41decbd9648360095b0c2ba977025260048', 'Michael', 'Zurowski', 17),
(174, 'stu2024173', 'stu2024173@school.edu', 'scrypt:32768:8:1$zjfhmQSs1ANo0pCb$6e72d369091bc2d12f221b969b7be2df90ace7e43f779f61391c23c6f07ff5ad856e5a6027856910f0c39c5cde0c6c9016408ee54786c148c1b2d5862d424b08', 'Duncan', 'McCord', 17),
(175, 'stu2024174', 'stu2024174@school.edu', 'scrypt:32768:8:1$RcF0fFL5JEYhunix$31f63a0b0e8831e8dd358325b06da5f79eeed1579f45318f6dcaa3a2d234539eca28d941777c4452c430a1c44059bc12f3af9a000becdf68dca7b5a287b327c0', 'Malcom', 'McCord', 17),
(176, 'stu2024175', 'stu2024175@school.edu', 'scrypt:32768:8:1$nI0iW1rEShPwIU9a$74d7b9ac2b5d877e429e5bd9d11e91baa3f5aabc7de43f0bc9290a207432bc6904c93b0779c019af688241c4ce71fd9c9ff8edaf05be61825b15785a1130828b', 'Angus', 'McCord', 17),
(177, 'stu2024176', 'stu2024176@school.edu', 'scrypt:32768:8:1$4ODVeuGRDtPEbVDQ$2d03fccc4ede4d7c24f29fa75c1fd31cfe43cb73493eb41811558f5739c4c2d19061121289ef39771e79cd7021ce81642242f9900b5a0eebcbb09648b2e0790a', 'Clay', 'Parris', 17),
(178, 'stu2024177', 'stu2024177@school.edu', 'scrypt:32768:8:1$OI0VDup3hBJbZ4mO$e143a58805c348bcd4c1384e08124b23e70756deb6499403d21e37c443c00d5a492b81b4a5be9bc1c2ec3db1840d2a203cfa96d4eece09f5d34ad36dc7885848', 'Kendall', 'Virginia', 17),
(179, 'stu2024178', 'stu2024178@school.edu', 'scrypt:32768:8:1$Ac81mBF7CxgX2mZ6$dbf4ae57cf0b149aa410efc17280b489ce90a4df21a3cf4310e954b82f7ade2f85e53327cf43d4f642b6ef806aea1c3fa491f721c2d5a37bddd7314fdac160a4', 'Mathias', 'Uribe', 17),
(180, 'stu2024179', 'stu2024179@school.edu', 'scrypt:32768:8:1$Ioza6GyTSfAZh5kY$dc2fed23d6f4c471910d3695cd68647783ad675917fe6cfae65446b52a20de5e760730985efc43d52ac65d7eee9ef6cf961da097d8bd24aa53f051a012803c0b', 'Nicholas', 'Uribe', 17),
(181, 'stu2024180', 'stu2024180@school.edu', 'scrypt:32768:8:1$WP1f9R9jlEAb3o1j$5219232f6b7c5976d20d1763274dc22d9b35bca2f94cfe5cfd5163758b4a5d7bed626bf3a4e3a51a25c2773949100cf50ba6bab35165d9fdac132ff5d38f9928', 'Michael', 'Stolzenberg', 17),
(182, 'stu2024181', 'stu2024181@school.edu', 'scrypt:32768:8:1$Lyb9EfNfaZt7r6kY$33f04b17d72cb9809df56d8f94e9d504fdddc26e7d8001f154683925ac3d2e24001295ba61d15a9c8c8f9e3b401f520204fc1240f4aee61afbba5df79855195f', 'Harris', 'Stolzenberg', 17),
(183, 'stu2024182', 'stu2024182@school.edu', 'scrypt:32768:8:1$2Ieu6ne6ib4dAptZ$41aa22045ed75f5e9cca574c26a0742dd23a6ef4e39333122b6102e736d2c3241e9a9b89a3c54549d3b849ea65128f80b0cefaad88de26ff17ec42ff29bbe2aa', 'Philip', 'Mashki', 17),
(184, 'stu2024183', 'stu2024183@school.edu', 'scrypt:32768:8:1$MExJ3jvWtk5RazKv$96dfa2ca0f5a1f406c2382f9f6004b926f0be947a01b314ded3502e80f6742af21db60640e0edcedbd697f392fa07dd0e0a738ad65087c44b5c80cd174fec9ce', 'Philip', 'Mahi', 17),
(185, 'stu2024184', 'stu2024184@school.edu', 'scrypt:32768:8:1$lotPAdIisXkCZ9PX$e7660b0e3b5910bf2f2ea07bfff5cb05b2aa32da576ee52d5fb631becbd6e12ca5ee6ec0debf260a8e43bc24c6deaa5d5bc8afc644fe23cc97e897f0be832e99', 'Florian', 'France', 17),
(186, 'stu2024185', 'stu2024185@school.edu', 'scrypt:32768:8:1$mXnU1NB4xBhX7G2O$1cb378b4f3db292078f0caec44e957547416ae7fd9ffee23582b9817074e66e612891c5d559c1cc2ad6bfe51199f5da113525e79215d3056c5a3d0a5570db486', 'Julian', 'France', 17),
(187, 'stu2024186', 'stu2024186@school.edu', 'scrypt:32768:8:1$pK42KT3WAgvjNexN$e5b9195c2164af3ec3d688fa4b24eeee2833d53eb4d5dea18f8506af7a8ca82880e99acaa2aace3f4d4266508af28859ee2c2bbaa57924102c0b73868857135d', 'Donny', 'harmison', 17),
(188, 'stu2024187', 'stu2024187@school.edu', 'scrypt:32768:8:1$DuhXXELyPDQ50x8c$a402ec966091651ed1ad6b90e3c93f00d8860f6ad9e2ec79ce42da41eeebaaccd82e8505aa8039b6c33ab3617a3ae4d7ae1426d5977acde7e9926e083f2df3a7', 'Donny', 'MPMS', 17),
(189, 'stu2024188', 'stu2024188@school.edu', 'scrypt:32768:8:1$wb9R1K4nlihEB4Pn$27139d106c693453a62f5f5e87fd83e2531485d646fb77025ae91de7fce24f01a35a7e27c8093cbc5388c8a584cb60018ee86359a071198afb8c28d3b1b42bf5', 'Chris', 'Keope', 17),
(190, 'stu2024189', 'stu2024189@school.edu', 'scrypt:32768:8:1$E6j8l8ETr0VQJ9ah$bc16045d912fc1e9a330fe7dfa38255ee688f6c0a5cfeef258fbfda0d6ccb8bc48d1b8539637a7bd698fc1b08e5e4693c951ba96d313ced8dc9d8aa8511892c3', 'Jake', 'Carner', 17),
(191, 'stu2024190', 'stu2024190@school.edu', 'scrypt:32768:8:1$XIZWxYi6pkfwbmCs$cb888789ff69b3885ec6cf9c374d0b34d833753d32e279467967e0574f84e678236e6363cf3f7873c3921d7282d4c491702d2c5396d153aebb73f44061a2bdad', 'Jake', 'Jurowski', 17),
(192, 'stu2024191', 'stu2024191@school.edu', 'scrypt:32768:8:1$gnmeUj8EpwvnKvaV$a43b235f6ae007dc2d3dd192a4806e6d14aaef9e52fc31586a695cad3c21fa5ea4437e0dbf826ac25e4243889cdcf39fcf2d51506aca8172c6fd44bfd4a83ee9', 'Robbie', 'MPMS', 17),
(193, 'stu2024192', 'stu2024192@school.edu', 'scrypt:32768:8:1$QBbY3gKN6RGX5A9f$41743309d8ced07146296fdd6e5be43d0a5c214e32c32c187847fea63fc136e6221a9597811b547b0d09e5b0d02db44e9203639be2ba0068c94c2a09f2ea81aa', 'Phillip', 'Green', 17),
(194, 'stu2024193', 'stu2024193@school.edu', 'scrypt:32768:8:1$Nb6s6yLfAoKN2cnE$8fd3edf1bf05800cd8972fc2129435d85989c5039320c7327e486e9a341dabb0728508d4d56f34e8062593c91c0fd6953e65b4f5d8f1d187842f644878e1c08e', 'Shawn', 'Green', 17),
(195, 'stu2024194', 'stu2024194@school.edu', 'scrypt:32768:8:1$WQF91V8odrVdulwJ$8c82ab57d5ac3f7d706312a34a24673d97697d13da51b0d0487e22010995f3a044c4d62e11b667a0a323224b48ca52f59136d19242f20bd4cec571f4495fe328', 'shawn', 'gray', 17),
(196, 'stu2024195', 'stu2024195@school.edu', 'scrypt:32768:8:1$AbYk75LwvECH4KwX$232d342d3e0235f03f17ed4dfffe36ac52b8f63917c73005a5171c464ea8b1dcde313fd8c334be38e03c76ec7a381c6bdfe5280cc7a68dcb62f1a06d982e04f5', 'Brandon', 'Knight', 17),
(197, 'stu2024196', 'stu2024196@school.edu', 'scrypt:32768:8:1$ZwH4IYTRT5LKLm8L$79c6d4bb28cb85851fd05f81447fd14844ca699ab007407ade71f9f005b67e0c2d2a28dec056a4deaebcf866c5900800ade7b11ffb12fb3f6f5c7a78a261f0e9', 'Phillip', 'Wilsie', 17),
(198, 'stu2024197', 'stu2024197@school.edu', 'scrypt:32768:8:1$fkvHggaZwxYrG21g$d83e58c173037657bbdfecd9b1f2bd0c5af4df05c237feb88b5afbb0cf2fe312b9778998966768bf6f934e38e267aae49f3eef936d1fc77c6283dfe4ecd18935', 'Caleb', 'Hollo', 17),
(199, 'stu2024198', 'stu2024198@school.edu', 'scrypt:32768:8:1$T36SrSIL1IebTxHq$57f3cb2c85e008c02bbcca5066eb36a89e91941026c6b539e6e9c85bd7e2345dab3d580a5188d1fac2be88c754f75ae99bd532a68409af7883bf152ec478c872', 'Jared', 'Grey', 17),
(200, 'stu2024199', 'stu2024199@school.edu', 'scrypt:32768:8:1$ckZtkdVkoOlAL7fS$daa86914da1e705dc5056321a1b30ff37b1330b2b1b31c4fdd1e231402428b560b3f44e6d51246516151c6bbb43e781d1442433c208c3ca565ccddfe7b19a894', 'Redmond', 'Gerard', 17),
(201, 'stu2024200', 'stu2024200@school.edu', 'scrypt:32768:8:1$1FUYiWugsGyi5ZCU$2ea502aa8c0b1c4ddfae3cfca528f7a8ad42e85a49d79d0c7f462a92043c5d2ef11447941a89e12220e68fa1ada958af0bbddd3ed6c81fb2d16f0ffeccc0c1ad', 'Tom', 'Holland', 17),
(202, 'stu2024201', 'stu2024201@school.edu', 'scrypt:32768:8:1$bHk4kGORMSxgPKwl$9415c549dd925f257f563c8d17603dd275f2ac5eb5fa20b23b88123b73700a99306b517f90fabc337184079c7a56fa4041b1d574d9e40785f27bf15a342fa9f5', 'Lucas', 'Judy', 17),
(203, 'stu2024202', 'stu2024202@school.edu', 'scrypt:32768:8:1$jLkWao4qnK5egkbc$e4f18b449230ae55bccd574db67629cc7c4b9454c7ef457cad40fdb0147b2c7d0d12cf892e30be7652885dc40ab186e2e9a32bb6c0af5e03fa422d20f9b53ae9', 'Lucas', 'Benentt', 17),
(204, 'stu2024203', 'stu2024203@school.edu', 'scrypt:32768:8:1$3Zzr7XTLDzYI3VaJ$3524284ab9242e6b9f4bfea92730e2b95572358cc84430fc374ca4d4f89b46a71b6896f505dba3fc0af5987dbf99d319c0a58d343ab43906f66636f9bf80e373', 'Jared', 'Enting', 17),
(205, 'stu2024204', 'stu2024204@school.edu', 'scrypt:32768:8:1$sP1p8UVDukrQMmLh$6d68a82f277bf6c8f68db13082e58a64ce51580df47aa87c063f55a97421aad4e1455c9cdaa95a2e7c73cd6545ed942035f358ef420faf7279503f23569d2a74', 'Jared', 'MPMS', 17),
(206, 'stu2024205', 'stu2024205@school.edu', 'scrypt:32768:8:1$GfFn1l2DHV3APupf$5697f84c0b0e9e70bf23b88eab980ede664f0afccb79a359eb7a8555eeae2b89477d7dce30ef7a2a4da44ac4cb35171d576259bdff44b2f8b4439ebb1e244c47', 'Frank', 'Panstingal', 17),
(207, 'stu2024206', 'stu2024206@school.edu', 'scrypt:32768:8:1$WdFAXWfLj1ARaBiM$c0939648cd1be3195f005586572948df40d1b1db8606b75f5f76c92cef07559236976309ce0da26e12339d5a1fe7da9173787728384618bb4a218f44d6355573', 'Adrian', 'Wilson', 17),
(208, 'stu2024207', 'stu2024207@school.edu', 'scrypt:32768:8:1$5WlASBGNW5I2d732$3379eb19f724e8414e36b85fd50df739de2893e0b4f0bbf906f04d348c47e60877603813a29005b9e19674899726ab3e7c9e216dbfa645a566fcfcd523f1f536', 'Cory', 'Saddler', 17),
(209, 'stu2024208', 'stu2024208@school.edu', 'scrypt:32768:8:1$BMn0yJXwRd69UBxu$206cf47f6d06719ac99555840dc410fe0386cae23c6191377744a3dc0f7851f3a36293285b124be6315ce2e7c6b81216ee289082c24adcbe47d2d9360bed1a5e', 'Nick', 'Markley', 17),
(210, 'stu2024209', 'stu2024209@school.edu', 'scrypt:32768:8:1$J8V9KfXCIQiz0PL3$b9ffbdf63cd962eb97f3c65e3e55fa23c0781227a21160cfb2fe299cd8bef2d6b2e33213473f8e5582dc4da8bf8d14476614eb4b879bab8c84258738341a26cb', 'Telo ', 'Grove', 17),
(211, 'stu2024210', 'stu2024210@school.edu', 'scrypt:32768:8:1$3ewTlwJ4Hj5n6UFy$754c8f800786c89cbee4a8f9058ff9cd7ca7557df60e93c319a2654e6ae8e1834e56f773fc3ef8165bee4978e7b93c2e77865b73440ce5758bc0bb82e38a9e78', 'Danny', 'Bevan', 17),
(212, 'stu2024211', 'stu2024211@school.edu', 'scrypt:32768:8:1$NSspd74qbJqcekTB$871166685ab0a669105f9548e29f61054d19560f08e50b187db12d5d8f5609be59e203f8a83dfe9688e11971cafb7ba663426a8e00f0c88d6ca38cad0be70b6a', 'Josh', 'Green', 17),
(213, 'stu2024212', 'stu2024212@school.edu', 'scrypt:32768:8:1$C8voNtBDaV0e4YIL$32658521ebc67314617c560ee8a812809000574e1aaf521b3cec59dab7bde6b2d52a37fcbd8ded4d7599f02c12c5b678c8d8eb068d97fbfc4903e91a6f342bcd', 'Garett', 'Stewart', 17);
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `role_id`) VALUES
(214, 'stu2024213', 'stu2024213@school.edu', 'scrypt:32768:8:1$VVhV9MTFsHP1YXI9$608c26df7dc7c3bff703b775490b7bff721d2a80e1b459402aa85334533b17d865a74e9817ac3a47610fa8f51835f56483b781c1228cf861f0cd07464eebe3ff', 'Mark', 'Bazemore', 17),
(215, 'stu2024214', 'stu2024214@school.edu', 'scrypt:32768:8:1$SauxKEhqR6QDCkEs$4f021e8533ca4b621b5d0330d27e1e89c717a11e5e23d1d3c44745f0ff8f6e965cb2040e566913fc8450223eebc48a20f48c80a9c8dadd52e1f5ba2ca86ba2d3', 'John', 'McVicker', 17),
(216, 'stu2024215', 'stu2024215@school.edu', 'scrypt:32768:8:1$uFakyketVavTmokC$b3b02554feda01dcca7002eca69833f8de07c840dbf9541052a957c0091f5d65f53d30c0d2f872315f3561ef9a2df6bd297afbeed02d87bae9b5551ebef1eb9b', 'Frank', 'DeCapio', 17),
(217, 'stu2024216', 'stu2024216@school.edu', 'scrypt:32768:8:1$jBosPvpikYGT4A9q$e4a912cd9726b75e2103221d26f5a99e1707787a498d0b7bfcbff19a6d63e11e39ba143f19d152be6d670ca0307e59cedcfb7f6375c9cf40fc07d4d0cfbf5db8', 'Mark', 'Sunde', 17),
(218, 'stu2024217', 'stu2024217@school.edu', 'scrypt:32768:8:1$Drda7xUGT1q8x3g8$b44132e311562c5e950f08022df7a31152a9c4a301acad0aa3b509c499bf06a95020325577962b2534c0e1c7b213ddc9b46abaf11d10382177cdc4d2f33d854e', 'Jeremy', 'Morningstar', 17),
(219, 'stu2024218', 'stu2024218@school.edu', 'scrypt:32768:8:1$rItClDnuCQgzE1y5$696a83faf3123fa0fc59fd78a4dbada2b3af3f236dbd529d0df3dbc4949d43f5cf52f56e8c4bccf1919ee188db672c869b96857003cbe57fb0193d0ab053ff4a', 'Jordan', 'Zolman', 17),
(220, 'stu2024219', 'stu2024219@school.edu', 'scrypt:32768:8:1$9fTQeMJ0JCv3NCGJ$33027549a260cb90a9772e4abfbeadbd3c00631cd6bfcb828383632106311e3250175eb9b4bbf148a94566020aa4e0f30f2161f4c5f742551a1c2b29dd7039a8', 'Mason', 'Cooley', 17),
(221, 'stu2024220', 'stu2024220@school.edu', 'scrypt:32768:8:1$SFhvHESDAEtfNENc$1ea1c184ccbb20a6cd4fea4170607100f411380472fe6b12d76a5176b5f4ffe354004c491d37f79130975752ca6a55e14e7954a69107b72a79e1b9fde301b29b', 'Connor', 'masonfriend', 17),
(222, 'stu2024221', 'stu2024221@school.edu', 'scrypt:32768:8:1$9QCFd5Gssw0GJGNL$56c155f5f90c1893e3b1f354624223be80cdc8068091c937a60fed462807e84a96166e374e49fe0a60b9fa1e02d31a353f25d5014143ce09ccc508087086e23d', 'Greg', 'Kinitis', 17),
(223, 'stu2024222', 'stu2024222@school.edu', 'scrypt:32768:8:1$OjQTGMRQpYHChBd4$a7f4f57dd52e8dfed0a00ca3c8de514538c3d5856fabeb6c0f009a51923cf51d1f2006e98f2f8b33d1bd7d2c454f1265d5ead8bff528e3ebd3245df5ac18ed3d', 'Adam', 'Johnson', 17),
(224, 'stu2024223', 'stu2024223@school.edu', 'scrypt:32768:8:1$Lfsr6z89uaA4RNqs$70e71436abdd6cb5793cb31c5750c7e66a122a7c563198a27019d63c35a318e5c1296201a959e11c9974920b02661f13a40e2c14a38b6f118df0513452621a66', 'Justin', 'Bonheim', 17),
(225, 'stu2024224', 'stu2024224@school.edu', 'scrypt:32768:8:1$hhUQJel4qAUDJACw$c0755f4701e6b3181d8207cbe01a7eb680dc561c18e0049c714884f9344ca94f81e2f0c7633b84519a5aff60d0411b647a5fd8f3b9af944592012789faaee727', 'Blake', 'Bonheim', 17),
(226, 'stu2024225', 'stu2024225@school.edu', 'scrypt:32768:8:1$920GERqQETFT9T86$570cafab0be3b253243e44c3831a0d98ca45024542251b40787206a798daf1747ddbe914648926ccb4067f1d3960a2bc9181fae1287e06c4af1ebc918d3c50c8', 'Andrew', 'Sherer', 17),
(227, 'stu2024226', 'stu2024226@school.edu', 'scrypt:32768:8:1$i9bP057vGdyrJXDE$e8790c32b60adf6bc3f7da9d5ae51100fc3d3e2260a965e6aa1a90fd127e0d581dfd95d5b5df4d0505c889a4c033cd68cb6af0ec10910cb7bd9881da44d8bcdd', 'Mark', 'Zuiderveen', 17),
(228, 'stu2024227', 'stu2024227@school.edu', 'scrypt:32768:8:1$oXsW2Xi5HVQUIek6$c78c6f69d1d22a9b061592b8f3dc4b3fa3fa38252b26613aa5898ad0165a68504d8d8b6cf856825bd81ef7bb17213d77b18caf06b48f737613e1e8ce44f00fef', 'Jim', 'Ringer', 17),
(229, 'stu2024228', 'stu2024228@school.edu', 'scrypt:32768:8:1$DTP5kXPq2pb5T7y1$29fb22d81322d7f281351c367a3334dd1065177b992e407127173e2e4b08fee5176cc2f5526ace591f11cf7ae7b9425c85d0f72a0fb1510f4f9f932b933c7cf9', 'Jason', 'Mascari', 17),
(230, 'stu2024229', 'stu2024229@school.edu', 'scrypt:32768:8:1$TYSGyXUCnkeBVKDk$fc3bd2f7267b161496efd3f521e9eab32b0367f5cb632dd846c59589efdd0ad15322290cc3d53e4bba45a73d07bc955b45ab96ab4cebe1cf3f2d4ba958504eeb', 'brent', 'Davis', 17),
(231, 'stu2024230', 'stu2024230@school.edu', 'scrypt:32768:8:1$vId3b0WLT8CNlA11$2857fd23d3435f6cd20b7e06307a894d99590ef521f84d3585ffca1457809ef1c9bdf0a95a9a4f42da1ae119db9f2a01a775f34ccd6847b5aba893512664ddd7', 'Danny', 'Kyper', 17),
(232, 'stu2024231', 'stu2024231@school.edu', 'scrypt:32768:8:1$tC5thkiCoN6Ul1F2$26af1d5cf1a267b97de2d32fe972cb2c12004ebfffd69d4e17171a966a758fdb6211e6207ea686d67c57e561782810f8ddd40aaf288c0c152bcdb15e98491cff', 'Danny', 'Webster', 17),
(233, 'stu2024232', 'stu2024232@school.edu', 'scrypt:32768:8:1$I0WM4JrMKVpzMYKx$6cf512178ee4e6064206ccecb0d9d6e31aac3cb8cc02cf7ef11060c8ab7ab9e4eb47c13981b6c942506b1d803728889edd23923044ee5c19988d53e5fbd4bbcd', 'clay', 'Febus', 17),
(234, 'stu2024233', 'stu2024233@school.edu', 'scrypt:32768:8:1$rWMODtM2EZ0KbZu2$267628405a688a80bbd6242ac0f29d389a6a829ca96158023b5ebc256fb96a724e65f9d32657b200c1fad98cd5622693a921458d017ddbc9936082f2a56ab639', 'Brian', 'clayfriend', 17),
(235, 'stu2024234', 'stu2024234@school.edu', 'scrypt:32768:8:1$lCl7ZFIZwuvledWj$5f1073d6a2a13244430f17a2d6fea4c3c9f63a270a140ed2a8cc40557fd04d197d4643d69ebf481c42c950d8c6cf51bdfbf1a7355549afe9b5005b5190e27114', 'David', 'Farley', 17),
(236, 'stu2024235', 'stu2024235@school.edu', 'scrypt:32768:8:1$GJRHTAYc3P8BLs0H$abc2b909322333d9564b18c49fc1460977a9add8d88b1c1d70eb83057c01b702e5deb0f49fd11a36db7a2861ba20d091dfcd7bb48883235af2ae2f13b34f10d2', 'Tyler', 'Andrew', 17),
(237, 'stu2024236', 'stu2024236@school.edu', 'scrypt:32768:8:1$xSW2H1h6GUBeUtLG$7900483bce9328cf79967bfb04652e7cf83edd27daf5e2bd0728813132e18c7d9f0090af6ce759d666f13ec34083c37ae3fa5ec848a746206965cc72d303d24f', 'Brian', 'Vickers', 17),
(238, 'stu2024237', 'stu2024237@school.edu', 'scrypt:32768:8:1$iopBnxuMy79LAiH3$1abd6222318f53078a9e4abc38a84ad8e85bd778ff47cb20cd4b036fff4c821030aa5de67a2be44651206b662a1b7e7b8418ee1bcef6e09ce442f04f4320b1df', 'Anthony', 'PIasano', 17),
(239, 'stu2024238', 'stu2024238@school.edu', 'scrypt:32768:8:1$70dBH3pi8clxFTsQ$0f78c386eeb1a17e0a89b273b4f92806ace04c2d20f32e1a6b1c86482b9f92264526d1bc909d72bb0a3ce96639d27bab00853a48e776de3714017815af75145c', 'Zach', 'Arnold', 17),
(240, 'stu2024239', 'stu2024239@school.edu', 'scrypt:32768:8:1$LWQEKPTnhH5puHww$f21c200df43c9fcb02703ceb9516b457c36da6ad9a7e58ef0659d580be11ad3fa8bad898a03fd317e556943e1a00434b40ce3af5db1a96713379adc9fc517f2f', 'Brandon', 'Kaskey', 17),
(241, 'stu2024240', 'stu2024240@school.edu', 'scrypt:32768:8:1$t1WpNUnkNncx7JgG$7543971884302c1033e7d711b964ed21bd0cafbbb556fa255480bec0fd2361e49a88d2c7c20350432d875579301dc70c47445a24e9ab274f1f003dd8387b6362', 'Jimmy', 'Kaskey', 17),
(242, 'stu2024241', 'stu2024241@school.edu', 'scrypt:32768:8:1$WkAgAH3BE3Eawo98$c0471fa245ff0a04725f356603af12dfb3fee4c1e81e607306075b6b224bfdc29b7b01f940455386fc4a024375ff53d9163a9731577a3120d67414462e1e040b', 'Jimmy', 'Guess', 17),
(243, 'stu2024242', 'stu2024242@school.edu', 'scrypt:32768:8:1$3YXsotvbNyAJ6tPV$73ac9331fe2daa8d5f52911761f5ca9705394800960c1466c538c957f67dcbac2f206752402099b331e7fc085531346802c698df3c86307266609a99e9a318ab', 'Eric', 'Guillentine', 17),
(244, 'stu2024243', 'stu2024243@school.edu', 'scrypt:32768:8:1$I0QIHszaBSslx9iG$21d423c7c064d6cb1d78975be72a83fb0322e87cf458f8d852c8557042c1dc940f4680d0b6c03fbb6678d34326f56ae1dc0225e2e03286adf9d8940c3797ee92', 'Joshua', 'Mullins', 17),
(245, 'stu2024244', 'stu2024244@school.edu', 'scrypt:32768:8:1$UR60FVUdVKwO4DfH$e699578980be831c26fb1021a376b08b412341a5d0855a73eefe9b100c58c18208c9612d8e7d8e7ab69b5beb17f382ad210d01abe06c768aa7d561bf62f9c41f', 'Nathan', 'Cunningham', 17),
(246, 'stu2024245', 'stu2024245@school.edu', 'scrypt:32768:8:1$kEtUdr4R0SAtdtC2$c9fb69dd79232791922bb91c013cf55bffea3e009363f7fd998b74770d66e5762ab8e5422951c5e3f07c46183d59586ed66f0c2e78cb837a4942a46afa6fe663', 'Seth', 'Cunningham', 17),
(247, 'stu2024246', 'stu2024246@school.edu', 'scrypt:32768:8:1$gx1vUXYgIEUHafun$0e0fec80a1d87498488332d66ecc183b6a57f97dc6feb874803443f6028172c67243ec678ca9b92f6eb2f63c99331fe590f8a5ec9258ad9f4b6807d28423b511', 'Benny', 'Cunningham', 17),
(248, 'stu2024247', 'stu2024247@school.edu', 'scrypt:32768:8:1$zyBTFUKc84uxcUgc$f823670689e57af856b9487dff0d649e26ff619d61c1bc4fd95eb84af55173ead6489eaa1ebad7016e78bf34a5f8f70c5a933cfa2c951c9d4751a656645bf3bb', 'Alexi', 'Ivanovich', 17),
(249, 'stu2024248', 'stu2024248@school.edu', 'scrypt:32768:8:1$oVW4wTUUVDQ72BGs$e5e72bfe54471c9dcbee2c53c8903d567c29166aa01abf9063ac6ff7a12376d3c6de2fc2da3eecc57197ccf66019c3ea9a2993682d3a34be832e8a2561c39153', 'Ivan', 'Demitrovich', 17),
(250, 'stu2024249', 'stu2024249@school.edu', 'scrypt:32768:8:1$tFpOyRxS6tME94Kr$ec6a8b460318285aa1256e318d6376f47ac250408e705cb983576ae47cf7c23090492708c8519ab8c54a8dfcee89d7ef328ba549e702c19562a5267a4183ee9e', 'Dale', 'Berskin', 17),
(251, 'stu2024250', 'stu2024250@school.edu', 'scrypt:32768:8:1$CUhC2flewKAPJaLQ$47e1289e974d1b525c6cb849ca9008288bee8945f51918abc4c8c498fd4448da02dde837401e2aead2f08edf15af2fef4edaa2c435b83f656245e91023ff5e9e', 'Matt', 'Carper', 17),
(252, 'stu2024251', 'stu2024251@school.edu', 'scrypt:32768:8:1$W31k31Js2tSUprEY$7ba73fe1036fb88610405b09f16869322798712828a7774f4b29c9d7f8569fdacc101c706059c87b7ea3f2ca309c674509c37ae03e7c834d1fee792c2e750f14', 'Jack', 'Carper', 17),
(253, 'stu2024252', 'stu2024252@school.edu', 'scrypt:32768:8:1$w5fe4XCxKJjIzcjZ$509e825667b8c4227287f17539fa05c965141103fc82ed0c3901206e6ac72010b935b08530dde46ba75d2f1c0ea0cdb24d84446c4ddd1cab403cffb4748c508c', 'Austin', 'Oh', 17),
(254, 'stu2024253', 'stu2024253@school.edu', 'scrypt:32768:8:1$jBJkgBM5WAT07RGs$e0ce7d0b057e69140b834f8f9f449ce583488ca0b1eca3f1ce5c35dde14322b8412771fbfbfc688971864f79342d2c41d1731141315d8d68db9f282f0d79049e', 'Ryan', 'Hornack', 17),
(255, 'stu2024254', 'stu2024254@school.edu', 'scrypt:32768:8:1$v3V9BcBi5Eovybnx$6d98e2291b9d369fc763e41cab3ddeb689931424f7ee79e8d04af3d02302ba8dfcc10f8e5ff755ae9ef9c8a07a1e305357f8ac602a179be3cd5f74292479f6a9', 'Shawn', 'Baisden', 17),
(256, 'stu2024255', 'stu2024255@school.edu', 'scrypt:32768:8:1$RfNkKh4Q7HjSBdtv$fdbb04428c024b29700253f1bb00c0ae6d79bbe41d1144f11427227083dc726021dbd794dba2ed56d5e9e0bcf1a945cf4a09b6c1d8f14c5a516e039f2b39660f', 'Jimmy', 'Meyers', 17),
(257, 'stu2024256', 'stu2024256@school.edu', 'scrypt:32768:8:1$lscdhn5eBobSXimU$3e06336ef655862c00d7bf8816ebb5a4bfe1fc026c9711674b37878cf4bd35748d0f83bc57bc57f9c5eb52540ee40d7972c63e6576b0d33cc5c88cf7f26cf1d1', 'Jimmy', 'Murphy', 17),
(258, 'stu2024257', 'stu2024257@school.edu', 'scrypt:32768:8:1$3iikC55thDeUP87m$0a0be67c1cccaaa63b8d293592d935b9cc40dbf11fc216fa5d599ee85b8ab22784b34766fedb26358b4b814930df4e777aefd4fc05c477437900855e380dc4ee', 'Brad', 'Brock', 17),
(259, 'stu2024258', 'stu2024258@school.edu', 'scrypt:32768:8:1$q9SbDZhwRfCOA69J$bbad5b05346cc93aa49e695df9a9e4c13ebb07f2e511d6de51815f1459b3967c281ddf86a651d86b60a6d78a4aa60527f9144edc51e476e42773697b15627b49', 'Randy', 'Richner', 17),
(260, 'stu2024259', 'stu2024259@school.edu', 'scrypt:32768:8:1$d6EhTLMMAZPAVkib$e470a8c6a2c8577f61ff3258368d39f0cd15e47732e1dec999a4263d1aa5e97ba1e5c8f8646d6273a071d06692b2085870b055602f6c7b4a46b91ff73f599c82', 'Andrew', 'Witzak', 17),
(261, 'stu2024260', 'stu2024260@school.edu', 'scrypt:32768:8:1$dOESekXICKbaSght$d580e1b8274b54b206e74061eebe0eedac2b4e3e69e2c3abd5ed9abc0c6f0e82ece8c5eea4ede463e33aa82fde381b80f5c11a230965438c61e40ace06f256e4', 'Kyle', 'Bruffy', 17),
(262, 'stu2024261', 'stu2024261@school.edu', 'scrypt:32768:8:1$Xx6KoWJ5CkH6KsOU$3fd464ca7f9a3ee1b8e61055641dcab27a1f8e1a3b792f2c95857afce9f9e603ec9103ec3b99640aeed07f9c9d58d1e13cb9392005504a301ccf5fd5c9a3a9dd', 'Alex', 'dakota', 17),
(263, 'stu2024262', 'stu2024262@school.edu', 'scrypt:32768:8:1$DvZAFDxrSIb3yvl5$443fd69ce53424bb2b165b15138f53a9fe65f58e72081c339e228fc39ace853bc6b2a4ecec787674a565ab586cf7a1fb8b899c68858febf5b0a55a3e667fce6a', 'Danny', 'Dakota', 17),
(264, 'stu2024263', 'stu2024263@school.edu', 'scrypt:32768:8:1$gtvU7FpX0hdvAoJS$26c66635ecc6d3c6f4c78f11431cd69896bd4e5c3b4e9f2513b9a271744c0f23fb82ac6a19a78d9aa8ffc9a827d34a62e1a85717f3c670ace398872b6d5e5f9e', 'David', 'Calif', 17),
(265, 'stu2024264', 'stu2024264@school.edu', 'scrypt:32768:8:1$yfGrMv7XEG3YXnBA$9addd94268d311d0d870bd7ae940ab6a76554ba8de527b7882b8b97f9d7206b874c02685e66ed45ec34dc428ba53c7f7df9422fb2d63decc110350d88fbbd877', 'Jeremy', 'playfirstbase', 17),
(266, 'stu2024265', 'stu2024265@school.edu', 'scrypt:32768:8:1$ex1d9GO290MeKCxb$0c2abcfb3b0875689fcb03cfa96494d9247a2abe873d63b3d39266ce4cb463bce4859cf811c690e6ce5382730ea33e3e8b605845aedfba92925319b2e41aaa38', 'David', 'Jamison', 17),
(267, 'stu2024266', 'stu2024266@school.edu', 'scrypt:32768:8:1$zqPqjUhheTbaP6Pk$affa7e951d8244752505a842a9e039be3698aab46df8cc0d2598b26b97b0654717f11f7de7425b702398db4dd2b178bf1a8f4428705e2d233c0072806d8ae1fb', 'Barry', 'Horvath', 17),
(268, 'stu2024267', 'stu2024267@school.edu', 'scrypt:32768:8:1$8SK7QGay2N79IScR$fa8dde829610992958b7979fd4733a718b8023758071ac2eda7aed20bd2b9c9929334df3d9b33061ceee6db4aac01f7a72709536d240da1c66f95e39201805fd', 'Marc', 'Berry', 17),
(269, 'stu2024268', 'stu2024268@school.edu', 'scrypt:32768:8:1$t26rlmGWLxPS4PLg$586af4699daf77a7cb282f8f73a516afeab7069aae3574b38b14ca624487a3526df05dbe57a8999134bc790a2f3b80f70724ac78801cff1d84fd4926dfe483d0', 'Marc', 'Calif', 17),
(270, 'stu2024269', 'stu2024269@school.edu', 'scrypt:32768:8:1$2BAA0rqGt1JQxi5V$3506035d79042bfc3f9e9c7906de89a486c89325843fe4ffa6a5e27943a3bc749a0bfabfe1aefb20f81cc3e083027b56f13cab4cd410de9d52a5ff371290c389', 'Troy', 'Berry', 17),
(271, 'stu2024270', 'stu2024270@school.edu', 'scrypt:32768:8:1$DGukwACdq7KdkHd4$ab4547b07a049947017e9641c215b293f4eaaf3670fa1fe79a87db2f0e2315742576ec4ae0e83948be9bbccde5011ec9dc86778ff396decdc5a0abbe726792e6', 'Kyle', 'Chippewa', 17),
(272, 'stu2024271', 'stu2024271@school.edu', 'scrypt:32768:8:1$b40mWPMDQ57E2WRB$2e2d64e167f8e550e870b520ed212739ff97182951592166962c9378c7636e86691b94bbec479875fc79114a05f52a090b6145e34b2416e1dc9974ad4fea4850', 'Matthew', 'Lacrosse', 17),
(273, 'stu2024272', 'stu2024272@school.edu', 'scrypt:32768:8:1$JWzNEO5NqcRr5EnC$35cbb785406e0526e4f2b682c8ff5351ec4ac783a66c8901cfa8b7c2d19c4b4e4096b35d905f3185b0f37548cfba303566dc279e67a28096ee9a2659621c5981', 'Derwin', 'Loverink', 17),
(274, 'stu2024273', 'stu2024273@school.edu', 'scrypt:32768:8:1$5XQU3ixuhBGHVseL$0c73e26c2b01a903d60826738b7f4dd5b2ed051a93ee4b1342e9dabf82d2c2d8a5db065359e20f0f2ba8b6ece1dd00505279ca4682eec812d6e3caf04c76e4b8', 'Peter', 'Loverink', 17),
(275, 'stu2024274', 'stu2024274@school.edu', 'scrypt:32768:8:1$YSAAKnpnYgpJT6oO$3e10b02f956e2d69f1524b36382a363d81aa971be95f76754e2f65f8c944792c33c41e143dde624878094075119d78204a4159ecaa2a4803508014bc8a265f6a', 'Aiden', 'Loverink', 17),
(276, 'stu2024275', 'stu2024275@school.edu', 'scrypt:32768:8:1$15P1dx7YkjIzBtlg$cf5dd64399b96a94ef5c0a0e54eab7408c6d73f7436174e3291b95f6629edabd2029453715b3a068c0f7c90eedb3fd476dfdca74852bba913c3597fc05c6ce77', 'Gordy', 'Sanders', 17),
(277, 'stu2024276', 'stu2024276@school.edu', 'scrypt:32768:8:1$i2Ll3Ri6O4eIve6E$e9a9f35b5a71d069de0e74f091b6dfe77ff7bd3f3f373695671f2edcec4c901a6efb1503faf4a0cf3f32072ab73a2ef56ca4b71dd7f99351b652e86f5f7476c9', 'Nico', 'White', 17),
(278, 'stu2024277', 'stu2024277@school.edu', 'scrypt:32768:8:1$2jnIpLopAyBJWtJq$573c12862caea1cd3c32cadc24b4cece3b7274617ed31e982c7ec417fe1a7b0893160c199ab1569017b20810e48490912c428b1551bc632e133c9fbef1ee2ea4', 'Tommy', 'Brady', 17),
(279, 'stu2024278', 'stu2024278@school.edu', 'scrypt:32768:8:1$XEr7xu7iWiY5xiZO$29adab1ec408e9a8981ccc4ac1615ebbd541c00c1bf9e48df98758232157293a6b3812036bda8297f68e777928d2dba49a1efd3075204f9d09ed80905670b79f', 'Aaron', 'Green', 17),
(280, 'stu2024279', 'stu2024279@school.edu', 'scrypt:32768:8:1$msQ5ECOD2l28MG6d$135435063dd7a725e15d5b0c167ba5b161d2f69c0b49e6e43e3ea691e23e94275d9ead5b293aa5cfa803a7ce86cca139e01a2091cbce65f787e507960cb418b9', 'Mike', 'Long', 17),
(281, 'stu2024280', 'stu2024280@school.edu', 'scrypt:32768:8:1$I4VRabqZSA5YgQ9e$b038542933793c23de8248ed1a62680734097fb1be0c90ade00c022b2a30d0b5b06d453034cf4a86aed52e1421425c2f62c5a6abd89f2bc811e673eeb414c417', 'Mike', 'Cole', 17),
(282, 'stu2024281', 'stu2024281@school.edu', 'scrypt:32768:8:1$UBTQh0ce7bwRDcvC$15edab119e3ea7588b840aad6eff77fc7f68842e8c9784979d5d4fed3bb1d0661adb6fa9fae0aad6501134e89a28f0a0279ede57c48bfabb2d36de5f720e2579', 'Jordan', 'Grills', 17),
(283, 'stu2024282', 'stu2024282@school.edu', 'scrypt:32768:8:1$kMikzrjwNvvd88a8$5239471a68a89e2e9c454e944ae909c91ada099117ae23adcbd8cc5d41bfa348e00d5581993e5d1abd5e3f7e481ce598dca6cec82cb10a33a2c0bbf5d453760c', 'Johnny', 'McDougal', 17),
(284, 'stu2024283', 'stu2024283@school.edu', 'scrypt:32768:8:1$foUyDK25jDrKQ1qZ$4c2ab4f958d52c0aeb5fd9125b0ed3483e50b07c88e538cd9312df6e02f4bc2cb5052aa76f4a48e16b6574b4892d922f4aa2398137474c2ba50ef4f266e5f7da', 'Steve', 'Brown', 17),
(285, 'stu2024284', 'stu2024284@school.edu', 'scrypt:32768:8:1$TNMKdGsGLoNI1g27$e93ecc347d2cab1537f504c45e63cd0a118f331133643da164b47cb42512737496ce621d13e2aa42c2007f60093c7d245d517aa98001268ae5ac6ac3feb45862', 'Greg', 'Streme', 17),
(286, 'stu2024285', 'stu2024285@school.edu', 'scrypt:32768:8:1$2yttRs3ywDs78to8$39ebce6df7d40022370d75a753f0b5a60d40fc70838eaf8d7fdd4f48088c9d998e6846956396fd074d5d3436bd50d26830f0dbd0fecea79eb53c5b7ff163bb32', 'Abdul', 'Gassed', 17),
(287, 'stu2024286', 'stu2024286@school.edu', 'scrypt:32768:8:1$XmKjKDWwEPi6m1iL$c8dde6f2499964db7a2f0c8870f65ee6ad224a29265596b57d4301d741e9e339ac42fcce05f84cc1d7fbf5b043d73d7ffd99755ef383cb924fba40f1f6fdbd91', 'Greg ', 'Cornelius', 17),
(288, 'stu2024287', 'stu2024287@school.edu', 'scrypt:32768:8:1$enyq9HOxnYOoqZ3x$614a59ddbdc73e9fb1eefb1b522bdba9c50af2c7d86d303241ff400225751ae8e87e464860a07eeb9974d2317f7d18af29c8bc51e7c5ae7acc9553043695c1a5', 'Bobby', 'Pembridge', 17),
(289, 'stu2024288', 'stu2024288@school.edu', 'scrypt:32768:8:1$92wrZazddy76Dtxg$c1a01a98c010bd9e42c9ce47de0218279d4b6230c29015d3b899df6d3dd8b2cb5f89f61ebed7f34dd4beb7d57b9f0e45e41ef9a25e30642a5a7fefb99d2c6736', 'Tim', 'Miskimen', 17),
(290, 'stu2024289', 'stu2024289@school.edu', 'scrypt:32768:8:1$dF10UssE6rtye5hg$8cf6b4085bfbce498ab9a20b34e8905e0653667ed0d24ec28483d1765185448ec85beecb6cf96aa03b700c7a3e8d0c2d53f09f5eade7f7c4836ae31a1329823f', 'Ryan', 'O\'Callaghan', 17),
(291, 'stu2024290', 'stu2024290@school.edu', 'scrypt:32768:8:1$sPhV2bSy5au31OuV$af595364b62aa71987c876104a6e8a5c97ae6af885e8253c44ae4202f2b8cbabb0fca3687782c93956dd6feba00e1eaac89b65ce5183f43b22f8fb9267093751', 'Eric', 'O\'Callaghan', 17),
(292, 'stu2024291', 'stu2024291@school.edu', 'scrypt:32768:8:1$Gr1udyrtkT1eCa8T$c6bc96d184e0506d137c487bd91b17bf9bd7b3e6a54e9aa0703cd16dcf534b432bb12f24800694b41f288284c0f9b53f04dccf4e25fcd786f5cfac6215455ac3', 'Codi', 'Schmidt-McPhee', 17),
(293, 'stu2024292', 'stu2024292@school.edu', 'scrypt:32768:8:1$8m3uC12aINGTvb1O$6c59b17c83f12b227bc99e5383eb3ec1f2bf57e526daef7ff90977841fc1f9569f70fce7144722c2156669d051e2206bd99400cf10b59cdd4f12acc86a8a314c', 'Ty', 'Sheridin', 17),
(294, 'stu2024293', 'stu2024293@school.edu', 'scrypt:32768:8:1$SSAQz5WuZV7ekde6$0f8d8ef28a751732f4afc9fafa0df43dfe078e751b4275ce6b5f4629839d404387058782b18ecf3ee41291dff39f54aa4bdc39c68da121b4de33b39af95d3a46', 'Jacob seth', 'Loughland', 17),
(295, 'stu2024294', 'stu2024294@school.edu', 'scrypt:32768:8:1$w4kMiZ9UzguBAnx2$032ae973067133a89e7454061f07db231d68d9d9ad9118069ffa0cfde73e9e83feef9c08819c6784f3f3aa46c54c9337ba19a7783ed3f52d1e76f1db30149a5a', 'Seth', 'Clearwater', 17),
(296, 'stu2024295', 'stu2024295@school.edu', 'scrypt:32768:8:1$u2z9bZsQiTV3Vugp$2708aec580d8ef0399fd56227f4b95af89c046806d10015f46130cafbc11192fbc29077603298d4e5216dfe08ff629c43be8271910e498d763faae55345adfaa', 'Thomas', 'Brodi-Sanger', 17),
(297, 'stu2024296', 'stu2024296@school.edu', 'scrypt:32768:8:1$Lc7lX3Xnp7jrZAWj$ad18c19f8db7dd26c7341e9b1ca69c3a8e965e716a184e79a6253570e0eaecf676c3730679f001f65810e8906cf3924a928c6eb6ee344895aadb996671e46592', 'Mickey', 'Matson', 17),
(298, 'stu2024297', 'stu2024297@school.edu', 'scrypt:32768:8:1$CZW7aBnXYfQ4rh2P$4014917968e5b7a5440568b28d8ac66ce443023ee9b8d5cbd443824a8f05f2c151ffb82e927cdac3fa67fa349acf1457e4160d52d3c6cf23ad4914885f049fd4', 'Brett', 'Portage', 17),
(299, 'stu2024298', 'stu2024298@school.edu', 'scrypt:32768:8:1$kxyrlKus6lSyXBgF$375aef4146a767a042501ce540d41b3bb854b011bc83126556085b312c41f6f0c20eac30a10bfacc169270c93edab83b97f05816cf6613e72c443c27e7ab300b', 'Brett', 'Nau', 17),
(300, 'stu2024299', 'stu2024299@school.edu', 'scrypt:32768:8:1$UQqGxtPYKR1lDL51$fa8703b404443b74d331d14c96c81b16906a2d8f4944954c0a2712e6b733003f61e988e368577c403cab9a1ddfa3bdd4372c9d6d016285a5b1f9a9fe1c104966', 'David', 'Wright', 17),
(301, 'stu2024300', 'stu2024300@school.edu', 'scrypt:32768:8:1$jgticD0hU74tZkD3$d8ab7ee0791664600fefdf56a6a0ffec9fb0d23ee006a39ae00159ba929d9b06645a6f4311c6ec8c3c657c2c9b91b2f33054ae4a3b15a92a5d77c07e6cbb8efe', 'Frankie', 'Suthard', 17),
(302, 'stu2024301', 'stu2024301@school.edu', 'scrypt:32768:8:1$MXmj664cHLCg8mUs$98aa851d0e8192065eab902e8992645f83882556a5417caeef2e53b017e305b8bc193653e5309ad6a2c7c28b407e0aac5c9dc42e17e908b5cae8bf58ea2ccc6e', 'Cody', 'Suthard', 17),
(303, 'stu2024302', 'stu2024302@school.edu', 'scrypt:32768:8:1$273SQ9xrP3xA9ckg$70d62eed3e7957fe3c1a37de899de130a61dd05212b9d055b82c7c9a3b55bb616ad9d40f2ce82e41488bcabea5859324ae63dc1ec3d8baee948e2352ec5acf6f', 'Jase', 'Suthard', 17),
(304, 'stu2024303', 'stu2024303@school.edu', 'scrypt:32768:8:1$AKiKgHHDepGZuktS$729311c6dffbfd96b7c9681c1d2ad631731c68670fc48c37bb723729e10686312469f5e42af7c2df8bd5560c7ba375637c72b3824012c9c72fd1258c52f2a176', 'Philip', 'Smith-bros', 17),
(305, 'stu2024304', 'stu2024304@school.edu', 'scrypt:32768:8:1$2lwAf9U8SMhIngfa$3e09898cc0885c3479886e6176a05412765424c83406275499d5ba0d169d970d8d92302098a97e1e4b3d1a143b7a242246ca53e8b559dee9985df78b26a6811e', 'Reshet', 'Moti', 17),
(306, 'stu2024305', 'stu2024305@school.edu', 'scrypt:32768:8:1$2LtwIArNUMBaLHns$d5f123430ca99c6e508e5c9d0d51970300224a587a239a217b7b6fe8efb904859a55d372c9bf7bd6a0b702edaed3cc8ad667f77c5b6a6a97c4633ca88c98c1c4', 'CJ', 'Scout', 17),
(307, 'stu2024306', 'stu2024306@school.edu', 'scrypt:32768:8:1$XeKClVglFGu3EYxK$b8d4847276f9d743d0b2c480446dd61f751f31c3dd0ea24fc8a53f4d01b126c725733f396e219e16da217f7aef0fdbd1cbe5f62168e3aa5db99c6019b17bcd37', 'Caleb', 'Scout', 17),
(308, 'stu2024307', 'stu2024307@school.edu', 'scrypt:32768:8:1$05OXis8j4zc3Pq87$72dda0861b86d1da981b56ad380f611edfb9fd1a844893abfa369820690ef03fd9c7f234c8ee6e2755188ee94d8eac028e3fe805f4531352c80af54086682ad5', 'Chris', 'Scout', 17),
(309, 'stu2024308', 'stu2024308@school.edu', 'scrypt:32768:8:1$rTkqeiWH4ryj0qVH$6ee2634a400fc6df14d45afa0ed354edb06ce2f1b9bbeb85a9727cc94558d74efc20fcbeef0e1442881b6bdd2a8ae6be30724ac687034df38dc2cafd01dce410', 'Misha', 'Hotel', 17),
(310, 'stu2024309', 'stu2024309@school.edu', 'scrypt:32768:8:1$yR5FEUw6tMP7bFi0$cf60d7336a224c1c006fcb405ebd18b67a26b600b8951d5b4872b58b88c103acdb08d7486d9c5f0bea468aff3fd77530e44410a72c99531873a85758aa0de130', 'Matty', 'Aussie', 17),
(311, 'stu2024310', 'stu2024310@school.edu', 'scrypt:32768:8:1$sYc9LXnSeZmd2ORN$2ec57a55ca4c9d4b380d37f3922065cc4b2e0f26a74036604ef11aaf900d35341d267c72325c31e80175c5081f158c4bf68991ec27490befaa4a24e3ac51c5d1', 'Julian', 'Aussie', 17),
(312, 'stu2024311', 'stu2024311@school.edu', 'scrypt:32768:8:1$YlhdXurUzTxNS7Jz$e12a26f78797d2a33acafcb4d1a9f0ca9938b78b00ac9d4aa18e346330f39f2e1bbdb444acd4fd54f1b046afce5d2a6bfabde949260f15e006da7db2b54c1217', 'Mikey', 'Argy', 17),
(313, 'stu2024312', 'stu2024312@school.edu', 'scrypt:32768:8:1$q7ikT6EFkI4bDf9Y$90cc0b604ee416a61df558130fb56ef03493ce963de416928ec47c06a69212c7020975a2adf5314eed7fb0e85599f5d697ff55e43259d6f228549cf6ead59f59', 'Sandro', 'Argy', 17),
(314, 'stu2024313', 'stu2024313@school.edu', 'scrypt:32768:8:1$8crtDyNuUPxfaEWS$deacdcdb7b4f09111974c142c9a848d4bcdc72299a934b0cb2dcd6fbddb2ab76e9087707305ad25e34025ca17988112d78da706d01f289c8ee3c1a93c4f1426f', 'Jeremy', 'Kocher', 17),
(315, 'stu2024314', 'stu2024314@school.edu', 'scrypt:32768:8:1$8mugbCgpAPuObla1$33f86e897ca5e8657c78ac65fe4baa241dc43d76cf8ed7b70681dccccb30b915f9a95d53e8cebfcc229af5a31da588faa02be208d5c1c51a36ca5f6ce35ce9ba', 'Zach', 'Kocher', 17),
(316, 'stu2024315', 'stu2024315@school.edu', 'scrypt:32768:8:1$xp1lCj2PBqRKg6s7$a7d2eb89cd798740f2f02b3ff75384d4e35d5204807f2c55dbc68947deaf687687a7d372ccedbdf6bf0c3991d957af5d1c704e224aaf50d87d701917c17fa6b3', 'Gregory', 'Petek', 17),
(317, 'stu2024316', 'stu2024316@school.edu', 'scrypt:32768:8:1$Ots0UXTHozEvZIqM$1e5ea5924d7c2c72f97040c159e05d584f912d70c7b1836d76479f5c53d6bf7120bf43f095230de079d32033517983d5b962ea09c1dcbeec1e05423d1b8268a5', 'Thomas', 'Petek', 17),
(318, 'stu2024317', 'stu2024317@school.edu', 'scrypt:32768:8:1$sJ9cESAcGdAkaGOt$96c1b3857aff3dcc3e290238615b89a8b569222c7552b22a9860803e6c5e7dd72f0faf982701ebde0b02bde7d9a315fe4bb2817595acff2279d526c15095ae36', 'Mark', 'Regowski', 17),
(319, 'stu2024318', 'stu2024318@school.edu', 'scrypt:32768:8:1$rdRVbNsGkFxvFL9U$c077df4533845203d2db7bd0f2b19a5596e0318b89e8a70c3caf7e54c0489bbec31d542e4fd8c3cf7b63cdc76caedba8f88757aba93110de2ea58b4392fed2c2', 'Randall', 'Bolinger', 17),
(320, 'stu2024319', 'stu2024319@school.edu', 'scrypt:32768:8:1$KsVwnHTIjuVxaHbk$1aafbea12e539a0375884b7832aa76d471186f7bf7d6b489ed6231076c5ffc16e9dbc1c9fd0a850c85677df994cfa5aaf858244581a640dc78b8cd52fbc4c97d', 'Eric', 'Larson', 17),
(321, 'stu2024320', 'stu2024320@school.edu', 'scrypt:32768:8:1$6vAzfn9aindsO56V$c9fe733b5356d3e095e52c8fa1af0ed2a1ebd5fc95f949bb65a50ef89f3dee92efb1bb22bbc2117598b6ba4fbb0cbcb67edd9a7343290b1534e4b5fd8dbcdb02', 'Steven', 'Larson', 17),
(322, 'stu2024321', 'stu2024321@school.edu', 'scrypt:32768:8:1$sYaDE1MDYAHye9Ow$23ac4419c811c73d34afddd6149ed6342a7d411cb657bb0e4e5648f9fd719d582aa88adc2d9c6c22cc3843b5ff3128410b5984d5a5052b544f581887af4ea1bd', 'Carter', 'Bratton', 17),
(323, 'stu2024322', 'stu2024322@school.edu', 'scrypt:32768:8:1$3qZuoOkxBtgU3kYH$9cd8842e229c92a8c6e3d368066c7cfb3f3e91441f4c54304e05673e91d318a73454b8f714d6f47d7fb060d8a43f6a7f35498d18edc0b7a00f68637481bb6f04', 'Rotem', 'Mathias', 17),
(324, 'stu2024323', 'stu2024323@school.edu', 'scrypt:32768:8:1$Ll74cHNd2YPGddRS$96e89dcadff3a136178df9fd6aebac38ecdfc9e354a66ec47b6317060220a66cda86d14a673a376dd18f18ea1eecf12c3489be9250e1b15b5f1ccd475b81c52a', 'Erick', 'Johnson', 17),
(325, 'stu2024324', 'stu2024324@school.edu', 'scrypt:32768:8:1$4zoMru7VPT58BHWU$f8f44d80636f74334f38a56712f94cb349d7236634476519ba4045a5f6ce8349c7b1b919a294af75d49bb587396aa09f8fc3248290cf179c289346eb7c5fd7d6', 'Jacob', 'Wetterling', 17),
(326, 'stu2024325', 'stu2024325@school.edu', 'scrypt:32768:8:1$e7cqs94guzETAGRy$d06ef351d187bc951ba8a1d7a8f5186d9bf78a4e66de5b897604c7d715cad047e98f22a514c2bc98f03aa6c4d48c8d0bf89ddb8581110653b29ecd59668a91a3', 'Tom', 'Daley', 17),
(327, 'stu2024326', 'stu2024326@school.edu', 'scrypt:32768:8:1$b6Ymp1vOCGk3O9Ve$c13fc879e7fe957ed5d0ae6ce48fe277cb77f35281b0b538d157d1e8a5174efee37bd025b0f7db11903b21847f7f478705ec0af493cf24701788e0be68065932', 'Tom', 'Danley', 17),
(328, 'stu2024327', 'stu2024327@school.edu', 'scrypt:32768:8:1$Jleq0TwBlVSE4HHe$697bd25f09e9cd66e1f7a800bcba8dbd66ae10018c03dc138419a732b16f2ddd59ae6bca6be3d4ea307981278183aca3d62af79bc49660cb65ad6abc5af197b8', 'Brig', 'Miller', 17),
(329, 'stu2024328', 'stu2024328@school.edu', 'scrypt:32768:8:1$6Y5GNakk7FkpvtXG$f4dc86c0a60fd7c3a49e160a19b5e5cff4a5e11fda5626bf7f5c1a3ddabc46a41bf820b73c5513ebf1816c1c0f575ab144afd0e143c5f1d7e88ba8b4f69f7df0', 'Dillon', 'Weisler', 17),
(330, 'stu2024329', 'stu2024329@school.edu', 'scrypt:32768:8:1$9JsmLkMSXqRdLpBF$a79030bf59f832626e5c8d361f4e2bbefced9c5c6a0cd749ab82ef2edffcb9377a2251e5c93c393bba4b67af069e160f2a19223125db6e7a48627eba1d457383', 'Jaden', 'Henline', 17),
(331, 'stu2024330', 'stu2024330@school.edu', 'scrypt:32768:8:1$cBakPQWoPwkcttSC$f26b38a0398f4d0d1c79ae5dee0ddd36978129ea98a147d0a418fe462a23cab02fdc8a0f2f7dfe5e38ed1d91893867193ed91cfe685aead93e348241b6d1fb59', 'Ryan', 'McManus', 17),
(332, 'stu2024331', 'stu2024331@school.edu', 'scrypt:32768:8:1$4XyDV1Vz2RkiK1uS$5e01a98733831f12a7ada050af2d68bf75f4492e9351953d709b3b683752fce3e71d97a56b7c7df25a9f779112abcb5d4f7490fe94e677d1e9459dfcaa616c29', 'Jacob', 'Miracle', 17),
(333, 'stu2024332', 'stu2024332@school.edu', 'scrypt:32768:8:1$Nt8NQ8ziy2kqMYkT$53ba9bba4da5996fa75a04df03ae7e145b371c297c3dbf1f3d7796ffb76b75cb610afcde86726d4b361ecd7af9d6c9a39134f061f58ab55694ae8ad6231c52a8', 'Aiden', 'Bryant', 17),
(334, 'stu2024333', 'stu2024333@school.edu', 'scrypt:32768:8:1$B7bJa3QV6wMJqZiL$5bd1b4959a8e89bb3e9dba1cc3498af5b81d418d47aea5778bc1b3c029ca0963716d608ffc265bd632fc80902e410479a5f9ece174131257cc6fb0af75f53013', 'Bo', 'Folger', 17),
(335, 'stu2024334', 'stu2024334@school.edu', 'scrypt:32768:8:1$KT14KEfayyZiEN9d$cc5c0613b29d5c76627c19ad7618603d7cb1760594bae6c5ae1f678fe2f20f5e0fd99ef8ad6f8d3eb41b3224a4ed3001b7334ccd7e0c95c0f8a9de7a4d56e809', 'Tyler', 'Folger', 17),
(336, 'stu2024335', 'stu2024335@school.edu', 'scrypt:32768:8:1$ENTmQH0HtY2oamc2$a780edd200fd69d89c33a89ff8ba589229e38bea7e69f8cd378fda214fbb046ad7c2effab0e84a1cc6fbd5001c98e0c99ccc36b5b8f17930459965e9534e89e3', 'Lucas', 'Folger', 17),
(337, 'stu2024336', 'stu2024336@school.edu', 'scrypt:32768:8:1$JR5crths0j1ScqAB$c42edfff50d53a568de8f6615d685aeac10d7e34fa152c45431b5f62a9b4e19be8c6487d3593865e00ce3ed5366c23508011201b09ae55938c57f7bf93fdb700', 'Cort', 'Oregon', 17),
(338, 'stu2024337', 'stu2024337@school.edu', 'scrypt:32768:8:1$ZXduHyHu5WU4CsAZ$31a7d96ad4b4ffd1edad009eb0cbf9fc9d171762fe8844e1cee29f50e123285247d71ff0b620f2c72f4600a23083afd0e11d6c665186922688b81b444fdec183', 'David', 'Whitewolf', 17),
(339, 'stu2024338', 'stu2024338@school.edu', 'scrypt:32768:8:1$7AjI1Sn9NLBK3nmC$6b14cc1469ae66d0fcdd6090f65b839b81df9605578838dfb3160dd86a7b277d29eda27b26547d18318e7f8acb1a1e4efbaa8772cec4961695480a07fde02a30', 'Ralph', 'Marachio', 17),
(340, 'stu2024339', 'stu2024339@school.edu', 'scrypt:32768:8:1$Uz7JBpqWpjTx3CLm$c2f5921e50de3894427a9b8dc048d1541abba2e2fbb53367f165a2eefe07b8c3cd78206f344a1e6430423fe1281c733d7d309572c0ced817659d2c179e2bebce', 'Devon', 'Sawa', 17),
(341, 'stu2024340', 'stu2024340@school.edu', 'scrypt:32768:8:1$InbjZcc3uUPnPRs6$85dd783efa0e65741fe963a964a44da5cb262c4b1666364a74dffdb84ea5afa47d61e4ca291ff5d8ea8a3f249bcb6edbdb75d2964700caeb5145a95b431503cf', 'Greg', 'Xenon', 17),
(342, 'stu2024341', 'stu2024341@school.edu', 'scrypt:32768:8:1$XZaPEYAVkmRPzfqG$510e0f13b6bf5ff9a170ea549b7942c756d6231570be88525faaa3bd3c3c36d0a1fea09da14f6948f3267306647074063c99c54cc81bb0fa6672981b8bade0c9', 'Robert', 'Irwin', 17),
(343, 'stu2024342', 'stu2024342@school.edu', 'scrypt:32768:8:1$2WjZ9bzaSs5btAMk$53b01b1346e031345ba56fb433742862a2bdf2674f1d30be967054421bdb16daa3cd56af29d4b5f2be5ec0a11e3ebd2a4115deb8ccf338897521c0a1ea6d24df', 'Drilon', 'Sadiku', 17),
(344, 'stu2024343', 'stu2024343@school.edu', 'scrypt:32768:8:1$71JyWifyXgoC5egr$3af2075c7ee18fcf2db629f52da7499689899c99337f7dc889e91e323d9d28dea5e72265ec5d8dc5c5a9f048e53b431ddfadc977b3b1d13d6eb27fc2bb42f52c', 'Drin', 'Sadiku', 17),
(345, 'stu2024344', 'stu2024344@school.edu', 'scrypt:32768:8:1$j55wSRTbfZ8oa8Ao$731437561f20a327be160b4b0d86ff475fcb8f38577c124c0a8ad014ca0c9d09f14b1b148cf4e69a515f39621aee87337ec5ea046afdff8cb4dfd54ba9aa5b2d', 'Lucas', 'Wallencheck', 17),
(346, 'stu2024345', 'stu2024345@school.edu', 'scrypt:32768:8:1$OADANItYMWPuMNh3$387fd7fe145fb5fae03cbf8ea540cdbd88af8e531157cc299a0cb2a3dacea1ac967dec2b96527d9cf03711ebcb11e65eccf38c326fc247bbea2f456a9def9e64', 'Brian', 'Clouds', 17),
(347, 'stu2024346', 'stu2024346@school.edu', 'scrypt:32768:8:1$rDTDqUrUIZHwR6EF$dc926bf8d290ddb7b81bfa8f97999b98f3238d66a5a70f1551cc05a5cd30fafde6d2eed99ffe4bf3d6b8d89a7873bf10b0ece826a78c3ef38fd0c91aebc154e0', 'Charlie', 'Bandan', 17),
(348, 'stu2024347', 'stu2024347@school.edu', 'scrypt:32768:8:1$lr1zponVp7U2sIEK$07cdc8fb7e3819f246b1911ad5ea90de981475d2e2acbf74ac474e845f2c64f0ab9baef242e11874a8369d55a2fe6236efcaae9fd2279d6d9d5d01612c1e64eb', 'Tyler', 'VA', 17),
(349, 'stu2024348', 'stu2024348@school.edu', 'scrypt:32768:8:1$w2JPuyD6XpEumplI$eb66666291dff7296898215042e4a9b43746b744e5fcbefdf852b0d2f2bb9de7c3a145fd5e80ba26c01ee4583868a8928078f852aa171f9244bd8a4bb81f95f0', 'Grayson', 'DC', 17),
(350, 'stu2024349', 'stu2024349@school.edu', 'scrypt:32768:8:1$0yS5xfMmgpqfroOe$9e63a6d531e321be8495e8e898630340e086579ca542585f8cc483b44ee3d5a3b0a9cfcd47947a7ea2a62a9d26866609ffcb0ff951520886a96b7b7f2f710ff3', 'Tanner', 'VA', 17),
(351, 'stu2024350', 'stu2024350@school.edu', 'scrypt:32768:8:1$NpXnjyEMwzg8IiHv$9902ff02244c290aed7a5832a17406f7ffaaf8cd5aecde46a3c3fda314fd8c656272cdfbc4a57c8528ae79c5502354f3772892910e4126d834c84a1a7027f8d7', 'Taylor', 'Starr', 17),
(352, 'stu2024351', 'stu2024351@school.edu', 'scrypt:32768:8:1$jDGGcLD6Dfn33NRx$1e6eb54d8ca2c0162ebba13952a453aeb6e8384968988f7528639fe5297794b98234919d4cbdad1bcc70d8b56edff87aecd906645c420fb8a909c6c541507442', 'Hunter', 'Starr', 17),
(353, 'stu2024352', 'stu2024352@school.edu', 'scrypt:32768:8:1$IRyK5rESfGvrGGQG$b705b3b517c7a642f8b3018d7f624e8aadbf1c85186fbb5bd9dd77f899898de30b7dda3feee77f7bc961cd796e186999d89af5e7f525049182f7f9e5c3277efe', 'Thomas', 'Tex', 17),
(354, 'stu2024353', 'stu2024353@school.edu', 'scrypt:32768:8:1$zwWXDD5Ddsykff7V$03b4cfc472aba0e8d4d1e3b9a287432da2364beb9d9960d56860d78fb49510be6fc1317081bab35535520ef4134d15d3f2030e92f784bed81761d5a25a6685c6', 'Robert', 'Burroughs', 17),
(355, 'stu2024354', 'stu2024354@school.edu', 'scrypt:32768:8:1$x25emRIMSEAhKB0t$fe66f933234b7cd1296f3eb991181bc6712c9d7a5eeb575f16dbe5c1dad16fb83d5ec05a71910d0b6ce20d35cc886393e3c332f3f4e4aec6313d192725390e7c', 'David', 'Anthony', 17),
(356, 'stu2024355', 'stu2024355@school.edu', 'scrypt:32768:8:1$QswCOvw3LctDiB8V$14d272433468280747bc72b6cfb24c12b2eea650e59090326871bdaccc280f0ae09b036c3ce4b00d3aeb07c8cb042f9cfc5790375811afbd69b890157b52c32a', 'William', 'Blakeney', 17),
(357, 'stu2024356', 'stu2024356@school.edu', 'scrypt:32768:8:1$9jWaXnLV0zy9mEZW$fd5dfc3564c0b00ec6e7263a104675ad8bbc2e797fb056b9ea01f1bbb4ed79a418ae296fa171a62576e38ea1e24e07e2ec7b0f1b635f379ec331947d9b2f496d', 'Philip', 'Model', 17),
(358, 'stu2024357', 'stu2024357@school.edu', 'scrypt:32768:8:1$i4zJYwPFH4b5TGSe$4cd9ebbe0c478e9bb81dc7267d41823f14e9c78a884d8c3a98eb4cbdde65829b423001d2e57c2d80722c900a328e5d79f99a98000a56540deb7b1ab1b0596352', 'Scott', 'Allen', 17),
(359, 'stu2024358', 'stu2024358@school.edu', 'scrypt:32768:8:1$wpP3QglBgHHtEkij$5fddaea41f8f811a0bb1e06112777c639eb4a746916a12ee241f36ecc7350c977505f12b82c188beda8eabc7bbcd22d2d7ab2b5b5762cc5a0a4d2f60e0e2e8cc', 'Scott', 'Drummond', 17),
(360, 'stu2024359', 'stu2024359@school.edu', 'scrypt:32768:8:1$tBqZVCF2AwIWGXHI$1f91cee732103cece416757dde1437aff04fe439ff3d4e2b98cfa2197280c4cde4c9303459046abef3f6186b48c6a5156fe9bcf77174eb0f63af9f8812d7f088', 'Ron', 'Drummond', 17),
(361, 'stu2024360', 'stu2024360@school.edu', 'scrypt:32768:8:1$7stE0HrPAZe7SU3S$3ac97b5a1dfbadd6053dae5d5ff29dc01e174fb09968d246031e3b76b9705a297463c4ece383730a541c6085b774bb1fb63bc3ac156ee3ecb3d1754fb5b4ad50', 'Brett', 'Klauss', 17),
(362, 'stu2024361', 'stu2024361@school.edu', 'scrypt:32768:8:1$A5mnr58ryasJRDpv$036e1909004777c73fa1453a9dede785bbc51b8d2d06828458239d098bc0a07377316a2923209da10fd3f90a80d8076ca3e40984184988a77224b1ad5d777e0e', 'Jason', 'Klauss', 17),
(363, 'stu2024362', 'stu2024362@school.edu', 'scrypt:32768:8:1$pDybXJaMEan7CeXh$7cdff28760b04bfdd3bfcac1276eaf100171ecc46d7b167cf760e42673269c70bf1988ef3fd5f20bd86ab2d6704872776f98274c866f4422918d12e6cb82ec4f', 'Zach', 'Garner', 17),
(364, 'stu2024363', 'stu2024363@school.edu', 'scrypt:32768:8:1$dZCFhlzPQcyFKb9i$81a98feb62ab352c67d257be9245b0c11498fa49984ecd758abb322c39240faf65f10fcadae2f69c7082c00d4cd4dfb0bf775c12bb1b7528e3312aa5c712196d', 'Keegan', 'Garner', 17),
(365, 'stu2024364', 'stu2024364@school.edu', 'scrypt:32768:8:1$EFdn9QlzVkORXIfe$fc308bbb03009ae5a6475076f7ea4b68dfa718468b4b8f78d157a865ad15a6d9e280c4fa9c42a9d72e02d0e802b1c2443ea1151d0737c7742338ba282bea82fd', 'Zach', 'Mesinko', 17),
(366, 'stu2024365', 'stu2024365@school.edu', 'scrypt:32768:8:1$nyWicwrnYhzgKYbJ$ed05d0d1f6971a0ba3a8db56a347eb27210af1fc5920e799c87b4d2c8b2e4c48806e8b41bcbf2680fd4c3462ef951969fa608ea59146cfa9927fbc4dc4cfc8ef', 'Adam', 'Mesinko', 17),
(367, 'stu2024366', 'stu2024366@school.edu', 'scrypt:32768:8:1$O0UgdS6BvtFX4XcF$d09a76997dd2073155b925c24ff751c2313bfd47d086b5718f01472bca31c7e707b15b16f804a3df4242355fbe5f2d1089abb2e149b8b1fa64e7fb8a680e8a39', 'Danny', 'Chambers', 17),
(368, 'stu2024367', 'stu2024367@school.edu', 'scrypt:32768:8:1$rEKGqWS3t7BynO1X$c8c584b6833076435e0441e47b77509652f6b708bbdf13c9462fb777f6832222e5d5c64f4bafb803fdabf80be3a227b2afceecfd58c1b6d60a2aa3c37a2de32b', 'Danny', 'Honeycutt', 17),
(369, 'stu2024368', 'stu2024368@school.edu', 'scrypt:32768:8:1$ig2AV2Tcumw02N84$7657203c576aafda1c0e45ebde5b19202929c72844ea8f851cb4dc71ea683810e953be063906d6548d05863feedea6f4a35cde5796071ea420de90cda8caa6e1', 'Danny', 'Winton', 17),
(370, 'stu2024369', 'stu2024369@school.edu', 'scrypt:32768:8:1$zvmzrdKqNUm8JBlY$800f44ce2b2b1ea023efd629bd5022273c2a8b5755b252bbbe87383ee4717af19f18f420fec8cfb5255bf6c9eeb573d2e6b77e6dfcdc50f16b4da761f2b68805', 'Lars', 'Eckburg', 17),
(371, 'stu2024370', 'stu2024370@school.edu', 'scrypt:32768:8:1$oIC23Hfb8kXPc02N$057d0ae55446417985698d58c435a86f11a9cc4217ecefcf5cadc50874a0079a0fd16c3c92470843c207967c8681ad1ce6533443e7b8289f36c27bf2e37834f6', 'Duke', 'Gains', 17),
(372, 'stu2024371', 'stu2024371@school.edu', 'scrypt:32768:8:1$TG1lDTfdvFi69SWa$ff9141f1041922405de1fd2735159f6275f5b5607605385c4d8ac25a554f40c695923ddbcb5ac46a5747b1692fca1966b80e08dda3e78af8ce777f81c538d5b6', 'Jeff', 'Mohler', 17),
(373, 'stu2024372', 'stu2024372@school.edu', 'scrypt:32768:8:1$3VJpWNIfbC1mcIjh$8f61f8fa89eee9b1fee8291fec0bd4ffc30a20715ac3775b5467407709b036068ab2b627d9e8f79e4e111097f93e72ae08f804a4121df8cd4a97233fa7a62227', 'Andrew', 'Mohler', 17),
(374, 'stu2024373', 'stu2024373@school.edu', 'scrypt:32768:8:1$i9wJOd3KAF7kZtqP$b218f4d1d86780435a576e0f254a3091bcd550b345e8ed81d0bba325dd50aae2954abf6c87a6fd75c65bbb81bea03ca3d5ebfc400c2a7763290a99d141e9f14e', 'Nathan', 'Mohler', 17),
(375, 'stu2024374', 'stu2024374@school.edu', 'scrypt:32768:8:1$uyD8zcrH7757CqcG$5b87fee49072eb54c4fe460407ea0258b9df2f8cdcaccfbd79257d52f5db02937beb4691481e5cbc6adfa49b673b011b4d6a2b417d779f94e817329b3718c321', 'Jacob', 'Mohler', 17),
(376, 'stu2024375', 'stu2024375@school.edu', 'scrypt:32768:8:1$5nrBXwUjDIRDT9Cy$5c1d52781d143495725e4d05cb6271650df79c35d2999724198861bce4995ab01e2c73f16f298272b6a0c330b46fb435e5956cb845c97a26249b6de4cbb326fb', 'Martin', 'Mohler', 17),
(377, 'stu2024376', 'stu2024376@school.edu', 'scrypt:32768:8:1$p45IQXjFSVYVS95Y$e480a486c9defcd3864804514bd98a3cb3c147da83e82502744cfdb0ffa23c8b358473d532c5eee6319de506d0d92767a5d8baec5c261d0a32595adf7ba95e99', 'Randall', 'Mohler', 17),
(378, 'stu2024377', 'stu2024377@school.edu', 'scrypt:32768:8:1$5US9FY9CaxtMchuy$50125a94219d8f5db5ae35cbb865fca4301399bbd29a52f2505a6591fa70c04f1c4aa0dd7c50b3503491399b330a6afd418036f45de0240587e1821473a77401', 'Jeremy', 'Reeder', 17),
(379, 'stu2024378', 'stu2024378@school.edu', 'scrypt:32768:8:1$QpVTy07Pz92iOE6Z$e905c2a65bc2fc6f7a677e611f856595ca0248beeaf4acd25cc6f8a325f54226ed57883f0f9bd78111402eba41218c8a464c1403ea8fba9237cd7433775548e5', 'Ben', 'Hawley', 17),
(380, 'stu2024379', 'stu2024379@school.edu', 'scrypt:32768:8:1$B72XVT8aJp13ibAN$15f412349b52c0b8b73c177d713307e8eeae5e17533e53861edc9dd50b6e9959c619fe7a3fd78d9b06e3da02c3ffec36d986a9a1d79049961ac9fd05124b1a74', 'Joshua', 'Robb', 17),
(381, 'stu2024380', 'stu2024380@school.edu', 'scrypt:32768:8:1$lNF4Ly6GpNfa7hjU$699843f3f8b74decbb062077bfece4f5582bc4cc528af5ca80ca9c639c1e5277d033794c23938229980f97a46680f0e0586c045df96658d046ad0c6f437c4c0c', 'JJ', 'Robb', 17),
(382, 'stu2024381', 'stu2024381@school.edu', 'scrypt:32768:8:1$AtlNK7RB4Ip6FCGH$7035418587851722bd262525780e357527dfccdbed347d0001cda7ae774b9fe1c8cd1be9beb7c4def7ca78d355a5049cce2fb01da421f622703bdef2f7ddc964', 'Joey', 'Robb', 17),
(383, 'stu2024382', 'stu2024382@school.edu', 'scrypt:32768:8:1$TkXfpc7gXMsN6dRO$8a8b839440767b0aa6c1a5e386729c0022b197718784426a761f631e934cbe1cead2519f932464b67ea8c99b8c5535afc9e9e6fad4262c681f700d0961342156', 'Ilia', 'Malinin', 17),
(384, 'stu2024383', 'stu2024383@school.edu', 'scrypt:32768:8:1$GBhD5KhcruLVplMG$79b346d2c7b583f53204f3e35d9078bde505d2b747f668d445f5b3b0379cf189e04f3f12f4104f9cc55426afa67aaf2490054982c34ff412547cf1556567f5f7', 'Simon', 'Brown', 17),
(385, 'stu2024384', 'stu2024384@school.edu', 'scrypt:32768:8:1$6EsNkNVPCEx3EUSY$7afd1396780153af05aef341fcbf5f87b9e6b612fbd6321b8bb3e1fef2efe67539c40735500408fc20c18c27bd0538b4e494f2be11a0292c0482630d36593295', 'Tyler', 'Kobel', 17),
(386, 'stu2024385', 'stu2024385@school.edu', 'scrypt:32768:8:1$EimCLRhiC4anqOUC$c39c867af4eff64ddf1a76f04c4bb61654a30f7a597e13bc661bc972ed02135a2c4aa5e66c991e1b0300d78b002e69c81557d28828add0d72d138a99f020acc0', 'Mario', 'Roulette', 17),
(387, 'stu2024386', 'stu2024386@school.edu', 'scrypt:32768:8:1$RO5NmBWHQYbTclmb$bb4b48b28e2e073c0154a68648859193929435619b59c63ec56c7e9acfd0df51580b8c48201216a95cfc9fe6cf226c4d4825d437ed3b941b3082e36cd65e670a', 'Rick', 'Dancer', 17),
(388, 'stu2024387', 'stu2024387@school.edu', 'scrypt:32768:8:1$kN6CcrhxD1hYdgfe$48eb9f48a986805065195e4ad2d917a9c68a798cf059b94cf7210a946d770085007e12c229b361ca19bf39f46a3dee293b547d3bbf070a02a896e3315f6be4e6', 'Gabriel', 'Silva', 17),
(389, 'stu2024388', 'stu2024388@school.edu', 'scrypt:32768:8:1$sFAZe6z6iDUo6vKA$32584bfb4231a54216d0a18f89cd9cceb2604c99ef589e1c3ae3f463a1250fab6bf89c89c29fd7595161e60749d3c6c283872ed71b4bfc231d17c75ef174a136', 'Joshua', 'Kontour', 17),
(390, 'stu2024389', 'stu2024389@school.edu', 'scrypt:32768:8:1$OgZWqgpMmR8eunkl$5f3d8b9ccdc51d3a62d9bc3a24a89d1d1af171d76a973ddccf595a32e3f981f3596f2edbb95365b364b6d7cb9fb137c54d987df9dbf3a82c0094ab9319f5a1f3', 'Evan', 'Kontour', 17),
(391, 'stu2024390', 'stu2024390@school.edu', 'scrypt:32768:8:1$lEPNK7mjypaotVE5$5881c78b246e2a8a416ce8a4db7240c19c360aa3eff467d68002107b3eb3227f911997b8d01d8d2b8f02bd654316aca80f6aa5eabe1d9efca3ed3298531f39bd', 'Joshua', 'Dundr', 17),
(392, 'stu2024391', 'stu2024391@school.edu', 'scrypt:32768:8:1$8N6BnI0oQBKbbhDR$7a3c5063b7c0674c707badea07fb8189f0dec93121025db65c43e6bec45b9ecbadfad5d9d7a3c3ad576c7ef5c3006c558e481274af86cd2f20cf5ed417a3db1f', 'David', 'Merk', 17),
(393, 'stu2024392', 'stu2024392@school.edu', 'scrypt:32768:8:1$lkZ0L08hWybHKzpT$474718c1039253a130856a33231101c6d7c312f7a08308a3a6c57f71a30ac2d4abc6bb9666e19eb34bc4ec0aaa6fed52214c592dcadccb8da116a0345c5d676c', 'Charles', 'Ridley', 17),
(394, 'stu2024393', 'stu2024393@school.edu', 'scrypt:32768:8:1$rAISjmLnu9joF8nm$f9a5d0d45fa52df3f2aa671270ab0be3f33134daae69791725b0d32f0d613ca783eea08bfbcf7cd54457f3505bdb97a32d6fad67e7ce3d9a5007c187add101a4', 'Johnathan', 'Ridley', 17),
(395, 'stu2024394', 'stu2024394@school.edu', 'scrypt:32768:8:1$OeWYwNGB356OGJ9P$bd9f1e54401130f6d778d63dfd0af0a40df6e8f1321ff10c4ca42a710c4a2db7ffce43564ea85664676622ee4c6d9665b41740b01887608c1d7986968408d6c0', 'Paul', 'Ridley', 17),
(396, 'stu2024395', 'stu2024395@school.edu', 'scrypt:32768:8:1$RN6z3r4rzgpGOLBv$562973edea20571380fc86b0809b3fb4d4455560e4eae6d9dbec73016c86cfaddbbbb5636865e4bd1c18d513560cbf8e14703c3a9ea81718b431c3b9781372fc', 'Michael', 'Slayton', 17),
(397, 'stu2024396', 'stu2024396@school.edu', 'scrypt:32768:8:1$kKZk1S2bYLdORhnv$0d222ed0c7fca8bdec451002f966893a8fda33a78e86899e6c552a149c4afc966f60534453ba5887c4d680dfa79b5c076f0b7cdf63702dc6b93c24978ce81745', 'Christian', 'Slayton', 17),
(398, 'stu2024397', 'stu2024397@school.edu', 'scrypt:32768:8:1$3vzQrhYvAQqKIboG$96bef48c62431c0ef265d06914a295a321e7df5e9f5143a8643d5cba88dc602b387365e1af3a12e8629179275d5d3a60a60b106a37808afdc3204d880b5b172d', 'Levi', 'McCoaughey', 17),
(399, 'stu2024398', 'stu2024398@school.edu', 'scrypt:32768:8:1$C98qLldGMNjM9ui0$c56a078afe9b62ca48249c04020c5008603c2f9939f4d052d89e2372f0c89049b6ae42f8fb1abdedf727833068245ee2796d04bc20b50be9ba258d9037e89fc6', 'Livingston', 'McConaughey', 17),
(400, 'stu2024399', 'stu2024399@school.edu', 'scrypt:32768:8:1$yZ2leLeISor0Xy4Y$7c839a934a8b1cb5898b3b24c38ef3a74a77dd18ed7d86dac3dae3647012b44d4215fc2ce8a4952048928c7649ba6e2f57579b753dd5473258c6923d7990388d', 'William', 'Vance', 17),
(401, 'stu2024400', 'stu2024400@school.edu', 'scrypt:32768:8:1$2ySKlVWkar7Fk0Dq$bd14162865b76d9ffa2b02ac97d362b720ad6196597e486f2a5fa3a7d1ae59f87017cb6d18732b8a92383bdf2fc7d95788f7069619c6dfc1326ce7ec96054870', 'Andrew', 'Miller', 17),
(402, 'stu2024401', 'stu2024401@school.edu', 'scrypt:32768:8:1$JDe3THEbk8eX5bcv$6327b677c1f77fd24db9b4631a5512f77728e0d9d94c82bf1d741f81800c4ed8d969936fde8a3640a54949324e69f0b9f2321c63cebcd5cdc63c46a37ef295bb', 'Bradley', 'Little', 17),
(403, 'stu2024402', 'stu2024402@school.edu', 'scrypt:32768:8:1$AwHTQHCLzScTdFip$1b56fe48ce45a6c3850abc7da9e858dc84efd2c2390005130289a12b8145998bb5f55774649d75b44cea63b9055a0facc19f18a668ab646110ca41680066943b', 'Curtis', 'Post', 17),
(404, 'stu2024403', 'stu2024403@school.edu', 'scrypt:32768:8:1$sT1aS7tNzZRuv8yZ$5e12a821e169a6a0c971bc5dd33372b935c6a5cbca070392be287332c46f328b82de09a95f60b5eaabcb7a987db686d1a184e6479746f606194cf7f5a0e7bcb0', 'Scout', 'Beachovich', 17),
(405, 'stu2024404', 'stu2024404@school.edu', 'scrypt:32768:8:1$DOms1SDTcQAYDNlL$a332d193cdebbf97b242e42b45723251ad4e99f408afbdbb4ddada143383f8d29e13c7611b6ec63adb4bc72d81faa08af4c40a4410642463377d96991c26f06e', 'Deven', 'Jackson', 17),
(406, 'stu2024405', 'stu2024405@school.edu', 'scrypt:32768:8:1$1SnumrsATKGYxifM$9438f353515137e616d1f4f7935d9f8cd5c04e3b3c2bff1333887b8f72e616f89584abfa8c655bf3ed8065fd22a6d1603867831903b6531a329b7f45267cbb03', 'Casey', 'Likes', 17),
(407, 'stu2024406', 'stu2024406@school.edu', 'scrypt:32768:8:1$LG97KrDXLlpFlzgS$73c85ffbc8313df383d07dfe854553edb0496c38ef52b272beac147977d5c1fa656ef1e363f8bc89afcc5855ca51960c7ecaafdbac56ffe5d5d4d8e57fa3efed', 'Eitan', 'Yahalomi', 17),
(408, 'stu2024407', 'stu2024407@school.edu', 'scrypt:32768:8:1$i09uNsMUdNptUy8m$35bf79a29c10910477db65e7a4fc02e04386a38960bad401cb2cd06d627b81aa0d996f0f83203edc18ac242549111fb86d1ca73370c5509d947204fa0d7a75a5', 'Rizkallah', 'Saliba', 17),
(409, 'stu2024408', 'stu2024408@school.edu', 'scrypt:32768:8:1$JmMMX35fYYPkDsVu$63e2d5b7e83599df190c50dbae3351446956fd98ad0558d0195deba9253ea90de96d768818edb06a1fbcfbd164a2b2b9bd51031bb96f46d0722f5d7b2b79c80b', 'Austin', 'Saliba', 17),
(410, 'stu2024409', 'stu2024409@school.edu', 'scrypt:32768:8:1$Gk0kXbEtYiecDJCS$bc718c18d9dee4abd412be251a8b3b0e6bd8a77ed5864416bc9aae70d025bb3297761771c72b00fcffc888a6f367ae4644f318a81ed96d5b43bae08fcf96fa66', 'David', 'Saliba', 17),
(411, 'stu2024410', 'stu2024410@school.edu', 'scrypt:32768:8:1$vl8jG1wBZdlyqtm4$f4edef26967136c830740f29070d00ec9748fb4c181186d2a7c16fda5b4badee340e1042c97e00bc7841b1aa0230c0c507a89292df6e6212fcb0504709b28988', 'Neil', 'Rutter', 17),
(412, 'stu2024411', 'stu2024411@school.edu', 'scrypt:32768:8:1$omF5c5b6hsHb22HN$32642bf505e0d1cd1c392f8d9d7f2f474c7ce83df43eab93ca11700ba7a23946f5b7540f007b30f7d4307aafdf0551161d997d128b65f07e5403fced143d829e', 'John', 'Skyview', 17),
(413, 'stu2024412', 'stu2024412@school.edu', 'scrypt:32768:8:1$WY1CKpCDx90WWtu4$19dc2c37430ae3ea0e09b05795e526d4e65a967d5813da59936e2e02047e3b1f35490cdcba8d5bd14fa42280a77d97232e57e7bb0e18f3b2e6cf50a75009afb6', 'Timothy', 'Bair', 17),
(414, 'stu2024413', 'stu2024413@school.edu', 'scrypt:32768:8:1$PPsDd6R12IoN6KoQ$7c16d76877ea3d19b2833a2d18557b794d47aa1e35ca0eb370ec5c016a2542d5d999120b3fb6d0ecd7931d4fd5ca8ce7e1f4fc52b5361f22ec8be149ea5efd84', 'David', 'Bair', 17),
(415, 'stu2024414', 'stu2024414@school.edu', 'scrypt:32768:8:1$96EPwg22HP2ozxNa$8ac8b7855736ab46e4c5423ea8a3c45aea354ba3d4b13ad48af26a15c018c6e85bf5fcac20abd5f492f7bab2de9e69043c482c9f9af15afd0eead2e6fecb2e11', 'Michael', 'Weber', 17),
(416, 'stu2024415', 'stu2024415@school.edu', 'scrypt:32768:8:1$2kXuMHTxRwufG3IF$75d5e48b465d607ec6853a7403701cf8d20d125e385ce066590094b3b6f6e12ba8c17448afba21e573a061c7e5521670ae1510cea0cb047759b5609f2ed59453', 'Dean', 'Howard', 17),
(417, 'stu2024416', 'stu2024416@school.edu', 'scrypt:32768:8:1$HDsg3EXLJzfN99Wv$c6dc8dc1f4df2ed9e16fd4908058a5369048a1177c9ea813429ad341de45079f8a89952d016969e754f632912b87fef806619fafdb4c2accd757383513265d3f', 'Brandon', 'DelToro', 17),
(418, 'stu2024417', 'stu2024417@school.edu', 'scrypt:32768:8:1$nABXWwHuXNPLkEbo$49e1481023541a3c3e6333722f3472a6dadf8d104fb84259748a12478230bd01f81ef39e41ac265c66a1194e2285c1f4fa091db36231159747bebce0974b18fc', 'Aaron', 'Favri', 17),
(419, 'stu2024418', 'stu2024418@school.edu', 'scrypt:32768:8:1$ILW4S1Xul8KHT3Me$2a50ba7c79f2aacf5944efcf27889cbd8d3fb62fdf7978daa81a700b2ee29d4df3720a31423bdd27f6bab2dfca8e8a266c6774a6c8f59e1f42684b8f92df5172', 'Carson', 'Glasier', 17),
(420, 'stu2024419', 'stu2024419@school.edu', 'scrypt:32768:8:1$I6zZSM3GCl04A1ew$95b674428baba60f4dd45c2fe98bd6444f55c93d17c1635cb6fd51b98478a28ac981f9d8e16bf177fd99a07e99b0cec2d9708d39c5d303246ae4bac85d38b57a', 'Connor', 'Glasier', 17),
(421, 'stu2024420', 'stu2024420@school.edu', 'scrypt:32768:8:1$nLgXOcwB9h4KO6fd$48334d968cc363afc4036d3d89066f886ced4b10ea2e1a1d6c9bc5abaac18d31ec1490f64cc936caf6ebb4c0f81d41353e5cad9d23e655f214a72040adcf32cc', 'Marty', 'Sampson', 17),
(422, 'stu2024421', 'stu2024421@school.edu', 'scrypt:32768:8:1$ByzZ4ALLdgULNphO$07358312c3d7dbacb2b260c8dd3a087a5bb1c2bc7f2220bf12036eebcaff6be37078926aab1f041e004c989204b5fdaef39d1eca53f68400045bec1fac1fa570', 'Mason', 'Sampson', 17),
(423, 'stu2024423', 'stu2024423@school.edu', 'scrypt:32768:8:1$jbQhIFaG3WaMmzvL$0fdb2afb641b6e25b6c6f0e83216cbe9bf569bcab33a8c1d18886398b388a38895a3106252456c64fe2a6098d93489f8b32f948d76cae3b74496dcd72088faf6', 'Hunter', 'Ebie', 17),
(424, 'stu2024424', 'stu2024424@school.edu', 'scrypt:32768:8:1$7nUpw1ET9GLNzIzS$750db4282ae5decb3e19d3ed3bcd54a1a24d65846a660defd41c8039000f2abde8241c195ef8f59356d0331f233f4b84b2c11830eff9e473e7032fff7d122525', 'Jonathan', 'Fielding', 17),
(425, 'stu2024425', 'stu2024425@school.edu', 'scrypt:32768:8:1$gA9sPHfiqZUkQ9mf$006dc02c11307e901f372bf6eefb9e434a5c122416abebf0eb6d34a667d62d3a5c485cf488c012c13a061e04f6a50b0b60299a63353f5e439ce98de602ffc34d', 'ig_abee', 'Australia', 17),
(426, 'stu2024426', 'stu2024426@school.net', 'scrypt:32768:8:1$0Q9II1alPRlrEmC5$24ca4cca957ec0129600b69ab4c77f109e8761f26de424e0a5dd3faa45c2ec97805484240b7a5eeea9055ee118a9fa740087235af89f9695931612e4ef610115', 'Cooper', 'Roberts', 17);
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `first_name`, `last_name`, `role_id`) VALUES
(427, 'stu2024427', 'stu2024427@school.net', 'scrypt:32768:8:1$X16utmVW80CdzaCf$b49f0005782bc3a75c8aa3263f540ff192c9bcb7f307d16ebf1add4e20d483f0360a2d8b6b902d45afacb73c83a4b700fd9962db1f81818a1ad5ee06f953e41a', 'Luke', 'Roberts', 17),
(428, 'stu20240429', 'stu20240429@schooldomain.com', 'scrypt:32768:8:1$NRWPBUK0KkoJ4ELK$893db06a9be19ff62ed58be367fef8e30ac771275ab8563a20b874463397fc46c2f71c114333dcdf67ecf026abd37d2574b2e714e3d1f444a0ee126dd06f4307', 'Ethan', 'McCaw', 17),
(429, 'stu20240430', 'stu20240430@schooldomain.com', 'scrypt:32768:8:1$8gOMqLy2iXYdMBRl$e3e39d57c8c22a27a84cb144bc46da85c4496895bce3aa11976e2d08c63a19e3eb53c7f06ce77b2b6c03c4984093d1dd3faea8b7f5abbeeb6ab3954a8368ec40', 'Brady', 'Procon', 17),
(430, 'stu20240431', 'stu20240431@schooldomain.com', 'scrypt:32768:8:1$sZZzFfBmiAv2wPpF$5fd02a30259a6a5bf8b1e3647dea0c67e52e8fefb9c11bb1cf0e291c68d20e535f7bd42d88efae10f15ae2f8bd15229e66617c86730e64f8a89a26a9018550df', 'Jack', 'Holm', 17),
(431, 'stu20240432', 'stu20240432@schooldomain.com', 'scrypt:32768:8:1$oP1j7WYsEEGjGL5T$a7074badbed89e9fa8acc0c8efe204d92a2e0ca72597108aa13b4afb92b8491d42ba2e45f6c7271393d6713a1c755fcd0c3ecaf28686d72f9e17822079128511', 'Benjamin', 'McCaw', 17),
(432, 'stu20240433', 'stu20240433@schooldomain.com', 'scrypt:32768:8:1$F9F6lyk1Rk39042P$09aeea566ceb3b3bd6837b4dd204d8e16ad15865ed5a1d85023d744e871ff30a9f70a24012a80b43fba0be45c706b91fe796e6aed8d3700c691a5c126d55ba5c', 'Gia', 'Frenchboy-Normandy', 17),
(433, 'stu20240434', 'stu20240434@school.net', 'scrypt:32768:8:1$SO2NxSGHZcT2QX89$429f7a1b2e5e73fb328df5fb3088f4bcd8d3cdc5f36848c67d4e5e309ef9cb353f78204c27fd18104f2a032462af961c4ecba209b0575c37fd1dde28a666a21f', 'Ryan', 'Chian', 17),
(434, 'stu20240438', '20240438@school.edu', 'scrypt:32768:8:1$eITTwjZsEK6uCeSs$a8adf0471ed16cb244f4e3e74affe02dd01dfd78f6546cbcc57bf09a6e195602c300c408ed530058b3480cbd9450ff897c871bd36eed40cf221f4a4e96f8213a', 'Luke', 'Bowers', 17),
(435, 'stu20240439', '20240439@school.edu', 'scrypt:32768:8:1$RIV9JMnylqRcO3nX$619dbdbc7c5822d5e977632c5650137451f7f6e7c6891aaa878427be1e9270257ce983e5b72417dcfe6f73b739961c449de02831cd15ab27b721e1fd2bd2c3ac', 'Riley', 'Burr', 17),
(436, 'stu20240440', '20240440@school.edu', 'scrypt:32768:8:1$1EEH7IhAlWv7e13u$2d7b40539136576de359bc3a5556f74c47d626d1dd491ba1f42eea8bcc2a3b8a45948f9996667ace99d5bf81a4bdef44c223778f08f88cae9c4a9a595f27f558', 'Aiden', 'Burr', 17),
(437, 'stu20240441', '20240441@school.edu', 'scrypt:32768:8:1$CZmLyfU93epvHtzA$87ea2636147341853a2a90d12d22dcc3c4ac304ee069a967a15792cd355cf77e416a26008176fa44a7196458c6713c116d821ea461d098384246c0127a02f427', 'Isiah', 'Monville', 17),
(438, 'stu20240442', 'stu20240442@school.edu', 'scrypt:32768:8:1$biofI8YIT9F2qIbL$3370519763b69448a3028efa2ab4ea26db6e95c7483a80796a86655a8826da70e2f7fd0100498a0aec5b2b89e27b550ada0802839de32287dcced49534802601', 'Matthew', 'Szalsky', 17),
(440, 'stu20240443', 'stu20240443@school.edu', 'scrypt:32768:8:1$Nmr1ggtnTwusmSUC$82e372a50cc5364f7b96d8b67ab41602be6cef8301fa7643c2bf9d46a80ffea216f3bd7706853186a9e35c2e100fa3b57d221db3748d1f221df4d2ee064fc8ac', 'Deepak', 'Armanan', 17),
(441, 'stu20240444', 'stu20240444@school.edu', 'scrypt:32768:8:1$NfxPI6tFi4FgDLP6$2f66263490e28cfdf6e013fa19e25e6cbeff16407c9422c3c3829fa609278734439dfe6f9ddf6bb29259ee96664cb371eee5988435ee0bae1460fa2f938cc229', 'Ishan', 'Armanan', 17),
(442, 'stu20240445', 'stu20240445@school.edu', 'scrypt:32768:8:1$FgmbNBubuJB4uEmq$a8aad519f997561375450d77761f371639f37be07482b9e129a02b670b61a3d389a84510f6c18c05581c49fffb5543867351a7e1514117d92c47bc1233f9876f', 'Douglass', 'Reynolds', 17),
(443, 'stu20240446', 'stu20240446@school.edu', 'scrypt:32768:8:1$KBtcpJnQbUmgCarH$35a078893440e34467158363d9d13f59a0bf658dcff359edc45c953a326369c5751df2946d1c015e5c10a86517d0c7c79f72cec863393834115bb8d5eb91cfac', 'Samuel', 'Eldridge', 17),
(444, 'stu20240447', 'stu20240447@school.edu', 'scrypt:32768:8:1$lj1k9l0QER7FIXQa$53b228b23afaa7068761d7ac7edd9b7fa47836c2a211f2d6c72d18c66427d89498b2b25fdbbbcd8740f1370b6904a6968d468a96c2f8acf4aa3fbf24eda59e96', 'Blaine', 'Eldridge', 17),
(445, 'stu20240448', 'stu20240448@school.edu', 'scrypt:32768:8:1$hA9ytoIbCsMEdYCS$94bd70112aa8fb42e919ddaf47c081177d2e31f536fe00f5c1ed2e0927decb8ddcc2238c6bb80c778f1b8beddab6f5ecbfc37eac120fca9d962c3779689eff37', 'Luke', 'Eldridge', 17),
(446, 'stu20240449', 'stu20240449@school.edu', 'scrypt:32768:8:1$xnjsLUtgfC2nAObF$eaf0572bdc534b6e647c30a3ff5b4ee6496f662e6ac6713c622a56b92b709f946b1fdf35a2392b4f6a9dfc65d2d59355ee6b15ba7fbcace982ff0367754ab74d', 'Samuel', 'Gilson', 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `student_profile`
--
ALTER TABLE `student_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `student_profile`
--
ALTER TABLE `student_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_profile`
--
ALTER TABLE `student_profile`
  ADD CONSTRAINT `student_profile_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `student_profile_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
