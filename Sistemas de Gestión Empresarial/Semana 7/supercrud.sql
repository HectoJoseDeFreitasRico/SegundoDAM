-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2023 a las 00:34:26
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
  `Identificador` int(20) NOT NULL COMMENT '{"titulo":"Introduce tu email","descripcion":"Introduce tu email","placeholder":"ej:persona@dominio.com","mascara":"algo","min":"5","deshabilitado":"false","visible":"false","tipodato":"number"}	',
  `email` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT '{"titulo":"Introduce tu email","descripcion":"Introduce tu email","placeholder":"ej:persona@dominio.com","mascara":"algo","min":"5","deshabilitado":"false","visible":"true","icono":"fas fa-at","tipodato":"email","max":"30","max2":"30"}',
  `url` varchar(120) COLLATE utf8mb4_spanish_ci NOT NULL COMMENT '{"titulo":"URL del tráiler","descripcion":"En este campo debes introducir la URL del tráiler de la película que quieres puntuar","placeholder":"ej:https://www.youtube.com/watch?v=GFZv8MWvaeoaseq","mascara":"algo","min":"10","deshabilitado":"false","visible":"true","icono":"fab fa-youtube","tipodato":"url","max":"120"}',
  `nota` int(2) NOT NULL COMMENT '{"titulo":"Nota de la película","descripcion":"Introduce la nota de la película que seleccionaste","placeholder":"ej:Introduce un número","mascara":"algo","min":"1","max":"2","deshabilitado":"false","visible":"true","icono":"fas fa-sort-numeric-up","tipodato":"number","max2":"10"}	',
  `epoch` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '{"titulo":"Número de la práctica","descripcion":"Introduce el número de práctica que vas a subir en esta entrega","placeholder":"ej:Introduce un número","mascara":"algo","min":"1","deshabilitado":"true","visible":"false","tipodato":"text","max":"30","max2":"10000000"}',
  `genero` int(20) NOT NULL COMMENT '{"titulo":"Género de la película","descripcion":"Especifica el código de la asignatura","placeholder":"Introduce el código de la película","mascara":"algo","min":"1","deshabilitado":"true","visible":"true","tipodato":"number","icono":"fas fa-video","parametroget":"idgenero","max":"20","max2":"500"}	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `entregas`
--

INSERT INTO `entregas` (`Identificador`, `email`, `url`, `nota`, `epoch`, `genero`) VALUES
(30, 'hjfnogueira@gmail.com', 'https://www.youtube.com/watch?v=_8ylSrn3SJY', 2, '2023-11-13 14:19:02', 0),
(31, 'hjfnogueira@gmail.com', 'https://www.youtube.com/watch?v=RUccfKydLLQ', 6, '2023-11-13 14:27:20', 0),
(32, 'hjfnogueira@gmail.com', 'https://www.youtube.com/watch?v=bsgU3KrdkpI', 8, '2023-11-13 14:28:09', 0),
(33, 'hjfnogueira@gmail.com', 'https://www.youtube.com/watch?v=JpUd4BS7yI0', 9, '2023-11-13 14:28:40', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `Identificador` int(20) NOT NULL,
  `epoch` int(30) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `ip` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `datos` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`Identificador`, `epoch`, `url`, `ip`, `browser`, `datos`) VALUES
