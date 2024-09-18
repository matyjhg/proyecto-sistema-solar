-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2024 a las 04:36:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_solar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estrellas`
--

CREATE TABLE `estrellas` (
  `id_estrellas` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `magnitud` float DEFAULT NULL,
  `distancia_a_tierra` float DEFAULT NULL,
  `edad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estrellas`
--

INSERT INTO `estrellas` (`id_estrellas`, `nombre`, `tipo`, `magnitud`, `distancia_a_tierra`, `edad`) VALUES
(1, 'Sol', 'G2V', -26.74, 0, 4.6),
(2, 'Sirius', 'A1V', -1.46, 8.6, 200),
(3, 'Betelgeuse', 'M1-M2', 0.42, 642, 10),
(4, 'Aldebarán', 'K5III', 0.85, 65, 65),
(5, 'Rigel', 'B8Ia', 0.18, 863, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lunas`
--

CREATE TABLE `lunas` (
  `id_lunas` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `planeta_id` int(11) DEFAULT NULL,
  `diametro` float DEFAULT NULL,
  `distancia_al_planeta` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lunas`
--

INSERT INTO `lunas` (`id_lunas`, `nombre`, `planeta_id`, `diametro`, `distancia_al_planeta`) VALUES
(1, 'Luna', 1, 3474.8, 384400),
(2, 'Fobos', 2, 22.4, 6000),
(3, 'Deimos', 2, 12.4, 23460),
(4, 'Io', 3, 3642, 421700),
(5, 'Europa', 3, 3121.6, 670900),
(6, 'Titán', 4, 5150, 1221700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planetas`
--

CREATE TABLE `planetas` (
  `id_planetas` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `diametro` float DEFAULT NULL,
  `masa` float DEFAULT NULL,
  `distancia_al_sol` float DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `id_estrellas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `planetas`
--

INSERT INTO `planetas` (`id_planetas`, `nombre`, `diametro`, `masa`, `distancia_al_sol`, `tipo`, `id_estrellas`) VALUES
(1, 'Mercurio', 4879.4, 3.3011e23, 57.91, 'rocoso', NULL),
(2, 'Venus', 12104, 4.8675e24, 108.2, 'rocoso', NULL),
(3, 'Tierra', 12742, 5.97237e24, 149.6, 'rocoso', NULL),
(4, 'Marte', 6779, 6.4171e23, 227.9, 'rocoso', NULL),
(5, 'Júpiter', 139820, 1.8982e27, 778.5, 'gaseoso', NULL),
(6, 'Saturno', 116460, 5.6834e26, 1433.5, 'gaseoso', NULL),
(7, 'Urano', 50724, 8.681e25, 2872.5, 'gaseoso', NULL),
(8, 'Neptuno', 49244, 1.02413e26, 4495.1, 'gaseoso', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estrellas`
--
ALTER TABLE `estrellas`
  ADD PRIMARY KEY (`id_estrellas`);

--
-- Indices de la tabla `lunas`
--
ALTER TABLE `lunas`
  ADD PRIMARY KEY (`id_lunas`),
  ADD KEY `planeta_id` (`planeta_id`);

--
-- Indices de la tabla `planetas`
--
ALTER TABLE `planetas`
  ADD PRIMARY KEY (`id_planetas`),
  ADD KEY `id_estrellas` (`id_estrellas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estrellas`
--
ALTER TABLE `estrellas`
  MODIFY `id_estrellas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `lunas`
--
ALTER TABLE `lunas`
  MODIFY `id_lunas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `planetas`
--
ALTER TABLE `planetas`
  MODIFY `id_planetas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lunas`
--
ALTER TABLE `lunas`
  ADD CONSTRAINT `lunas_ibfk_1` FOREIGN KEY (`planeta_id`) REFERENCES `planetas` (`id_planetas`);

--
-- Filtros para la tabla `planetas`
--
ALTER TABLE `planetas`
  ADD CONSTRAINT `planetas_ibfk_1` FOREIGN KEY (`id_estrellas`) REFERENCES `estrellas` (`id_estrellas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
