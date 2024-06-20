-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2024 a las 03:27:55
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
-- Base de datos: `mercy_developer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Direccion`, `Estado`) VALUES
(1, 'gonzalo', 'limari', 'gonzalolimari@gmail.com', '41123213', 'pinga', 1),
(2, 'ayrton', 'hidalgo', 'hjsp@outlook.cl', '52545485', 'yugoslavia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcionservicio`
--

CREATE TABLE `descripcionservicio` (
  `idDescServ` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Servicio_idServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcionequipo`
--

CREATE TABLE `recepcionequipo` (
  `id` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdServicio` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `TipoPc` int(11) DEFAULT NULL,
  `Accesorio` varchar(45) DEFAULT NULL,
  `MarcaPc` varchar(45) DEFAULT NULL,
  `ModeloPc` varchar(45) DEFAULT NULL,
  `NSerie` varchar(45) DEFAULT NULL,
  `CapacidadRam` int(11) DEFAULT NULL,
  `TipoAlmacenamiento` int(11) DEFAULT NULL,
  `CapacidadAlmacenamiento` varchar(45) DEFAULT NULL,
  `TipoGpu` int(11) DEFAULT NULL,
  `Grafico` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `recepcionequipo`
--

INSERT INTO `recepcionequipo` (`id`, `IdCliente`, `IdServicio`, `Fecha`, `TipoPc`, `Accesorio`, `MarcaPc`, `ModeloPc`, `NSerie`, `CapacidadRam`, `TipoAlmacenamiento`, `CapacidadAlmacenamiento`, `TipoGpu`, `Grafico`) VALUES
(3, 1, 3, '2024-06-13 00:09:00', 1, 'na', 'hp', 'pavilion', '1234', 12, 1, '255', 1, 'nvidia 1050'),
(4, 2, 4, '2024-06-13 14:20:00', 1, 'na', 'asus', 'rog', '43453', 64, 2, '500', 1, 'nvidia 5090');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` int(11) NOT NULL,
  `Sku` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idServicio`, `Nombre`, `Precio`, `Sku`, `Usuario_idUsuario`) VALUES
(3, 'instalación de Windows', 15000, '456', 1),
(4, 'mantenimiento preventivo', 20000, '45434345', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nombre`, `Apellido`, `Correo`, `password`) VALUES
(1, 'gonzalo', 'limari', 'gonzalolimari@gmail.com', 'gonzalo123'),
(2, 'ayrton', 'hidalgo', 'hjsp@outlook.cl', 'papas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `descripcionservicio`
--
ALTER TABLE `descripcionservicio`
  ADD PRIMARY KEY (`idDescServ`),
  ADD KEY `fk_DescripcionServicio_Servicio1_idx` (`Servicio_idServicio`);

--
-- Indices de la tabla `recepcionequipo`
--
ALTER TABLE `recepcionequipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_RecepcionEquipo_Servicio1_idx` (`IdServicio`),
  ADD KEY `fk_RecepcionEquipo_Cliente1_idx` (`IdCliente`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `fk_Servicio_Usuario_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `descripcionservicio`
--
ALTER TABLE `descripcionservicio`
  MODIFY `idDescServ` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recepcionequipo`
--
ALTER TABLE `recepcionequipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `descripcionservicio`
--
ALTER TABLE `descripcionservicio`
  ADD CONSTRAINT `fk_DescripcionServicio_Servicio1` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recepcionequipo`
--
ALTER TABLE `recepcionequipo`
  ADD CONSTRAINT `fk_RecepcionEquipo_Cliente1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RecepcionEquipo_Servicio1` FOREIGN KEY (`IdServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_Servicio_Usuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
