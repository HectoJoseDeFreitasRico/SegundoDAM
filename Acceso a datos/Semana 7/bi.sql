-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2023 a las 09:00:54
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
-- Base de datos: `bi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salesorders`
--

CREATE TABLE `salesorders` (
  `OrderDate` varchar(8) DEFAULT NULL,
  `Region` varchar(7) DEFAULT NULL,
  `Rep` varchar(8) DEFAULT NULL,
  `Item` varchar(7) DEFAULT NULL,
  `Units` int(2) DEFAULT NULL,
  `Unit Cost` varchar(7) DEFAULT NULL,
  `Total` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `salesorders`
--

INSERT INTO `salesorders` (`OrderDate`, `Region`, `Rep`, `Item`, `Units`, `Unit Cost`, `Total`) VALUES
('1/6/21', 'East', 'Jones', 'Pencil', 95, '1,99 ', '189,05 '),
('1/23/21', 'Central', 'Kivell', 'Binder', 50, '19,99 ', '999,50 '),
('2/9/21', 'Central', 'Jardine', 'Pencil', 36, '4,99 ', '179,64 '),
('2/26/21', 'Central', 'Gill', 'Pen', 27, '19,99 ', '539,73 '),
('3/15/21', 'West', 'Sorvino', 'Pencil', 56, '2,99 ', '167,44 '),
('4/1/21', 'East', 'Jones', 'Binder', 60, '4,99 ', '299,40 '),
('4/18/21', 'Central', 'Andrews', 'Pencil', 75, '1,99 ', '149,25 '),
('5/5/21', 'Central', 'Jardine', 'Pencil', 90, '4,99 ', '449,10 '),
('5/22/21', 'West', 'Thompson', 'Pencil', 32, '1,99 ', '63,68 '),
('6/8/21', 'East', 'Jones', 'Binder', 60, '8,99 ', '539,40 '),
('6/25/21', 'Central', 'Morgan', 'Pencil', 90, '4,99 ', '449,10 '),
('7/12/21', 'East', 'Howard', 'Binder', 29, '1,99 ', '57,71 '),
('7/29/21', 'East', 'Parent', 'Binder', 81, '19,99 ', '1.619,19 '),
('8/15/21', 'East', 'Jones', 'Pencil', 35, '4,99 ', '174,65 '),
('9/1/21', 'Central', 'Smith', 'Desk', 2, '125,00 ', '250,00 '),
('9/18/21', 'East', 'Jones', 'Pen Set', 16, '15,99 ', '255,84 '),
('10/5/21', 'Central', 'Morgan', 'Binder', 28, '8,99 ', '251,72 '),
('10/22/21', 'East', 'Jones', 'Pen', 64, '8,99 ', '575,36 '),
('11/8/21', 'East', 'Parent', 'Pen', 15, '19,99 ', '299,85 '),
('11/25/21', 'Central', 'Kivell', 'Pen Set', 96, '4,99 ', '479,04 '),
('12/12/21', 'Central', 'Smith', 'Pencil', 67, '1,29 ', '86,43 '),
('12/29/21', 'East', 'Parent', 'Pen Set', 74, '15,99 ', '1.183,26 '),
('1/15/22', 'Central', 'Gill', 'Binder', 46, '8,99 ', '413,54 '),
('2/1/22', 'Central', 'Smith', 'Binder', 87, '15,00 ', '1.305,00 '),
('2/18/22', 'East', 'Jones', 'Binder', 4, '4,99 ', '19,96 '),
('3/7/22', 'West', 'Sorvino', 'Binder', 7, '19,99 ', '139,93 '),
('3/24/22', 'Central', 'Jardine', 'Pen Set', 50, '4,99 ', '249,50 '),
('4/10/22', 'Central', 'Andrews', 'Pencil', 66, '1,99 ', '131,34 '),
('4/27/22', 'East', 'Howard', 'Pen', 96, '4,99 ', '479,04 '),
('5/14/22', 'Central', 'Gill', 'Pencil', 53, '1,29 ', '68,37 '),
('5/31/22', 'Central', 'Gill', 'Binder', 80, '8,99 ', '719,20 '),
('6/17/22', 'Central', 'Kivell', 'Desk', 5, '125,00 ', '625,00 '),
('7/4/22', 'East', 'Jones', 'Pen Set', 62, '4,99 ', '309,38 '),
('7/21/22', 'Central', 'Morgan', 'Pen Set', 55, '12,49 ', '686,95 '),
('8/7/22', 'Central', 'Kivell', 'Pen Set', 42, '23,95 ', '1.005,90 '),
('8/24/22', 'West', 'Sorvino', 'Desk', 3, '275,00 ', '825,00 '),
('9/10/22', 'Central', 'Gill', 'Pencil', 7, '1,29 ', '9,03 '),
('9/27/22', 'West', 'Sorvino', 'Pen', 76, '1,99 ', '151,24 '),
('10/14/22', 'West', 'Thompson', 'Binder', 57, '19,99 ', '1.139,43 '),
('10/31/22', 'Central', 'Andrews', 'Pencil', 14, '1,29 ', '18,06 '),
('11/17/22', 'Central', 'Jardine', 'Binder', 11, '4,99 ', '54,89 '),
('12/4/22', 'Central', 'Jardine', 'Binder', 94, '19,99 ', '1.879,06 '),
('12/21/22', 'Central', 'Andrews', 'Binder', 28, '4,99 ', '139,72 ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
