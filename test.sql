-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2021-01-19 16:43:36
-- 服务器版本： 5.5.62-log
-- PHP 版本： 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `admi_log`
--

CREATE TABLE `admi_log` (
  `id` int(100) NOT NULL,
  `m` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `c` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `a` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` int(100) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `ip` int(100) NOT NULL,
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admi_log`
--

INSERT INTO `admi_log` (`id`, `m`, `c`, `a`, `querystring`, `userid`, `username`, `ip`, `time`) VALUES
(1, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610966068'),
(2, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610966069'),
(3, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610966120'),
(4, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610966127'),
(5, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610966128'),
(6, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610966560'),
(7, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610966625'),
(8, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610966629'),
(9, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610966647'),
(10, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610966649'),
(11, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967305'),
(12, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967357'),
(13, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967397'),
(14, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967410'),
(15, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967597'),
(16, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610967602'),
(17, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967607'),
(18, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967644'),
(19, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610967645'),
(20, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610967664'),
(21, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610967666'),
(22, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967667'),
(23, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610967706'),
(24, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610967723'),
(25, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610967727'),
(26, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610967728'),
(27, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610967739'),
(28, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610967752'),
(29, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610967886'),
(30, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968018'),
(31, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968034'),
(32, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610968035'),
(33, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610968039'),
(34, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968200'),
(35, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968202'),
(36, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968221'),
(37, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610968223'),
(38, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968364'),
(39, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968408'),
(40, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968465'),
(41, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968572'),
(42, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968728'),
(43, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968729'),
(44, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968793'),
(45, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968794'),
(46, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968817'),
(47, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968818'),
(48, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610968823'),
(49, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968863'),
(50, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968865'),
(51, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968867'),
(52, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968868'),
(53, 'admin', 'Bguser', 'list', '?findbyname=', 1, 'sead', 1931204454, '1610968883'),
(54, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968884'),
(55, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610968892'),
(56, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968893'),
(57, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968895'),
(58, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610968898'),
(59, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610968924'),
(60, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610968925'),
(61, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610968930'),
(62, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610968931'),
(63, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610969020'),
(64, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610969024'),
(65, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610969043'),
(66, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610969044'),
(67, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610969054'),
(68, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610969055'),
(69, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610969063'),
(70, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610969063'),
(71, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610969209'),
(72, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610969209'),
(73, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610969210'),
(74, 'admin', 'Bguser', 'select', '?findbyname=', 1, 'sead', 1931204454, '1610969211'),
(75, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970255'),
(76, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970256'),
(77, 'admin', 'Bguser', 'select', '?username=sead', 1, 'sead', 1931204454, '1610970260'),
(78, 'admin', 'Bguser', 'select', '?username=', 1, 'sead', 1931204454, '1610970261'),
(79, 'admin', 'Bguser', 'select', '?username=', 1, 'sead', 1931204454, '1610970262'),
(80, 'admin', 'Bguser', 'select', '?username=', 1, 'sead', 1931204454, '1610970262'),
(81, 'admin', 'Bguser', 'select', '?username=sead', 1, 'sead', 1931204454, '1610970296'),
(82, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970439'),
(83, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970440'),
(84, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970478'),
(85, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970478'),
(86, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970549'),
(87, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970550'),
(88, 'admin', 'Bguser', 'select', '?username=', 1, 'sead', 1931204454, '1610970552'),
(89, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931204454, '1610970647'),
(90, 'admin', 'Bguser', 'dee_edit', '?void=1', 1, 'sead', 1931204454, '1610970652'),
(91, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970705'),
(92, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970705'),
(93, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970713'),
(94, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970839'),
(95, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970840'),
(96, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610970846'),
(97, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970847'),
(98, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610970853'),
(99, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610971009'),
(100, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971010'),
(101, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610971048'),
(102, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971049'),
(103, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971054'),
(104, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610971070'),
(105, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971071'),
(106, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610971075'),
(107, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610971087'),
(108, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971087'),
(109, 'admin', 'Bguser', 'sresult', '?username=sd', 1, 'sead', 1931204454, '1610971089'),
(110, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610971891'),
(111, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971891'),
(112, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610971895'),
(113, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610971928'),
(114, 'admin', 'Bguser', 'dee_edit', '?void=1', 1, 'sead', 1931204454, '1610971932'),
(115, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972044'),
(116, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972124'),
(117, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972125'),
(118, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972128'),
(119, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972320'),
(120, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972322'),
(121, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972325'),
(122, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972340'),
(123, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972341'),
(124, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972344'),
(125, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972385'),
(126, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972388'),
(127, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972404'),
(128, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972405'),
(129, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972408'),
(130, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972593'),
(131, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972594'),
(132, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972597'),
(133, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972660'),
(134, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972661'),
(135, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972663'),
(136, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972674'),
(137, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972675'),
(138, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972717'),
(139, 'admin', 'Bguser', 'sresult', '?username=mema', 1, 'sead', 1931204454, '1610972721'),
(140, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972731'),
(141, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972732'),
(142, 'admin', 'Bguser', 'sresult', '?username=orma', 1, 'sead', 1931204454, '1610972736'),
(143, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972760'),
(144, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972760'),
(145, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972763'),
(146, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972797'),
(147, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972797'),
(148, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972798'),
(149, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972800'),
(150, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972856'),
(151, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972857'),
(152, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972861'),
(153, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972875'),
(154, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972876'),
(155, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972879'),
(156, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972890'),
(157, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972891'),
(158, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972894'),
(159, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972903'),
(160, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972904'),
(161, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972906'),
(162, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972950'),
(163, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972951'),
(164, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972953'),
(165, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610972991'),
(166, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610972992'),
(167, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610972994'),
(168, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973025'),
(169, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973026'),
(170, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973029'),
(171, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973033'),
(172, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973034'),
(173, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973036'),
(174, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973047'),
(175, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973048'),
(176, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973050'),
(177, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973070'),
(178, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973071'),
(179, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973073'),
(180, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973096'),
(181, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973097'),
(182, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973099'),
(183, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973109'),
(184, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973110'),
(185, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973112'),
(186, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973173'),
(187, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973173'),
(188, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973175'),
(189, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973194'),
(190, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973196'),
(191, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973276'),
(192, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973277'),
(193, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973281'),
(194, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973294'),
(195, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973295'),
(196, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973297'),
(197, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973337'),
(198, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973338'),
(199, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973340'),
(200, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973370'),
(201, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973371'),
(202, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973373'),
(203, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973381'),
(204, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973381'),
(205, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973385'),
(206, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973411'),
(207, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973412'),
(208, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973422'),
(209, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973423'),
(210, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973425'),
(211, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973446'),
(212, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973447'),
(213, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973450'),
(214, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973470'),
(215, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973471'),
(216, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973473'),
(217, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973512'),
(218, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973513'),
(219, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973516'),
(220, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973553'),
(221, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973554'),
(222, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973557'),
(223, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931204454, '1610973590'),
(224, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931204454, '1610973591'),
(225, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931204454, '1610973593'),
(226, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610974134'),
(227, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610974376'),
(228, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610974520'),
(229, 'admin', 'Stuser', 'select', '', 1, 'sead', 1931204454, '1610974522'),
(230, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610974547'),
(231, 'admin', 'Stuser', 'select', '', 1, 'sead', 1931204454, '1610974548'),
(232, 'admin', 'Stuser', 'sresult', '?username=ll', 1, 'sead', 1931204454, '1610974550'),
(233, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610974581'),
(234, 'admin', 'Stuser', 'select', '', 1, 'sead', 1931204454, '1610974582'),
(235, 'admin', 'Stuser', 'sresult', '?username=ll', 1, 'sead', 1931204454, '1610974584'),
(236, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931204454, '1610974638'),
(237, 'admin', 'Stuser', 'select', '', 1, 'sead', 1931204454, '1610974638'),
(238, 'admin', 'Stuser', 'sresult', '?username=ls', 1, 'sead', 1931204454, '1610974641'),
(239, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974703'),
(240, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974704'),
(241, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974705'),
(242, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974727'),
(243, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974733'),
(244, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974922'),
(245, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974923'),
(246, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610974956'),
(247, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610975062'),
(248, 'admin', 'Menu', 'select', '', 1, 'sead', 1931204454, '1610975063'),
(249, 'admin', 'Menu', 'select', '', 1, 'sead', 1931204454, '1610975068'),
(250, 'admin', 'Menu', 'select', '', 1, 'sead', 1931204454, '1610975113'),
(251, 'admin', 'Menu', 'sresult', '?role_id=1', 1, 'sead', 1931204454, '1610975115'),
(252, 'admin', 'Menu', 'select', '', 1, 'sead', 1931204454, '1610975122'),
(253, 'admin', 'Menu', 'sresult', '?role_id=1', 1, 'sead', 1931204454, '1610975124'),
(254, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610975160'),
(255, 'admin', 'Menu', 'select', '', 1, 'sead', 1931204454, '1610975161'),
(256, 'admin', 'Menu', 'sresult', '?role_id=1', 1, 'sead', 1931204454, '1610975163'),
(257, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610975216'),
(258, 'admin', 'Menu', 'select', '', 1, 'sead', 1931204454, '1610975217'),
(259, 'admin', 'Menu', 'sresult', '?rule_id=1', 1, 'sead', 1931204454, '1610975220'),
(260, 'admin', 'Rule', 'list', '', 1, 'sead', 1931204454, '1610975229'),
(261, 'admin', 'Rule', 'list', '', 1, 'sead', 1931204454, '1610975241'),
(262, 'admin', 'Rule', 'info', '', 1, 'sead', 1931204454, '1610975915'),
(263, 'admin', 'Rule', 'list', '', 1, 'sead', 1931204454, '1610976342'),
(264, 'admin', 'Rule', 'list', '', 1, 'sead', 1931204454, '1610976460'),
(265, 'admin', 'Rule', 'select', '', 1, 'sead', 1931204454, '1610976464'),
(266, 'admin', 'Rule', 'sresult', '?role_id=1', 1, 'sead', 1931204454, '1610976466'),
(267, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610976472'),
(268, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610976475'),
(269, 'admin', 'Menu', 'list', '', 1, 'sead', 1931204454, '1610976481'),
(270, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1610976919'),
(271, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1610977306'),
(272, 'admin', 'Dormanage', 'select', '', 2, 'mema', 1931204454, '1610977307'),
(273, 'admin', 'Dormanage', 'sresult', '?goods_id=1', 2, 'mema', 1931204454, '1610977309'),
(274, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1610977520'),
(275, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1610977555'),
(276, 'admin', 'Cout', 'select', '', 3, 'orma', 1931204454, '1610977559'),
(277, 'admin', 'Cout', 'sresult', '?order_id=202101171610892198801081', 3, 'orma', 1931204454, '1610977562'),
(278, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1610977572'),
(279, 'admin', 'Cout', 'select', '', 3, 'orma', 1931204454, '1610977573'),
(280, 'admin', 'Cout', 'sresult', '?order_id=202101171610892198801081', 3, 'orma', 1931204454, '1610977575'),
(281, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610982817'),
(282, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931205729, '1610982865'),
(283, 'admin', 'Bguser', 'add', '?user_id=4&username=dfdf&passwd=sder345g&role_id=4&status=1', 1, 'sead', 1931205729, '1610982907'),
(284, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610982909'),
(285, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610982965'),
(286, 'admin', 'Bguser', 'dee_edit', '?void=4', 1, 'sead', 1931205729, '1610982967'),
(287, 'admin', 'Bguser', 'dee_edit', '?void=4', 1, 'sead', 1931205729, '1610982974'),
(288, 'admin', 'Bguser', 'do_dee_edit', '?user_id=4&username=ttm&passwd=694e175e58c080450294833d335bebfe&role_id=3&lastloginip=0&lastlogintime=0&status=1', 1, 'sead', 1931205729, '1610983014'),
(289, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610983015'),
(290, 'admin', 'Bguser', 'delete', '', 1, 'sead', 1931205729, '1610983052'),
(291, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610983055'),
(292, 'admin', 'Bguser', 'select', '', 1, 'sead', 1931205729, '1610983526'),
(293, 'admin', 'Bguser', 'sresult', '?username=sead', 1, 'sead', 1931205729, '1610983576'),
(294, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984356'),
(295, 'admin', 'Menu', 'select', '', 1, 'sead', 1931205729, '1610984358'),
(296, 'admin', 'Menu', 'sresult', '?rule_id=1', 1, 'sead', 1931205729, '1610984374'),
(297, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984453'),
(298, 'admin', 'Menu', 'select', '', 1, 'sead', 1931205729, '1610984454'),
(299, 'admin', 'Menu', 'sresult', '?rule_id=1', 1, 'sead', 1931205729, '1610984456'),
(300, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984481'),
(301, 'admin', 'Menu', 'select', '', 1, 'sead', 1931205729, '1610984481'),
(302, 'admin', 'Menu', 'sresult', '?rule_id=1', 1, 'sead', 1931205729, '1610984483'),
(303, 'admin', 'Menu', 'select', '', 1, 'sead', 1931205729, '1610984509'),
(304, 'admin', 'Menu', 'select', '', 1, 'sead', 1931205729, '1610984557'),
(305, 'admin', 'Menu', 'info', '', 1, 'sead', 1931205729, '1610984561'),
(306, 'admin', 'Menu', 'add', '?rule_id=67&parentid=0&name=%E7%BC%96%E8%BE%91%E6%93%8D%E4%BD%9C&icon=erer34&c=menu&a=yolo&display=1&listorder=0', 1, 'sead', 1931205729, '1610984645'),
(307, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984647'),
(308, 'admin', 'Menu', 'select', '', 1, 'sead', 1931205729, '1610984700'),
(309, 'admin', 'Menu', 'dee_edit', '?void=67', 1, 'sead', 1931205729, '1610984704'),
(310, 'admin', 'Menu', 'do_dee_edit', '?rule_id=67&parentid=1&name=%E7%BC%96%E8%BE%91%E6%93%8D%E4%BD%9C&icon=erer34&c=menu&a=yolo&display=1&listorder=0', 1, 'sead', 1931205729, '1610984721'),
(311, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984722'),
(312, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984725'),
(313, 'admin', 'Menu', 'delete', '', 1, 'sead', 1931205729, '1610984773'),
(314, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610984776'),
(315, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610985315'),
(316, 'admin', 'Rule', 'select', '', 1, 'sead', 1931205729, '1610985560'),
(317, 'admin', 'Rule', 'sresult', '?role_id=2', 1, 'sead', 1931205729, '1610985595'),
(318, 'admin', 'Rule', 'info', '', 1, 'sead', 1931205729, '1610985638'),
(319, 'admin', 'Rule', 'add', '?role_id=6&name=%E7%AE%A1%E7%90%86%E5%91%98&rules=78%2C90%2C56', 1, 'sead', 1931205729, '1610985697'),
(320, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610985699'),
(321, 'admin', 'Rule', 'dee_edit', '?void=6', 1, 'sead', 1931205729, '1610985730'),
(322, 'admin', 'Rule', 'do_dee_edit', '?role_id=6&name=%E7%AE%A1%E7%90%86%E5%91%98&rules=78%2C90%2C56%2C70', 1, 'sead', 1931205729, '1610985770'),
(323, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610985771'),
(324, 'admin', 'Rule', 'delete', '', 1, 'sead', 1931205729, '1610985849'),
(325, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610985852'),
(326, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610985853'),
(327, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610985856'),
(328, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610985856'),
(329, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610985860'),
(330, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931205729, '1610985878'),
(331, 'admin', 'Bguser', 'add', '?user_id=5&username=dfdf&passwd=asade2345&role_id=4&status=%E5%B1%B1%E4%B8%9C%E7%9C%81%E9%9D%92%E5%B2%9B%E5%B8%82', 1, 'sead', 1931205729, '1610985909'),
(332, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610985913'),
(333, 'admin', 'Bguser', 'delete', '', 1, 'sead', 1931205729, '1610985917'),
(334, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610985920'),
(335, 'admin', 'Bguser', 'info', '', 1, 'sead', 1931205729, '1610985921'),
(336, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931205729, '1610985944'),
(337, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931205729, '1610985945'),
(338, 'admin', 'Stuser', 'info', '', 1, 'sead', 1931205729, '1610985946'),
(339, 'admin', 'Stuser', 'add', '?user_id=5&username=rtrt&password=erer2312&local=%E5%B1%B1%E4%B8%9C%E7%9C%81%E9%9D%92%E5%B2%9B%E5%B8%82', 1, 'sead', 1931205729, '1610985977'),
(340, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931205729, '1610985978'),
(341, 'admin', 'Stuser', 'dee_edit', '?void=5', 1, 'sead', 1931205729, '1610985998'),
(342, 'admin', 'Stuser', 'dee_edit', '?void=5', 1, 'sead', 1931205729, '1610986009'),
(343, 'admin', 'Stuser', 'do_dee_edit', '?user_id=5&username=rtrt&password=45ggh%3F&local=%E5%B1%B1%E4%B8%9C%E7%9C%81%E9%9D%92%E5%B2%9B%E5%B8%82', 1, 'sead', 1931205729, '1610986047'),
(344, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931205729, '1610986049'),
(345, 'admin', 'Stuser', 'delete', '', 1, 'sead', 1931205729, '1610986068'),
(346, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931205729, '1610986071'),
(347, 'admin', 'Stuser', 'info', '', 1, 'sead', 1931205729, '1610986100'),
(348, 'admin', 'Stuser', 'select', '', 1, 'sead', 1931205729, '1610986119'),
(349, 'admin', 'Stuser', 'sresult', '?username=ll', 1, 'sead', 1931205729, '1610986143'),
(350, 'admin', 'Stuser', 'list', '', 1, 'sead', 1931205729, '1610986296'),
(351, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610986299'),
(352, 'admin', 'Bguser', 'list', '', 1, 'sead', 1931205729, '1610986299'),
(353, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610986300'),
(354, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610986300'),
(355, 'admin', 'Menu', 'list', '', 1, 'sead', 1931205729, '1610986301'),
(356, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610986302'),
(357, 'admin', 'Rule', 'delete', '', 1, 'sead', 1931205729, '1610986303'),
(358, 'admin', 'Rule', 'list', '', 1, 'sead', 1931205729, '1610986304'),
(359, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1611017431'),
(360, 'admin', 'Dormanage', 'info', '', 2, 'mema', 1931204454, '1611017685'),
(361, 'admin', 'Dormanage', 'add', '?goods_id=2&goods_name=%E6%B4%97%E5%8F%91%E6%B0%B4&socket=100&price=77', 2, 'mema', 1931204454, '1611017705'),
(362, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1611017710'),
(363, 'admin', 'Dormanage', 'delete', '', 2, 'mema', 1931204454, '1611017712'),
(364, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1611017715'),
(365, 'admin', 'Dormanage', 'info', '', 2, 'mema', 1931204454, '1611017717'),
(366, 'admin', 'Dormanage', 'add', '?goods_id=2&goods_name=%E6%B4%97%E5%8F%91%E6%B0%B4&socket=100&price=77', 2, 'mema', 1931204454, '1611017729'),
(367, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1611017738'),
(368, 'admin', 'Dormanage', 'dee_edit', '?void=2', 2, 'mema', 1931204454, '1611017753'),
(369, 'admin', 'Dormanage', 'do_dee_edit', '?goods_id=2&goods_name=%E6%B4%97%E5%8F%91%E6%B0%B4&socket=300&price=77', 2, 'mema', 1931204454, '1611017776'),
(370, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1611017777'),
(371, 'admin', 'Dormanage', 'delete', '', 2, 'mema', 1931204454, '1611017802'),
(372, 'admin', 'Dormanage', 'list', '', 2, 'mema', 1931204454, '1611017806'),
(373, 'admin', 'Dormanage', 'select', '', 2, 'mema', 1931204454, '1611017865'),
(374, 'admin', 'Dormanage', 'sresult', '?goods_id=1', 2, 'mema', 1931204454, '1611017895'),
(375, 'admin', 'Dormanage', 'select', '', 2, 'mema', 1931204454, '1611018157'),
(376, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018201'),
(377, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018355'),
(378, 'admin', 'Cout', 'info', '', 3, 'orma', 1931204454, '1611018388'),
(379, 'admin', 'Cout', 'add', '?order_id=2021160452323434&username=gt&goods_id=6&price=34&create_time=2021-01-19+09%3A07%3A56', 3, 'orma', 1931204454, '1611018445'),
(380, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018447'),
(381, 'admin', 'Cout', 'delete', '', 3, 'orma', 1931204454, '1611018466'),
(382, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018469'),
(383, 'admin', 'Cout', 'info', '', 3, 'orma', 1931204454, '1611018470'),
(384, 'admin', 'Cout', 'add', '?order_id=202101181610956487171887&username=dff&goods_id=5&price=45&create_time=2021-01-19+09%3A08%3A67', 3, 'orma', 1931204454, '1611018499'),
(385, 'admin', 'Cout', 'info', '', 3, 'orma', 1931204454, '1611018503'),
(386, 'admin', 'Cout', 'info', '', 3, 'orma', 1931204454, '1611018509'),
(387, 'admin', 'Cout', 'add', '?order_id=202101181310956485671887&username=fg&goods_id=4&price=76&create_time=2021-01-19+09%3A08%3A34', 3, 'orma', 1931204454, '1611018543'),
(388, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018544'),
(389, 'admin', 'Cout', 'dee_edit', '?void=202101181310956485671887', 3, 'orma', 1931204454, '1611018560'),
(390, 'admin', 'Cout', 'do_dee_edit', '?order_id=202101181310956485671887&username=fg&goods_id=4&price=98&create_time=2021-01-19', 3, 'orma', 1931204454, '1611018585'),
(391, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018586'),
(392, 'admin', 'Cout', 'dee_edit', '?void=202101181310956485671887', 3, 'orma', 1931204454, '1611018604'),
(393, 'admin', 'Cout', 'do_dee_edit', '?order_id=202101181310956485671887&username=fg&goods_id=4&price=98&create_time=2021-01-19+09%3A08%3A34', 3, 'orma', 1931204454, '1611018707'),
(394, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018708'),
(395, 'admin', 'Cout', 'delete', '', 3, 'orma', 1931204454, '1611018732'),
(396, 'admin', 'Cout', 'list', '', 3, 'orma', 1931204454, '1611018736'),
(397, 'admin', 'Cout', 'info', '', 3, 'orma', 1931204454, '1611018774'),
(398, 'admin', 'Cout', 'info', '', 3, 'orma', 1931204454, '1611018778'),
(399, 'admin', 'Cout', 'select', '', 3, 'orma', 1931204454, '1611018814'),
(400, 'admin', 'Cout', 'select', '', 3, 'orma', 1931204454, '1611018842'),
(401, 'admin', 'Cout', 'sresult', '?order_id=202101171610894165404200', 3, 'orma', 1931204454, '1611018856');

-- --------------------------------------------------------

--
-- 表的结构 `crm_role`
--

CREATE TABLE `crm_role` (
  `id` int(200) NOT NULL,
  `role_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rules` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_role`
--

INSERT INTO `crm_role` (`id`, `role_id`, `name`, `rules`) VALUES
(1, 1, '系统管理员', '1,4,5,6,12,13,14,15,16,17,18,19,20,21,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54'),
(2, 2, '商品管理员', '2,6,7,8,9,10,11,45,46,55,56'),
(3, 3, '订单管理员', '3,6,22,23,24,25,26,45,46,57,58');

-- --------------------------------------------------------

--
-- 表的结构 `crm_role_user`
--

CREATE TABLE `crm_role_user` (
  `id` int(11) NOT NULL,
  `user_id` int(32) NOT NULL,
  `role_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `crm_role_user`
--

INSERT INTO `crm_role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- 表的结构 `customerlist`
--

CREATE TABLE `customerlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `local` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `customerlist`
--

INSERT INTO `customerlist` (`id`, `user_id`, `username`, `password`, `local`) VALUES
(1, 1, 'll', 'b4f4336f3ed211f724d766e41f3e8313', '北京市海淀区颐和园路5号'),
(2, 2, 'ls', '6c8bd725ca41b67ccc16c1d7e7ac89da', '北京市海淀区颐和园路6号'),
(3, 3, 'an', '0dee9c1094610d6060067a3759bc3716', '北京市大兴区金苑路25号'),
(4, 4, 'deg', '12fd072e58d901d8e7e103c863c6cfd4', '北京市大兴区金苑路27号');

-- --------------------------------------------------------

--
-- 表的结构 `customer_log`
--

CREATE TABLE `customer_log` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `goods_id` int(100) NOT NULL,
  `result` int(3) NOT NULL COMMENT '订单结果(0等待中，1秒杀失败，2秒杀成功)',
  `errormessage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `customer_log`
--

INSERT INTO `customer_log` (`id`, `username`, `ip`, `goods_id`, `result`, `errormessage`) VALUES
(1, 'll', '115.27.215.102', 1, 2, ''),
(2, 'an', '115.27.215.102', 1, 2, ''),
(3, 'deg', '115.27.215.102', 1, 1, '商品已被抢完'),
(4, 'ls', '115.27.215.102', 1, 1, '与go文件链接失败');

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` int(100) NOT NULL,
  `rule_id` int(100) NOT NULL,
  `parentid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `icon` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `display` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1显示，2不显示)',
  `listorder` int(10) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `rule_id`, `parentid`, `name`, `icon`, `c`, `a`, `display`, `listorder`) VALUES
(1, 1, 0, '用户管理', 'xe6a3', 'Sadmin', 'index', 1, 1),
(2, 2, 0, '商品管理', 'xe6a3', 'Dormanage', 'list', 1, 1),
(3, 3, 0, '订单管理', 'xe6a3', 'Cout', 'list', 1, 1),
(4, 4, 1, '后台用户', NULL, 'Bguser', 'list', 1, 2),
(5, 5, 1, '顾客', NULL, 'Stuser', 'list', 1, 2),
(6, 6, 0, '欢迎页面', 'xe761', 'Index', 'index', 1, 0),
(7, 7, 2, '编辑页面', NULL, 'Dormanage', 'dee_edit', 2, 0),
(8, 8, 2, '添加页面', NULL, 'Dormanage', 'info', 2, 0),
(9, 9, 2, '编辑保存', NULL, 'Dormanage', 'do_dee_edit', 2, 0),
(10, 10, 2, '添加保存', NULL, 'Dormanage', 'add', 2, 0),
(11, 11, 2, '删除', NULL, 'Dormanage', 'delete', 2, 0),
(12, 12, 4, '编辑页面', NULL, 'Bguser', 'dee_edit', 2, 0),
(13, 13, 4, '添加页面', NULL, 'Bguser', 'info', 2, 0),
(14, 14, 4, '编辑保存', NULL, 'Bguser', 'do_dee_edit', 2, 0),
(15, 15, 4, '添加保存', NULL, 'Bguser', 'add', 2, 0),
(16, 16, 4, '删除', NULL, 'Bguser', 'delete', 2, 0),
(17, 17, 5, '编辑页面', NULL, 'Stuser', 'dee_edit', 2, 0),
(18, 18, 5, '添加页面', NULL, 'Stuser', 'info', 2, 0),
(19, 19, 5, '编辑保存', NULL, 'Stuser', 'do_dee_edit', 2, 0),
(20, 20, 5, '添加保存', NULL, 'Stuser', 'add', 2, 0),
(21, 21, 5, '删除', NULL, 'Stuser', 'delete', 2, 0),
(22, 22, 3, '编辑页面', NULL, 'Cout', 'dee_edit', 2, 0),
(23, 23, 3, '添加页面', NULL, 'Cout', 'info', 2, 0),
(24, 24, 3, '编辑保存', NULL, 'Cout', 'do_dee_edit', 2, 0),
(25, 25, 3, '添加保存', NULL, 'Cout', 'add', 2, 0),
(26, 26, 3, '删除', NULL, 'Cout', 'delete', 2, 0),
(27, 27, 0, '日志管理', 'xe761', 'Log', 'list', 1, 1),
(28, 28, 27, '编辑页面', NULL, 'Log', 'dee_edit', 2, 0),
(29, 29, 27, '添加页面', NULL, 'Log', 'info', 2, 0),
(30, 30, 27, '编辑保存', NULL, 'Log', 'do_dee_edit', 2, 0),
(31, 31, 27, '添加保存', NULL, 'Log', 'add', 2, 0),
(32, 32, 27, '删除', NULL, 'Log', 'delete', 2, 0),
(33, 33, 0, '目录管理', 'xe761', 'Menu', 'list', 1, 1),
(34, 34, 33, '编辑页面', NULL, 'Menu', 'dee_edit', 2, 0),
(35, 35, 33, '添加页面', NULL, 'Menu', 'info', 2, 0),
(36, 36, 33, '编辑保存', NULL, 'Menu', 'do_dee_edit', 2, 0),
(37, 37, 33, '添加保存', NULL, 'Menu', 'add', 2, 0),
(38, 38, 33, '删除', NULL, 'Menu', 'delete', 2, 0),
(39, 39, 0, '角色权限管理', 'xe761', 'Rule', 'list', 1, 1),
(40, 40, 39, '编辑页面', NULL, 'Rule', 'dee_edit', 2, 0),
(41, 41, 39, '添加页面', NULL, 'Rule', 'info', 2, 0),
(42, 42, 39, '编辑保存', NULL, 'Rule', 'do_dee_edit', 2, 0),
(43, 43, 39, '添加保存', NULL, 'Rule', 'add', 2, 0),
(44, 44, 39, '删除', NULL, 'Rule', 'delete', 2, 0),
(45, 45, 0, '修改密码', NULL, 'Repassword', 'repasswd', 2, 0),
(46, 46, 0, '修改密码保存', NULL, 'Repassword', 're', 2, 0),
(47, 47, 4, '查找', NULL, 'Bguser', 'select', 2, 0),
(48, 48, 4, '查找结果', NULL, 'Bguser', 'sresult', 2, 0),
(49, 49, 5, '查找', NULL, 'Stuser', 'select', 2, 0),
(50, 50, 5, '查找结果', NULL, 'Stuser', 'sresult', 2, 0),
(51, 51, 33, '查找', NULL, 'Menu', 'select', 2, 0),
(52, 52, 33, '查找显示', NULL, 'Menu', 'sresult', 2, 0),
(53, 53, 39, '查找', NULL, 'Rule', 'select', 2, 0),
(54, 54, 39, '查找显示', NULL, 'Rule', 'sresult', 2, 0),
(55, 55, 2, '查找', NULL, 'Dormanage', 'select', 2, 0),
(56, 56, 2, '查找显示', NULL, 'Dormanage', 'sresult', 2, 0),
(57, 57, 3, '查找', NULL, 'Cout', 'select', 2, 0),
(58, 58, 3, '查找显示', NULL, 'Cout', 'sresult', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `m_goods`
--

CREATE TABLE `m_goods` (
  `id` int(100) NOT NULL,
  `goods_id` int(100) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `socket` int(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `m_goods`
--

INSERT INTO `m_goods` (`id`, `goods_id`, `goods_name`, `socket`, `price`) VALUES
(1, 1, '洗衣液', 200, 88);

-- --------------------------------------------------------

--
-- 表的结构 `m_order`
--

CREATE TABLE `m_order` (
  `id` int(100) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `goods_id` int(100) NOT NULL,
  `price` int(100) NOT NULL,
  `create_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `m_order`
--

INSERT INTO `m_order` (`id`, `order_id`, `username`, `goods_id`, `price`, `create_time`) VALUES
(1, '202101171610894165404200', 'll', 1, 88, '2021-01-17 22:36:05'),
(2, '202101171610894165445456', 'ls', 1, 88, '2021-01-17 22:36:05'),
(3, '202101181610956364188081', 'deg', 1, 88, '2021-01-18 15:52:44'),
(4, '202101181610956487171887', 'an', 1, 88, '2021-01-18 15:54:47');

-- --------------------------------------------------------

--
-- 表的结构 `token`
--

CREATE TABLE `token` (
  `id` int(100) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `token` varchar(400) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `token`
--

INSERT INTO `token` (`id`, `username`, `token`) VALUES
(7, 'sead', '010994b2525e5ac34470270a84551353'),
(8, 'orma', 'db73c250e23a06bbe7eb16753d2f2e8a'),
(9, 'mema', '653c2fe9ba6028ee4de9a48d66a761d9');

-- --------------------------------------------------------

--
-- 表的结构 `vipuser`
--

CREATE TABLE `vipuser` (
  `id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `username` varchar(100) CHARACTER SET utf16 NOT NULL,
  `passwd` varchar(100) CHARACTER SET utf16 NOT NULL,
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '是否有效(1:有效；2无效)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `vipuser`
--

INSERT INTO `vipuser` (`id`, `user_id`, `username`, `passwd`, `lastloginip`, `lastlogintime`, `status`) VALUES
(1, 1, 'sead', 'ed3517b59834a1609f75db4a08c6d792', 1931205729, 1610982774, 1),
(2, 2, 'mema', '053cd52a2cb19d50b1cce31431272cb8', 1931204454, 1611017426, 1),
(3, 3, 'orma', '2e866d3e89805d5f4184e29fad967199', 1931204454, 1611018197, 1);

--
-- 转储表的索引
--

--
-- 表的索引 `admi_log`
--
ALTER TABLE `admi_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `crm_role`
--
ALTER TABLE `crm_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_id` (`role_id`);

--
-- 表的索引 `crm_role_user`
--
ALTER TABLE `crm_role_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 表的索引 `customerlist`
--
ALTER TABLE `customerlist`
  ADD UNIQUE KEY `id` (`id`);

--
-- 表的索引 `customer_log`
--
ALTER TABLE `customer_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`),
  ADD KEY `parentid` (`parentid`);

--
-- 表的索引 `m_goods`
--
ALTER TABLE `m_goods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `goods_id` (`goods_id`);

--
-- 表的索引 `m_order`
--
ALTER TABLE `m_order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `vipuser`
--
ALTER TABLE `vipuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admi_log`
--
ALTER TABLE `admi_log`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- 使用表AUTO_INCREMENT `crm_role`
--
ALTER TABLE `crm_role`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `crm_role_user`
--
ALTER TABLE `crm_role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `customerlist`
--
ALTER TABLE `customerlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `customer_log`
--
ALTER TABLE `customer_log`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3460;

--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- 使用表AUTO_INCREMENT `m_goods`
--
ALTER TABLE `m_goods`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `m_order`
--
ALTER TABLE `m_order`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;

--
-- 使用表AUTO_INCREMENT `token`
--
ALTER TABLE `token`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `vipuser`
--
ALTER TABLE `vipuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
