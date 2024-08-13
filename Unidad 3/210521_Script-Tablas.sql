-- Table structure for table `tbb_preguntas_nutricionales`

DROP TABLE IF EXISTS `tbb_preguntas_nutricionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_preguntas_nutricionales` (
  `ID_Pregunta` int NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(255) NOT NULL,
  `Tipo_Respuesta` enum('Abierta','Cerrada') NOT NULL,
  `Descripcion` text,
  `Fecha_Creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  `Opciones_Respuesta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
