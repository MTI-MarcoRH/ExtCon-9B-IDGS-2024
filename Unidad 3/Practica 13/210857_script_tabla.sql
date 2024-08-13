/*Tabla miembros*/

CREATE TABLE `tbb_miembros` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Membresia_ID` int unsigned NOT NULL,
  `Usuario_ID` int unsigned NOT NULL,
  `Tipo` enum('Frecuente','Ocasional','Nuevo','Esporadico','Una sola visita') NOT NULL DEFAULT 'Nuevo',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Antiguedad` varchar(80) NOT NULL,
  `Fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
