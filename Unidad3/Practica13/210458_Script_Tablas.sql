--Elaborado por: Jorge Cazarez Cruz
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.



------Script Tabla Base: Instructor--------

CREATE TABLE `tbb_instructores` (
  `ID` int NOT NULL,
  `Total_Años_Experiencia` int NOT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  `Total_Clientes_Atendidos` int unsigned NOT NULL DEFAULT '0',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Calificacion` int unsigned DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

