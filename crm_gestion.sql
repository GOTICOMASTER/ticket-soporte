-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2023 a las 05:03:43
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
-- Base de datos: `crm_gestion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'configuroweb', '1234abcd..');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prequest`
--

CREATE TABLE `prequest` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` varchar(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `services` text DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `query` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `posting_date` date DEFAULT NULL,
  `remark` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prequest`
--

INSERT INTO `prequest` (`id`, `name`, `email`, `contactno`, `company`, `services`, `others`, `query`, `status`, `posting_date`, `remark`) VALUES
(1, 'Mark Cooper', 'pcliente@cweb.com', '3052589471', 'ConfiguroWeb', '[\\\"Recuperaci\\\\u00f3n de Informaci\\\\u00f3n\\\"]', '', 'Se solicita ayuda analizando el disco duro', 0, '2022-11-29', 'Registro Observaciones'),
(2, 'Juan Cliente', 'jcliente@cweb.com', '3025897461', 'ConfiguroWeb', '[\\\"Recuperaci\\\\u00f3n de Informaci\\\\u00f3n\\\"]', '', 'Se solicita ayuda analizando el disco duro, para recuperar información, ya que fue eliminada.', 0, '2023-01-11', 'Se realiza el proceso solicitado a satisfacción.'),
(3, 'Juan Cliente', 'jcliente@cweb.com', '3025897461', 'ConfiguroWeb', '[\\\"Recuperaci\\\\u00f3n de Informaci\\\\u00f3n\\\"]', '', 'Se necesita buscar información en el tel que previamente fue eliminado.', 0, '2023-01-12', 'Se realiza el proceso solicitado.'),
(4, 'Equis', 'ecorreo@cweb.com', '3052589741', 'ConfiguroWeb', '[\\\" Formateo de Dispositivo\\\"]', '', 'Se solicita el formateo del teléfono', 0, '2023-01-14', 'Se ejecuta el servicio solicitado efectivamente.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `ticket_id` varchar(11) DEFAULT NULL,
  `email_id` varchar(300) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `task_type` varchar(300) DEFAULT NULL,
  `prioprity` varchar(300) DEFAULT NULL,
  `ticket` longtext DEFAULT NULL,
  `attachment` varchar(300) DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  `admin_remark` longtext DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `admin_remark_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `ticket_id`, `email_id`, `subject`, `task_type`, `prioprity`, `ticket`, `attachment`, `status`, `admin_remark`, `posting_date`, `admin_remark_date`) VALUES
(13, '6', 'pcliente@cweb.com', 'Fallo con el Servidor IDPROD 26', 'Fallo a Nivel de Servidor', 'importante', 'Es necesario reiniciar la máquina de estados', NULL, 'closed', 'Se realiza el proceso solicitado a satisfacción.', '2022-11-29', '2023-01-11 22:28:16'),
(14, '7', 'pcliente@cweb.com', 'Fallo con el Servidor IDPROD 26', 'Fallo a Nivel de Servidor', 'non-urgent', 'Es necesario reiniciar la máquina de estados', NULL, 'closed', 'Se realiza el proceso solicitado a satisfacción.', '2022-11-29', '2023-01-11 22:28:20'),
(15, '1', 'jcliente@cweb.com', 'Fallo con el Servidor IDPROD 26', 'Fallo a Nivel de Servidor', 'Importante', 'Es necesario reiniciar la máquina de estados', NULL, 'closed', 'Se realiza el proceso solicitado a satisfacción.', '2023-01-11', '2023-01-11 21:31:11'),
(16, '2', 'jcliente@cweb.com', 'Fallo en consulta', 'Error capa de aplicación', 'Urgente-(Problema Funcional)', 'Se confirma que en la consulta se envía un json, con un campo en NULL', NULL, 'closed', 'Se realiza en ajuste en la consulta, se procede al cierre del ticket.', '2023-01-12', '2023-01-12 16:12:12'),
(17, '3', 'ecorreo@cweb.com', 'Fallo consulta', 'Incidente Lógica', 'Importante', 'La consulta de cédula de cliente no arroja resultados, esto para la operación por completo.', NULL, 'closed', 'Se soluciona el fallo efectivamente, se confirma la resolución, se procede al cierre', '2023-01-14', '2023-01-14 14:50:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alt_email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `posting_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `alt_email`, `password`, `mobile`, `gender`, `address`, `status`, `posting_date`) VALUES
(1, 'Mauricio Sevilla', 'hola@cweb.com', 'admin@cweb.com', '1234abcd..', '3162430081', 'male', 'Calle 45 23 21', NULL, '2021-04-22 12:25:19'),
(2, 'Pedro Cliente', 'pcliente@cweb.com', 'pecliente@cweb.com', '1234abcd..', '3025869471', 'm', 'Sample Address only', NULL, '2022-11-29 03:28:28'),
(3, 'Juan Cliente', 'jcliente@cweb.com', 'jacliente@cweb.com', '12345abcde..', '3025897461', 'male', 'Calle 85 94 71', NULL, '2023-01-10 22:30:44'),
(4, 'Lorena Cliente', 'lcliente@cweb.com', NULL, '1234abcd..', '3052859471', 'male', NULL, NULL, '2023-01-12 14:21:24'),
(5, 'Equis', 'ecorreo@cweb.com', NULL, '1234abcd..', '3052589741', 'male', NULL, NULL, '2023-01-14 14:44:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usercheck`
--

CREATE TABLE `usercheck` (
  `id` int(11) NOT NULL,
  `logindate` varchar(255) DEFAULT '',
  `logintime` varchar(255) DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT '',
  `ip` varbinary(16) DEFAULT NULL,
  `mac` varbinary(16) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usercheck`
--

INSERT INTO `usercheck` (`id`, `logindate`, `logintime`, `user_id`, `username`, `email`, `ip`, `mac`, `city`, `country`) VALUES
(4, '2022/11/29', '09:36:21am', 2, 'Pedro Cliente', 'pcliente@cweb.com', 0x3a3a31, 0x30302d30422d32422d30322d36352d44, '', ''),
(3, '2022/11/29', '09:01:36am', 2, 'Pedro Cliente', 'pcliente@cweb.com', 0x3a3a31, 0x30302d30422d32422d30322d36352d44, '', ''),
(5, '2023/01/10', '04:00:59am', 3, 'Juan Cliente', 'jcliente@cweb.com', 0x3132372e302e302e31, 0x4e6f6d62726520646520686f73742e20, '', ''),
(6, '2023/01/11', '10:17:10pm', 3, 'Juan Cliente', 'jcliente@cweb.com', 0x3a3a31, 0x4e6f6d62726520646520686f73742e20, '', ''),
(7, '2023/01/11', '02:38:50am', 3, 'Juan Cliente', 'jcliente@cweb.com', 0x3a3a31, 0x4e6f6d62726520646520686f73742e20, '', ''),
(8, '2023/01/11', '02:40:06am', 3, 'Juan Cliente', 'jcliente@cweb.com', 0x3a3a31, 0x4e6f6d62726520646520686f73742e20, '', ''),
(9, '2023/01/11', '03:23:15am', 3, 'Juan Cliente', 'jcliente@cweb.com', 0x3132372e302e302e31, 0x4e6f6d62726520646520686f73742e20, '', ''),
(10, '2023/01/12', '07:54:47pm', 4, 'Lorena Cliente', 'lcliente@cweb.com', 0x3a3a31, 0x4e6f6d62726520646520686f73742e20, '', ''),
(11, '2023/01/14', '08:14:36pm', 5, 'Equis', 'ecorreo@cweb.com', 0x3a3a31, 0x4e6f6d62726520646520686f73742e20, '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prequest`
--
ALTER TABLE `prequest`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usercheck`
--
ALTER TABLE `usercheck`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `prequest`
--
ALTER TABLE `prequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usercheck`
--
ALTER TABLE `usercheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
