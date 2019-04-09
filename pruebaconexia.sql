-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2019 a las 22:29:43
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebaconexia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camarero`
--

CREATE TABLE `camarero` (
  `IdCamarero` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(30) NOT NULL,
  `Apellido2` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `camarero`
--

INSERT INTO `camarero` (`IdCamarero`, `Nombre`, `Apellido1`, `Apellido2`) VALUES
(1, 'michael', 'duert', '2'),
(2, 'pancho', 'garcia', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(30) NOT NULL,
  `Apellido2` varchar(30) DEFAULT NULL,
  `Observaciones` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Nombre`, `Apellido1`, `Apellido2`, `Observaciones`) VALUES
(1, 'juan', 'char', 'suar', 'cliente preferencial'),
(2, 'hallei', 'towers', 'velandi', 'vip'),
(3, 'men', 'vega', 'gonzalez', 'rregular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocinero`
--

CREATE TABLE `cocinero` (
  `idCocinero` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(30) NOT NULL,
  `Apellido2` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cocinero`
--

INSERT INTO `cocinero` (`idCocinero`, `Nombre`, `Apellido1`, `Apellido2`) VALUES
(1, 'cocinero1', 'apellido', 'apellido2'),
(2, 'cocinero2', 'apellido', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `IdFactura` int(11) NOT NULL,
  `IdDetalleFactura` int(11) NOT NULL,
  `IdCocinero` int(11) NOT NULL,
  `Plato` varchar(25) NOT NULL,
  `Importe` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`IdFactura`, `IdDetalleFactura`, `IdCocinero`, `Plato`, `Importe`) VALUES
(1, 1, 1, 'pizza', '50000'),
(1, 2, 1, 'perro', '25000'),
(2, 1, 1, 'CENA', '100000'),
(1, 2, 1, 'corriente', '35000'),
(4, 2, 1, 'ejecutivo', '80000'),
(3, 1, 1, 'sopa', '3000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IdFactura` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdCamarero` int(11) NOT NULL,
  `IdMesa` int(11) NOT NULL,
  `FechaFactura` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`IdFactura`, `IdCliente`, `IdCamarero`, `IdMesa`, `FechaFactura`) VALUES
(1, 2, 2, 2, '2029-03-19'),
(2, 3, 2, 2, '2029-03-19'),
(3, 1, 1, 1, '2029-03-19'),
(4, 3, 2, 2, '2029-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `IdMesa` int(11) NOT NULL,
  `NumMaxComensa` int(11) NOT NULL,
  `Ubicacion` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`IdMesa`, `NumMaxComensa`, `Ubicacion`) VALUES
(1, 4, 'sala'),
(2, 4, 'salon'),
(3, 5, 'salon'),
(4, 9, 'principal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camarero`
--
ALTER TABLE `camarero`
  ADD PRIMARY KEY (`IdCamarero`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD PRIMARY KEY (`idCocinero`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IdFactura`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`IdMesa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
