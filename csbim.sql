-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-12-15 11:19:10
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csbim`
--

-- --------------------------------------------------------

--
-- 表的结构 `about_type`
--

CREATE TABLE IF NOT EXISTS `about_type` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(60) NOT NULL COMMENT '分类名称',
  `content` varchar(255) NOT NULL COMMENT '分类内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='关于我们分类表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `about_type`
--

INSERT INTO `about_type` (`id`, `name`, `content`) VALUES
(5, '分类2', '分类2分类2'),
(4, '分类1', '分类1分类1');

-- --------------------------------------------------------

--
-- 表的结构 `about_us`
--

CREATE TABLE IF NOT EXISTS `about_us` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '页面Title',
  `keywords` varchar(100) NOT NULL COMMENT '页面关键字',
  `description` varchar(100) NOT NULL COMMENT '页面描述',
  `flag` varchar(20) NOT NULL COMMENT '标识',
  `content` text NOT NULL COMMENT '内容',
  `type_id` smallint(6) unsigned NOT NULL COMMENT '项目类别',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='关于我们' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `about_us`
--

INSERT INTO `about_us` (`id`, `title`, `keywords`, `description`, `flag`, `content`, `type_id`, `add_time`) VALUES
(5, '', '', '', 'aboutus', 'dasfaaaa', 4, '2014-10-22 09:55:38'),
(4, '', '', '', '', 'asdfdsfsdfadfsasdf', 5, '2014-10-22 09:55:31');

-- --------------------------------------------------------

--
-- 表的结构 `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '模块名称',
  `flag` varchar(30) NOT NULL COMMENT '模块标志',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统模块' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `actions`
--

INSERT INTO `actions` (`id`, `name`, `flag`, `add_time`) VALUES
(1, '友情链接', 'friendlink', '2013-05-23 02:00:11'),
(2, '管理员管理', 'admin', '2013-05-23 02:00:11');

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `pwd` char(32) NOT NULL,
  `originpwd` varchar(20) NOT NULL COMMENT '原始密码',
  `rid` smallint(6) unsigned NOT NULL COMMENT '角色id',
  `last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `account`, `pwd`, `originpwd`, `rid`, `last_time`, `add_time`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', '111111', 0, '2014-11-06 08:32:22', '2013-06-27 19:59:47'),
(15, 'springjzc', '96e79218965eb72c92a549dd5a330112', '111111', 1, '2013-06-27 19:58:41', '2013-06-27 19:58:41'),
(16, 'test', '96e79218965eb72c92a549dd5a330112', '111111', 1, '2014-10-16 07:15:54', '2014-10-15 10:10:32'),
(17, 'cmkj', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '1111', 0, '2014-12-12 00:56:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

CREATE TABLE IF NOT EXISTS `collect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '会员id',
  `nickname` varchar(20) NOT NULL COMMENT '收藏人妮称',
  `mid` int(11) unsigned NOT NULL COMMENT '收藏的3d模型id',
  `title` varchar(50) NOT NULL COMMENT '模型名称',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏日志表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '评论用户id',
  `nickname` varchar(20) NOT NULL COMMENT '评论人妮称',
  `mid` int(11) unsigned NOT NULL COMMENT '被评论的3d模型id',
  `content` tinytext NOT NULL COMMENT '内容',
  `rank` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论等级',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='3D模型评论表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `uid`, `nickname`, `mid`, `content`, `rank`, `add_time`) VALUES
(1, 1, 'qqqqq', 22, 'qqqqqqqqqqqqqqqqqqqqq', 5, '2014-10-23 07:42:48');

-- --------------------------------------------------------

--
-- 表的结构 `correct`
--

