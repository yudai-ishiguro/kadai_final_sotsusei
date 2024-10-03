-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-09-24 00:26:59
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `deploy`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `conditions`
--

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL,
  `judge` varchar(64) NOT NULL,
  `image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `conditions`
--

INSERT INTO `conditions` (`id`, `judge`, `image`) VALUES
(1, 'Good', './img/Good.PNG'),
(2, 'So-So', './img/So-So.PNG'),
(3, 'Bad', './img/Bad.PNG');

-- --------------------------------------------------------

--
-- テーブルの構造 `diving_area`
--

CREATE TABLE `diving_area` (
  `id` int(11) NOT NULL,
  `area_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `diving_area`
--

INSERT INTO `diving_area` (`id`, `area_name`) VALUES
(1, '阿嘉島'),
(2, '座間味島'),
(3, '渡嘉敷島');

-- --------------------------------------------------------

--
-- テーブルの構造 `diving_log`
--

CREATE TABLE `diving_log` (
  `id` int(12) NOT NULL,
  `dive_no` int(12) DEFAULT NULL,
  `diving_point_id` int(12) NOT NULL,
  `date` date NOT NULL,
  `wind_direction_id` int(12) DEFAULT NULL,
  `conditions_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `diving_log`
--

INSERT INTO `diving_log` (`id`, `dive_no`, `diving_point_id`, `date`, `wind_direction_id`, `conditions_id`) VALUES
(1, 40, 1, '2007-07-05', 11, 1),
(2, 47, 1, '2008-08-22', 11, 1),
(3, 35, 2, '2006-10-09', 3, 1),
(4, 39, 2, '2006-10-11', 3, 1),
(5, 43, 2, '2007-07-06', 11, 1),
(6, 44, 3, '2007-07-06', 11, 1),
(7, 6, 4, '1998-08-09', 15, 1),
(8, 37, 4, '2006-10-10', 5, 1),
(9, 48, 4, '2008-08-22', 11, 1),
(10, 59, 5, '2010-06-26', 8, 1),
(11, 45, 7, '2007-07-06', 11, 1),
(12, 86, 10, '2013-09-15', 1, 1),
(13, 87, 13, '2013-09-15', 1, 1),
(14, 60, 14, '2010-06-26', 8, 1),
(15, 36, 16, '2006-10-10', 5, 1),
(16, 8, 17, '1998-08-10', 13, 1),
(17, 29, 17, '2003-10-14', 1, 1),
(18, 38, 20, '2006-10-11', 3, 1),
(19, 76, 35, '2012-07-08', 11, 1),
(20, 7, 41, '1998-08-09', 15, 1),
(21, 27, 41, '2003-10-13', 12, 1),
(22, 56, 52, '2008-10-12', 1, 1),
(23, 100, 53, '2016-09-29', 7, 1),
(24, 9, 54, '1998-08-10', 13, 1),
(25, 28, 54, '2003-10-14', 1, 1),
(26, 53, 54, '2008-10-11', 1, 1),
(27, 54, 55, '2008-10-11', 1, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `diving_point`
--

CREATE TABLE `diving_point` (
  `id` int(12) NOT NULL,
  `diving_area_id` int(12) NOT NULL,
  `point_name` varchar(64) NOT NULL,
  `level` varchar(64) NOT NULL,
  `depth` varchar(64) NOT NULL,
  `note` varchar(64) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `diving_point`
--

INSERT INTO `diving_point` (`id`, `diving_area_id`, `point_name`, `level`, `depth`, `note`, `image`) VALUES
(1, 3, '黒島ツインロック', '中級以上', '5～35m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.1413758028293!2d127.40120035252447!3d26.257074653406466!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDE1JzI1LjQiTiAxMjfCsDI0JzA0LjUiRQ!5e0!3m2!1sja!2sjp!4v1725193341886!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(2, 3, '自津留', '中級以上', '5～35m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.6045492357534!2d127.3659636924747!3d26.242035819723345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDE0JzMxLjkiTiAxMjfCsDIxJzU2LjAiRQ!5e0!3m2!1sja!2sjp!4v1725101303106!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(3, 3, '儀志布 西', '初級以上', '7～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.9846881203175!2d127.36752020173667!3d26.229687059481034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzQ3LjYiTiAxMjfCsDIyJzAwLjMiRQ!5e0!3m2!1sja!2sjp!4v1725193483437!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(4, 3, 'タマルル', '初級以上', '4～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.1075512587804!2d127.3608196250151!3d26.225694711827188!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzM1LjIiTiAxMjfCsDIxJzM2LjkiRQ!5e0!3m2!1sja!2sjp!4v1725193612267!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(5, 3, 'カミグー', '初級以上', '3～17m', 'ほとんど流れはない。', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.168375393794!2d127.36435774273681!3d26.223718067136005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzI3LjUiTiAxMjfCsDIxJzUxLjIiRQ!5e0!3m2!1sja!2sjp!4v1725193780472!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(6, 3, 'アカンア', '初級以上', '4～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.350409883297!2d127.37140153903182!3d26.21780153697422!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzA2LjQiTiAxMjfCsDIyJzE3LjEiRQ!5e0!3m2!1sja!2sjp!4v1725193887016!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(7, 3, '運瀬', '中級以上', '6～35m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d1790.622258098026!2d127.37281880454523!3d26.156165033959372!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzIzLjgiTiAxMjfCsDIyJzIyLjMiRQ!5e0!3m2!1sja!2sjp!4v1725194038753!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(8, 3, 'ムチズニ', '中級以上', '7～35m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3581.3146944721466!2d127.3536366078169!3d26.153878754641983!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzE1LjgiTiAxMjfCsDIxJzExLjUiRQ!5e0!3m2!1sja!2sjp!4v1725194296055!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(9, 3, 'アハレン灯台下', '初級以上', '3～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d1265.474231670658!2d127.34387187295296!3d26.149962181988776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzAwLjkiTiAxMjfCsDIwJzM4LjEiRQ!5e0!3m2!1sja!2sjp!4v1725194930949!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(10, 3, '中頭', '初級以上', '3～10m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3581.309136961997!2d127.34397962512115!3d26.154059814887216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzE0LjQiTiAxMjfCsDIwJzM4LjEiRQ!5e0!3m2!1sja!2sjp!4v1725100523885!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(11, 3, 'Ｖ', '中級以上', '5～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3581.172746666058!2d127.33644608989079!3d26.158502961293806!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzMyLjAiTiAxMjfCsDIwJzEwLjkiRQ!5e0!3m2!1sja!2sjp!4v1725195546416!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(12, 3, 'ハナレビーチ前', '初級以上', '3～6m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3581.107128396139!2d127.3411672348007!3d26.160640338381235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzQwLjciTiAxMjfCsDIwJzI2LjgiRQ!5e0!3m2!1sja!2sjp!4v1725195622480!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(13, 3, '海人', '中級以上', '20～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d14321.17478116362!2d127.33909815134378!3d26.18712274583541!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDExJzA4LjgiTiAxMjfCsDIwJzMwLjIiRQ!5e0!3m2!1sja!2sjp!4v1725080378619!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(14, 3, 'とかしくビーチ前', '初級以上', '1～3m', 'ほとんど流れはない。', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3580.336493522195!2d127.34651967528382!3d26.18573001233039!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDExJzEwLjYiTiAxMjfCsDIwJzQ2LjQiRQ!5e0!3m2!1sja!2sjp!4v1725196475240!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(15, 3, '三本根', '初級以上', '7～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3580.049800448342!2d127.34404960782496!3d26.195058220989928!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDExJzQzLjQiTiAxMjfCsDIwJzM3LjAiRQ!5e0!3m2!1sja!2sjp!4v1725196540948!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(16, 3, 'アリガー南', '初級以上', '4～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.8202055739207!2d127.3435510972355!3d26.202526384880866!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzA5LjkiTiAxMjfCsDIwJzM4LjgiRQ!5e0!3m2!1sja!2sjp!4v1725196634831!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(17, 3, 'アリガーケーブル', '初級以上', '5～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.712393372189!2d127.34812381019549!3d26.20603257164652!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzIwLjciTiAxMjfCsDIwJzUzLjQiRQ!5e0!3m2!1sja!2sjp!4v1725100359968!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(18, 3, 'アリガー北', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.6176771341848!2d127.3475605390385!3d26.20911250172349!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzM0LjUiTiAxMjfCsDIwJzUxLjMiRQ!5e0!3m2!1sja!2sjp!4v1725196701097!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(19, 3, 'スン崎', '初級以上', '4～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.5253201669457!2d127.34834353903894!3d26.212115390509002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzQ1LjIiTiAxMjfCsDIwJzU0LjEiRQ!5e0!3m2!1sja!2sjp!4v1725196758049!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(20, 3, '野崎', '初級以上', '3～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.139548018672!2d127.35147086178564!3d26.224654907876157!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzI4LjMiTiAxMjfCsDIxJzA0LjEiRQ!5e0!3m2!1sja!2sjp!4v1725101442087!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(21, 2, '男岩', '中級以上', '5～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.4387407853997!2d127.33377570967852!3d26.247420394090263!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDE0JzUyLjIiTiAxMjfCsDE5JzU5LjciRQ!5e0!3m2!1sja!2sjp!4v1725197377033!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(22, 2, 'ウチャカシ', '中級以上', '2～28m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.5242143557793!2d127.30602591205593!3d26.244644796448515!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDE0JzQyLjgiTiAxMjfCsDE4JzIxLjUiRQ!5e0!3m2!1sja!2sjp!4v1725197446213!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(23, 2, 'ニタ洞窟', '初級以上', '3～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.591207372368!2d127.29485457343274!3d26.242469130280927!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDE0JzM0LjUiTiAxMjfCsDE3JzQwLjciRQ!5e0!3m2!1sja!2sjp!4v1725197516851!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(24, 2, '阿真ビーチ前', '初級以上', '2～17m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.089141691771!2d127.28778453903911!3d26.22629295318401!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzM2LjciTiAxMjfCsDE3JzE2LjEiRQ!5e0!3m2!1sja!2sjp!4v1725197588456!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(25, 2, '海底砂漠', '中級以上', '5～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.2336950155823!2d127.2863451316292!3d26.22159517527217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzE5LjIiTiAxMjfCsDE3JzEyLjAiRQ!5e0!3m2!1sja!2sjp!4v1725197656886!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(26, 2, 'お花畑', '中級以上', '5～35m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.280061514228!2d127.28514994788122!3d26.220088164196913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzE0LjQiTiAxMjfCsDE3JzA1LjEiRQ!5e0!3m2!1sja!2sjp!4v1725197998661!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(27, 2, '阿真牛瀬', '中級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.3281563524606!2d127.28268520816641!3d26.218524893318108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzA5LjMiTiAxMjfCsDE2JzU2LjQiRQ!5e0!3m2!1sja!2sjp!4v1725198077358!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(28, 2, '嘉比裏', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.3644191963454!2d127.2842714902091!3d26.217346151389762!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzA0LjIiTiAxMjfCsDE3JzAyLjAiRQ!5e0!3m2!1sja!2sjp!4v1725198170712!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(29, 2, 'ブツブツサンゴ', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.430142905423!2d127.28697559062874!3d26.21520964374303!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzU3LjciTiAxMjfCsDE3JzExLjkiRQ!5e0!3m2!1sja!2sjp!4v1725198232432!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(30, 2, '嘉比キンメの根', '初級以上', '15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.3657725254557!2d127.28875631946495!3d26.21730215979505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzA0LjMiTiAxMjfCsDE3JzE4LjMiRQ!5e0!3m2!1sja!2sjp!4v1725198319811!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(31, 2, '嘉比前', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.302101384249!2d127.28792986179292!3d26.21937179272756!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzExLjEiTiAxMjfCsDE3JzE1LjQiRQ!5e0!3m2!1sja!2sjp!4v1725198380471!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(32, 2, '送電線', '初級以上', '5～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.2723581334662!2d127.29590169248114!3d26.22033854623901!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzE0LjciTiAxMjfCsDE3JzQzLjgiRQ!5e0!3m2!1sja!2sjp!4v1725198451259!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(33, 2, 'エダサンゴ', '初級以上', '2～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.3514327922403!2d127.29609448877635!3d26.217768286628484!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzA2LjkiTiAxMjfCsDE3JzQ1LjAiRQ!5e0!3m2!1sja!2sjp!4v1725199013546!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(34, 2, 'アダン下', '初級以上', '2～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.5249133047646!2d127.29328167528445!3d26.212128618493832!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzQ2LjkiTiAxMjfCsDE3JzM0LjgiRQ!5e0!3m2!1sja!2sjp!4v1725199144286!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(35, 2, '安室漁礁', '初級以上', '8～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.5239520907485!2d127.30790621761219!3d26.212159869652105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzQ2LjkiTiAxMjfCsDE4JzI3LjUiRQ!5e0!3m2!1sja!2sjp!4v1725199204862!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(36, 2, '古座間味ビーチ', '初級以上', '2～5m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.237856240323!2d127.3091948961862!3d26.22145992979243!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzE5LjMiTiAxMjfCsDE4JzMxLjEiRQ!5e0!3m2!1sja!2sjp!4v1725199300941!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(37, 2, 'シル', '初級以上', '5～24m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.3619924030118!2d127.30999416734988!3d26.21742503706175!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzAzLjgiTiAxMjfCsDE4JzM0LjAiRQ!5e0!3m2!1sja!2sjp!4v1725199367418!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(38, 2, '東牛', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.419126231773!2d127.31065984459586!3d26.21556777857236!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzU3LjciTiAxMjfCsDE4JzM3LjYiRQ!5e0!3m2!1sja!2sjp!4v1725199444960!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(39, 2, 'ウフタマ', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.6604215294524!2d127.31434186046503!3d26.207722604838448!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzMwLjIiTiAxMjfCsDE4JzUyLjgiRQ!5e0!3m2!1sja!2sjp!4v1725199514183!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(40, 2, '安室牛瀬', '中級以上', '2～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.844139455465!2d127.3224509120548!3d26.201747966174285!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzA4LjIiTiAxMjfCsDE5JzIwLjciRQ!5e0!3m2!1sja!2sjp!4v1725199689978!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(41, 2, '灯台下', '初級以上', '1～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.1186794896366!2d127.3326166924813!3d26.22533308022956!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzMzLjYiTiAxMjfCsDE5JzU2LjAiRQ!5e0!3m2!1sja!2sjp!4v1725199744863!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(42, 1, 'ニシ浜', '初級以上', '5～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.7263618059237!2d127.28753976045745!3d26.205578325406282!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEyJzIxLjAiTiAxMjfCsDE3JzEyLjAiRQ!5e0!3m2!1sja!2sjp!4v1725231347345!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(43, 1, '佐久原漁礁', '中級以上', '9～31m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3580.4670713575492!2d127.27609845489943!3d26.181480342844864!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEwJzU0LjkiTiAxMjfCsDE2JzMxLjYiRQ!5e0!3m2!1sja!2sjp!4v1725231450230!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(44, 1, '佐久原', '中級以上', '5～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3580.6153670668195!2d127.27440169166988!3d26.176653265659468!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEwJzM2LjgiTiAxMjfCsDE2JzI2LjQiRQ!5e0!3m2!1sja!2sjp!4v1725231540134!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(45, 1, 'タカチンシ', '中級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d1789.5574255480165!2d127.24060254626517!3d26.225457491192216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzMyLjMiTiAxMjfCsDE0JzI2LjAiRQ!5e0!3m2!1sja!2sjp!4v1725231616323!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(46, 1, 'ナカチンシ', '初級以上', '3～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.1891044751846!2d127.24229858981916!3d26.223044387969555!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzI2LjAiTiAxMjfCsDE0JzMxLjEiRQ!5e0!3m2!1sja!2sjp!4v1725231673015!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(47, 1, 'ヤカビトンネル', '初級以上', '5～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3579.2430118683606!2d127.24273808188467!3d26.2212923639502!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzE4LjQiTiAxMjfCsDE0JzMxLjciRQ!5e0!3m2!1sja!2sjp!4v1725231751209!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(48, 1, '久場西洞窟コース', '初級以上', '3～15m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3580.515750467778!2d127.23553132548246!3d26.179895911988503!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEwJzQ4LjUiTiAxMjfCsDE0JzA4LjIiRQ!5e0!3m2!1sja!2sjp!4v1725231813578!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(49, 1, '久場北', '初級以上', '5～20m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3580.5240380049!2d127.24085299457221!3d26.179626156406318!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEwJzQ3LjQiTiAxMjfCsDE0JzI5LjQiRQ!5e0!3m2!1sja!2sjp!4v1725231869587!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(50, 1, '久場の隠れ根', '中級以上', '5～30m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3010.971942533399!2d127.23065552926971!3d26.174898920161926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEwJzMwLjUiTiAxMjfCsDEzJzUwLjAiRQ!5e0!3m2!1sja!2sjp!4v1725231926459!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(51, 1, '下曽根', '上級以上', '5～40m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3581.5084566558326!2d127.23835089537366!3d26.147565373829817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA4JzUyLjYiTiAxMjfCsDE0JzE2LjEiRQ!5e0!3m2!1sja!2sjp!4v1725231182024!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(52, 1, '久場南', '初級以上', '10～30m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3581.075365163549!2d127.24170021812823!3d26.16167490055404!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDA5JzQzLjUiTiAxMjfCsDE0JzI2LjkiRQ!5e0!3m2!1sja!2sjp!4v1725231273621!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(53, 2, '知志', '初級以上', '5～18m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.4158431453216!2d127.31689535385883!3d26.24816390670254!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDE0JzU1LjAiTiAxMjfCsDE4JzU4LjciRQ!5e0!3m2!1sja!2sjp!4v1725200021896!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(54, 2, 'トウマ', '初級以上', '5～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.9561872438335!2d127.32870921761278!3d26.230613093901756!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzUyLjEiTiAxMjfCsDE5JzQyLjQiRQ!5e0!3m2!1sja!2sjp!4v1725199901754!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"'),
(55, 2, 'ドラゴンレディ', '初級以上', '5～25m', NULL, 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d3578.9875762824922!2d127.32276592925223!3d26.229593217247803!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMjbCsDEzJzQ4LjUiTiAxMjfCsDE5JzIxLjQiRQ!5e0!3m2!1sja!2sjp!4v1725199953248!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"');

-- --------------------------------------------------------

--
-- テーブルの構造 `wind_direction`
--

CREATE TABLE `wind_direction` (
  `id` int(11) NOT NULL,
  `direction` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `wind_direction`
--

INSERT INTO `wind_direction` (`id`, `direction`) VALUES
(1, '北'),
(2, '北北東'),
(3, '北東'),
(4, '東北東'),
(5, '東'),
(6, '東南東'),
(7, '南東'),
(8, '南南東'),
(9, '南'),
(10, '南南西'),
(11, '南西'),
(12, '西南西'),
(13, '西'),
(14, '西北西'),
(15, '北西'),
(16, '北北西');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `diving_area`
--
ALTER TABLE `diving_area`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `diving_log`
--
ALTER TABLE `diving_log`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `diving_point`
--
ALTER TABLE `diving_point`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diving_area_id` (`diving_area_id`);

--
-- テーブルのインデックス `wind_direction`
--
ALTER TABLE `wind_direction`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `diving_area`
--
ALTER TABLE `diving_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `diving_log`
--
ALTER TABLE `diving_log`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- テーブルの AUTO_INCREMENT `diving_point`
--
ALTER TABLE `diving_point`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- テーブルの AUTO_INCREMENT `wind_direction`
--
ALTER TABLE `wind_direction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `diving_point`
--
ALTER TABLE `diving_point`
  ADD CONSTRAINT `diving_point_ibfk_1` FOREIGN KEY (`diving_area_id`) REFERENCES `diving_area` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
