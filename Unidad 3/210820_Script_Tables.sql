--
-- Table structure for table `tbb_indicadores_nutricionales`
--

DROP TABLE IF EXISTS `tbb_indicadores_nutricionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_indicadores_nutricionales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `altura` decimal(5,2) NOT NULL,
  `peso_kg` decimal(5,2) NOT NULL,
  `imc` float NOT NULL,
  `porcentaje_grasa` decimal(5,2) DEFAULT NULL,
  `nivel_actividad` enum('Sedentario','Ligero','Moderado','Activo','Muy Activo') NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indicadores_nutricionales_1_idx` (`usuario_id`),
  CONSTRAINT `fk_indicadores_nutricionales_1` FOREIGN KEY (`usuario_id`) REFERENCES `tbb_usuarios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;