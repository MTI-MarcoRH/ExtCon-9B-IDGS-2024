-- TRIGGERS OPINIONES CLIENTES
-- AFTER INSERT
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_opiniones_clientes_AFTER_INSERT` AFTER INSERT ON `tbd_opiniones_clientes` FOR EACH ROW BEGIN
  DECLARE v_estatus VARCHAR(20) DEFAULT 'Atendida';
    
    -- Verificamos el estatus para ubicar el valor en la descripción de la bitácora
    IF NEW.estatus = 'Cancelado' THEN
        SET v_estatus = 'Cancelado';
    ELSEIF NEW.estatus = 'Registrado' THEN
        SET v_estatus = 'Registrado';
	ELSEIF NEW.estatus = 'Abierto' THEN
        SET v_estatus = 'Abierto';
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        USER(),
        "Create",
        "tbd_opiniones_clientes",
        CONCAT_WS(" ", "Se ha insertado una nueva opinión de cliente con los siguientes datos:",
        "ID = ", NEW.id,
        "USUARIO ID = ", NEW.usuario_id,
        "DESCRIPCIÓN = ", NEW.descripcion,
        "TIPO = ", NEW.tipo,
        "RESPUESTA = ", NEW.respuesta,
        "ESTATUS = ", v_estatus,
        "FECHA REGISTRO = ", NEW.registro_fecha,
        "FECHA ACTUALIZACIÓN = ", NEW.registro_actualizacion,
        "ATENCIÓN PERSONAL = ", NEW.Atencion_personal),
        DEFAULT,
        DEFAULT
    );
END

-- BEFORE_UPDATE
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_opiniones_clientes_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_opiniones_clientes` FOR EACH ROW BEGIN
SET new.registro_actualizacion = current_timestamp();
END

--AFTER_UPDATE
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_opiniones_clientes_AFTER_UPDATE` AFTER UPDATE ON `tbd_opiniones_clientes` FOR EACH ROW BEGIN
   DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Atendida';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Atendida';
    
    -- Verificamos el estatus antiguo
    IF OLD.estatus = 'Cancelado' THEN
        SET v_estatus_old = 'Cancelado';
    ELSEIF OLD.estatus = 'Registrado' THEN
        SET v_estatus_old = 'Registrado';
	 ELSEIF OLD.estatus = 'Abierto' THEN
        SET v_estatus_old = 'Abierto';
    END IF;
    
   -- Verificamos el estatus nuevo
    IF NEW.estatus = 'Cancelado' THEN
        SET v_estatus_new = 'Cancelado';
    ELSEIF NEW.estatus = 'Registrado' THEN
        SET v_estatus_new = 'Registrado';
	ELSEIF NEW.estatus = 'Abierto' THEN
        SET v_estatus_new = 'Abierto';
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        CURRENT_USER(),
        'Update',
        'tbd_opiniones_clientes',
        CONCAT_WS(" ", 
            "Se ha modificado una opinión de cliente existente con los siguientes datos: ",
            "ID = ", OLD.id, ' - ', NEW.id, 
            "USUARIO ID = ", OLD.usuario_id, ' - ', NEW.usuario_id,
            "DESCRIPCIÓN = ", OLD.descripcion, ' - ', NEW.descripcion,
            "TIPO = ", OLD.tipo, ' - ', NEW.tipo,
            "RESPUESTA = ", OLD.respuesta, ' - ', NEW.respuesta,
            "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new,
            "FECHA REGISTRO = ", OLD.registro_fecha, ' - ', NEW.registro_fecha,
            "FECHA ACTUALIZACIÓN = ", OLD.registro_actualizacion, ' - ', NEW.registro_actualizacion,
            "ATENCIÓN PERSONAL = ", OLD.Atencion_personal, ' - ', NEW.Atencion_personal),
        DEFAULT,
        DEFAULT  
    );
END

-- AFTER_DELETE
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_opiniones_clientes_AFTER_DELETE` AFTER DELETE ON `tbd_opiniones_clientes` FOR EACH ROW BEGIN
  DECLARE v_estatus VARCHAR(20) DEFAULT 'Atendida';
    
    -- Verificamos el estatus del registro antes de eliminarlo
    IF OLD.estatus = 'Cancelado' THEN
        SET v_estatus = 'Cancelado';
    ELSEIF OLD.estatus = 'Registrado' THEN
        SET v_estatus = 'Registrado';
	 ELSEIF OLD.estatus = 'Abierto' THEN
        SET v_estatus = 'Abierto';
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        CURRENT_USER(),
        'Delete',
        'tbd_opiniones_clientes',
        CONCAT_WS(" ", 
            "Se ha eliminado una opinión de cliente con los siguientes datos: ",
            "ID = ", OLD.id, 
            "USUARIO ID = ", OLD.usuario_id,
            "DESCRIPCIÓN = ", OLD.descripcion,
            "TIPO = ", OLD.tipo,
            "RESPUESTA = ", OLD.respuesta,
            "ESTATUS = ", v_estatus,
            "FECHA REGISTRO = ", OLD.registro_fecha,
            "FECHA ACTUALIZACIÓN = ", OLD.registro_actualizacion,
            "ATENCIÓN PERSONAL = ", OLD.Atencion_personal),
        DEFAULT,
        DEFAULT 
    );
