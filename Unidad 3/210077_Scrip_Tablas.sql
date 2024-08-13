CREATE TABLE `tbd_dietas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Detalle` int unsigned DEFAULT NULL,
  `Descripcion` text,
  `Objetivo` int unsigned DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbd_detalles_dietas` (
  `Dieta_id` int unsigned NOT NULL,
  `Detalle` text NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Dieta_id`),
  CONSTRAINT `fk_dieta_3` FOREIGN KEY (`Dieta_id`) REFERENCES `tbd_dietas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbd_objetivos_dietas` (
  `Dieta_id` int unsigned NOT NULL,
  `Objetivo` text NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_actualizacion` datetime DEFAULT NULL,
  KEY `fk_dieta_1_idx` (`Dieta_id`),
  CONSTRAINT `fk_dieta_1` FOREIGN KEY (`Dieta_id`) REFERENCES `tbd_dietas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
