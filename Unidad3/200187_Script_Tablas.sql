CREATE TABLE `tbc_membresias` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Codigo` VARCHAR(50) NOT NULL,
  `Tipo` ENUM('Individual', 'Familiar', 'Empresarial') NOT NULL,
  `Tipo_Servicios` ENUM('Basicos', 'Completa', 'Coaching', 'Nutriólogo') NOT NULL,
  `Tipo_Plan` ENUM('Anual', 'Semestral', 'Trimestral', 'Bimestral', 'Mensual', 'Semanal', 'Diaria') NULL DEFAULT NULL,
  `Nivel` ENUM('Nuevo', 'Plata', 'Oro', 'Diamante') NOT NULL,
  `Fecha_Inicio` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` DATETIME NULL DEFAULT NULL,
  `Estatus` BIT(1) NOT NULL DEFAULT b'1',
  `Fecha_Registro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci