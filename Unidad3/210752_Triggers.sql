-- AFTER INSERT
CREATE DEFINER=`amisadai`@`%` TRIGGER `tbc_puestos_AFTER_INSERT` AFTER INSERT ON `tbc_puestos` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not NEW.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	-- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbc_puestos",
        CONCAT_WS(" ","Se ha insertado una nuevo puesto con los siguientes datos: ",
        "NOMBRE = ", NEW.Nombre,
        "DESCRIPCIÓN = ", NEW.Descripcion,
		"SALARIO = ", NEW.Salario,
        "REQUISITOS = ", NEW.Requisitos,
		"ESTATUS = ", v_estatus,
        "FECHA REGISTRO = ", new.Fecha_Registro,
		"FECHA_ACTUALIZACION = ", NEW.Fecha_Actualizacion
       ),
        DEFAULT,
        DEFAULT
    );

END



--- BEFORE UPDATE 
CREATE DEFINER=`amisadai`@`%` TRIGGER `tbc_puestos_BEFORE_UPDATE` BEFORE UPDATE ON `tbc_puestos` FOR EACH ROW BEGIN
set new.Fecha_Actualizacion = current_timestamp();
END



-- AFTER UPDATE --
CREATE DEFINER=`amisadai`@`%` TRIGGER `tbc_puestos_AFTER_UPDATE` AFTER UPDATE ON `tbc_puestos` FOR EACH ROW BEGIN
DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
	DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo';
    
    -- Verificamos si el estatus del puesto, para ubicar el valor en la descripción de la bitácora
    IF NOT OLD.Estatus THEN
        SET v_estatus_old = "Inactivo";
    END IF;
    IF NOT NEW.Estatus THEN
        SET v_estatus_new = "Inactivo";
    END IF;
    
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        CURRENT_USER(),
        'Update',
        'tbc_puestos',
			CONCAT_WS(", ", "Se ha modificado un puesto de usuario con los siguientes datos:",
            "NOMBRE =", OLD.Nombre, ' - ', NEW.Nombre,
            "DESCRIPCIÓN =", OLD.Descripcion, ' - ', NEW.Descripcion,
            "SALARIO =", OLD.Salario, ' - ', NEW.Salario,
            "REQUISITOS =", OLD.Requisitos, ' - ', NEW.Requisitos,
             "ESTATUS =", v_estatus_old, ' - ', v_estatus_new,
            "FECHA REGISTRO =", OLD.Fecha_Registro, ' - ', NEW.Fecha_Registro, 
            "FECHA ACTUALIZACION =", OLD.Fecha_Actualizacion, ' - ', NEW.Fecha_Actualizacion
        ),
	DEFAULT,
	DEFAULT  
    );
END 


-- AFTER DELETE 
CREATE DEFINER=`amisadai`@`%` TRIGGER `tbc_puestos_AFTER_DELETE` AFTER DELETE ON `tbc_puestos` FOR EACH ROW BEGIN
DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT OLD.estatus THEN
        SET v_estatus = "Inactiva";
    END IF;
    
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        CURRENT_USER(),
        'Delete',
        'tbc_puestos',
			CONCAT_WS(" ", "Se ha eliminado un puesto con los siguientes datos:",
            "NOMBRE =", OLD.Nombre,
            "DESCRIPCIÓN =", OLD.Descripcion,
            "SALARIO =", OLD.Salario,
            "REQUISITOS =", OLD.Requisitos,
            "ESTATUS =", v_estatus,
            "FECHA REGISTRO =", OLD.Fecha_Registro,
            "FECHA ACTUALIZACION =", OLD.Fecha_Actualizacion
        ),
	DEFAULT,
	DEFAULT );
END