(1, 1699866484, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(2, 1699866588, '//localhost/supercrud/formulario.php?idcurso=14', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'idcurso:14|'),
(7, 1699866978, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/3Z2Rz0Nshlk|practica:4|asignatura:|'),
(8, 1699866978, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/3Z2Rz0Nshlk|practica:4|asignatura:|'),
(9, 1699866983, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(10, 1699867014, '//localhost/supercrud/formulario.php?idcurso=20', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'idcurso:20|'),
(11, 1699867037, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/IZP6ZdOywTQ|practica:6|asignatura:20|'),
(12, 1699867037, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/IZP6ZdOywTQ|practica:6|asignatura:20|'),
(13, 1699867042, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(14, 1699867742, '//localhost/supercrud/formulario.php/enviamail.php', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(15, 1699867742, '//localhost/supercrud/formulario.php/icono.ico', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(16, 1699868408, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(17, 1699868420, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/asqh_T-aCos|practica:5|asignatura:|'),
(18, 1699868420, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/asqh_T-aCos|practica:5|asignatura:|'),
(19, 1699868425, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(20, 1699868476, '//localhost/supercrud/formulario.php?idcurso=34', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'idcurso:34|'),
(21, 1699869025, '//localhost/supercrud/formulario.php/informe.php', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(22, 1699869025, '//localhost/supercrud/formulario.php/icono.ico', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(23, 1699877161, '//localhost/supercrud/formulario.php', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(24, 1699877175, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/A7vMrjsBMTI?si=h1Xn0c2OSmxm4dGW|practica:77|asignatura:|'),
(25, 1699877175, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/A7vMrjsBMTI?si=h1Xn0c2OSmxm4dGW|practica:77|asignatura:|'),
(26, 1699877180, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(27, 1699877947, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=dQw4w9WgXcQ|practica:2|asignatura:|'),
(28, 1699877947, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=dQw4w9WgXcQ|practica:2|asignatura:|'),
(29, 1699877953, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(30, 1699878117, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=A7vMrjsBMTI|practica:1|asignatura:|'),
(31, 1699878117, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=A7vMrjsBMTI|practica:1|asignatura:|'),
(32, 1699878123, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(33, 1699878966, '//localhost/supercrud/formulario.php?idcurso=102', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'idcurso:102|'),
(34, 1699878980, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=A7vMrjsBMTI|practica:4|asignatura:102|'),
(35, 1699878980, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=A7vMrjsBMTI|practica:4|asignatura:102|'),
(36, 1699878985, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(37, 1699881144, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(38, 1699881145, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(39, 1699881145, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(40, 1699881217, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(41, 1699882651, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.rottentomatoes.com/m/five_nights_at_freddys|practica:1993|asignatura:|'),
(42, 1699882651, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.rottentomatoes.com/m/five_nights_at_freddys|practica:1993|asignatura:|'),
(43, 1699882656, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(44, 1699883272, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(45, 1699883331, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(46, 1699884001, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(47, 1699884028, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/asqh_T-aCos|practica:200|asignatura:|'),
(48, 1699884028, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://youtu.be/asqh_T-aCos|practica:200|asignatura:|'),
(49, 1699884033, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(50, 1699884272, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(51, 1699884360, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(52, 1699884505, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(53, 1699884609, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(54, 1699884687, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(55, 1699884735, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(56, 1699884787, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(57, 1699884873, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(58, 1699884910, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(59, 1699885009, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(60, 1699885142, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=_8ylSrn3SJY|nota:2|genero:|'),
(61, 1699885142, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=_8ylSrn3SJY|nota:2|genero:|'),
(62, 1699885147, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(63, 1699885447, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(64, 1699885640, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=RUccfKydLLQ|nota:6|genero:|'),
(65, 1699885640, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=RUccfKydLLQ|nota:6|genero:|'),
(66, 1699885645, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(67, 1699885689, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=bsgU3KrdkpI|nota:8|genero:|'),
(68, 1699885689, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=bsgU3KrdkpI|nota:8|genero:|'),
(69, 1699885695, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(70, 1699885720, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=JpUd4BS7yI0|nota:9|genero:|'),
(71, 1699885720, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'clave:procesaformulario|tabla:entregas|email:hjfnogueira@gmail.com|url:https://www.youtube.com/watch?v=JpUd4BS7yI0|nota:9|genero:|'),
(72, 1699885725, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(73, 1699886069, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', ''),
(74, 1699918081, '//localhost/supercrud/formulario.php?', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`Identificador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
  MODIFY `Identificador` int(20) NOT NULL AUTO_INCREMENT COMMENT '{"titulo":"Introduce tu email","descripcion":"Introduce tu email","placeholder":"ej:persona@dominio.com","mascara":"algo","min":"5","deshabilitado":"false","visible":"false","tipodato":"number"}	', AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `Identificador` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
