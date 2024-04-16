-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 16 2024 г., 22:45
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bikes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bikes`
--

CREATE TABLE `bikes` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `type_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `bikes`
--

INSERT INTO `bikes` (`id`, `title`, `type_id`, `active`) VALUES
(1, 'Bike 1', 1, 1),
(2, 'Bike 2', 2, 1),
(3, 'Bike 3', 3, 1),
(4, 'Bike 4', 4, 1),
(5, 'Bike 5', 5, 1),
(6, 'Bike 6', 1, 1),
(7, 'Bike 7', 1, 0),
(8, 'Bike 8', 2, 0),
(9, 'Bike 9', 3, 0),
(10, 'Bike 10', 4, 0),
(11, 'Bike 11', 5, 0),
(12, 'Bike 12', 2, 0),
(13, 'Bike 13', 1, 1),
(14, 'Bike 14', 2, 1),
(15, 'Bike 15', 3, 1),
(16, 'Bike 16', 4, 1),
(17, 'Bike 17', 5, 1),
(18, 'Bike 18', 3, 1),
(19, 'Bike 19', 1, 0),
(20, 'Bike 20', 2, 0),
(21, 'Bike 21', 3, 0),
(22, 'Bike 22', 4, 0),
(23, 'Bike 23', 5, 0),
(24, 'Bike 24', 4, 0),
(25, 'Bike 25', 1, 1),
(26, 'Bike 26', 2, 1),
(27, 'Bike 27', 3, 1),
(28, 'Bike 28', 4, 1),
(29, 'Bike 29', 5, 1),
(30, 'Bike 30', 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bikes_types`
--

CREATE TABLE `bikes_types` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `bikes_types`
--

INSERT INTO `bikes_types` (`id`, `title`) VALUES
(1, 'High-speed'),
(2, 'premium'),
(3, 'Passable'),
(4, 'Up to 14 years old'),
(5, 'Children\'s toys');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `bikes_types`
--
ALTER TABLE `bikes_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `bikes_types`
--
ALTER TABLE `bikes_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bikes`
--
ALTER TABLE `bikes`
  ADD CONSTRAINT `bikes_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `bikes_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
