-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Час створення: Вер 19 2018 р., 13:58
-- Версія сервера: 5.7.20
-- Версія PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `exchange_rates`
--

-- --------------------------------------------------------

--
-- Структура таблиці `history_courses`
--

CREATE TABLE `history_courses` (
  `date` date NOT NULL,
  `usd_buy` decimal(10,5) NOT NULL,
  `usd_sale` decimal(10,5) NOT NULL,
  `eur_buy` decimal(10,5) NOT NULL,
  `eur_sale` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `history_courses`
--

INSERT INTO `history_courses` (`date`, `usd_buy`, `usd_sale`, `eur_buy`, `eur_sale`) VALUES
('2018-09-16', '8.25000', '9.45600', '10.25000', '11.35000'),
('2018-09-17', '8.26000', '12.11000', '15.65000', '18.35000'),
('2018-09-18', '16.25000', '19.25000', '23.56000', '25.63000'),
('2018-09-19', '36.25000', '40.58000', '56.36000', '59.85000'),
('2018-09-19', '27.95000', '28.20000', '32.45000', '33.05000'),
('2018-09-19', '8.25000', '9.45600', '15.00000', '16.00000'),
('2018-09-19', '27.95000', '28.20000', '32.45000', '33.05000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
