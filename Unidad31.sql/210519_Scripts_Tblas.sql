-- Pedidos
CREATE TABLE `tbb_pedidos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Producto_ID` int unsigned NOT NULL,
  `Persona_ID` int unsigned NOT NULL,
  `Tipo` enum('Promoción',' Descuento','Precio tienda') NOT NULL DEFAULT 'Precio tienda',
  `Fecha_Registro` datetime NOT NULL,
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Estatus` bit(1) DEFAULT b'1',
  `Total_Productos` int NOT NULL,
  `Costo_total` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Producto_id_idx` (`Producto_ID`),
  KEY `Persona_id_fk_1_idx` (`Persona_ID`),
  CONSTRAINT `Persona_id_fk_1` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_personas` (`ID`),
  CONSTRAINT `Producto_id_1` FOREIGN KEY (`Producto_ID`) REFERENCES `tbb_productos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Promociones
CREATE TABLE `tbb_promociones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Producto_id` int unsigned NOT NULL,
  `Tipo` enum('Miembro','Usuario','Empleado') NOT NULL DEFAULT 'Usuario',
  `Aplicacion_en` enum('Tienda virtual','Tienda Presencial') NOT NULL DEFAULT 'Tienda Presencial',
  `Estatus` bit(1) DEFAULT b'1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Producto_id_idx` (`Producto_id`),
  CONSTRAINT `Producto_id_2` FOREIGN KEY (`Producto_id`) REFERENCES `tbb_productos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
