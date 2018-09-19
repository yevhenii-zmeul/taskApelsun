-- phpMyAdmin SQL Dump
-- version 4.7.7
--
-- Час створення: Вер 18 2018 р., 16:53


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `debts`
--

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id_user`, `name`) VALUES
(1, 'User_1'),
(2, 'User_2'),
(3, 'User_3');

-- --------------------------------------------------------

--
-- Структура таблиці `user_transaction`
--

CREATE TABLE `user_transaction` (
  `id_transaction` int(11) NOT NULL,
  `id_borrower` int(11) NOT NULL,
  `id_lender` int(11) NOT NULL,
  `amount` decimal(10,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп даних таблиці `user_transaction`
--

INSERT INTO `user_transaction` (`id_transaction`, `id_borrower`, `id_lender`, `amount`, `date`) VALUES
(1, 1, 3, '245.05000', '2018-09-18'),
(2, 2, 3, '145.45000', '2018-09-19'),
(3, 3, 1, '333.46000', '2018-09-19'),
(4, 1, 3, '100.00000', '2018-09-19'),
(5, 2, 3, '504.78000', '2018-09-20');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Індекси таблиці `user_transaction`
--
ALTER TABLE `user_transaction`
  ADD PRIMARY KEY (`id_transaction`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `user_transaction`
--
ALTER TABLE `user_transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
