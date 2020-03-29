-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 21-03-2020 a las 01:43:35
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `MARCO`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ACTIVIDAD`
--
use marco;
CREATE TABLE `ACTIVIDAD` (
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
  `img5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ACTIVIDAD`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIA`
--

CREATE TABLE `CATEGORIA` (
  `idCategoria` int(11) NOT NULL,
  `tipoCategoria` varchar(20) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `CATEGORIA`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DOCUMENTO`
--

CREATE TABLE `DOCUMENTO` (
  `idDocumento` int(11) NOT NULL,
  `tipoDocumento` varchar(15) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPRESA`
--

CREATE TABLE `EMPRESA` (
  `nit` int(11) NOT NULL,
  `razonSocial` varchar(65) NOT NULL,
  `correoEmpresa` varchar(45) NOT NULL,
  `ROL_idRol` int(11) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `logo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `EMPRESA`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LUGAR`
--

CREATE TABLE `LUGAR` (
  `idLugar` int(11) NOT NULL,
  `direccionLugar` varchar(45) NOT NULL,
  `zonaLugar` varchar(45) NOT NULL,
  `aforoLugar` int(11) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `LUGAR`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Multimedia`
--

CREATE TABLE `Multimedia` (
  `idMultimedia` int(11) NOT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `ACTIVIDAD_idActividad` int(11) NOT NULL,
  `EMPRESA_nit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RESERVA`
--

CREATE TABLE `RESERVA` (
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

--
-- Volcado de datos para la tabla `RESERVA`
--




-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROL`
--

CREATE TABLE `ROL` (
  `idRol` int(11) NOT NULL,
  `tipoRol` varchar(10) NOT NULL,
  `estadoRol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
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
-- Volcado de datos para la tabla `USUARIO`
--



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ACTIVIDAD`
--
ALTER TABLE `ACTIVIDAD`
  ADD PRIMARY KEY (`idActividad`),
  ADD KEY `fk_ACTIVIDAD_EMPRESA1_idx` (`fk_empresa`,`EMPRESA_nit`),
  ADD KEY `fk_ACTIVIDAD_LUGAR1_idx` (`fk_lugar`),
  ADD KEY `fk_ACTIVIDAD_CATEGORIA1_idx` (`fk_categoria`);

--
-- Indices de la tabla `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `fk_CATEGORIA_EMPRESA1_idx` (`EMPRESA_nit`);

--
-- Indices de la tabla `DOCUMENTO`
--
ALTER TABLE `DOCUMENTO`
  ADD PRIMARY KEY (`idDocumento`);

--
-- Indices de la tabla `EMPRESA`
--
ALTER TABLE `EMPRESA`
  ADD PRIMARY KEY (`nit`,`ROL_idRol`),
  ADD KEY `fk_EMPRESA_ROL1_idx` (`ROL_idRol`);

--
-- Indices de la tabla `LUGAR`
--
ALTER TABLE `LUGAR`
  ADD PRIMARY KEY (`idLugar`),
  ADD KEY `fk_LUGAR_EMPRESA1_idx` (`EMPRESA_nit`);

--
-- Indices de la tabla `Multimedia`
--
ALTER TABLE `Multimedia`
  ADD PRIMARY KEY (`idMultimedia`),
  ADD KEY `fk_Multimedia_ACTIVIDAD1_idx` (`ACTIVIDAD_idActividad`),
  ADD KEY `fk_Multimedia_EMPRESA1_idx` (`EMPRESA_nit`);

--
-- Indices de la tabla `RESERVA`
--
ALTER TABLE `RESERVA`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_RESERVA_USUARIO1_idx` (`fk_usuario`),
  ADD KEY `fk_RESERVA_ACTIVIDAD1_idx` (`fk_actividad`);

--
-- Indices de la tabla `ROL`
--
ALTER TABLE `ROL`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_USUARIO_DOCUMENTO1_idx` (`DOCUMENTO_idDocumento`),
  ADD KEY `fk_USUARIO_ROL1_idx` (`ROL_idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ACTIVIDAD`
--
ALTER TABLE `ACTIVIDAD`
  MODIFY `idActividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `DOCUMENTO`
--
ALTER TABLE `DOCUMENTO`
  MODIFY `idDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `LUGAR`
--
ALTER TABLE `LUGAR`
  MODIFY `idLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54545;

--
-- AUTO_INCREMENT de la tabla `Multimedia`
--
ALTER TABLE `Multimedia`
  MODIFY `idMultimedia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `RESERVA`
--
ALTER TABLE `RESERVA`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `ROL`
--
ALTER TABLE `ROL`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
