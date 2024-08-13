-- TRIGGER: AFTER INSERT
CREATE DEFINER=`sebastian.marquez`@`%` TRIGGER `tbb_transacciones_AFTER_INSERT` AFTER INSERT ON `tbb_transacciones` FOR EACH ROW BEGIN
	DECLARE v_estatus varchar(20) default 'Activo';
    
    IF not new.estatus = b'1' then
        set v_estatus = "Inactivo";
    end if;

    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbb_transacciones",
        CONCAT_WS(" ","Se ha insertado una nueva transaccion con los siguientes datos: ",
        "ID = ", NEW.ID,
        "METODO_PAGO = ", NEW.Metodo_Pago,
        "MONTO = ", NEW.Monto, 
        "ESTATUS = ", v_estatus,
        "FECHA_TRANSACCION = ", NEW.Fecha_Transaccion,
        "FECHA_ACTUALIZACION = ", NEW.Fecha_Actualizacion),
        DEFAULT,
        DEFAULT
    );
END

-- TRIGGER: BEFORE UPDATE
CREATE DEFINER=`sebastian.marquez`@`%` TRIGGER `tbb_transacciones_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_transacciones` FOR EACH ROW BEGIN
	SET NEW.Fecha_Actualizacion = current_timestamp();
END

-- TRIGGER: AFTER UPDATE
CREATE DEFINER=`sebastian.marquez`@`%` TRIGGER `tbb_transacciones_AFTER_UPDATE` AFTER UPDATE ON `tbb_transacciones` FOR EACH ROW BEGIN
	DECLARE v_estatus_old varchar(20) default 'Activo';
	DECLARE v_estatus_new varchar(20) default 'Activo';
    
    IF not old.estatus = b'1' then
        set v_estatus_old = "Inactivo";
    end if;

    IF not new.estatus = b'1' then
        set v_estatus_new = "Inactivo";
    end if;

    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Update",
        "tbb_transacciones",
        CONCAT_WS(" ","Se ha actualizado transaccion con los siguientes datos: ",
        "ID = ", OLD.ID, "-", NEW.ID,
        "METODO_PAGO = ", OLD.Metodo_Pago, "-", NEW.Metodo_Pago,
        "MONTO = ", OLD.Monto, "-", NEW.Monto, 
        "ESTATUS = ", v_estatus_old, "-", v_estatus_new,
        "FECHA_TRANSACCION = ", OLD.Fecha_Transaccion, "-", NEW.Fecha_Transaccion,
        "FECHA_ACTUALIZACION = ", OLD.Fecha_Actualizacion, "-", NEW.Fecha_Actualizacion),
        DEFAULT,
        DEFAULT
    );
END

-- TRIGGER: AFTER DELETE
CREATE DEFINER=`sebastian.marquez`@`%` TRIGGER `tbb_transacciones_AFTER_DELETE` AFTER DELETE ON `tbb_transacciones` FOR EACH ROW BEGIN
	DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT OLD.estatus = b'1' THEN
        SET v_estatus = "Inactivo";
    END IF;
	
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Delete",
        "tbb_transacciones",
        CONCAT_WS(" ","Se ha eliminado la transaccion con los siguientes datos: ", 
        "ID = ", OLD.ID,
        "METODO_PAGO = ", OLD.Metodo_Pago,
        "MONTO = ", OLD.Monto, 
        "ESTATUS = ", v_estatus,
        "FECHA_TRANSACCION = ", OLD.Fecha_Transaccion,
        "FECHA_ACTUALIZACION = ", OLD.Fecha_Actualizacion),
        DEFAULT,
        DEFAULT
    );
END