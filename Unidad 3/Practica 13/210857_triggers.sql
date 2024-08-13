/*AFTER INSERT*/
CREATE DEFINER=`max`@`%` TRIGGER `tb_miembros_AFTER_INSERT` AFTER INSERT ON `tbb_miembros` FOR EACH ROW BEGIN
	DECLARE v_estatus varchar(20) default 'Activo';
    
    IF not new.estatus = b'1' then
        set v_estatus = "Inactiva";
    end if;

    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbb_miembros",
        CONCAT_WS(" ","Se ha insertado un nuevo miembro con los siguientes datos: ",
        "ID = ", NEW.id,
        "MEMBRESIA_ID = ", NEW.membresia_id,
        "USUARIO_ID = ", new.usuario_id,
        "TIPO = ", NEW.tipo,
        "ANTIGUEDAD = ", new.antiguedad,
        "FECHA_REGISTRO = ", new.fecha_registro,
        "FECHA_ACTUALIZACION = ", new.fecha_actualizacion,
        "ESTATUS = ", v_estatus),
        DEFAULT,
        DEFAULT
    );
END

/*BEFORE UPDATE*/
CREATE DEFINER=`max`@`%` TRIGGER `tb_miembros_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_miembros` FOR EACH ROW BEGIN
	set new.fecha_actualizacion = current_timestamp();
END

/*AFTER UPDATE*/
CREATE DEFINER=`max`@`%` TRIGGER `tb_miembros_AFTER_UPDATE` AFTER UPDATE ON `tbb_miembros` FOR EACH ROW BEGIN
	DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo'; 
    
    IF not NEW.estatus then
        set v_estatus_old = "Inactiva";
    end if;
    
    IF  not new.estatus then
        set v_estatus_new = "Inactiva";
    end if;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Update",
        "tbb_miembros",
        CONCAT_WS(" ","Se ha actualizado un miembro con los datos: ",
        "ID = ",old.id,' - ', NEW.id,
        "MEMBRESIA_ID = ",old.membresia_id,' - ', NEW.membresia_id,
        "USUARIO_ID = ",old.usuario_id,' - ', new.usuario_id,
        "TIPO = ",old.tipo, ' - ',NEW.tipo,
        "ANTIGUEDAD = ",old.antiguedad, ' - ',new.antiguedad,
        "FECHA_REGISTRO = ",old.fecha_registro,' - ', new.fecha_registro,
        "FECHA_ACTUALIZACION = ",old.fecha_actualizacion,' - ', new.fecha_actualizacion,
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
        DEFAULT,
        DEFAULT
    );
END

/*BEFORE DELETE*/

CREATE DEFINER=`max`@`%` TRIGGER `tb_miembros_BEFORE_DELETE` BEFORE DELETE ON `tbb_miembros` FOR EACH ROW BEGIN
	DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF  not OLD.estatus then
        set v_estatus = "Inactiva";
    end if;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Delete",
        "tbb_miembros",
        CONCAT_WS(" ","Se ha eliminado un miembro con los siguientes datos: ",
        "ID = ",old.id,
        "MEMBRESIA_ID = ",old.membresia_id,
        "USUARIO_ID = ",old.usuario_id,
        "TIPO = ",old.tipo, 
        "ANTIGUEDAD = ",old.antiguedad,
        "FECHA_REGISTRO = ",old.fecha_registro,
        "FECHA_ACTUALIZACION = ",old.fecha_actualizacion,
        "ESTATUS = ", v_estatus),
        DEFAULT,
        DEFAULT
    );
END