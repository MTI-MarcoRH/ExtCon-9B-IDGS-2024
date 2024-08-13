CREATE TABLE `tbd_adeudos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(90) NOT NULL,
  `cliente` int DEFAULT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `detalle` enum('Producto','Equipamiento','Servicio') DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
