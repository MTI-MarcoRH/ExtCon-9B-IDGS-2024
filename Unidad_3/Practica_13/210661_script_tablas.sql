CREATE TABLE `tbb_prestamos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_prestamo` datetime NOT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `situacion` enum('pendiente','devuelto','retrasado','cancelado') NOT NULL,
  `observaciones` text,
  `estatus` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
