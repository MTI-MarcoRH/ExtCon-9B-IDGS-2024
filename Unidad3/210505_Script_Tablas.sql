--
-- Table structure for table `tbb_transaccion`
--

DROP TABLE IF EXISTS `tbb_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transaccion` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Metodo_Pago` enum('Tarjeta de debito','Tarjeta de credito') NOT NULL,
  `Monto` float NOT NULL,
  `Estatus` tinyint(1) NOT NULL DEFAULT '1',
  `Fecha_Transaccion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  `Usuario_ID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_transaccion_usuario_idx` (`Usuario_ID`),
  CONSTRAINT `fk_transaccion_usuario` FOREIGN KEY (`Usuario_ID`) REFERENCES `tbb_usuarios` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;