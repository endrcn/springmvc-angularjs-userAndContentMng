-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 03 Eyl 2014, 16:09:44
-- Sunucu sürümü: 5.5.38-0ubuntu0.14.04.1
-- PHP Sürümü: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `projegorev6`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTMENT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `TBL_CONTENT`
--

CREATE TABLE IF NOT EXISTS `TBL_CONTENT` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_title` varchar(225) NOT NULL,
  `content_content` text NOT NULL,
  `content_date` date NOT NULL,
  `content_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Tablo döküm verisi `TBL_CONTENT`
--

INSERT INTO `TBL_CONTENT` (`content_id`, `content_title`, `content_content`, `content_date`, `content_status`) VALUES
(5, 'Baslik', 'Icerik', '2014-09-03', 1),
(6, 'Ender', 'Can', '2014-09-03', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `TBL_USER`
--

CREATE TABLE IF NOT EXISTS `TBL_USER` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(225) NOT NULL,
  `user_surname` varchar(225) NOT NULL,
  `user_email` varchar(225) NOT NULL,
  `user_pass` varchar(225) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Tablo döküm verisi `TBL_USER`
--

INSERT INTO `TBL_USER` (`user_id`, `user_name`, `user_surname`, `user_email`, `user_pass`) VALUES
(24, 'Atilla', 'Acar', 'atilla.acar@outlook.com', '2'),
(28, 'Ender1', '1Can', 'endercan34@gmail.com', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
