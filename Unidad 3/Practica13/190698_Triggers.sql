-- SERVICIO AL CLIENTE : AFTER INSERT

 DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT new.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), -- Usuario
        "Create", -- Operación
        "tbd_servicios_al_cliente", -- Tabla
        CONCAT_WS(" ", "Se ha insertado un nuevo servicio al cliente con los siguientes datos", -- Desde aquí
        "ID de la persona: ", new.id_usuario,
        "ID del empleado: ", new.id_persona, 
        "Tipo de Servicio: ", new.tipo_servicio,
        "Descripción: ", new.descripcion,
        "Comentarios: ", new.comentarios,
        "Fecha Registro: ", new.fecha_registro,
        "Fecha Actualización: ", new.fecha_actualizacion,
        "Estatus: ", v_estatus ), -- Hasta aquí -> Descripción 
        DEFAULT, -- Fecha registro 
        default -- Estatus
    );


-- ------------------------------------------------------------------------------------------------------------------------------

-- SERVICIO AL CLIENTE : BEFORE UPDATE
BEGIN
SET new.fecha_actualizacion = current_timestamp();
END

-- ------------------------------------------------------------------------------------------------------------------------------

-- SERVICIO AL CLIENTE: AFTER UPDATE


DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo';


-- Validaciones para las etiquetas del estatus

IF NOT old.estatus THEN
SET v_estatus_old = 'Inactivo';
END IF;

IF NOT new.estatus THEN
SET v_estatus_new = 'Inactivo';
END IF;

INSERT INTO tbi_bitacora VALUES(
DEFAULT, -- ID
current_user(), -- Usuario
'Update', -- Operación 
'tbd_servicios_al_cliente', -- Tabla
CONCAT_WS(' ','Se ha modificado Servicio al cliente prestado con los siguientes datos:', -- Desde Aquí
'ID de quien solicitó el servicio: ', old.id_usuario, ' a pasado a: ', new.id_usuario, ' - ',-- Id usuario (Cliente)
'ID de quien prestó el servicio: ', old.id_persona, ' a pasado a: ', new.id_persona, ' - ',-- Id persona (Cliente)
'Tipo de servicio: ', old.tipo_servicio, ' a pasado a: ', new.tipo_servicio, ' - ',-- Tipo de servicio
'Descripción: ', old.descripcion,' a pasado a: ',new.descripcion,' - ', -- Descripción
'comentarios: ', old.comentarios,' a pasado a: ',new.comentarios,' - ', -- Comentarios
'Fecha actualización: ', old.fecha_actualizacion,' a pasado a: ',new.fecha_actualizacion,' - ', -- Fecha de Actualización
'Estatus: ', v_estatus_new 
), --   Hasta Aquí -> Descripción
DEFAULT, -- Fecha Registro
default -- Estatus
);
-- ------------------------------------------------------------------------------------------------------------------------------

-- SERVICIOS AL CLIENTE: BEFORE DELETE

 DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
  IF NOT OLD.estatus THEN
        SET v_estatus = 'Inactiva';
    END IF;

    INSERT INTO tbi_bitacora VALUES (
        DEFAULT, -- ID
        current_user(), -- Usuario
        'Delete', -- Operación
        'tbd_servicios_al_cliente', -- Tabla
        CONCAT_WS(" ", "Se ha eliminado un servicio al cliente con los siguientes datos:", -- Desde aquí
            "ID de quien solicitó el servicio: ", OLD.id_usuario,
            "ID de quien prestó el servicio: ", OLD.id_persona, 
            "Tipo de servicio: ", OLD.tipo_servicio,
            "Descripción: ", OLD.descripcion,
            "Comentarios: ", OLD.comentarios,
            "Estatus: ", v_estatus,
            "Fecha actualización: ", OLD.fecha_actualizacion
        ), -- Hasta aquí -> Descripción 
        DEFAULT, -- Fecha registro 
        b'0' -- Estatus
    );
-- e) Realizar una consulta join (en caso de que aplique) para comprobar la integridad de la información.
