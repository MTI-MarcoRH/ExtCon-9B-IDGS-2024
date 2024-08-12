/*TABLA ASIGNADA: PROGRAMAS SALUDABLES*/
CREATE TABLE `tbd_programas_saludables` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(250) NOT NULL,
  `Usuario_ID` int unsigned NOT NULL,
  `Instructor_ID` int unsigned NOT NULL,
  `Fecha_Creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estatus` enum('Registrado','Sugerido','Aprobado por el Médico','Aprobado por el Usuario','Rechazado por el Médico','Rechazado por el Usuario','Terminado','Suspendido','Cancelado') NOT NULL DEFAULT 'Registrado',
  `Duracion` varchar(80) NOT NULL,
  `Porcentaje_Avance` decimal(5,2) NOT NULL DEFAULT '0.00',
  `Fecha_Ultima_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
