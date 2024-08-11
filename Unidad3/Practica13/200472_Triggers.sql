----------------------------------------------------------------------------------------------
-------------------------------------TRIGGER AFTER INSERT------------------------------------ 
----------------------------------------------------------------------------------------------
CREATE DEFINER=`alejandro`@`%` TRIGGER `tbd_horarios_AFTER_INSERT` AFTER INSERT ON `tbd_horarios` FOR EACH ROW BEGIN
    -- Declaración de variables
    DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NEW.Estatus = 0 THEN
        SET v_estatus = 'Inactivo';
    END IF;

    -- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        USER(),
        "Create",
        "tbd_horarios",
        CONCAT_WS(" ", "Se ha insertado un nuevo horario con los siguientes datos: ",
            "ID = ", NEW.ID,
            "Tipo = ", NEW.Tipo,
            "Dia = ", NEW.Dia,
            "Hora Inicio = ", NEW.Hora_Inicio, 
            "Hora Fin = ", NEW.Hora_Fin,
            "Empleado ID = ", NEW.Empleado_ID, 
            "Sucursal ID = ", NEW.Sucursal_ID, 
            "Servicio ID = ", NEW.Servicio_ID, 
            "Estatus = ", v_estatus 
        ),        
        NOW(),
        DEFAULT
    );
END

----------------------------------------------------------------------------------------------
-------------------------------------TRIGGER BEFORE UPDATE------------------------------------ 
----------------------------------------------------------------------------------------------


CREATE DEFINER=`alejandro`@`%` TRIGGER `tbd_horarios_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_horarios` FOR EACH ROW BEGIN
set new.Fecha_actualizacion = current_timestamp();
END

----------------------------------------------------------------------------------------------
-------------------------------------TRIGGER AFTER UPDATE------------------------------------ 
----------------------------------------------------------------------------------------------

CREATE DEFINER=`alejandro`@`%` TRIGGER `tbd_horarios_AFTER_UPDATE` AFTER UPDATE ON `tbd_horarios` FOR EACH ROW BEGIN
    -- Declaración de variables
    DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Inactivo'; 
    
    -- Determinar el estatus antiguo y nuevo basado en el valor del campo
    IF OLD.Estatus = 0 THEN
        SET v_estatus_old = 'Inactivo';
    ELSE
        SET v_estatus_old = 'Activo';
    END IF;
    
    IF NEW.Estatus = 0 THEN
        SET v_estatus_new = 'Inactivo';
    ELSE
        SET v_estatus_new = 'Activo';
    END IF;

    -- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        USER(),
        'Update',
        'tbd_horarios',
        CONCAT_WS(" ", "Se ha modificado un horario con los siguientes datos: ",
            "ID = ", NEW.ID,
            "Tipo = ", OLD.Tipo, ' - ', NEW.Tipo,
            "Dia = ", OLD.Dia, ' - ', NEW.Dia,
            "Hora Inicio = ", OLD.Hora_Inicio, ' - ', NEW.Hora_Inicio, 
            "Hora Fin = ", OLD.Hora_Fin, ' - ', NEW.Hora_Fin,
            "Empleado ID = ", OLD.Empleado_ID, ' - ', NEW.Empleado_ID, 
            "Sucursal ID = ", OLD.Sucursal_ID, ' - ', NEW.Sucursal_ID, 
            "Servicio ID = ", OLD.Servicio_ID, ' - ', NEW.Servicio_ID, 
            "Estatus = ", v_estatus_old, ' - ', v_estatus_new
        ),
        NOW(),
        DEFAULT
    );
END

----------------------------------------------------------------------------------------------
-------------------------------------TRIGGER BEFORE DELETE------------------------------------ 
----------------------------------------------------------------------------------------------


CREATE DEFINER=`alejandro`@`%` TRIGGER `tbd_horarios_BEFORE_DELETE` BEFORE DELETE ON `tbd_horarios` FOR EACH ROW BEGIN
    -- Declaración de variables
    DECLARE v_estatus VARCHAR(20) DEFAULT 'Inactivo';

    -- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        USER(),
        'Delete',
        'tbd_horarios',
        CONCAT_WS(" ", "Se ha eliminado un horario con el ID: ", OLD.ID, "\nLos siguientes datos: ",
            "Tipo = ", OLD.Tipo, 
            "Dia = ", OLD.Dia,
            "Hora Inicio = ", OLD.Hora_Inicio,
            "Hora Fin = ", OLD.Hora_Fin,
            "Empleado ID = ", OLD.Empleado_ID,
            "Sucursal ID = ", OLD.Sucursal_ID,
            "Servicio ID = ", OLD.Servicio_ID,
            "Estatus = ", v_estatus
        ),
        NOW(),
        DEFAULT
    );
END
