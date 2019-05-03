-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-05-2019 a las 04:29:49
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `elBarrio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `new_rutas`
--

CREATE TABLE `new_rutas` (
  `id_destino` int(6) UNSIGNED NOT NULL,
  `destino` varchar(50) NOT NULL,
  `hora_salida` time NOT NULL,
  `servicio` varchar(15) DEFAULT NULL,
  `hora_llegada` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `new_rutas`
--

INSERT INTO `new_rutas` (`id_destino`, `destino`, `hora_salida`, `servicio`, `hora_llegada`) VALUES
(1, 'TGA-NCA', '12:05:08', 'lujo', '15:11:13'),
(3, 'TGA--CAT', '07:00:00', 'lujo', '09:30:00'),
(4, 'TGA--CAT', '13:15:16', 'LUJO', '16:20:09'),
(5, 'TGA--CAT', '08:05:00', 'lujo', '12:00:00'),
(6, 'JPA--TGA', '13:30:00', 'plus/lujo', '17:00:00'),
(7, 'JPA--TGA', '10:00:00', 'lujo', '13:00:00'),
(8, 'TGA--SIG', '07:00:00', 'Lujo', '09:20:00'),
(9, 'TGA--SIG', '02:00:00', 'Lujo', '05:00:00'),
(10, 'TGA--SIG', '15:00:00', 'Lujo', '18:20:00'),
(11, 'TGA--SIG', '02:00:00', 'Lujo', '05:00:00'),
(12, 'CBA--TGA', '02:00:00', 'Lujo', '05:00:00'),
(13, 'CBA--TGA', '05:00:00', 'Lujo', '08:00:00'),
(14, 'TGA--SPS', '10:00:00', 'Lujo', '13:00:00'),
(15, 'TGA--SPS', '09:00:00', 'Lujo', '11:00:00'),
(16, 'TGA--SIG', '15:00:00', 'Lujo', '17:00:00'),
(17, 'TGA--SIG', '08:00:00', 'Lujo', '10:00:00'),
(18, 'TGA--SPS', '11:00:00', 'Lujo', '13:00:00'),
(19, 'TGA--SPS', '20:00:00', 'Lujo', '23:00:00'),
(20, 'TGA--SLO', '08:00:00', 'Lujo/plus', '11:00:00'),
(21, 'TGA--SLO', '14:00:00', 'normal', '17:00:00'),
(22, 'NCA--TGA', '08:00:00', 'Lujo', '10:29:00'),
(23, 'NCA--TGA', '13:20:00', 'Plus', '16:00:00'),
(24, 'CAT--TGA', '08:00:00', 'lujo/plus', '10:11:00'),
(25, 'CAT--TGA', '19:00:00', 'plus', '22:00:00'),
(26, 'TGA--NCA', '08:00:00', 'Lujo', '10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_automotor`
--