END
-- --------------------------------------------------------------------------------------------------

-- TRIGGERS PREGUNTAS
-- AFTER_INSERT

CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_preguntas_AFTER_INSERT` AFTER INSERT ON `tbd_preguntas` FOR EACH ROW BEGIN
 DECLARE v_estatus VARCHAR(20) DEFAULT 'Atendida';
    
    -- Verificamos el estatus para ubicar el valor en la descripción de la bitácora
    IF NEW.estatus = 'Cancelada' THEN
        SET v_estatus = 'Cancelada';
    ELSEIF NEW.estatus = 'Registratada' THEN
        SET v_estatus = 'Registratada';
    ELSEIF NEW.estatus = 'Pendiente' THEN
        SET v_estatus = 'Pendiente';
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES (
        DEFAULT,
        USER(),
        "Create",
        "tbd_preguntas",
        CONCAT_WS(" ", "Se ha insertado una nueva pregunta con los siguientes datos:",
        "ID = ", NEW.id,
        "PREGUNTA = ", NEW.pregunta,
        "RESPUESTA = ", NEW.respuesta,
        "CATEGORÍA = ", NEW.categoria,
        "PERSONA ID = ", NEW.persona_id,
        "ESTATUS = ", v_estatus,
        "FECHA CREACIÓN = ", NEW.fecha_creacion,
        "FECHA ACTUALIZACIÓN = ", NEW.fecha_actualizacion),
        DEFAULT,
        DEFAULT
    );
END

-- BEFORE_UPDATE
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_preguntas_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_preguntas` FOR EACH ROW BEGIN
SET new.fecha_actualizacion = current_timestamp();
END

-- AFTER_UPDATE
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_preguntas_AFTER_UPDATE` AFTER UPDATE ON `tbd_preguntas` FOR EACH ROW BEGIN
 DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Atendida';
    DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Atendida';
    
    -- Verificamos el estatus antiguo
    IF OLD.estatus = 'Cancelada' THEN
        SET v_estatus_old = 'Cancelada';
    ELSEIF OLD.estatus = 'Registratada' THEN
        SET v_estatus_old = 'Registratada';
    ELSEIF OLD.estatus = 'Pendiente' THEN
        SET v_estatus_old = 'Pendiente';
    END IF;
    
    -- Verificamos el estatus nuevo
    IF NEW.estatus = 'Cancelada' THEN
        SET v_estatus_new = 'Cancelada';
    ELSEIF NEW.estatus = 'Registratada' THEN
        SET v_estatus_new = 'Registratada';
    ELSEIF NEW.estatus = 'Pendiente' THEN
        SET v_estatus_new = 'Pendiente';
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        CURRENT_USER(),
        'Update',
        'tbd_preguntas',
        CONCAT_WS(" ", 
            "Se ha modificado una pregunta existente con los siguientes datos: ",
            "ID = ", OLD.id, ' - ', NEW.id, 
            "PREGUNTA = ", OLD.pregunta, ' - ', NEW.pregunta,
            "RESPUESTA = ", OLD.respuesta, ' - ', NEW.respuesta,
            "CATEGORÍA = ", OLD.categoria, ' - ', NEW.categoria,
            "PERSONA ID = ", OLD.persona_id, ' - ', NEW.persona_id,
            "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new,
            "FECHA CREACIÓN = ", OLD.fecha_creacion, ' - ', NEW.fecha_creacion,
            "FECHA ACTUALIZACIÓN = ", OLD.fecha_actualizacion, ' - ', NEW.fecha_actualizacion),
        DEFAULT,
        DEFAULT  
    );
END

-- AFTER_DELETE
CREATE DEFINER=`dulce`@`%` TRIGGER `tbd_preguntas_AFTER_DELETE` AFTER DELETE ON `tbd_preguntas` FOR EACH ROW BEGIN
 DECLARE v_estatus VARCHAR(20) DEFAULT 'Atendida';
    
    -- Verificamos el estatus del registro antes de eliminarlo
    IF OLD.estatus = 'Cancelada' THEN
        SET v_estatus = 'Cancelada';
    ELSEIF OLD.estatus = 'Registratada' THEN
        SET v_estatus = 'Registratada';
    ELSEIF OLD.estatus = 'Pendiente' THEN
        SET v_estatus = 'Pendiente';
    END IF;
    
    -- Insertar en la bitácora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        CURRENT_USER(),
        'Delete',
        'tbd_preguntas',
        CONCAT_WS(" ", 
            "Se ha eliminado una pregunta con los siguientes datos: ",
            "ID = ", OLD.id, 
            "PREGUNTA = ", OLD.pregunta,
            "RESPUESTA = ", OLD.respuesta,
            "CATEGORÍA = ", OLD.categoria,
            "PERSONA ID = ", OLD.persona_id,
            "ESTATUS = ", v_estatus,
            "FECHA CREACIÓN = ", OLD.fecha_creacion,
            "FECHA ACTUALIZACIÓN = ", OLD.fecha_actualizacion),
        DEFAULT,
        DEFAULT 
    );
END