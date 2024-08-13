CREATE DEFINER=`osiel`@`%` TRIGGER `tbb_prestamos_AFTER_INSERT` 
AFTER INSERT ON `tbb_prestamos` 
FOR EACH ROW 
BEGIN
    DECLARE v_estatus varchar(20) DEFAULT 'Activo';
    
   
    IF NOT NEW.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;

    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,  
        USER(),   
        'Create', 
        'tbb_prestamos', 
        CONCAT_WS(' ', 'Se ha insertado un nuevo préstamo con los siguientes datos:',
            'ID =', NEW.id,
            'FECHA_PRESTAMO =', NEW.fecha_prestamo,
            'FECHA_DEVOLUCION =', NEW.fecha_devolucion,
            'FECHA_ACTUALIZACION =', NEW.fecha_actualizacion,
            'FECHA_REGISTRO =', NEW.fecha_registro,
            'SITUACION =', NEW.situacion,
            'OBSERVACIONES =', NEW.observaciones,
            'ESTATUS =', v_estatus
        ),
        DEFAULT,  
        DEFAULT   
    );
END;

----------------------------------------
CREATE DEFINER=`osiel`@`%` TRIGGER `tb_miembros_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_miembros` FOR EACH ROW BEGIN
	set new.fecha_actualizacion = current_timestamp();
END

-------------------------------------------

CREATE DEFINER=`osiel`@`%` TRIGGER `tbb_prestamos_AFTER_UPDATE` 
AFTER UPDATE ON `tbb_prestamos` 
FOR EACH ROW 
BEGIN
    DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo'; 
    
    
    IF NOT OLD.estatus THEN
        SET v_estatus_old = "Inactivo";
    END IF;
    
    
    IF NOT NEW.estatus THEN
        SET v_estatus_new = "Inactivo";
    END IF;
    
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,  
        USER(),   
        "Update", 
        "tbb_prestamos", 
        CONCAT_WS(" ", "Se ha actualizado un préstamo con los datos: ",
            "ID = ", OLD.id, ' - ', NEW.id,
            "FECHA_PRESTAMO = ", OLD.fecha_prestamo, ' - ', NEW.fecha_prestamo,
            "FECHA_DEVOLUCION = ", OLD.fecha_devolucion, ' - ', NEW.fecha_devolucion,
            "FECHA_ACTUALIZACION = ", OLD.fecha_actualizacion, ' - ', NEW.fecha_actualizacion,
            "FECHA_REGISTRO = ", OLD.fecha_registro, ' - ', NEW.fecha_registro,
            "SITUACION = ", OLD.situacion, ' - ', NEW.situacion,
            "OBSERVACIONES = ", OLD.observaciones, ' - ', NEW.observaciones,
            "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
        DEFAULT,  
        DEFAULT   
    );
END;

-------------------------

CREATE DEFINER=`osiel`@`%` TRIGGER `tbb_prestamos_BEFORE_DELETE` 
BEFORE DELETE ON `tbb_prestamos` 
FOR EACH ROW 
BEGIN
    DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    
    IF NOT OLD.estatus THEN
        SET v_estatus = "Inactivo";
    END IF;
    
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,  
        USER(),   
        "Delete", 
        "tbb_prestamos", 
        CONCAT_WS(" ", "Se ha eliminado un préstamo con los siguientes datos: ",
            "ID = ", OLD.id,
            "FECHA_PRESTAMO = ", OLD.fecha_prestamo,
            "FECHA_DEVOLUCION = ", OLD.fecha_devolucion,
            "FECHA_ACTUALIZACION = ", OLD.fecha_actualizacion,
            "FECHA_REGISTRO = ", OLD.fecha_registro,
            "SITUACION = ", OLD.situacion,
            "OBSERVACIONES = ", OLD.observaciones,
            "ESTATUS = ", v_estatus
        ),
        DEFAULT,  
        DEFAULT   
    );
END;