CREATE TABLE IF NOT EXISTS `correct` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '纠错用户id',
  `nickname` varchar(20) NOT NULL COMMENT '纠错人妮称',
  `ip` char(14) NOT NULL COMMENT '纠错用户ip地址',
  `page` varchar(20) NOT NULL COMMENT '纠错页面',
  `mid` int(11) unsigned NOT NULL COMMENT '3d模型id',
  `title` varchar(20) NOT NULL COMMENT '标题',
  `content` mediumtext NOT NULL COMMENT '纠错内容',
  `status` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0未处理,1已纠错,2不处理)',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`),
  KEY `status` (`status`),
  KEY `ip` (`ip`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='纠错表' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `correct`
--

INSERT INTO `correct` (`id`, `uid`, `nickname`, `ip`, `page`, `mid`, `title`, `content`, `status`, `add_time`) VALUES
(1, 0, '', '127.0.0.1', '', 21, '大小', '3344', 0, '2014-12-11 16:00:00'),
(2, 0, '', '127.0.0.1', '', 21, '适用空间', '12', 0, '2014-12-11 16:00:00'),
(3, 0, '', '127.0.0.1', '', 24, '适用空间', '14', 0, '2014-12-11 16:00:00'),
(4, 0, '', '127.0.0.1', '', 24, '风格', '7', 0, '2014-12-11 16:00:00'),
(5, 0, '', '127.0.0.1', '', 24, '大小', '12', 0, '2014-12-11 16:00:00'),
(6, 0, '', '127.0.0.1', '', 24, '版本', '24', 0, '2014-12-11 16:00:00'),
(7, 18, 'member1', '127.0.0.1', '', 22, '风格', '7', 0, '2014-12-11 16:00:00'),
(8, 18, 'member1', '127.0.0.1', '', 22, '模型面数', '011', 0, '2014-12-11 16:00:00'),
(9, 0, '', '127.0.0.1', '', 22, '大小', 'we', 0, '2014-12-11 16:00:00'),
(10, 18, 'member1', '127.0.0.1', '', 22, '适用空间', '9', 0, '2014-12-11 16:00:00'),
(11, 18, 'member1', '127.0.0.1', '', 22, '大小', '22', 0, '2014-12-11 16:00:00'),
(12, 0, '', '127.0.0.1', '', 22, '标签', '竹子鸟,鸟', 0, '2014-12-11 16:00:00'),
(13, 0, '', '127.0.0.1', '', 22, '标题', 'dfdfdf23', 0, '2014-12-11 16:00:00'),
(14, 0, '', '127.0.0.1', '', 22, '模型面数', '023', 0, '2014-12-11 16:00:00'),
(15, 0, '', '127.0.0.1', '', 22, '风格', '7', 0, '2014-12-11 16:00:00'),
(17, 0, '', '127.0.0.1', '', 22, '介绍', 'sdfsdf34', 0, '2014-12-11 16:00:00'),
(16, 0, '', '127.0.0.1', '', 22, '适用空间', '9', 0, '2014-12-11 16:00:00'),
(18, 0, '', '127.0.0.1', '', 22, '格式', '18', 0, '2014-12-11 16:00:00'),
(19, 0, '', '127.0.0.1', '', 22, '版本', '24', 0, '2014-12-11 16:00:00'),
(21, 18, 'member1', '127.0.0.1', '', 22, '介绍', '345', 0, '2014-12-11 16:00:00'),
(20, 18, 'member1', '127.0.0.1', '', 22, '标签', '竹子鸟,鸟', 0, '2014-12-11 16:00:00'),
(22, 18, 'member1', '127.0.0.1', '', 22, '标题', 'dfdfdf', 0, '2014-12-11 16:00:00'),
(23, 18, 'member1', '127.0.0.1', '', 21, '标签', '竹子鸟', 0, '2014-12-11 16:00:00'),
(24, 18, 'member1', '127.0.0.1', '', 21, '版本', '24', 0, '2014-12-11 16:00:00'),
(25, 18, 'member1', '127.0.0.1', '', 24, '标签', 'asf', 0, '2014-12-14 16:00:00'),
(26, 18, 'member1', '127.0.0.1', '', 24, '介绍', 'asdv', 0, '2014-12-14 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `credits_log`
--

CREATE TABLE IF NOT EXISTS `credits_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `mid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `flag` varchar(10) NOT NULL COMMENT '积分动作',
  `status` tinyint(1) NOT NULL COMMENT '1为增加,2为减少',
  `credits` tinyint(4) NOT NULL COMMENT '积分',
  `demo` varchar(100) NOT NULL COMMENT '备注',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分日志表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `csbimtest`
--

CREATE TABLE IF NOT EXISTS `csbimtest` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `old_name` varchar(100) NOT NULL,
  `new_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to_uid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '目标用户id',
  `to_email` varchar(20) NOT NULL COMMENT '目标用户邮箱',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮件类型:1下载链接',
  `mid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `page` varchar(20) NOT NULL COMMENT '下载页',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0为未发送,1为已发送)',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `to_email` (`to_email`),
  KEY `type` (`type`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件发送表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(14) NOT NULL COMMENT '反馈用户ip地址',
  `content` text NOT NULL COMMENT '反馈内容',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否看过,0不是，1是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0未处理,1已处理)',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='反馈表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `feedback`
--

INSERT INTO `feedback` (`id`, `uid`, `ip`, `content`, `is_read`, `status`, `add_time`) VALUES
(1, 0, '', 'dfsssfddfsds', 1, 1, '2014-11-06 08:18:27');

-- --------------------------------------------------------

--
-- 表的结构 `friend_link`
--

CREATE TABLE IF NOT EXISTS `friend_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `show_order` (`order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `friend_link`
--

INSERT INTO `friend_link` (`id`, `name`, `url`, `logo`, `order`, `add_time`) VALUES
(13, 'dsdds', 'http://www.baidu.com', '', 2, '2014-10-21 07:22:01'),
(7, 'fdgffg', 'http://www.baidu.com', '14482801227800.jpg', 4, '2014-10-21 06:51:12'),
(9, '百度2', 'http://www.sina.com', '13022535620400.jpg', 3, '2014-10-21 06:51:12');

-- --------------------------------------------------------

--
-- 表的结构 `key_search`
--

CREATE TABLE IF NOT EXISTS `key_search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `ip` char(14) NOT NULL COMMENT '搜索ip',
  `keyword` varchar(30) NOT NULL,
  `search_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '搜索时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='关键词搜索表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `key_search`
--

INSERT INTO `key_search` (`id`, `uid`, `ip`, `keyword`, `search_time`) VALUES
(1, 0, '127.0.0.1', '沙发', '2014-09-25 04:10:11'),
(2, 0, '127.0.0.1', '桌子', '2014-09-25 04:10:11'),
(3, 1, '168.1.12.13', '沙发', '2014-09-25 05:27:06');

-- --------------------------------------------------------

--
-- 表的结构 `mcategory`
--

CREATE TABLE IF NOT EXISTS `mcategory` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(60) NOT NULL COMMENT '分类名称',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='3d模型分类表' AUTO_INCREMENT=126 ;

--
-- 转存表中的数据 `mcategory`
--

INSERT INTO `mcategory` (`id`, `name`, `parent_id`, `order`) VALUES
(1, '室内场景模型', 0, 0),
(2, '家具/软装', 0, 0),
(3, '灯具/灯饰', 0, 0),
(4, '日用/饰品', 0, 0),
(5, '厨卫/洁具', 0, 0),
(6, '器材/设备', 0, 0),
(7, '构件/五金', 0, 0),
(8, '户外/建筑', 0, 0),
(9, '交通/车船', 0, 0),
(10, '植物', 0, 0),
(11, '人物', 0, 0),
(12, '动物', 0, 0),
(13, '家居/别墅', 1, 0),
(14, '餐饮/宾馆', 1, 0),
(15, '接待/娱乐', 1, 0),
(16, '办公/机构', 1, 0),
(17, '商展/零售', 1, 0),
(18, '医疗/健康', 1, 0),
(19, '专业/其他', 1, 0),
(20, '沙发', 2, 0),
(21, '桌椅', 2, 0),
(22, '床具', 2, 0),
(23, '橱柜', 2, 0),
(24, '案几', 2, 0),
(25, '凳', 2, 0),
(26, '窗帘/软饰', 2, 0),
(27, '其他', 2, 0),
(28, '顶灯', 3, 0),
(29, '壁灯', 3, 0),
(30, '台灯', 3, 0),
(31, '落地灯', 3, 0),
(32, '格栅灯', 3, 0),
(33, '射灯/筒灯', 3, 0),
(34, '其他灯饰', 3, 0),
(35, '雕塑', 4, 0),
(36, '器皿', 4, 0),
(37, '食物', 4, 0),
(38, '服饰', 4, 0),
(39, '办公/文具', 4, 0),
(40, '其他饰品', 4, 0),
(41, '马桶', 5, 0),
(42, '面盆', 5, 0),
(43, '浴缸', 5, 0),
(44, '龙头', 5, 0),
(45, '厨房器具', 5, 0),
(46, '其他厨卫', 5, 0),
(47, '电器设备', 6, 0),
(48, '体育器材', 6, 0),
(49, '儿童器材', 6, 0),
(50, '音乐美术', 6, 0),
(51, '游乐设备', 6, 0),
(52, '军事器材', 6, 0),
(53, '商展器材', 6, 0),
(54, '工业设备', 6, 0),
(55, '其他器材', 6, 0),
(56, '楼梯', 7, 0),
(57, '栏杆', 7, 0),
(58, '柱子', 7, 0),
(59, '门窗', 7, 0),
(60, '隔断', 7, 0),
(61, '五金件', 7, 0),
(62, '其他构件', 7, 0),
(63, '建筑', 8, 0),
(64, '桥梁', 8, 0),
(65, '景观设施', 8, 0),
(66, '构件', 8, 0),
(67, '其他建筑', 8, 0),
(68, '机动车', 9, 0),
(69, '非机动车', 9, 0),
(70, '航空', 9, 0),
(71, '舰船', 9, 0),
(72, '其他交通工具', 9, 0),
(73, '室内/盆栽', 10, 0),
(74, '藤本植物', 10, 0),
(75, '灌木', 10, 0),
(76, '阔叶乔木', 10, 0),
(77, '针叶乔木', 10, 0),
(78, '热带植物', 10, 0),
(79, '沙漠植物', 10, 0),
(80, '其他植物', 10, 0),
(81, '男人', 11, 0),
(82, '女人', 11, 0),
(83, '儿童', 11, 0),
(84, '老人', 11, 0),
(85, '哺乳', 12, 0),
(86, '爬行', 12, 0),
(87, '水生动物', 12, 0),
(88, '飞行动物', 12, 0),
(89, '客厅', 13, 0),
(90, '餐厅', 13, 0),
(91, '卧室', 13, 0),
(92, '儿童房', 13, 0),
(93, '书房', 13, 0),
(94, '厨房', 13, 0),
(95, '卫生间', 13, 0),
(96, '桑拿房', 13, 0),
(97, '工作间', 13, 0),
(98, '玄关', 13, 0),
(99, '佣人房', 13, 0),
(100, '洗衣房', 13, 0),
(101, '健身房', 13, 0),
(102, '棋牌室', 13, 0),
(103, '茶室', 13, 0),
(104, '酒窖', 13, 0),
(105, '衣帽间', 13, 0),
(106, '宴会厅', 14, 0),
(107, '礼堂', 14, 0),
(108, '多功能厅', 14, 0),
(109, '专业厨房', 14, 0),
(110, '餐饮包房', 14, 0),
(111, '大厅', 14, 0),
(112, '客房', 14, 0),
(113, '套房', 14, 0),
(114, '会所', 15, 0),
(115, 'KTV', 15, 0),
(116, '酒吧', 15, 0),
(117, '洗浴', 15, 0),
(118, '足疗', 15, 0),
(119, '休闲大厅', 15, 0),
(120, '放映厅', 15, 0),
(121, '按摩房', 15, 0),
(122, 'SPA', 15, 0),
(123, '咖啡厅', 15, 0),
(124, 'dsddssd', 0, 0),
(125, 'aaaa', 89, 0);

-- --------------------------------------------------------

--
-- 表的结构 `mcategory_export`
--

CREATE TABLE IF NOT EXISTS `mcategory_export` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(60) NOT NULL COMMENT '分类名称',
  `parent_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级分类',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `extra_catid` varchar(30) NOT NULL DEFAULT '0' COMMENT '外部的分类id',
  `extra_parentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '外部有父级分类id,0为顶级',
  `extra_child` tinyint(1) NOT NULL COMMENT '外部是否有子分类,0为否，1为有',
  `extra_catename` varchar(50) NOT NULL COMMENT '外部分类名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='3d模型分类表' AUTO_INCREMENT=126 ;

--
-- 转存表中的数据 `mcategory_export`
--

INSERT INTO `mcategory_export` (`id`, `name`, `parent_id`, `order`, `extra_catid`, `extra_parentid`, `extra_child`, `extra_catename`) VALUES
(1, '室内场景模型', 0, 0, '521,662', 547, 1, '室内家装模型,室内工装模型'),
(2, '家具/软装', 0, 0, '6', 547, 1, '家具组合'),
(3, '灯具/灯饰', 0, 0, '0', 0, 0, ''),
(4, '日用/饰品', 0, 0, '0', 0, 0, ''),
(5, '厨卫/洁具', 0, 0, '0', 0, 0, ''),
(6, '器材/设备', 0, 0, '0', 0, 0, ''),
(7, '构件/五金', 0, 0, '0', 0, 0, ''),
(8, '户外/建筑', 0, 0, '0', 0, 0, ''),
(9, '交通/车船', 0, 0, '0', 0, 0, ''),
(10, '植物', 0, 0, '0', 0, 0, ''),
(11, '人物', 0, 0, '0', 0, 0, ''),
(12, '动物', 0, 0, '0', 0, 0, ''),
(13, '家居/别墅', 1, 0, '0', 0, 0, ''),
(14, '餐饮/宾馆', 1, 0, '0', 0, 0, ''),
(15, '接待/娱乐', 1, 0, '0', 0, 0, ''),
(16, '办公/机构', 1, 0, '0', 0, 0, ''),
(17, '商展/零售', 1, 0, '0', 0, 0, ''),
(18, '医疗/健康', 1, 0, '0', 0, 0, ''),
(19, '专业/其他', 1, 0, '0', 0, 0, ''),
(20, '沙发', 2, 0, '12,626', 6, 0, '沙发,沙发茶几组合'),
(21, '桌椅', 2, 0, '11,13,621', 6, 0, '桌,椅,桌椅'),
(22, '床具', 2, 0, '21', 6, 0, '床'),
(23, '橱柜', 2, 0, '20', 6, 0, '柜'),
(24, '案几', 2, 0, '622', 6, 0, '架'),
(25, '凳', 2, 0, '625', 6, 0, '凳'),
(26, '窗帘/软饰', 2, 0, '35', 6, 0, '窗帘'),
(27, '其他', 2, 0, '508,623,624', 6, 0, '相框,背景墙,电视墙'),
(28, '顶灯', 3, 0, '0', 0, 0, ''),
(29, '壁灯', 3, 0, '0', 0, 0, ''),
(30, '台灯', 3, 0, '0', 0, 0, ''),
(31, '落地灯', 3, 0, '0', 0, 0, ''),
(32, '格栅灯', 3, 0, '0', 0, 0, ''),
(33, '射灯/筒灯', 3, 0, '0', 0, 0, ''),
(34, '其他灯饰', 3, 0, '0', 0, 0, ''),
(35, '雕塑', 4, 0, '0', 0, 0, ''),
(36, '器皿', 4, 0, '16', 6, 0, '餐具'),
(37, '食物', 4, 0, '0', 0, 0, ''),
(38, '服饰', 4, 0, '0', 0, 0, ''),
(39, '办公/文具', 4, 0, '0', 0, 0, ''),
(40, '其他饰品', 4, 0, '0', 0, 0, ''),
(41, '马桶', 5, 0, '0', 0, 0, ''),
(42, '面盆', 5, 0, '0', 0, 0, ''),
(43, '浴缸', 5, 0, '0', 0, 0, ''),
(44, '龙头', 5, 0, '0', 0, 0, ''),
(45, '厨房器具', 5, 0, '0', 0, 0, ''),
(46, '其他厨卫', 5, 0, '0', 0, 0, ''),
(47, '电器设备', 6, 0, '0', 0, 0, ''),
(48, '体育器材', 6, 0, '0', 0, 0, ''),
(49, '儿童器材', 6, 0, '0', 0, 0, ''),
(50, '音乐美术', 6, 0, '0', 0, 0, ''),
(51, '游乐设备', 6, 0, '0', 0, 0, ''),
(52, '军事器材', 6, 0, '0', 0, 0, ''),
(53, '商展器材', 6, 0, '0', 0, 0, ''),
(54, '工业设备', 6, 0, '0', 0, 0, ''),
(55, '其他器材', 6, 0, '0', 0, 0, ''),
(56, '楼梯', 7, 0, '0', 0, 0, ''),
(57, '栏杆', 7, 0, '0', 0, 0, ''),
(58, '柱子', 7, 0, '0', 0, 0, ''),
(59, '门窗', 7, 0, '0', 0, 0, ''),
(60, '隔断', 7, 0, '0', 0, 0, ''),
(61, '五金件', 7, 0, '0', 0, 0, ''),
(62, '其他构件', 7, 0, '0', 0, 0, ''),
(63, '建筑', 8, 0, '0', 0, 0, ''),
(64, '桥梁', 8, 0, '0', 0, 0, ''),
(65, '景观设施', 8, 0, '0', 0, 0, ''),
(66, '构件', 8, 0, '0', 0, 0, ''),
(67, '其他建筑', 8, 0, '0', 0, 0, ''),
(68, '机动车', 9, 0, '0', 0, 0, ''),
(69, '非机动车', 9, 0, '0', 0, 0, ''),
(70, '航空', 9, 0, '0', 0, 0, ''),
(71, '舰船', 9, 0, '0', 0, 0, ''),
(72, '其他交通工具', 9, 0, '0', 0, 0, ''),
(73, '室内/盆栽', 10, 0, '0', 0, 0, ''),
(74, '藤本植物', 10, 0, '0', 0, 0, ''),
(75, '灌木', 10, 0, '0', 0, 0, ''),
(76, '阔叶乔木', 10, 0, '0', 0, 0, ''),
(77, '针叶乔木', 10, 0, '0', 0, 0, ''),
(78, '热带植物', 10, 0, '0', 0, 0, ''),
(79, '沙漠植物', 10, 0, '0', 0, 0, ''),
(80, '其他植物', 10, 0, '0', 0, 0, ''),
(81, '男人', 11, 0, '0', 0, 0, ''),
(82, '女人', 11, 0, '0', 0, 0, ''),
(83, '儿童', 11, 0, '0', 0, 0, ''),
(84, '老人', 11, 0, '0', 0, 0, ''),
(85, '哺乳', 12, 0, '0', 0, 0, ''),
(86, '爬行', 12, 0, '0', 0, 0, ''),
(87, '水生动物', 12, 0, '0', 0, 0, ''),
(88, '飞行动物', 12, 0, '0', 0, 0, ''),
(89, '客厅', 13, 0, '75,660', 521, 0, '客厅,过道'),
(90, '餐厅', 13, 0, '522', 521, 0, '餐厅'),
(91, '卧室', 13, 0, '0', 0, 0, '卧室'),
(92, '儿童房', 13, 0, '0', 0, 0, ''),
(93, '书房', 13, 0, '537', 521, 0, '书房'),
(94, '厨房', 13, 0, '534', 521, 0, '厨房'),
(95, '卫生间', 13, 0, '536', 521, 0, '卫生间'),
(96, '桑拿房', 13, 0, '0', 0, 0, ''),
(97, '工作间', 13, 0, '0', 0, 0, ''),
(98, '玄关', 13, 0, '0', 0, 0, ''),
(99, '佣人房', 13, 0, '0', 0, 0, ''),
(100, '洗衣房', 13, 0, '0', 0, 0, ''),
(101, '健身房', 13, 0, '0', 0, 0, ''),
(102, '棋牌室', 13, 0, '0', 0, 0, ''),
(103, '茶室', 13, 0, '0', 0, 0, ''),
(104, '酒窖', 13, 0, '0', 0, 0, ''),
(105, '衣帽间', 13, 0, '0', 0, 0, ''),
(106, '宴会厅', 14, 0, '662', 547, 0, '大堂/大厅'),
(107, '礼堂', 14, 0, '0', 0, 0, ''),
(108, '多功能厅', 14, 0, '0', 0, 0, ''),
(109, '专业厨房', 14, 0, '0', 0, 0, ''),
(110, '餐饮包房', 14, 0, '0', 0, 0, ''),
(111, '大厅', 14, 0, '0', 0, 0, ''),
(112, '客房', 14, 0, '0', 0, 0, ''),
(113, '套房', 14, 0, '0', 0, 0, ''),
(114, '会所', 15, 0, '0', 0, 0, ''),
(115, 'KTV', 15, 0, '0', 0, 0, ''),
(116, '酒吧', 15, 0, '0', 0, 0, ''),
(117, '洗浴', 15, 0, '0', 0, 0, ''),
(118, '足疗', 15, 0, '0', 0, 0, ''),
(119, '休闲大厅', 15, 0, '0', 0, 0, ''),
(120, '放映厅', 15, 0, '0', 0, 0, ''),
(121, '按摩房', 15, 0, '0', 0, 0, ''),
(122, 'SPA', 15, 0, '0', 0, 0, ''),
(123, '咖啡厅', 15, 0, '0', 0, 0, ''),
(124, 'dsddssd', 0, 0, '0', 0, 0, ''),
(125, 'aaaa', 89, 0, '0', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `mdict`
--

CREATE TABLE IF NOT EXISTS `mdict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(200) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='3d模型字典表' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `mdict`
--

INSERT INTO `mdict` (`id`, `name`, `parent_id`, `code`, `sort`) VALUES
(1, '风格', 0, 'style', 0),
(2, '适用空间', 0, 'space', 0),
(3, '文件格式', 0, 'format', 0),
(4, '版本', 0, 'version', 0),
(5, '西式风情', 1, '', 0),
(6, '东方意境', 1, '', 0),
(7, '现代时尚', 1, '', 0),
(8, '个性混搭', 1, '', 0),
(9, '酒店/餐饮', 2, '', 0),
(10, '办公/机构', 2, '', 0),
(11, '商业/零售', 2, '', 0),
(12, '健康/医疗', 2, '', 0),
(13, '家居/别墅', 2, '', 0),
(14, '酒店/宾馆', 2, '', 0),
(15, '娱乐/酒吧', 2, '', 0),
(16, '户外/休闲', 2, '', 0),
(17, '工业/厂房', 2, '', 0),
(18, 'max', 3, '', 0),
(19, '3ds', 3, '', 0),
(20, 'obj', 3, '', 0),
(21, 'dwg', 3, '', 0),
(22, 'lwo', 3, '', 0),
(23, 'vrml', 3, '', 0),
(24, '2009版', 4, '', 0),
(25, '2010版', 4, '', 0),
(26, '2011版', 4, '', 0),
(27, '2012版', 4, '', 0),
(28, '取消订阅', 0, 'cancel_subscribe_reason', 0),
(29, '网站异常', 28, '', 0),
(30, '\r\n网站无法正常连接，网站异常', 28, '', 0),
(31, '资讯类信息不全', 28, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `meta`
--

CREATE TABLE IF NOT EXISTS `meta` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '网站名称',
  `keywords` varchar(120) NOT NULL COMMENT '关键词',
  `description` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='seo设置' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `default_pic_id` int(11) unsigned NOT NULL COMMENT '默认模型图片id',
  `default_pic` varchar(50) NOT NULL,
  `No` int(11) unsigned NOT NULL COMMENT 'id号',
  `rar_file` varchar(50) NOT NULL COMMENT '模型压缩包url',
  `mcategory_path` varchar(10) NOT NULL COMMENT '分类id路径',
  `uid` int(11) unsigned NOT NULL COMMENT '上传的用户id',
  `space_id` int(11) unsigned NOT NULL COMMENT '适用空间id',
  `file_size` varchar(8) NOT NULL COMMENT '文件大小',
  `format_id` int(11) unsigned NOT NULL COMMENT '文件格式id',
  `face_num` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '模型面数',
  `is_map` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '材质贴图(有或无)，1为有',
  `is_animation` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '动画(有或无)1为有',
  `is_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定 1为绑定',
  `is_cad` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否cad 1为cad',
  `is_lights` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '灯光(有或无)，1为有',
  `style_id` int(11) unsigned NOT NULL COMMENT '模型风格id',
  `version_id` int(11) unsigned NOT NULL COMMENT '版本id',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文件来源，0为共享，1为原创',
  `is_flat` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否平面布置图，1为是',
  `is_drawing` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有施工图，1为是',
  `is_entity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是实体，1为是',
  `is_entity_link` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有实物链接',
  `is_psd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否psd后期,1为是',
  `is_recom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐,1为是',
  `recom_pos` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐位置,1为首页banner,2为首页列表',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `is_recom` (`is_recom`),
  KEY `recom_pos` (`recom_pos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='3D模型表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `model`
--

INSERT INTO `model` (`id`, `title`, `description`, `default_pic_id`, `default_pic`, `No`, `rar_file`, `mcategory_path`, `uid`, `space_id`, `file_size`, `format_id`, `face_num`, `is_map`, `is_animation`, `is_bind`, `is_cad`, `is_lights`, `style_id`, `version_id`, `source`, `is_flat`, `is_drawing`, `is_entity`, `is_entity_link`, `is_psd`, `is_recom`, `recom_pos`, `is_del`, `add_time`) VALUES
(1, 'sdffsd', '', 13, '20140930/pic13342384937600.jpg', 0, '20140930/file12491361855100.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2014-09-30 04:49:13'),
(2, '现代沙发凳', '配饰用沙发', 11, '20140930/pic13282981877300.jpg', 0, '20140930/file12534228213000.zip', ',2,20,', 1, 13, '', 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2014-09-30 04:53:42'),
(3, 'ddddd', '', 12, '20140930/pic13312190033800.jpg', 0, '20140930/file12553963805000.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2014-09-30 04:55:39'),
(4, '客厅新古典现代沙发', '', 1, '20140930/pic13061065312200.jpg', 0, '20140930/file13005028694600.zip', '', 1, 0, '', 18, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2014-09-30 05:00:50'),
(5, 'ddddd', '', 2, '20140930/pic13064393740500.jpg', 0, '20140930/file13063508895000.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, '2014-09-30 05:06:35'),
(6, '爱丽丝童话沙发', '', 4, '20140930/pic13084523110500.jpg', 0, '20140930/file13070419073900.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, '2014-09-30 05:07:04'),
(7, '现代单人沙发', '2009版本', 3, '20140930/pic13073875074200.jpg', 0, '20140930/file13073158010500.zip', ',2,20,', 1, 13, '', 18, 0, 0, 0, 0, 0, 0, 7, 24, 0, 0, 0, 0, 0, 0, 1, 2, 0, '2014-09-30 05:07:31'),
(8, '现代单人沙发', '', 5, '20140930/pic13102014985400.jpg', 0, '20140930/file13100730734200.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, '2014-09-30 05:10:07'),
(9, '现代时尚吸顶玻璃瓶吊灯', '2009版本', 6, '20140930/pic13124841361800.jpg', 0, '20140930/file13124095332100.zip', ',3,28,', 1, 13, '', 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, '2014-09-30 05:12:40'),
(10, '现代莲花吊顶客厅吸顶灯', '2009版本', 7, '20140930/pic13140264079500.jpg', 0, '20140930/file13135423557300.zip', ',3,28,', 1, 13, '', 18, 0, 0, 0, 0, 0, 0, 7, 27, 0, 0, 0, 0, 0, 0, 0, 2, 0, '2014-09-30 05:13:54'),
(11, '圣诞节专用节日灯具', '经检查为2010', 8, '20140930/pic13171917413200.jpg', 0, '20140930/file13171240242300.zip', ',3,30,', 1, 13, '', 18, 0, 0, 0, 0, 0, 0, 7, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-09-30 05:17:12'),
(12, '欧式豪华椅边柜组合', '2009版本， 包含床 床品 布艺 家具组合', 9, '20140930/pic13191129171000.jpg', 0, '20140930/file13190212088200.zip', ',2,22,', 1, 13, '', 18, 0, 0, 0, 0, 0, 0, 7, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-09-30 05:19:02'),
(13, '新古典现代床具组合', '2009版本的，包含床 ，高精度配饰', 10, '20140930/pic13221176471600.jpg', 0, '20140930/file13220510035900.zip', ',2,22,', 1, 13, '', 0, 0, 0, 0, 0, 0, 0, 6, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-09-30 05:22:05'),
(14, 'aaa', '', 0, '', 0, '20141008/file14134451401300.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 06:13:44'),
(15, 'aaa', '', 0, '', 0, '20141008/file14141083551800.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 06:14:10'),
(16, 'qqqq', '', 16, '20141008/pic14530315792000.jpg', 0, '20141008/file14524417483400.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 06:52:44'),
(17, 'ffff', '', 0, '', 0, '20141008/file15034755177700.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 07:03:47'),
(18, 'fddfdfs', '', 0, '', 0, '20141008/file15054393243300.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 07:05:43'),
(19, 'hghg', '', 0, '', 0, '20141008/file15081351798900.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 07:08:13'),
(20, 'sdasdasd', '', 18, '20141008/pic15582159604100.jpg', 0, '20141008/file15404644469000.rar', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-08 07:40:46'),
(21, 'gfddfs', 'aaaa', 17, '20141008/pic15535750793600.jpg', 0, '20141008/file15495563510200.rar', ',1,14,107,', 1, 10, '', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, '2014-10-08 07:49:55'),
(22, 'dfdfdf', 'sdfsdf', 24, '20141009/pic12053663107400.jpg', 0, '20141009/file12052867861900.rar', ',1,13,90,', 1, 10, '', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, '2014-10-09 04:05:28'),
(23, 'dddsssa', 'sadasdsdadsa', 25, '20141030/pic15462287511400.jpg', 0, '20141030/file15281114667100.rar', ',1,14,108,', 1, 10, '', 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-30 07:28:11'),
(24, 'dddd', '', 0, '', 0, '20141030/file17305146965700.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-30 09:30:51'),
(25, 'rrrrr', '', 0, '', 0, '20141030/file17313765829900.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-30 09:31:37'),
(26, 'aaa', '', 0, '', 0, '20141031/file10572727413400.zip', '', 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-10-31 02:57:27'),
(27, '1234', NULL, 26, '20141215/pic14261986798200.jpg', 0, '20141215/file14255235340800.rar', '', 18, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2014-12-15 06:25:52');

-- --------------------------------------------------------

--
-- 表的结构 `model_entity`
--

CREATE TABLE IF NOT EXISTS `model_entity` (
  `mid` int(11) unsigned NOT NULL COMMENT '3d模型id',
  `company` varchar(50) NOT NULL COMMENT '公司名称',
  `brand` varchar(50) NOT NULL COMMENT '品牌',
  `Number` varchar(50) NOT NULL COMMENT '型号',
  `length` varchar(50) NOT NULL COMMENT '模型长度',
  `width` varchar(50) NOT NULL COMMENT '模型宽度',
  `hight` varchar(50) NOT NULL COMMENT '模型高度',
  `object_num` smallint(6) NOT NULL DEFAULT '0' COMMENT '物体个数',
  `orgin` varchar(20) NOT NULL COMMENT '产地',
  `link` varchar(50) NOT NULL COMMENT '购买链接',
  `eprice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实物价格',
  UNIQUE KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='3D模型商品表';

--
-- 转存表中的数据 `model_entity`
--

INSERT INTO `model_entity` (`mid`, `company`, `brand`, `Number`, `length`, `width`, `hight`, `object_num`, `orgin`, `link`, `eprice`) VALUES
(13, '', '', '', '', '', '', 0, '', '', '0.00'),
(22, '', '', '', '', '', '', 0, '', '', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `model_ext`
--

CREATE TABLE IF NOT EXISTS `model_ext` (
  `mid` int(11) unsigned NOT NULL COMMENT '3d模型id',
  `tags` varchar(255) NOT NULL COMMENT '相关标签(多个用逗号分隔)',
  `down_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '下载类别：0未登陆就免费,1登录后才免费,2凭稅分,3付费',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '付费下载需要的价格',
  `credits` smallint(6) NOT NULL DEFAULT '0' COMMENT '凭积分下载需要的积分',
  `reback_credit` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '返还积分',
  `down_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `view_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `collect_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `comment_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评价次数',
  `score` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '评价总平均分数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态:(未审核0，已审核通过1,未通过2)',
  `reason` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '未通过理由',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `publish_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  UNIQUE KEY `mid` (`mid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='3D模型扩展表';

--
-- 转存表中的数据 `model_ext`
--

INSERT INTO `model_ext` (`mid`, `tags`, `down_type`, `price`, `credits`, `reback_credit`, `down_num`, `view_num`, `collect_num`, `comment_num`, `score`, `status`, `reason`, `modify_time`, `publish_time`) VALUES
(10, '', 1, '0.00', 0, 0, 0, 0, 0, 0, 0, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '节日灯具,儿童灯具,娱乐', 2, '0.00', 20, 0, 0, 0, 0, 0, 0, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '床,卧室家具,床头柜,组合', 1, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '新古典,中', 3, '11.00', 35, 0, 0, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '竹子鸟', 0, '0.00', 0, 0, 1, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '竹子鸟,鸟', 0, '0.00', 0, 0, 2, 0, 0, 1, 5, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'za', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '', 3, '0.01', 0, 0, 11, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '', 0, '0.00', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `model_pic`
--

CREATE TABLE IF NOT EXISTS `model_pic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) unsigned NOT NULL COMMENT '3d模型id',
  `pic` varchar(50) NOT NULL COMMENT '图片',
  `order` tinyint(1) unsigned NOT NULL DEFAULT '99' COMMENT '排序',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='3D模型图片表' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `model_pic`
--

INSERT INTO `model_pic` (`id`, `mid`, `pic`, `order`, `add_time`) VALUES
(1, 4, '20140930/pic13061065312200.jpg', 99, '2014-09-30 05:06:10'),
(2, 5, '20140930/pic13064393740500.jpg', 99, '2014-09-30 05:06:44'),
(3, 7, '20140930/pic13073875074200.jpg', 99, '2014-09-30 05:07:38'),
(4, 6, '20140930/pic13084523110500.jpg', 99, '2014-09-30 05:08:45'),
(5, 8, '20140930/pic13102014985400.jpg', 99, '2014-09-30 05:10:20'),
(6, 9, '20140930/pic13124841361800.jpg', 99, '2014-09-30 05:12:48'),
(7, 10, '20140930/pic13140264079500.jpg', 99, '2014-09-30 05:14:02'),
(8, 11, '20140930/pic13171917413200.jpg', 99, '2014-09-30 05:17:19'),
(9, 12, '20140930/pic13191129171000.jpg', 99, '2014-09-30 05:19:11'),
(10, 13, '20140930/pic13221176471600.jpg', 99, '2014-09-30 05:22:11'),
(11, 2, '20140930/pic13282981877300.jpg', 99, '2014-09-30 05:28:29'),
(12, 3, '20140930/pic13312190033800.jpg', 99, '2014-09-30 05:31:21'),
(13, 1, '20140930/pic13342384937600.jpg', 99, '2014-09-30 05:34:23'),
(14, 13, '20140930/pic13475555159000.jpg', 99, '2014-09-30 05:47:55'),
(15, 12, '20140930/pic13484468183300.jpg', 99, '2014-09-30 05:48:44'),
(16, 16, '20141008/pic14530315792000.jpg', 99, '2014-10-08 06:53:03'),
(17, 21, '20141008/pic15535750793600.jpg', 99, '2014-10-08 07:53:57'),
(18, 20, '20141008/pic15582159604100.jpg', 99, '2014-10-08 07:58:21'),
(19, 20, '20141008/pic15582934948500.jpg', 99, '2014-10-08 07:58:29'),
(20, 21, '20141008/pic16302429001300.png', 99, '2014-10-08 08:30:24'),
(21, 21, '20141008/pic16312579553100.png', 99, '2014-10-08 08:31:25'),
(22, 21, '20141008/pic16324226990500.jpg', 99, '2014-10-08 08:32:42'),
(23, 21, '20141008/pic16324685716800.jpg', 99, '2014-10-08 08:32:46'),
(24, 22, '20141009/pic12053663107400.jpg', 99, '2014-10-09 04:05:36'),
(25, 23, '20141030/pic15462287511400.jpg', 99, '2014-10-30 07:46:23'),
(27, 27, '20141215/pic14263020357300.jpg', 99, '2014-12-15 06:26:30');

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `is_recom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐：1为推荐',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `is_recom` (`is_recom`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='公告' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `notice`
--

INSERT INTO `notice` (`id`, `title`, `content`, `is_recom`, `update_time`, `add_time`) VALUES
(3, 'aaa', 'dsfadsf', 0, '0000-00-00 00:00:00', '2014-11-05 06:39:27');

-- --------------------------------------------------------

--
-- 表的结构 `order_list`
--

CREATE TABLE IF NOT EXISTS `order_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `nickname` varchar(20) NOT NULL COMMENT '支付的用户名',
  `ip` char(14) NOT NULL COMMENT '用户ip',
  `mid` int(11) NOT NULL COMMENT '3d模型id',
  `m_title` varchar(50) NOT NULL COMMENT '模型名称',
  `ordersn` char(14) DEFAULT NULL COMMENT '订单号',
  `title` varchar(50) DEFAULT NULL COMMENT '订单标题',
  `total_fee` float NOT NULL DEFAULT '0' COMMENT '总金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态(1为支付成功)',
  `payment_type` varchar(20) NOT NULL COMMENT '支付类型',
  `trade_no` varchar(100) NOT NULL COMMENT '支付接口交易号',
  `trade_status` varchar(100) NOT NULL COMMENT '支付接口返回的交易状态',
  `notify_id` varchar(100) NOT NULL COMMENT '通知校验ID',
  `notify_time` varchar(100) NOT NULL COMMENT '通知的发送时间',
  `buyer_email` varchar(100) NOT NULL COMMENT '买家支付宝帐号',
  `buyer_id` varchar(50) NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ordersn` (`ordersn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `order_list`
--

INSERT INTO `order_list` (`id`, `uid`, `nickname`, `ip`, `mid`, `m_title`, `ordersn`, `title`, `total_fee`, `status`, `payment_type`, `trade_no`, `trade_status`, `notify_id`, `notify_time`, `buyer_email`, `buyer_id`, `add_time`) VALUES
(2, 1, '', '127.0.0.1', 0, '', '14169006566687', '直接充值', 0.01, 1, '1', '2014112538135523', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr1xIwwPjc3NLpDYiDHM9umIK%2FS%2BCPvTI4PfEGawEfdqt67', '2014-11-25 15:31:50', '1175183274@qq.com', '2088612345841239', '2014-11-25 07:32:12'),
(22, 1, '', '127.0.0.1', 0, '', '14169008337605', '直接充值', 0.01, 1, '1', '2014112639698323', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr8iLOb%2BfeRZRbrBmgxb4QpCTh3I1Oa6qetqoDX95h%2FjUFv', '2014-11-26 16:25:16', '1175183274@qq.com', '2088612345841239', '2014-11-26 08:25:39'),
(31, 1, 'qqqqqfff', '127.0.0.1', 24, 'dddd', '14177701799716', '付费下载', 0.01, 0, '', '', '', '', '', '', '', '2014-12-05 09:02:59'),
(24, 0, 'u14169914041456', '127.0.0.1', 24, 'dddd', '14169914041456', '付费下载', 0.01, 0, '', '', '', '', '', '', '', '2014-11-26 08:43:24'),
(26, 0, '', '127.0.0.1', 0, '', '14169917310104', '付费下载', 0.01, 1, '1', '2014112639735323', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr8iaKdFjZAlBfhBlRjRJb10B8cnm3k4x%2BRrDzrdJXj1uEy', '2014-11-26 16:49:03', '1175183274@qq.com', '2088612345841239', '2014-11-26 08:49:26'),
(11, 1, '', '127.0.0.1', 0, '', '14169867487378', '直接充值', 0.01, 1, '1', '2014112639616223', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr9AaNOy5skoP1MLaUivl6aeDoVldm%2BaX1vFK%2FmLStCI34R', '2014-11-26 15:27:44', '1175183274@qq.com', '2088612345841239', '2014-11-26 07:28:07'),
(13, 1, '', '127.0.0.1', 0, '', '14169872882841', '付费下载', 0.01, 1, '1', '2014112639626823', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr9AL%2BSmDuNfo9guGoa4CN%2F7rjTkglaFECfaffR%2Bgf9C7tU', '2014-11-26 15:35:01', '1175183274@qq.com', '2088612345841239', '2014-11-26 07:35:24'),
(17, 0, '', '127.0.0.1', 0, '', '14169875963209', '付费下载', 0.01, 1, '1', '2014112639634123', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr9ALpom8P5nagtTmKGDHM9LLNdXVj2ETgfaLTdRVLGRU6t', '2014-11-26 15:40:11', '1175183274@qq.com', '2088612345841239', '2014-11-26 07:40:34'),
(19, 1, '', '127.0.0.1', 0, '', '14169901161110', '直接充值', 0.01, 1, '1', '2014112639694723', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr8iLFTYczCH8EAKTBEXBRRnM9RyUPblByP6wiepFRJjVsT', '2014-11-26 16:22:14', '1175183274@qq.com', '2088612345841239', '2014-11-26 08:22:36'),
(21, 1, '', '127.0.0.1', 0, '', '14169901960346', '付费下载', 0.01, 1, '1', '2014112639695823', 'TRADE_SUCCESS', 'RqPnCoPT3K9%2Fvwbh3InQ8Dr8iLIGvyyjjwRRg8soMM7s3ixesZA7WYAiZhdpKOS8ufXy', '2014-11-26 16:23:31', '1175183274@qq.com', '2088612345841239', '2014-11-26 08:23:54'),
(27, 0, 'u14169968698422', '127.0.0.1', 24, 'dddd', '14169968698422', '付费下载', 0.01, 0, '', '', '', '', '', '', '', '2014-11-26 10:14:29'),
(28, 0, 'u121221', '127.0.0.1', 24, 'dddd', '14169980726830', '付费下载', 0.01, 0, '', '', '', '', '', '', '', '2014-11-26 10:34:32'),
(29, 0, 'u14176847350320', '127.0.0.1', 24, 'dddd', '14176847355623', '付费下载', 0.01, 0, '', '', '', '', '', '', '', '2014-12-04 09:18:55'),
(32, 1, 'qqqqqfff', '127.0.0.1', 24, 'dddd', '14177701941730', '付费下载', 0.01, 0, '', '', '', '', '', '', '', '2014-12-05 09:03:14');

-- --------------------------------------------------------

--
-- 表的结构 `pay_money_log`
--

CREATE TABLE IF NOT EXISTS `pay_money_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '支付用户id',
  `nickname` varchar(20) NOT NULL COMMENT '支付用户名',
  `mid` int(11) unsigned NOT NULL COMMENT '3d模型id',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `demo` varchar(150) NOT NULL COMMENT '备注',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='支付日志表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `pay_money_log`
--

INSERT INTO `pay_money_log` (`id`, `uid`, `nickname`, `mid`, `price`, `demo`, `add_time`) VALUES
(1, 1, '', 24, '0.01', '下载支付', '2014-11-24 10:17:14'),
(2, 1, '', 24, '0.01', '下载支付', '2014-11-24 10:17:44'),
(3, 0, 'u123213213', 24, '0.01', '下载支付', '2014-11-26 10:16:09'),
(4, 0, 'u123213213', 24, '0.01', '下载支付', '2014-11-26 10:18:55'),
(5, 0, 'u121221', 24, '0.01', '下载支付', '2014-11-26 10:23:04'),
(6, 0, 'u121221', 24, '0.01', '下载支付', '2014-11-26 10:24:25'),
(7, 0, 'u121221', 24, '0.01', '下载支付', '2014-11-26 10:34:42'),
(8, 1, 'qqqqq', 24, '0.01', '下载支付', '2014-11-26 10:36:26'),
(9, 1, 'qqqqqfff', 24, '0.01', '下载支付', '2014-12-05 06:04:04');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL COMMENT '角色名',
  `permissions` varchar(100) NOT NULL COMMENT '角色的权限列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `name`, `permissions`) VALUES
(1, '超级管理员', ''),
(3, '推广人员', '2');

-- --------------------------------------------------------

--
-- 表的结构 `rule`
--

CREATE TABLE IF NOT EXISTS `rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类别(1为积分,2为钱)',
  `flag` varchar(10) NOT NULL COMMENT '动作',
  `operation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作(1增加,2减少)',
  `demo` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `share_log`
--

CREATE TABLE IF NOT EXISTS `share_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '分享用户id(主动)',
  `mid` int(11) unsigned NOT NULL COMMENT '分享的3d模型id',
  `title` varchar(50) NOT NULL COMMENT '模型标题',
  `spread_uid` int(11) unsigned NOT NULL COMMENT '推广用户id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '推广用户获得的金额',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分享日志表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `spread_log`
--

CREATE TABLE IF NOT EXISTS `spread_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '推广用户id',
  `mid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推广的3d模型id',
  `url` varchar(50) NOT NULL COMMENT '推广的url',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='推广日志表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `spread_log`
--

INSERT INTO `spread_log` (`id`, `uid`, `mid`, `url`, `add_time`) VALUES
(1, 1, 0, 'http://www.csbim2014.dev/?uid=1', '2014-11-10 06:08:07');

-- --------------------------------------------------------

--
-- 表的结构 `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订阅的uid',
  `email` varchar(20) NOT NULL COMMENT '订阅的email',
  `keywords` tinytext NOT NULL COMMENT '订阅的关键词',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0为订阅中,1为取消)',
  `cancel_reason` varchar(20) NOT NULL COMMENT '取消原因',
  `advice` tinytext NOT NULL COMMENT '建议',
  `send_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订阅时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关键词订阅表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `test`
--

INSERT INTO `test` (`id`, `name`, `address`) VALUES
(1, 'zhangsan', 'bali'),
(2, 'zhangsan0', 'bali0'),
(3, 'zhangsan1', 'bali1'),
(4, 'zhangsan2', 'bali2'),
(5, 'zhangsan3', 'bali3'),
(6, 'zhangsan4', 'bali4'),
(7, 'zhangsan5', 'bali5'),
(8, 'zhangsan6', 'bali6'),
(9, 'zhangsan7', 'bali7'),
(10, 'zhangsan8', 'bali8'),
(11, 'zhangsan9', 'bali9'),
(12, 'zhangsan10', 'bali10'),
(13, 'zhangsan11', 'bali11'),
(14, 'zhangsan12', 'bali12'),
(15, 'zhangsan13', 'bali13'),
(16, 'zhangsan14', 'bali14'),
(17, 'zhangsan15', 'bali15'),
(18, 'zhangsan16', 'bali16'),
(19, 'zhangsan17', 'bali17'),
(20, 'zhangsan18', 'bali18'),
(21, 'zhangsan19', 'bali19'),
(22, 'zhangsan20', 'bali20'),
(23, 'zhangsan21', 'bali21'),
(24, 'zhangsan22', 'bali22'),
(25, 'zhangsan23', 'bali23'),
(26, 'zhangsan24', 'bali24'),
(27, 'zhangsan25', 'bali25'),
(28, 'zhangsan26', 'bali26'),
(29, 'zhangsan27', 'bali27'),
(30, 'zhangsan28', 'bali28'),
(31, 'zhangsan29', 'bali29'),
(32, 'zhangsan30', 'bali30'),
(33, 'zhangsan31', 'bali31'),
(34, 'zhangsan32', 'bali32'),
(35, 'zhangsan33', 'bali33'),
(36, 'zhangsan34', 'bali34'),
(37, 'zhangsan35', 'bali35'),
(38, 'zhangsan36', 'bali36'),
(39, 'zhangsan37', 'bali37'),
(40, 'zhangsan38', 'bali38'),
(41, 'zhangsan39', 'bali39'),
(42, 'zhangsan40', 'bali40'),
(43, 'zhangsan41', 'bali41'),
(44, 'zhangsan42', 'bali42'),
(45, 'zhangsan43', 'bali43'),
(46, 'zhangsan44', 'bali44'),
(47, 'zhangsan45', 'bali45'),
(48, 'zhangsan46', 'bali46'),
(49, 'zhangsan47', 'bali47'),
(50, 'zhangsan48', 'bali48'),
(51, 'zhangsan49', 'bali49');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL COMMENT '妮称',
  `uname` varchar(20) NOT NULL COMMENT '姓名',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别 0为男',
  `pwd` char(32) NOT NULL COMMENT '密码',
  `orginpwd` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - 个人用户  1公司',
  `email` varchar(160) NOT NULL,
  `email_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - 未验证1 - 已验证',
  `mobile` char(11) NOT NULL,
  `mobile_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 - 未验证1 - 已验证',
  `avatar` varchar(120) NOT NULL COMMENT '头像地址',
  `brief` mediumtext NOT NULL COMMENT '个人简介',
  `field` varchar(120) NOT NULL COMMENT '擅长领域',
  `pay_account` varchar(60) NOT NULL COMMENT '支付宝账号',
  `pay_account_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付宝账号是否验证',
  `wechat` varchar(20) NOT NULL COMMENT '微信号',
  `wechat_verified` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '微信号是否验证成功:1为成功',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0正常,1关闭',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `nickname`, `uname`, `sex`, `pwd`, `orginpwd`, `type`, `email`, `email_verified`, `mobile`, `mobile_verified`, `avatar`, `brief`, `field`, `pay_account`, `pay_account_verified`, `wechat`, `wechat_verified`, `status`, `add_time`) VALUES
(1, 'qqqqqfff', 'ggg', 0, 'e3ceb5881a0a1fdaad01296d7554868d', '222222', 0, '5873113@qq.com', 1, '', 0, '20141204/pic15394082040800.jpg', '', '', '3333@qq.com', 0, '', 0, 0, '2014-12-04 10:09:23'),
(2, '', '', 0, 'e10adc3949ba59abbe56e057f20f883e', '123456', 0, 'nan.wei@csbim.com', 1, '', 0, '', '', '', '', 0, '', 0, 0, '2014-09-30 04:59:21'),
(17, '', '', 0, '96e79218965eb72c92a549dd5a330112', '111111', 0, '', 0, '18017267005', 1, '', '', '', '', 0, '', 0, 0, '2014-12-03 09:35:49'),
(18, '小三', 'mem1', 1, '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '1234', 0, '17763768@qq.com', 0, '13688888888', 0, '20141215/pic16481394395900.jpg', 'brief345ASDF123', '', '', 0, '', 0, 0, '2014-12-15 10:12:40');

-- --------------------------------------------------------

--
-- 表的结构 `user_down_log`
--

CREATE TABLE IF NOT EXISTS `user_down_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '会员id',
  `nickname` varchar(20) NOT NULL,
  `ip` char(14) NOT NULL COMMENT '下载ip',
  `mid` int(11) unsigned NOT NULL COMMENT '3d模型id',
  `title` varchar(50) NOT NULL COMMENT '模型标题',
  `m_uid` int(11) NOT NULL DEFAULT '0' COMMENT '模型所属用户id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '模型所属用户获得的金额',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员下载模型记录表' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `user_down_log`
--

INSERT INTO `user_down_log` (`id`, `uid`, `nickname`, `ip`, `mid`, `title`, `m_uid`, `money`, `add_time`) VALUES
(1, 0, '', '10.32.122.55', 22, 'dfdfdf', 1, '0.00', '2014-11-05 09:40:52'),
(2, 1, '', '127.0.0.1', 22, 'dfdfdf', 1, '0.00', '2014-11-20 09:15:21'),
(3, 1, '', '127.0.0.1', 21, 'gfddfs', 1, '0.00', '2014-11-21 09:44:47'),
(4, 1, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-24 10:17:14'),
(5, 1, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-24 10:17:44'),
(6, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:16:09'),
(7, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:18:55'),
(8, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:23:04'),
(9, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:23:22'),
(10, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:23:51'),
(11, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:24:25'),
(12, 0, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:34:42'),
(13, 1, '', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-11-26 10:36:26'),
(14, 1, 'qqqqqfff', '127.0.0.1', 24, 'dddd', 1, '0.00', '2014-12-05 06:04:04');

-- --------------------------------------------------------

--
-- 表的结构 `user_ext`
--

CREATE TABLE IF NOT EXISTS `user_ext` (
  `uid` int(11) unsigned NOT NULL,
  `is_recom` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recom_pos` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位置:1首页',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前余额',
  `credits` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '当前积分',
  `model_num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '模型数',
  `down_model_num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '已下载模型数',
  `login_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户附加表';

--
-- 转存表中的数据 `user_ext`
--

INSERT INTO `user_ext` (`uid`, `is_recom`, `recom_pos`, `level`, `money`, `credits`, `model_num`, `down_model_num`, `login_num`, `last_time`) VALUES
(1, 1, 0, 0, '8.04', 0, 0, 6, 70, '2014-12-09 01:19:05'),
(2, 0, 0, 0, '0.00', 0, 0, 0, 2, '2014-09-30 05:12:42'),
(7, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-11-28 06:55:23'),
(8, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-11-28 09:28:58'),
(9, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-11-28 09:32:17'),
(10, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-11-28 09:55:39'),
(11, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-12-02 06:51:22'),
(12, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-12-02 07:26:24'),
(13, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-12-03 08:51:21'),
(14, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-12-03 08:57:48'),
(15, 0, 0, 0, '0.00', 0, 0, 0, 2, '2014-12-03 09:34:12'),
(16, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-12-03 09:34:46'),
(17, 0, 0, 0, '0.00', 0, 0, 0, 1, '2014-12-03 09:35:49'),
(18, 0, 0, 0, '0.00', 0, 0, 0, 17, '2014-12-15 09:04:33');

-- --------------------------------------------------------

--
-- 表的结构 `user_privacy`
--

CREATE TABLE IF NOT EXISTS `user_privacy` (
  `uid` int(11) unsigned NOT NULL,
  `qq` varchar(20) NOT NULL COMMENT 'qq号',
  `qq_privacy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'qq隐私：0完全公开,1对设计师/公司，2对公司',
  `blog` varchar(20) NOT NULL COMMENT '新浪微博',
  `blog_privacy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '微博隐私：0完全公开,1对设计师/公司，2对公司',
  `contact` varchar(20) NOT NULL COMMENT '联系方式',
  `contact_privacy` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '联系方式隐私：0完全公开,1对设计师/公司，2对公司',
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户隐私表';

--
-- 转存表中的数据 `user_privacy`
--

INSERT INTO `user_privacy` (`uid`, `qq`, `qq_privacy`, `blog`, `blog_privacy`, `contact`, `contact_privacy`) VALUES
(0, '123', 0, '', 0, '', 0),
(18, '1234567890-AAA', 1, 'WEBB', 2, '12345678ASDFG', 0);

-- --------------------------------------------------------

--
-- 表的结构 `user_recharge_log`
--

CREATE TABLE IF NOT EXISTS `user_recharge_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '会员id',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `info` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '日志说明，1为个人充值',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='充值日志表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user_recharge_log`
--

INSERT INTO `user_recharge_log` (`id`, `uid`, `money`, `info`, `add_time`) VALUES
(1, 1, '10.00', 1, '2014-11-24 10:04:10');

-- --------------------------------------------------------

--
-- 表的结构 `user_withdraw_log`
--

CREATE TABLE IF NOT EXISTS `user_withdraw_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '会员id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否审核通过:0未审核,1已审核',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `info` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '日志说明，1为个人提现',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现日志' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
