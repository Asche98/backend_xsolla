-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 07 2019 г., 21:47
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gamesforsasha`
--

-- --------------------------------------------------------

--
-- Структура таблицы `games`
--

CREATE TABLE `games` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Year` int(11) NOT NULL,
  `SeriesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `games`
--

INSERT INTO `games` (`ID`, `Name`, `Description`, `Year`, `SeriesID`) VALUES
(1, 'Assassin’s Creed', 'Assassin’s Creed (с англ. — «Кредо ассасина») — компьютерная игра в жанре action-adventure, разработанная компанией Ubisoft Montreal.', 2007, 7),
(2, 'Assassin’s Creed II', 'Культовая мультиплатформенная компьютерная игра в жанре action-adventure, продолжение игры Assassin’s Creed', 2009, 7),
(3, 'Assassin’s Creed Brotherhood', 'Компьютерная игра в жанре action-adventure и стелс-экшена с видом от третьего лица, разработанная компанией Ubisoft Montreal', 2010, 7),
(4, 'Assassin’s Creed Revelations', 'Кредо ассасина: Откровения', 2011, 7),
(5, 'S.T.A.L.K.E.R.: Тень Чернобыля', 'Компьютерная игра в жанре шутера от первого лица с элементами RPG и survival horror, разработанная и выпущенная украинской компанией GSC Game World для Microsoft Windows в 2007 году', 2007, 1),
(6, 'S.T.A.L.K.E.R.: Чистое небо', 'Компьютерная игра в жанре шутера от первого лица с элементами ролевой игры, разработанная украинской компанией GSC Game World и выпущенная в России 22 августа 2008 года', 2008, 1),
(7, 'S.T.A.L.K.E.R.: Зов Припяти', ' компьютерная игра в жанре шутер от первого лица с элементами ролевой игры и survival horror от украинской компании GSC Game World, сиквел игры «S.T.A.L.K.E.R.: Тень Чернобыля', 2009, 1),
(8, 'Dota2', 'gg wp', 2003, 6),
(9, 'Half-life', 'Half-Life (с англ. — «период полураспада») — компьютерная игра в жанре научно-фантастического шутера от первого лица.', 1998, 3),
(10, 'Half-life2', 'компьютерная игра, научно-фантастический шутер от первого лица, сиквел Half-Life, разработанный Valve Corporation', 2004, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `games_genres`
--

CREATE TABLE `games_genres` (
  `ID` int(11) NOT NULL,
  `GameID` int(11) NOT NULL,
  `GenreID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `games_genres`
--

INSERT INTO `games_genres` (`ID`, `GameID`, `GenreID`) VALUES
(1, 1, 8),
(4, 3, 8),
(6, 2, 8),
(7, 4, 8),
(9, 8, 3),
(10, 7, 4),
(11, 5, 4),
(12, 6, 4),
(13, 9, 4),
(14, 10, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`ID`, `Name`) VALUES
(1, 'RPG'),
(3, 'MOBA'),
(4, 'Шутер'),
(5, 'Стратегия'),
(6, 'Аркада'),
(7, 'Симулятор'),
(8, 'Экшн');

-- --------------------------------------------------------

--
-- Структура таблицы `publishers`
--

CREATE TABLE `publishers` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `SupportContact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `publishers`
--

INSERT INTO `publishers` (`ID`, `Name`, `Description`, `SupportContact`) VALUES
(1, 'GSC Game World', 'Украинская частная компания, разработчик компьютерных игр (в том числе серий Казаки и S.T.A.L.K.E.R.', 'support@gsc-game.com'),
(3, 'Ubisoft', 'Французская компания, специализирующаяся на разработке и издании компьютерных игр, главный офис которой располагается в Монтрёй, Франция', 'ssupport.ubi.com/ru-ru'),
(4, 'Valve', 'Американская компания-разработчик компьютерных игр, создавшая серии компьютерных игр Half-Life, Portal, Counter-Strike, Team Fortress, Day of Defeat, Left 4 Dead, Ricochet, Alien Swarm, Dota 2 и Artifact; ', 'help.steampowered.com');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `ID` int(11) NOT NULL,
  `Comment` text NOT NULL,
  `FirstPlayingDate` date NOT NULL,
  `Rating` enum('1','2','3','4','5') NOT NULL,
  `GameID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`ID`, `Comment`, `FirstPlayingDate`, `Rating`, `GameID`) VALUES
(1, 'Норм', '2019-07-01', '4', 1),
(3, 'Круто', '2019-07-03', '5', 3),
(4, 'Огонь!', '2019-07-04', '5', 2),
(5, 'Пойдёт', '0000-00-00', '3', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `series`
--

CREATE TABLE `series` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `PublisherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `series`
--

INSERT INTO `series` (`ID`, `Name`, `PublisherID`) VALUES
(1, 'STALKER', 1),
(3, 'Half-life', 4),
(5, 'Portal', 4),
(6, 'Defence of the ancients', 4),
(7, 'Assassin\'s Creed', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SeriesID` (`SeriesID`);

--
-- Индексы таблицы `games_genres`
--
ALTER TABLE `games_genres`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GameID` (`GameID`),
  ADD KEY `GenreID` (`GenreID`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GameID` (`GameID`);

--
-- Индексы таблицы `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `games`
--
ALTER TABLE `games`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `games_genres`
--
ALTER TABLE `games_genres`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `publishers`
--
ALTER TABLE `publishers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `series`
--
ALTER TABLE `series`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_2` FOREIGN KEY (`SeriesID`) REFERENCES `series` (`ID`);

--
-- Ограничения внешнего ключа таблицы `games_genres`
--
ALTER TABLE `games_genres`
  ADD CONSTRAINT `games_genres_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `games` (`ID`),
  ADD CONSTRAINT `games_genres_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genres` (`ID`);

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`GameID`) REFERENCES `games` (`ID`);

--
-- Ограничения внешнего ключа таблицы `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `series_ibfk_1` FOREIGN KEY (`PublisherID`) REFERENCES `publishers` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
