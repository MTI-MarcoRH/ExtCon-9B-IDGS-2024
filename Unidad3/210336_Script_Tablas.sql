CREATE TABLE `tbc_sucursales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Direccion` varchar(250) NOT NULL,
  `Responsable_ID` int unsigned DEFAULT NULL,
  `Total_Clientes_Atendidos` int unsigned NOT NULL DEFAULT '0',
  `Promedio_Clientes_X_Dia` int unsigned NOT NULL DEFAULT '0',
  `Capacidad_Maxima` int unsigned NOT NULL DEFAULT '0',
  `Total_Empleados` int unsigned DEFAULT '0',
  `Horario_Disponibilidad` text NOT NULL,
  `Estatus` bit(1) DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- ---------------------------------------------------------------------
CREATE TABLE `tbb_instalaciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Servicio` varchar(200) NOT NULL,
  `Descripcion` text NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Observaciones` text NOT NULL,
  `Calificacion` enum('Exelente servicio','Buen servicio','Servicio Regular','Puede mejorar el servicio') NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `ID_Sucursal` int NOT NULL,
  `Horario_Disponibilidad` text NOT NULL,
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
