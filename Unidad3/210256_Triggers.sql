CREATE DEFINER=`valencia`@`%` TRIGGER `tbd_adeudos_AFTER_INSERT` AFTER INSERT ON `tbd_adeudos` FOR EACH ROW BEGIN
    DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT new.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), -- Usuario
        "Create", -- Operación
        "tbd_adeudos", -- Tabla
        CONCAT_WS(" ", "Se ha insertado un nuevo adeudo con los siguientes datos:", -- Desde aquí
        "Área: ", new.area,
        "Cliente: ", new.cliente,
        "Descripción: ", new.descripcion,
        "Tipo: ", new.tipo,
        "Detalle: ", new.detalle,
        "Estatus: ", v_estatus,
        "Fecha Registro: ", new.fecha_registro,
        "Fecha Actualización: ", new.fecha_actualizacion), -- Hasta aquí -> Descripción 
        DEFAULT, -- Fecha registro 
        DEFAULT -- Estatus
    );

END




--  -----------------------------------------------------------------------------
CREATE DEFINER=`valencia`@`%` TRIGGER `tbd_adeudos_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_adeudos` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END




-- --------------------------------------------------------------------------------

CREATE DEFINER=`valencia`@`%` TRIGGER `tbd_adeudos_AFTER_UPDATE` AFTER UPDATE ON `tbd_adeudos` FOR EACH ROW BEGIN
    DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT old.estatus = b'1' THEN
        SET v_estatus_old = 'Inactivo';
    END IF;
    
    IF NOT new.estatus = b'1' THEN
        SET v_estatus_new = 'Inactivo';
    END IF;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), -- Usuario
        "Update", -- Operación
        "tbd_adeudos", -- Tabla
        CONCAT_WS(" ", "Se ha modificado un adeudo con los siguientes cambios:", -- Desde aquí
        "Área: ", old.area, " a: ", new.area,
        "Cliente: ", old.cliente, " a: ", new.cliente,
        "Descripción: ", old.descripcion, " a: ", new.descripcion,
        "Tipo: ", old.tipo, " a: ", new.tipo,
        "Detalle: ", old.detalle, " a: ", new.detalle,
        "Estatus: ", v_estatus_old, " a: ", v_estatus_new,
        "Fecha Actualización: ", old.fecha_actualizacion, " a: ", new.fecha_actualizacion), -- Hasta aquí -> Descripción 
        DEFAULT, -- Fecha registro 
        DEFAULT -- Estatus
    );

END




-- -------------------------------------------------------------------------------------------

CREATE DEFINER=`valencia`@`%` TRIGGER `tbd_adeudos_AFTER_DELETE` AFTER DELETE ON `tbd_adeudos` FOR EACH ROW BEGIN
    DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';

    IF NOT old.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;

    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), -- Usuario
        "Delete", -- Operación
        "tbd_adeudos", -- Tabla
        CONCAT_WS(" ", "Se ha eliminado un adeudo con los siguientes datos:", -- Desde aquí
        "Área: ", old.area,
        "Cliente: ", old.cliente,
        "Descripción: ", old.descripcion,
        "Tipo: ", old.tipo,
        "Detalle: ", old.detalle,
        "Estatus: ", v_estatus,
        "Fecha Registro: ", old.fecha_registro,
        "Fecha Actualización: ", old.fecha_actualizacion), -- Hasta aquí -> Descripción 
        DEFAULT, -- Fecha registro 
        DEFAULT -- Estatus
    );

END