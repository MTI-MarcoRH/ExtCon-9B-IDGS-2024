CREATE DEFINER=`emilio`@`%` TRIGGER `tbb_dietas_AFTER_INSERT` AFTER INSERT ON `tbd_dietas` FOR EACH ROW BEGIN
	-- Declaración de variables
    DECLARE v_estatus varchar(20) default 'Activo';
    
    IF not new.estatus = b'1' then
        set v_estatus = "Inactiva";
    end if;

    -- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbd_dietas",
        CONCAT_WS(" ","Se ha insertado una nueva dieta con los siguientes datos: ",
        "NOMBRE = ", NEW.nombre, "\n ",
        "DETALLE = ", NEW.detalle, "\n ",
        "DESCRIPCIÓN = ", NEW.descripcion, "\n ",
        "ESTATUS = ", v_estatus, "\n ",
        "OBJETIVO = ", NEW.objetivo, "\n ",
        "Fecha registro = ", new.fecha_registro, "\n ",
        "Fecha Actualización = ", NEW.fecha_actualizacion ),
        DEFAULT,
        DEFAULT
    );
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbc_dietas_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_dietas` FOR EACH ROW BEGIN
	set new.Fecha_actualizacion = current_timestamp();
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbc_dietas_AFTER_UPDATE` AFTER UPDATE ON `tbd_dietas` FOR EACH ROW BEGIN
	DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Inactivo'; 
    
    IF not NEW.estatus then
        set v_estatus_old = "Activo";
    end if;
    
    IF  not old.estatus then
        set v_estatus_new = "Activo";
    end if;

	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Update' ,
		'tbd_dietas',
		concat_ws(" ","Se ha modificado una dieta existente con los siguientes datos: ",
        "Nombre = ", old.nombre, ' - ', new.nombre, "\n ",
        "DETALLE = ", old.detalle, ' - ', NEW.detalle, "\n ",
        "Descripción ID =", old.descripcion, ' - ', new.descripcion, "\n ",
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new, "\n ",
        "OBJETIVO = ", old.objetivo, ' - ', NEW.objetivo),
	DEFAULT,
	DEFAULT);
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbc_dietas_BEFORE_DELETE` BEFORE DELETE ON `tbd_dietas` FOR EACH ROW BEGIN
	DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF  not OLD.estatus then
        set v_estatus = "Inactiva";
    end if; 
    insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		'tbd_dietas',
		CONCAT_WS(" ","Se ha eliminado una dieta con el id",old.id, "\n los siguientes datos: ",
        "NOMBRE = ", old.nombre, "\n ",
        "DETALLE = ", old.detalle, "\n ",
        "Descripción =", old.descripcion, "\n ",
        "ESTATUS = ", v_estatus, "\n ",
        "OBJETIVO = ", old.objetivo),
	DEFAULT,
	DEFAULT );
END

-- -----------------------------------------------------------------------------------------------
CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_detalles_dietas_AFTER_INSERT` AFTER INSERT ON `tbd_detalles_dietas` FOR EACH ROW BEGIN
	-- Declaración de variables
    DECLARE v_estatus varchar(20) default 'Activo';
    
    IF not new.estatus = b'1' then
        set v_estatus = "Inactiva";
    end if;

    -- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbd_detalles_dietas",
        CONCAT_WS(" ","Se ha insertado un nuevo detalle de dieta con el id",NEW.Dieta_id, "\n los siguientes datos: ",
        "DETALLE = ", NEW.detalle, "\n ",
        "ESTATUS = ", v_estatus, "\n ",
        "Fecha registro = ", new.fecha_registro, "\n ",
        "Fecha Actualización = ", NEW.fecha_actualizacion ),
        DEFAULT,
        DEFAULT
    );
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_detalle_dieta_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_detalles_dietas` FOR EACH ROW BEGIN
	set new.Fecha_actualizacion = current_timestamp();
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_detalles_dietas_AFTER_UPDATE` AFTER UPDATE ON `tbd_detalles_dietas` FOR EACH ROW BEGIN
	DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Inactivo'; 
    
    IF not NEW.estatus then
        set v_estatus_old = "Activo";
    end if;
    
    IF  not old.estatus then
        set v_estatus_new = "Activo";
    end if;

	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Update' ,
		'tbd_detalles_dietas',
		concat_ws(" ","Se ha modificado un detalle de dieta con el id",NEW.Dieta_id, "\n los siguientes datos: ",
        "DETALLE = ", old.detalle, ' - ', NEW.detalle, "\n "
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
	DEFAULT,
	DEFAULT);
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_detalles_dietas_BEFORE_DELETE` BEFORE DELETE ON `tbd_detalles_dietas` FOR EACH ROW BEGIN
	DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF  not OLD.estatus then
        set v_estatus = "Inactiva";
    end if; 
    insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		'tbd_detalles_dietas',
		CONCAT_WS(" ","Se ha eliminado un detalle de dieta con el id",old.Dieta_id, "\n los siguientes datos: ",
        "DETALLE = ", old.detalle, "\n ",
        "ESTATUS = ", v_estatus),
	DEFAULT,
	DEFAULT );
END

-- -----------------------------------------------------------------------------------------------
CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_objetivo_dieta_AFTER_INSERT` AFTER INSERT ON `tbd_objetivos_dietas` FOR EACH ROW BEGIN
	-- Declaración de variables
    DECLARE v_estatus varchar(20) default 'Activo';
    
    IF not new.estatus = b'1' then
        set v_estatus = "Inactiva";
    end if;

    -- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbd_objetivos_dietas",
        CONCAT_WS(" ","Se ha insertado un nuevo objetivo de dieta con el id",NEW.Dieta_id, "\n los siguientes datos: ",
        "OBJETIVO = ", NEW.objetivo, "\n ",
        "ESTATUS = ", v_estatus, "\n ",
        "Fecha registro = ", new.fecha_registro, "\n ",
        "Fecha Actualización = ", NEW.fecha_actualizacion ),
        DEFAULT,
        DEFAULT
    );
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_objetivo_dieta_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_objetivos_dietas` FOR EACH ROW BEGIN
	set new.Fecha_actualizacion = current_timestamp();
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_objetivo_dieta_AFTER_UPDATE` AFTER UPDATE ON `tbd_objetivos_dietas` FOR EACH ROW BEGIN
	DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Inactivo'; 
    
    IF not NEW.estatus then
        set v_estatus_old = "Activo";
    end if;
    
    IF  not old.estatus then
        set v_estatus_new = "Activo";
    end if;

	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Update' ,
		'tbd_objetivos_dietas',
		concat_ws(" ","Se ha modificado un objetivo de dieta con el id",NEW.Dieta_id, "\n los siguientes datos: ",
        "OBJETIVO = ", old.objetivo, ' - ', NEW.objetivo, "\n "
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
	DEFAULT,
	DEFAULT);
END

CREATE DEFINER=`emilio`@`%` TRIGGER `tbd_objetivo_dieta_BEFORE_DELETE` BEFORE DELETE ON `tbd_objetivos_dietas` FOR EACH ROW BEGIN
	DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF  not OLD.estatus then
        set v_estatus = "Inactiva";
    end if; 
    insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		'tbd_objetivos_dietas',
		CONCAT_WS(" ","Se ha eliminado un objetivo de dieta con el id",old.Dieta_id, "\n los siguientes datos: ",
        "OBJETIVO = ", old.objetivo, "\n ",
        "ESTATUS = ", v_estatus),
	DEFAULT,
	DEFAULT );
END