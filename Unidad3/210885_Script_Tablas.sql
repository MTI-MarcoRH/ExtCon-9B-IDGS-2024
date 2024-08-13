-- TABLA tbd_evaluaciones_servicios
-- ELABORADO POR: Maria Lorena Ascencion Andres
--GRADO Y GRUPO: 9°'B'
--PROGRAMA EDUCATIVO: Ingeniería en Desarrollo y Gestión de Software

CREATE TABLE `tbd_evaluaciones_servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `servicio` enum('Servicio de nutrición','Horarios y Precios','Comunidad','Programas de entrenamiento') NOT NULL,
  `calificacion` int NOT NULL,
  `criterio` text NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `estatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
