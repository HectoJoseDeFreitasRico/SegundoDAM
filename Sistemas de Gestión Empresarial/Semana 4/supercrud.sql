-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2023 a las 05:59:21
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `supercrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregas`
--

CREATE TABLE `entregas` (
  `Identificador` int(20) NOT NULL,
  `NIF` varchar(9) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'Este campo contiene el NIF del usuario',
  `url` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL COMMENT 'En este campo debes introducir la url que has copiado y has pegado de youtube',
  `practica` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL COMMENT 'A continuacion debes indicar la practica que estas entregando',
  `epoch` int(12) DEFAULT NULL COMMENT 'En este campo aparecera la marca de tiempo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `entregas`
--

INSERT INTO `entregas` (`Identificador`, `NIF`, `url`, `practica`, `epoch`) VALUES
(1, '12345678a', 'AGAÑLDGNAR', 'asrgwevafwds', 15316),
(2, '87654321b', 'asdfasdf', 'asdfasdfca', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`Identificador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
  MODIFY `Identificador` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