CREATE TABLE `tbl_automotor` (
  `cod_bus` int(11) NOT NULL,
  `fk_cod_empresa` int(11) NOT NULL,
  `tipo_bus` varchar(45) NOT NULL,
  `marca_bus` varchar(45) NOT NULL,
  `color_bus` varchar(45) NOT NULL,
  `capacidad_asientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_automotor_ruta`
--

CREATE TABLE `tbl_automotor_ruta` (
  `cod_ruta_bus` int(11) NOT NULL,
  `cod_automotor` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_boleto`
--

CREATE TABLE `tbl_boleto` (
  `cod_pago` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL,
  `cod_marca` int(11) NOT NULL,
  `precio` float NOT NULL,
  `fecha_vencimiento` varchar(20) NOT NULL,
  `impuesto` float DEFAULT NULL,
  `numero_asiento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compra`
--

CREATE TABLE `tbl_compra` (
  `cod_compra` int(11) NOT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_ruta` int(11) DEFAULT NULL,
  `fecha_vencimiento` varchar(45) DEFAULT NULL,
  `impuesto` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `numero_tarjeta` int(30) NOT NULL,
  `csv` int(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_compra`
--

INSERT INTO `tbl_compra` (`cod_compra`, `cod_usuario`, `cod_ruta`, `fecha_vencimiento`, `impuesto`, `precio`, `numero_tarjeta`, `csv`) VALUES
(1, 44, 5, '12/12', 5, 56, 12345678, 0),
(2, 44, 5, '12/19', 1, 34, 1234567, 0),
(3, 44, 3, '12/18', NULL, NULL, 1234567, 1234),
(4, 44, 1, '31/12', NULL, NULL, 12345, 1223),
(5, 44, 5, '12/13', NULL, NULL, 12345, 1212),
(6, 44, 7, '12/19', NULL, NULL, 1234, 4567),
(7, 44, 1, '12/12', NULL, NULL, 12346, 1234),
(8, 44, 4, '12/18', NULL, NULL, 123465678, 1235),
(9, 46, 1, '07/2022', NULL, NULL, 123948, 123),
(10, 46, 4, '07/2019', NULL, NULL, 987654, 123),
(11, 46, 3, '07/2019', NULL, NULL, 654321, 654),
(12, 46, 3, '07/2019', NULL, NULL, 654321, 654),
(13, 46, 3, '07/2019', NULL, NULL, 654321, 654);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado`
--

CREATE TABLE `tbl_empleado` (
  `cod_persona` int(11) NOT NULL,
  `tipo_empleado` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL,
  `experiencia` varchar(200) DEFAULT NULL,
  `foto` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empleado`
--

INSERT INTO `tbl_empleado` (`cod_persona`, `tipo_empleado`, `cod_empresa`, `experiencia`, `foto`) VALUES
(49, 2, 1, 'recomendado po su calidad de empleado y empatía', 0),
(50, 2, 2, 'bastante', 0),
(51, 1, 4, 'soy nueva en esto, pero puedo', 0),
(52, 3, 1, 'trabajo con mucho gusto en mi empresa, me gusta lo que hago', 0),
(53, 3, 3, 'Es un gusto servirle', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado_bus`
--

CREATE TABLE `tbl_empleado_bus` (
  `cod_empl_bus` int(11) NOT NULL,
  `cod_bus` int(11) NOT NULL,
  `cod_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresa_transporte`
--

CREATE TABLE `tbl_empresa_transporte` (
  `cod_empresa` int(11) NOT NULL,
  `cod_lugar` int(11) DEFAULT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `cantidad_sucursal` int(11) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `dueño` varchar(45) NOT NULL,
  `registro_operaciones` varchar(45) DEFAULT NULL,
  `descripcion` varchar(4000) DEFAULT NULL,
  `ubicacion` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_empresa_transporte`
--

INSERT INTO `tbl_empresa_transporte` (`cod_empresa`, `cod_lugar`, `nombre_empresa`, `telefono`, `cantidad_sucursal`, `correo`, `dueño`, `registro_operaciones`, `descripcion`, `ubicacion`) VALUES
(1, NULL, 'Pulperia Bendicion', '87653454', 3, 'bendicion@yahoo.com', 'Juan', '1990', 'Es un agrado para nosotros presentarnos como una empresa dinámica y emprendedora donde la experiencia garantiza la calidad de nuestros servicios teniendo como finalidad coordinar sus actividades turísticas y de negocios. en el país de una manera confiable y eficaz.cuenta con un centro de operaciones en la ciudad de Tegucigalpa, honduras y alianzas estratégicas con empresas afines en los destinos de nuestro país y fuera de nuestro país.', 'https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d30957.521993377726!2d-87.24943421089162!3d14.095453591733914!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m5!1s0x8f6f97f4d0b68e45%3A0xcd8c5cc88e783ffb!2subicacion+pulperia+bendicion+tegucigalpa!3m2!1d14.0811534!2d-87.24137379999999!4m0!5e0!3m2!1ses!2shn!4v1556774203781!5m2!1ses!2shn'),
(2, NULL, 'Mercadito Navarro', '93423146', 5, 'navarro@yahoo.com', 'Francisco Soler', '1999', 'Empresa familiar, creada para satisfacer, y dar el mejor servicio a las personas que hacia la zona norte de nuestra República de Honduras', 'https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d61917.006766961254!2d-87.23957027360143!3d14.088218174272885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m5!1s0x8f6fbcc2462acd29%3A0x1aff536048f35a76!2subicacion+pulperia+bendicion+tegucigalpa!3m2!1d14.0625673!2d-87.1686213!4m0!5e0!3m2!1ses!2shn!4v1556774538171!5m2!1ses!2shn'),
(3, NULL, 'Pulp Kennedy', '87654352', 4, 'kennedy@yahoo.com', 'Javier Zuniga', '2004', 'los mejores precios y productos', 'https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d61917.23320347258!2d-87.24665662360361!3d14.087383224714836!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m5!1s0x8f6fbce093787c0f%3A0xa464a7cc5f783b7!2sBoulevard+Kennedy%2C+Tegucigalpa!3m2!1d14.061260299999999!2d-87.1826672!4m0!5e0!3m2!1ses!2shn!4v1556774653241!5m2!1ses!2shn'),
(4, NULL, 'Hedman Alas', '22345678', 8, 'dedman.alas@gmail.com', 'Patricia Zuniga', '1995', 'Hedman Alas es una empresa de transporte terrestre en Honduras con sede en la ciudad de San Pedro Sula, actualmente dirigida por Alexander Hedman Alas, esta empresa se a constituido como una línea de lujo en Honduras ofreciendo servicio Lujo, Servicio Ejecutivo y Servicio Ejecutivo Plus. la empresa se destaca por su servicio y modernas unidades. Hedman Alas ganó el premio \"Service Best\" en 2010', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3869.9073262845145!2d-87.18707428584239!3d14.08264769333629!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8f6fa2af0199b889%3A0xab7d94621e1efbb3!2sHedman+Alas!5e0!3m2!1ses-419!2shn!4v1541567011967');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `cod_genero` int(11) NOT NULL,
  `genero` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_genero`
--

INSERT INTO `tbl_genero` (`cod_genero`, `genero`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_hora`
--

CREATE TABLE `tbl_hora` (
  `cod_hora` int(11) NOT NULL,
  `hora` time NOT NULL,
  `minutos` time DEFAULT NULL,
  `segundos` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_hora`
--

INSERT INTO `tbl_hora` (`cod_hora`, `hora`, `minutos`, `segundos`) VALUES
(1, '05:30:00', NULL, NULL),
(2, '07:00:00', NULL, NULL),
(3, '08:30:00', NULL, NULL),
(4, '09:15:00', NULL, NULL),
(5, '12:00:00', NULL, NULL),
(6, '01:30:00', NULL, NULL),
(7, '03:00:00', NULL, NULL),
(8, '05:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_lugar`
--

CREATE TABLE `tbl_lugar` (
  `cod_lugar` int(11) NOT NULL,
  `nombre_lugar` varchar(200) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `cod_lugar_hijo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_lugar`
--

INSERT INTO `tbl_lugar` (`cod_lugar`, `nombre_lugar`, `descripcion`, `codigo_postal`, `cod_lugar_hijo`) VALUES
(1, 'Juticalpa', NULL, NULL, NULL),
(2, 'Catacamas', NULL, NULL, NULL),
(3, 'SPS', NULL, NULL, NULL),
(4, 'Siguatepeque', NULL, NULL, NULL),
(5, 'Tela', NULL, NULL, NULL),
(6, 'Ceiba', NULL, NULL, NULL),
(7, 'Tocoa-Colon', NULL, NULL, NULL),
(8, 'Tegucigalpa', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_marca_tarjeta`
--

CREATE TABLE `tbl_marca_tarjeta` (
  `cod_marca` int(11) NOT NULL,
  `nombre_marca` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_marca_tarjeta`
--

INSERT INTO `tbl_marca_tarjeta` (`cod_marca`, `nombre_marca`, `descripcion`) VALUES
(1, 'VISA', 'ES UNA TARJETA DE DEBITO/CREDITO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `cod_persona` int(11) NOT NULL,
  `cod_genero` int(11) NOT NULL,
  `cod_lugar` int(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nombre_persona` varchar(45) NOT NULL,
  `apellido_persona` varchar(45) NOT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_persona`
--

INSERT INTO `tbl_persona` (`cod_persona`, `cod_genero`, `cod_lugar`, `telefono`, `nombre_persona`, `apellido_persona`, `edad`) VALUES
(10, 2, NULL, '123', 'juan', 'lopez', NULL),
(20, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(24, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(29, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(30, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(31, 1, NULL, '97654534', 'carlos', 'garcia', NULL),
(32, 1, NULL, '97654534', 'carlos', 'lopez', NULL),
(33, 1, NULL, '97654534', 'carlos', 'garcia', NULL),
(34, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(35, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(36, 1, NULL, '97654534', 'juan', 'garcia', NULL),
(37, 1, NULL, '97654534', 'juan', 'garcia', NULL),
(38, 1, NULL, '97654534', 'juan', 'lopez', NULL),
(39, 1, NULL, '98675434', 'Arnold', 'Colindres', NULL),
(40, 1, NULL, '97654534', 'arnold francisco', 'colindres', NULL),
(41, 1, NULL, '97654534', 'carlos', 'lopez', NULL),
(42, 1, NULL, '97654534', 'carlos', 'lopez', NULL),
(43, 1, NULL, '97654534', 'Fran', 'lopez', NULL),
(44, 2, NULL, '97654534', 'Ana', 'Padilla', NULL),
(45, 1, NULL, '98564325', 'pedro', 'lopez', NULL),
(46, 2, NULL, '11234', 'tatiana', 'maradiaga', NULL),
(47, 1, NULL, '12345', 'tati', 'maradia', NULL),
(48, 1, NULL, '1235', 'tati', 'mara', NULL),
(49, 1, NULL, NULL, 'Jose', 'Dominguez', 45),
(50, 1, NULL, NULL, 'Luis', 'Aguilar', 38),
(51, 2, NULL, NULL, 'Rosa ', 'A.', 25),
(52, 1, NULL, '32451786', 'manuel', 'cruz', 45),
(53, 2, 2, NULL, 'Rosita', 'Fresita', 38),
(54, 2, NULL, '1234543', 'norma', 'maradiaga', NULL),
(55, 2, NULL, '1234', 'norma', 'ma', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` text NOT NULL,
  `cantidad_producto` int(13) NOT NULL,
  `precio_producto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`id_producto`, `nombre_producto`, `descripcion_producto`, `cantidad_producto`, `precio_producto`) VALUES
(1, 'churros Zambo', 'Deliciosas tajaditas de plátano con un toque de chile, limón y sal que le dará el sabor picosito que gusta a muchos.', 500, 5),
(2, 'Chorizos', 'el mejor embutido del Sur. Super Fresco', 200, 8),
(3, 'Chorizos', 'el mejor embutido del Sur. Super Fresco', 200, 8),
(4, 'Leche Sula	', 'Leche sula, entera	', 200, 6000),
(5, 'Popcorn premiun	', 'Palomitas de maiz con mantequilla	', 250, 2500),
(6, 'Galletas María	', 'Bolsa pequeña de galletas 	', 50, 75),
(7, 'Coca cola	', 'Toda clase de productos coca cola	', 350, 1000),
(8, 'Huevos	', 'Cartones de huevos	', 8, 620),
(9, 'Clorox	', 'Cloro	', 15, 450),
(10, 'Platano	', 'Platanos de alta calidad	', 15, 89),
(11, 'Yuscara	', 'Toda clase de productos yuscaran	', 100, 250),
(12, 'Pan blanco	', 'Pan blanco hecho en casa	', 60, 76),
(13, 'Del campo	', 'Jugo de naranja El campo	', 35, 150),
(14, 'tacones', 'de toda talla y color', 89, 300),
(15, 'zapato escolar', 'para niñas y niños', 200, 250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ruta`
--

CREATE TABLE `tbl_ruta` (
  `cod_ruta` int(11) NOT NULL,
  `tbl_empleado_cod_persona` int(11) DEFAULT NULL,
  `cod_hora` int(11) NOT NULL,
  `cod_lugar_origen` int(11) NOT NULL,
  `cod_lugar_destino` int(11) NOT NULL,
  `Duracion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_ruta`
--

INSERT INTO `tbl_ruta` (`cod_ruta`, `tbl_empleado_cod_persona`, `cod_hora`, `cod_lugar_origen`, `cod_lugar_destino`, `Duracion`) VALUES
(1, NULL, 1, 8, 1, 5),
(2, NULL, 2, 8, 2, 6),
(3, NULL, 3, 2, 8, 5),
(4, NULL, 5, 8, 2, 4),
(5, NULL, 1, 8, 6, 5),
(6, NULL, 3, 8, 4, 5),
(7, NULL, 5, 8, 3, 6),
(8, NULL, 3, 2, 8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ruta_x_empresa`
--

CREATE TABLE `tbl_ruta_x_empresa` (
  `cod_ruta_empresa` int(11) NOT NULL,
  `cod_ruta` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_ruta_x_empresa`
--

INSERT INTO `tbl_ruta_x_empresa` (`cod_ruta_empresa`, `cod_ruta`, `cod_empresa`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sucursal`
--

CREATE TABLE `tbl_sucursal` (
  `cod_sucursal` int(11) NOT NULL,
  `cod_empresa` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tbl_lugar_cod_lugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_sucursal`
--

INSERT INTO `tbl_sucursal` (`cod_sucursal`, `cod_empresa`, `descripcion`, `tbl_lugar_cod_lugar`) VALUES
(1, 1, NULL, 1),
(2, 1, NULL, 2),
(3, 1, NULL, 8),
(4, 2, NULL, 8),
(5, 2, NULL, 3),
(6, 2, NULL, 5),
(7, 2, NULL, 6),
(8, 3, NULL, 8),
(9, 3, NULL, 6),
(10, 3, NULL, 7),
(11, 4, NULL, 3),
(12, 4, NULL, 5),
(13, 4, NULL, 6),
(14, 4, NULL, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_empleado`
--

CREATE TABLE `tbl_tipo_empleado` (
  `cod_empleado` int(11) NOT NULL,
  `tipo_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_tipo_empleado`
--

INSERT INTO `tbl_tipo_empleado` (`cod_empleado`, `tipo_empleado`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `acerca` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id`, `username`, `password`, `acerca`, `ubicacion`) VALUES
(10, 'yty', 'juuyh', NULL, NULL),
(20, 'correo', 'e345', NULL, NULL),
(24, 'asdgf', 'hytg', NULL, NULL),
(36, 'carlos@yahoo.com', '123', NULL, NULL),
(38, 'juan@yahoo.com', '$2a$10$5/grhs6av7JtrQuL0aQ45Ol/gfgWXKU5lvHgn6//aaMJxyLqh8AOO', NULL, NULL),
(39, 'arnold@yahoo.com', '$2a$10$RNU/b4ChoDv.X/bpyiSy8OPCLFpxoFpJMlevcxkJ5VSWewoc7P4nm', NULL, NULL),
(40, 'arnold@yahoo.com', '$2a$10$UjKe/J.uy1U6M9kbtCsExux3e2Am.1WlZuAoTraWtvl5KjSyXL9a.', NULL, NULL),
(41, 'carlos@yahoo.com', '$2a$10$tWS7GcK5axsHeDN5lSLv2eJ89JOog94Gn0yaY7zPk0uEWBUKdE3ti', NULL, NULL),
(42, 'carlos2@yahoo.com', '$2a$10$Pp/ozIyANOHN/xYcwNAE6OzPaz7tKjBWlObBMAGSeqUo3lJUJpggq', NULL, NULL),
(43, 'fran@yahoo.com', '$2a$10$rZa/MFPoviaDBoggZWw.2uk9FP0ilcDviyb6xieEh32vbaGPpFotq', NULL, NULL),
(44, 'ana@yahoo.com', '$2a$10$2gGW7weoxck1VXKLos1O8eXU4AwDwRsiD7370Iktll/BLa36rZMey', 'Estudiante de la carrera de Ingenieria en Sistemas', 'Residencial Plaza, bloque 5, peatonal 7'),
(45, 'pedro@yahoo.com', '$2a$10$uXUUvstacUDDxP6N03dayesXNmt6cWFfnw0KVf5d6/eIpJUkYE8zm', NULL, NULL),
(46, 'tt@yahoo.com', '$2a$10$.IOuRrrbm2pa49mHe97RhOcTm0kM8DzfN3p/DNBu98Jx24zdhXmiW', NULL, NULL),
(47, 'tt25', '$2a$10$ymydNU4Rcwhd/VVnvBo2VuQ.gzvuNJ5XCs4OJYoGbG3/pZvEhktK2', NULL, NULL),
(48, 'tt@gmail.com', '$2a$10$1darzGVjO0qzMkBQ2nPeA..E0JKxkMvEjqBN/gC5AnW9UbOfQlPBe', NULL, NULL),
(52, 'mm@yahoo.com', '$2a$10$lJtGkORluj0.znmaCEUqr.4Z/Ahd4dYrUUdBDZcxJiR..HN5Nqury', NULL, NULL),
(54, 'norma@gmail.com', '$2a$10$Z2O.rbI/BvyOb76TTAvM..Sd7VVAo590nMeEoZa/XTtrnNHnNHMg2', NULL, NULL),
(55, 'norma@gmail.com', '$2a$10$exdW/b2JfOwkYA3Ae5Klz.bKtgbCOAzqRl9evhzvGsM8XugZvkKxO', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `new_rutas`
--
ALTER TABLE `new_rutas`
  ADD PRIMARY KEY (`id_destino`);

--
-- Indices de la tabla `tbl_automotor`
--
ALTER TABLE `tbl_automotor`
  ADD PRIMARY KEY (`cod_bus`),
  ADD KEY `fk_AUTOMOTOR_EMPRESA` (`fk_cod_empresa`);

--
-- Indices de la tabla `tbl_automotor_ruta`
--
ALTER TABLE `tbl_automotor_ruta`
  ADD PRIMARY KEY (`cod_ruta_bus`,`cod_automotor`,`cod_ruta`),
  ADD KEY `fk_bus_ruta` (`cod_automotor`),
  ADD KEY `fk_bus_x_ruta` (`cod_ruta`);

--
-- Indices de la tabla `tbl_boleto`
--
ALTER TABLE `tbl_boleto`
  ADD PRIMARY KEY (`cod_pago`,`cod_usuario`,`cod_ruta`),
  ADD KEY `fk_tbl_usuario_tbl_ruta` (`cod_usuario`),
  ADD KEY `fk_tbl_usuario_tbl_ruta1` (`cod_ruta`),
  ADD KEY `fk_tbl_pago_tbl_marca_tarjeta1` (`cod_marca`);

--
-- Indices de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  ADD PRIMARY KEY (`cod_compra`),
  ADD KEY `cod_usuario_idx` (`cod_usuario`),
  ADD KEY `cod_ruta_idx` (`cod_ruta`);

--
-- Indices de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD PRIMARY KEY (`cod_persona`),
  ADD KEY `fk_empleado_tipoEmpleado` (`tipo_empleado`),
  ADD KEY `fk_empleado_empresa` (`cod_empresa`);

--
-- Indices de la tabla `tbl_empleado_bus`
--
ALTER TABLE `tbl_empleado_bus`
  ADD PRIMARY KEY (`cod_empl_bus`,`cod_bus`,`cod_persona`),
  ADD KEY `fk_bus_empleado` (`cod_bus`),
  ADD KEY `fk_automotor_empleado` (`cod_persona`);

--
-- Indices de la tabla `tbl_empresa_transporte`
--
ALTER TABLE `tbl_empresa_transporte`
  ADD PRIMARY KEY (`cod_empresa`),
  ADD KEY `fk_empresa_lugar` (`cod_lugar`);

--
-- Indices de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`cod_genero`);

--
-- Indices de la tabla `tbl_hora`
--
ALTER TABLE `tbl_hora`
  ADD PRIMARY KEY (`cod_hora`);

--
-- Indices de la tabla `tbl_lugar`
--
ALTER TABLE `tbl_lugar`
  ADD PRIMARY KEY (`cod_lugar`),
  ADD KEY `fk_Lp_Lhijo` (`cod_lugar_hijo`);

--
-- Indices de la tabla `tbl_marca_tarjeta`
--
ALTER TABLE `tbl_marca_tarjeta`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`cod_persona`),
  ADD KEY `fk_tbl_persona_tbl_genero1` (`cod_genero`),
  ADD KEY `fk_tbl_persona_tbl_lugar1` (`cod_lugar`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `tbl_ruta`
--
ALTER TABLE `tbl_ruta`
  ADD PRIMARY KEY (`cod_ruta`),
  ADD KEY `fk_RUTA_HORA1` (`cod_hora`),
  ADD KEY `fk_ruta_lugar` (`cod_lugar_origen`),
  ADD KEY `fk_tbl_ruta_tbl_emple` (`tbl_empleado_cod_persona`),
  ADD KEY `fk_tbl_ruta_tbl_lugar1` (`cod_lugar_destino`);

--
-- Indices de la tabla `tbl_ruta_x_empresa`
--
ALTER TABLE `tbl_ruta_x_empresa`
  ADD PRIMARY KEY (`cod_ruta_empresa`,`cod_ruta`,`cod_empresa`),
  ADD KEY `fk_ruta_emoresa` (`cod_ruta`),
  ADD KEY `fk_empresa_ruta` (`cod_empresa`);

--
-- Indices de la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  ADD PRIMARY KEY (`cod_sucursal`,`tbl_lugar_cod_lugar`),
  ADD KEY `fk_sucursal_empresa` (`cod_empresa`),
  ADD KEY `fk_tbl_sucursal_tbl_lugar1` (`tbl_lugar_cod_lugar`);

--
-- Indices de la tabla `tbl_tipo_empleado`
--
ALTER TABLE `tbl_tipo_empleado`
  ADD PRIMARY KEY (`cod_empleado`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `new_rutas`
--
ALTER TABLE `new_rutas`
  MODIFY `id_destino` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tbl_automotor`
--
ALTER TABLE `tbl_automotor`
  MODIFY `cod_bus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_automotor_ruta`
--
ALTER TABLE `tbl_automotor_ruta`
  MODIFY `cod_ruta_bus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_boleto`
--
ALTER TABLE `tbl_boleto`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_compra`
--
ALTER TABLE `tbl_compra`
  MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `tbl_empleado_bus`
--
ALTER TABLE `tbl_empleado_bus`
  MODIFY `cod_empl_bus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_empresa_transporte`
--
ALTER TABLE `tbl_empresa_transporte`
  MODIFY `cod_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `cod_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_hora`
--
ALTER TABLE `tbl_hora`
  MODIFY `cod_hora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_lugar`
--
ALTER TABLE `tbl_lugar`
  MODIFY `cod_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_marca_tarjeta`
--
ALTER TABLE `tbl_marca_tarjeta`
  MODIFY `cod_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  MODIFY `cod_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_ruta`
--
ALTER TABLE `tbl_ruta`
  MODIFY `cod_ruta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_ruta_x_empresa`
--
ALTER TABLE `tbl_ruta_x_empresa`
  MODIFY `cod_ruta_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  MODIFY `cod_sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_empleado`
--
ALTER TABLE `tbl_tipo_empleado`
  MODIFY `cod_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_automotor`
--
ALTER TABLE `tbl_automotor`
  ADD CONSTRAINT `fk_AUTOMOTOR_EMPRESA` FOREIGN KEY (`fk_cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_automotor_ruta`
--
ALTER TABLE `tbl_automotor_ruta`
  ADD CONSTRAINT `fk_bus_ruta` FOREIGN KEY (`cod_automotor`) REFERENCES `tbl_automotor` (`cod_bus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bus_x_ruta` FOREIGN KEY (`cod_ruta`) REFERENCES `tbl_ruta` (`cod_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_boleto`
--
ALTER TABLE `tbl_boleto`
  ADD CONSTRAINT `fk_tbl_pago_tbl_marca_tarjeta1` FOREIGN KEY (`cod_marca`) REFERENCES `tbl_marca_tarjeta` (`cod_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuario_tbl_ruta` FOREIGN KEY (`cod_usuario`) REFERENCES `tbl_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_usuario_tbl_ruta1` FOREIGN KEY (`cod_ruta`) REFERENCES `tbl_ruta` (`cod_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD CONSTRAINT `fk_empleado_empresa` FOREIGN KEY (`cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_persona` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_tipoEmpleado` FOREIGN KEY (`tipo_empleado`) REFERENCES `tbl_tipo_empleado` (`cod_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empleado_bus`
--
ALTER TABLE `tbl_empleado_bus`
  ADD CONSTRAINT `fk_automotor_empleado` FOREIGN KEY (`cod_persona`) REFERENCES `tbl_empleado` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bus_empleado` FOREIGN KEY (`cod_bus`) REFERENCES `tbl_automotor` (`cod_bus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_empresa_transporte`
--
ALTER TABLE `tbl_empresa_transporte`
  ADD CONSTRAINT `fk_empresa_lugar` FOREIGN KEY (`cod_lugar`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_lugar`
--
ALTER TABLE `tbl_lugar`
  ADD CONSTRAINT `fk_Lp_Lhijo` FOREIGN KEY (`cod_lugar_hijo`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD CONSTRAINT `fk_tbl_persona_tbl_genero1` FOREIGN KEY (`cod_genero`) REFERENCES `tbl_genero` (`cod_genero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_persona_tbl_lugar1` FOREIGN KEY (`cod_lugar`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_ruta`
--
ALTER TABLE `tbl_ruta`
  ADD CONSTRAINT `fk_RUTA_HORA1` FOREIGN KEY (`cod_hora`) REFERENCES `tbl_hora` (`cod_hora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruta_lugar` FOREIGN KEY (`cod_lugar_origen`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ruta_tbl_emple` FOREIGN KEY (`tbl_empleado_cod_persona`) REFERENCES `tbl_empleado` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ruta_tbl_lugar1` FOREIGN KEY (`cod_lugar_destino`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_ruta_x_empresa`
--
ALTER TABLE `tbl_ruta_x_empresa`
  ADD CONSTRAINT `fk_empresa_ruta` FOREIGN KEY (`cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruta_emoresa` FOREIGN KEY (`cod_ruta`) REFERENCES `tbl_ruta` (`cod_ruta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  ADD CONSTRAINT `fk_sucursal_empresa` FOREIGN KEY (`cod_empresa`) REFERENCES `tbl_empresa_transporte` (`cod_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_sucursal_tbl_lugar1` FOREIGN KEY (`tbl_lugar_cod_lugar`) REFERENCES `tbl_lugar` (`cod_lugar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`id`) REFERENCES `tbl_persona` (`cod_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
