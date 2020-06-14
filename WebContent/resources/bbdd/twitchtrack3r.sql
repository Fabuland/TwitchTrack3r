-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2020 a las 13:08:09
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `twitchtrack3r`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `streamer`
--

CREATE TABLE `streamer` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `online` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `subscribers` int(11) NOT NULL,
  `followers` int(11) NOT NULL,
  `category_id` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `streamer`
--

INSERT INTO `streamer` (`id`, `name`, `online`, `subscribers`, `followers`, `category_id`) VALUES
(17, 'XQC', 'Online', 37543, 4312464, 'Just Chatting'),
(18, 'Mizkif', 'Offline', 13000, 760000, 'Just Chatting'),
(20, 'LVPes', 'Online', 1200, 400000, 'League of Legends'),
(21, 'Orslok', 'Online', 4324, 299321, 'Just Chatting'),
(22, 'Auronplay', 'Offline', 13645, 1432455, 'Grand Theft Auto V'),
(23, 'loltyler1', 'Offline', 45321, 3776456, 'League of Legends'),
(24, 'caps', 'Offline', 32112, 587643, 'League of Legends'),
(25, 'DrDisrespect', 'Online', 43221, 6542324, 'Call of Duty: Modern Warfare'),
(26, 'TimTheTatman', 'Offline', 45342, 7564232, 'Call of Duty: Modern Warfare'),
(27, 'bysTaXx', 'Online', 12531, 1242145, 'Counter-Strike: Global Offensive'),
(28, 'x6FlipiN', 'Online', 4315, 531424, 'Counter-Strike: Global Offensive'),
(29, 'Tfue', 'Online', 32652, 5321324, 'Fortnite'),
(30, 'Mongraal', 'Online', 23574, 5326221, 'Fortnite'),
(31, 'Anomaly', 'Offline', 12531, 894212, 'VALORANT'),
(32, 'ElRichMC', 'Online', 6312, 812412, 'Minecraft'),
(33, 'lilypichu', 'Online', 23451, 2312354, 'Minecraft'),
(34, 'RajjPatel', 'Online', 23512, 612412, 'Just Chatting'),
(35, 'FEDMYSTER', 'Online', 23512, 2412758, 'Just Chatting'),
(36, 'Greekgodx', 'Online', 15212, 3151253, 'Just Chatting'),
(37, 'JaimeAltozano', 'Online', 8232, 141264, 'Just Chatting'),
(38, 'Pestily', 'Offline', 3215, 543123, 'Escape From Tarkov'),
(39, 'Arteezy', 'Offline', 3214, 643123, 'Dota 2'),
(40, 'Perxitaa', 'Offline', 12156, 421534, 'Grand Theft Auto V'),
(41, 'Myth', 'Offline', 42123, 2315436, 'VALORANT'),
(42, 'fer', 'Offline', 4322, 1231217, 'Counter-Strike: Global Offensive'),
(43, 'Clix', 'Offline', 3464, 543123, 'Fortnite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`) VALUES
(4, 'Pepep', '12345', 'pepe@gmail.com'),
(5, 'Manuel', '23456', 'manuel@gmail.com'),
(6, 'Paco', '12345', 'paco@gmail.com'),
(7, 'Carlos', '12345', 'carlos@gmail.com'),
(8, 'Antonio', '12345', 'antonio@outlook.com'),
(9, 'Fran', '93289', 'fran@hotmail.es'),
(10, 'Andres', '32111', 'andres@hotmail.es'),
(11, 'Jose', '32134', 'jose@gmail.com'),
(12, 'Gustavo', '32422', 'gustavo@gmail.com'),
(13, 'Maria', '32131', 'maria@gmail.com'),
(14, 'Mario', '321412', 'mario@gmail.com'),
(15, 'Angel', '23134', 'angel@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `streamer`
--
ALTER TABLE `streamer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `streamer`
--
ALTER TABLE `streamer`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
