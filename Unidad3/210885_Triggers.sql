-- TABLA tbd_evaluaciones_servicios
-- ELABORADO POR: Maria Lorena Ascencion Andres
--GRADO Y GRUPO: 9°'B'
--PROGRAMA EDUCATIVO: Ingeniería en Desarrollo y Gestión de Software

-- ------- AFTER INSERT 
CREATE DEFINER=`lorena`@`%` TRIGGER `tbd_evaluaciones_servicios_AFTER_INSERT` AFTER INSERT ON `tbd_evaluaciones_servicios` FOR EACH ROW BEGIN
DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    -- Verificamos si el estatus del servicio para ubicar el valor en la descripción de la bitácora
    IF NOT NEW.estatus THEN
        SET v_estatus = "Inactivo";
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "evaluacionServicio",
        CONCAT_WS(" ","Se ha insertado una nueva evaluación de servicio con los siguientes datos: ",
            "USUARIO = ", NEW.usuario,
            "SERVICIO = ", NEW.servicio,
            "CALIFICACION = ", NEW.calificacion,
            "CRITERIO = ", NEW.criterio,
            "FECHA DE REGISTRO = ", NEW.fecha_registro,
            "ESTATUS = ", v_estatus),
        DEFAULT,
        DEFAULT
    );
END


-- --------- BEFORE UPDATE 
CREATE DEFINER=`lorena`@`%` TRIGGER `tbd_evaluaciones_servicios` BEFORE UPDATE ON `tbd_evaluaciones_servicios` FOR EACH ROW BEGIN
	SET NEW.fecha_registro = CURRENT_TIMESTAMP();
END


-- --------- AFTER UPDATE 
CREATE DEFINER=`lorena`@`localhost` TRIGGER `tbd_evaluaciones_servicios_AFTER_UPDATE` AFTER UPDATE ON `tbd_evaluaciones_servicios` FOR EACH ROW BEGIN
    DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo';
    
    -- Verificamos si el estatus del servicio para ubicar el valor en la descripción de la bitácora
    IF NOT OLD.estatus THEN
        SET v_estatus_old = 'Inactivo';
    END IF;
    
    IF NOT NEW.estatus THEN
        SET v_estatus_new = 'Inactivo';
    END IF;

    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        CURRENT_USER(),
        'Update',
        'evaluacionServicio',
        CONCAT_WS(" ", "Se ha modificado una evaluación de servicio existente con los siguientes datos: ",
            "Usuario =", OLD.usuario, '-', NEW.usuario,
            "Servicio =", OLD.servicio, '-', NEW.servicio,
            "Calificación =", OLD.calificacion, '-', NEW.calificacion,
            "Criterio =", OLD.criterio, '-', NEW.criterio,
            "Fecha de registro =", OLD.fecha_registro, '-', NEW.fecha_registro,
            "Estatus =", v_estatus_old, '-', v_estatus_new),
        DEFAULT,
        DEFAULT
    );
END

-- -------- BEFORE DELETE 
CREATE DEFINER=`lorena`@`%` TRIGGER `tbd_evaluaciones_servicios_BEFORE_DELETE` BEFORE DELETE ON `tbd_evaluaciones_servicios` FOR EACH ROW BEGIN
DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT OLD.estatus THEN
        SET v_estatus = "Inactivo";
    END IF;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        CURRENT_USER(),
        'Delete',
        'evaluacionServicio',
        CONCAT_WS(" ","Se ha eliminado una evaluación de servicio con los siguientes datos: ",
            "Usuario = ", OLD.usuario,
            "Servicio = ", OLD.servicio,
            "Calificación = ", OLD.calificacion,
            "Criterio = ", OLD.criterio,
            "Fecha de registro = ", OLD.fecha_registro,
            "Estatus = ", v_estatus),
        DEFAULT,
        DEFAULT
    );
END