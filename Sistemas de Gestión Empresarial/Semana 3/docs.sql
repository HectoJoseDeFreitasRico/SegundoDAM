-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2023 a las 21:48:26
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
-- Base de datos: `docs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `Identificador` int(15) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`Identificador`, `fecha`, `titulo`, `contenido`) VALUES
(1, '0000-00-00', 'Este es el titulo del primer articulo', '¿Cuál es el mejor whisky del mundo?\r\n\r\nEl mejor del mundo es el Blue Label de Johnnie Walker.\r\n\r\n¿Y ese que tiene vos, también es bueno?\r\n\r\nNah tampoco lo tomo porque un Johnnie Walker etiqueta negra, lo tomo. Pero cuando es algo especial, tomo un Blue Label, es un elixir, y los otros son un whisky. Uno se toma, el otro se saborea.\r\n\r\nDe etiqueta negra es para tomar fuertes después de las cenas, después de la cena, el Blue Label es para cualquier hora. Puede tomarlo en la mañana, jamás te va a agarrar acidez ni gastritis, así vale la botella.'),
(3, '2023-10-24', 'Titulo del segundo articulo', 'A continuación voy a redactar otro articulo de la web que a ser el segundo para demostrar que salen de la base de datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cms`
--

CREATE TABLE `cms` (
  `Identificador` int(15) NOT NULL,
  `elemento` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `idioma` varchar(5) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cms`
--

INSERT INTO `cms` (`Identificador`, `elemento`, `contenido`, `idioma`) VALUES
(1, 'titulo', 'Docs', 'es'),
(2, 'subtitulo', 'Crea tus documentos en la nube', 'es'),
(3, 'copyright', '(c)2023 Hector Jose', 'es'),
(4, 'bannertitulo', 'Este es el titulo del banner', 'es'),
(5, 'bannertexto', 'Este es el texto del banner', 'es'),
(6, 'iniciocaja1', 'Este es un bloque de texto que vamos a encontrar en la primera caja del inicio', 'es'),
(7, 'iniciocaja2', 'Este es un bloque de texto que vamos a encontrar en la segunda caja del inicio', 'es'),
(8, 'iniciocaja3', 'Este es un bloque de texto que vamos a encontrar en la tercera caja del inicio', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compartido`
--

CREATE TABLE `compartido` (
  `Identificador` int(15) NOT NULL,
  `FK_documentos_titulo` int(15) NOT NULL,
  `FK_usuarios_nombre` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `Identificador` int(15) NOT NULL,
  `FK_usuarios_nombre` int(16) NOT NULL,
  `FK_tipodocumento_documento` int(15) NOT NULL,
  `fechadecreacion` date NOT NULL,
  `publico` tinyint(1) NOT NULL,
  `compartido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `Identificador` int(4) NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Identificador` int(15) NOT NULL,
  `usuario` varchar(16) COLLATE utf8mb4_spanish_ci NOT NULL,
  `contrasena` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `compartido`
--
ALTER TABLE `compartido`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Identificador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `Identificador` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cms`
--
ALTER TABLE `cms`
  MODIFY `Identificador` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compartido`
--
ALTER TABLE `compartido`
  MODIFY `Identificador` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `Identificador` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `Identificador` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Identificador` int(15) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
