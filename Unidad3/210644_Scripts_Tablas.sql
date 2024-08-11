--Elaborado por: Suri Jazmin Peña Lira.
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

---- Tabla Catalago_Ejercicio--------
CREATE TABLE `tbc_ejercicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Video` varchar(100) DEFAULT NULL,
  `Tipo` enum('Aerobico','Resistencia','Flexibilidad','Fuerza') NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Dificultad` enum('Basico','Intermedio','Avanzado') NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Recomendaciones` text,
  `Restricciones` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

----Tabla Derivadas: Videos--------
CREATE TABLE `tbd_videos_ejercicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Ejercicio_ID` int unsigned NOT NULL,
  `Descripcion` text,
  `Duracion_Video` varchar(45) DEFAULT NULL,
  `URL_Video` varchar(45) DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

------Tabla Derivada : Recomendaciones -----

CREATE TABLE `tbd_recomendaciones_ejercicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Ejercicio_ID` int unsigned DEFAULT NULL,
  `Descripcion` text,
  `Tipo_Recomendacion` enum('Tecnica','Calentamiento','Hidratacion') NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


------Tabla Derivada : Restricciones -----
CREATE TABLE `tbd_restricciones_ejercicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Ejercicio_ID` int unsigned DEFAULT NULL,
  `Restriccion` text,
  `Tipo_Restriccion` enum('Medica','Seguridad','Tecnica') NOT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


