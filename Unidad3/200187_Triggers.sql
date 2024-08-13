CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_membresias_AFTER_INSERT` AFTER INSERT ON `tbc_membresias` FOR EACH ROW BEGIN
	 -- Declaración de variables
    DECLARE v_cadena_estatus VARCHAR(15) DEFAULT NULL;
    
    -- Inicialización de las variables 
    IF NEW.estatus = b'1' THEN
		SET v_cadena_estatus= "Activa";
    ELSE
		SET v_cadena_estatus= "Inactiva";
    END IF; 
    
	INSERT INTO tbi_bitacora VALUES(
		DEFAULT,
        USER(),
        "Create",
        "tbc_membresias",
        CONCAT_WS(" ","Se han creado los datos de la MEMBRESIA con el ID: ",NEW.ID, 
        "con los siguientes datos:",
        "CODIGO = ",NEW.codigo,
        "TIPO = ", NEW.tipo, 
		"TIPO SERVICIOS = ",NEW.tipo_servicios,
        "TIPO PLAN = ",NEW.tipo_plan, 
        "NIVEL = ", NEW.nivel,
        "FECHA INICIO = ",NEW.fecha_inicio, 
        "FECHA FIN = ", NEW.fecha_fin,
        "ESTATUS = ", v_cadena_estatus,
        "FECHA REGISTRO = ",  NEW.fecha_registro,
        "FECHA ACTUALIZACIÓN = ", NEW.fecha_actualizacion),
        NOW(),
        DEFAULT
    );
END

CREATE DEFINER=`hugo`@`%` TRIGGER `tbc_membresias_BEFORE_UPDATE` BEFORE UPDATE ON `tbc_membresias` FOR EACH ROW BEGIN
	set new.fecha_actualizacion = current_timestamp();
END

CREATE DEFINER=`hugo`@`%` TRIGGER `tbc_membresias_AFTER_UPDATE` AFTER UPDATE ON `tbc_membresias` FOR EACH ROW BEGIN
	 -- Declaración de variables
    DECLARE v_cadena_estatus VARCHAR(15) DEFAULT NULL;
    DECLARE v_cadena_estatus2 VARCHAR(15) DEFAULT NULL;
    
    -- Inicialización de las variables 
    IF NEW.estatus = b'1' THEN
		SET v_cadena_estatus= "Activa";
    ELSE
		SET v_cadena_estatus= "Inactiva";
    END IF; 
    
    IF OLD.estatus = b'1' THEN
		SET v_cadena_estatus2= "Activa";
    ELSE
		SET v_cadena_estatus2= "Inactiva";
    END IF; 
	INSERT INTO tbi_bitacora VALUES(
		DEFAULT,
        USER(),
        "Update",
        "tbc_membresias",
        CONCAT_WS(" ","Se han actualizado los datos de la MEMBRESIA con el ID: ",NEW.ID, 
        "con los siguientes datos:",
        "CODIGO = ", OLD.codigo, " cambio a " ,NEW.codigo,
        "TIPO = ",  OLD.tipo, " cambio a " ,NEW.tipo, 
		"TIPO SERVICIOS = ", OLD.tipo_servicios, " cambio a " , NEW.tipo_servicios,
        "TIPO PLAN = ", OLD.tipo_plan, " cambio a " , NEW.tipo_plan, 
        "NIVEL = ", OLD.nivel, " cambio a " , NEW.nivel,
        "FECHA INICIO = ",  OLD.fecha_inicio, " cambio a " ,NEW.fecha_inicio, 
        "FECHA FIN = ", OLD.fecha_fin, " cambio a " , NEW.fecha_fin,
        "ESTATUS = ",  v_cadena_estatus2, " cambio a " ,v_cadena_estatus,
        "FECHA REGISTRO = ",  OLD.fecha_registro, " cambio a " ,NEW.fecha_registro,
        "FECHA ACTUALIZACIÓN = ",  OLD.fecha_actualizacion, " cambio a " ,NEW.fecha_actualizacion),
        NOW(),
        DEFAULT
    );
END

CREATE DEFINER=`hugo`@`%` TRIGGER `tbc_membresias_BEFORE_DELETE` BEFORE DELETE ON `tbc_membresias` FOR EACH ROW BEGIN
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		'tbc_membresias',
		CONCAT_WS(" ","Se ha eliminado una membresia con los siguientes datos: ",
        "CODIGO = ", OLD.codigo,
        "TIPO = ",  OLD.tipo, 
		"TIPO SERVICIOS = ", OLD.tipo_servicios,
        "TIPO PLAN = ", OLD.tipo_plan,
        "NIVEL = ", OLD.nivel,
        "FECHA INICIO = ",  OLD.fecha_inicio,  
        "FECHA FIN = ", OLD.fecha_fin, 
        "ESTATUS = ", old.estatus,
        "FECHA REGISTRO = ",  OLD.fecha_registro,
        "FECHA ACTUALIZACIÓN = ", old.fecha_actualizacion),
        DEFAULT,
        default
);
END
