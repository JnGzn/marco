CREATE database marco;
use marco;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-03-2020 a las 03:18:47
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `marco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `idActividad` int(11) NOT NULL,
  `tituloActividad` varchar(50) NOT NULL,
  `fechaActividad` date NOT NULL,
  `horaActividad` varchar(45) NOT NULL,
  `duracionActividad` float NOT NULL,
  `cuposActividad` int(11) NOT NULL,
  `precioActividad` double DEFAULT NULL,
  `EMPRESA_nit` int(11) NOT NULL,
  `estadoActividad` varchar(15) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `descuento` varchar(3) DEFAULT NULL,
  `fk_empresa` int(11) NOT NULL,
  `fk_lugar` int(11) NOT NULL,
  `fk_categoria` int(11) NOT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `img3` varchar(100) DEFAULT NULL,
  `img4` varchar(100) DEFAULT NULL,
  `img5` varchar(100) DEFAULT NULL,
  `noVentas` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`idActividad`, `tituloActividad`, `fechaActividad`, `horaActividad`, `duracionActividad`, `cuposActividad`, `precioActividad`, `EMPRESA_nit`, `estadoActividad`, `descripcion`, `descuento`, `fk_empresa`, `fk_lugar`, `fk_categoria`, `img1`, `img2`, `img3`, `img4`, `img5`, `noVentas`) VALUES
(39, 'caminata por la ciudad', '2020-03-19', '00:03', 432, 32, 23213, 3438, 'activo', 'caminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudad', NULL, 3438, 54545, 12, 'imagenes/3438_caminata por la ciudad_descarga.jpg', NULL, NULL, NULL, NULL, 3),
(40, 'caminata por la ciudad', '2020-03-13', '02:34', 43, 55, 6546456, 3438, 'activo', 'jufcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudadcaminata por la ciudad', NULL, 3438, 54546, 11, 'imagenes/3438_caminata por la ciudad_descarga.jpg', 'imagenes/3438_caminata por la ciudad_images.jpg', 'imagenes/3438_caminata por la ciudad_', 'imagenes/3438_caminata por la ciudad_', NULL, 1),
(41, 'caminata por la ciudad', '2020-03-19', '04:34', 3423, 234, 3423, 3438, 'activo', 'caminata por la ciudadcaminata por la ciudadcaminata por la ciudad', NULL, 3438, 54545, 15, 'imagenes/3438_caminata por la ciudad_images.jpg', 'imagenes/3438_caminata por la ciudad_', 'imagenes/3438_caminata por la ciudad_', 'imagenes/3438_caminata por la ciudad_', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `tipoCategoria` varchar(20) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `tipoCategoria`, `EMPRESA_nit`) VALUES
(11, 'Cat 1', 3438),
(12, 'Cat 2', 3438),
(13, 'cat 3', 3438),
(14, 'cat 3', 3438),
(15, 'cat 4', 3438),
(16, 'cat 5', 3438);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `idDocumento` int(11) NOT NULL,
  `tipoDocumento` varchar(15) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nit` int(11) NOT NULL,
  `razonSocial` varchar(65) NOT NULL,
  `correoEmpresa` varchar(45) NOT NULL,
  `ROL_idRol` int(11) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`nit`, `razonSocial`, `correoEmpresa`, `ROL_idRol`, `estado`, `pass`, `logo`) VALUES
(3438, 'juanito', 'JUAN@JUAN.COM', 2, 'activo', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'imagenes/logo-3438-Fullmetal Alchemist - Personajes.jpg'),
(1122348, 'juan', 'juan@q.co', 2, 'activo', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', ''),
(36621738, 'integracion', 'juan@g.com', 2, 'activo', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', ''),
(45654324, 'juan', 'juanito@q.co', 2, 'activo', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar`
--

CREATE TABLE `lugar` (
  `idLugar` int(11) NOT NULL,
  `direccionLugar` varchar(45) NOT NULL,
  `zonaLugar` varchar(45) NOT NULL,
  `aforoLugar` int(11) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lugar`
--

INSERT INTO `lugar` (`idLugar`, `direccionLugar`, `zonaLugar`, `aforoLugar`, `EMPRESA_nit`) VALUES
(54545, 'mi casa ', 'Norte', 45, 3438),
(54546, 'mi casa 2', 'centro', 45, 3438),
(54547, 'mi casa 4', 'sur', 76, 3438);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multimedia`
--

CREATE TABLE `multimedia` (
  `idMultimedia` int(11) NOT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `ACTIVIDAD_idActividad` int(11) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `cantidadReservas` int(11) NOT NULL,
  `precioTotal` varchar(45) NOT NULL,
  `nombreComprador` varchar(45) NOT NULL,
  `apellidoComprador` varchar(45) NOT NULL,
  `documentoComprador` varchar(45) NOT NULL,
  `correoComprador` varchar(45) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `opinion` varchar(300) DEFAULT NULL,
  `fk_usuario` int(11) NOT NULL,
  `fk_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `tipoRol` varchar(10) NOT NULL,
  `estadoRol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `correoUsuario` varchar(45) NOT NULL,
  `contraseñaUsuario` varchar(100) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `DOCUMENTO_idDocumento` int(11) DEFAULT NULL,
  `ROL_idRol` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `celular` varchar(12) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='			';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `correoUsuario`, `contraseñaUsuario`, `nombres`, `apellidos`, `DOCUMENTO_idDocumento`, `ROL_idRol`, `fechaNacimiento`, `celular`, `direccion`, `estado`) VALUES
(22, 'j@j.co', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Juan', 'Garzon', NULL, 1, '2020-03-19', NULL, NULL, 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`idActividad`),
  ADD KEY `fk_ACTIVIDAD_EMPRESA1_idx` (`fk_empresa`,`EMPRESA_nit`),
  ADD KEY `fk_ACTIVIDAD_LUGAR1_idx` (`fk_lugar`),
  ADD KEY `fk_ACTIVIDAD_CATEGORIA1_idx` (`fk_categoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `fk_CATEGORIA_EMPRESA1_idx` (`EMPRESA_nit`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nit`,`ROL_idRol`),
  ADD KEY `fk_EMPRESA_ROL1_idx` (`ROL_idRol`);

--
-- Indices de la tabla `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`idLugar`),
  ADD KEY `fk_LUGAR_EMPRESA1_idx` (`EMPRESA_nit`);

--
-- Indices de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  ADD PRIMARY KEY (`idMultimedia`),
  ADD KEY `fk_Multimedia_ACTIVIDAD1_idx` (`ACTIVIDAD_idActividad`),
  ADD KEY `fk_Multimedia_EMPRESA1_idx` (`EMPRESA_nit`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_RESERVA_USUARIO1_idx` (`fk_usuario`),
  ADD KEY `fk_RESERVA_ACTIVIDAD1_idx` (`fk_actividad`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_USUARIO_DOCUMENTO1_idx` (`DOCUMENTO_idDocumento`),
  ADD KEY `fk_USUARIO_ROL1_idx` (`ROL_idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `idActividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `idDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugar`
--
ALTER TABLE `lugar`
  MODIFY `idLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54548;

--
-- AUTO_INCREMENT de la tabla `multimedia`
--
ALTER TABLE `multimedia`
  MODIFY `idMultimedia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
