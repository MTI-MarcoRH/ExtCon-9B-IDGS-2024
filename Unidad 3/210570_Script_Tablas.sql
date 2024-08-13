CREATE TABLE `tbb_equipamientos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Area` varchar(100) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Marca` varchar(100) DEFAULT NULL,
  `Modelo` varchar(180) DEFAULT NULL,
  `Fotografia` text,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Total_Existencias` int DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------
CREATE TABLE `tbb_mantenimientos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Equipo` varchar(50) NOT NULL,
  `Descripcion` text,
  `Costo` decimal(10,2) NOT NULL,
  `Responsable` varchar(50) NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_mantenimiento` date NOT NULL,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
