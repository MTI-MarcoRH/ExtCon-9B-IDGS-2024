-- opiniones clientes
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_manage_opiniones_clientes`(
    IN p_action VARCHAR(10), 
    IN p_id INT, 
    IN p_usuario_id INT, 
    IN p_descripcion TEXT, 
    IN p_tipo VARCHAR(255), 
    IN p_respuesta TEXT, 
    IN p_estatus ENUM('Atendida', 'Registrada', 'Cancelada', 'Pendiente'), 
    IN p_fecha_registro DATETIME, 
    IN p_fecha_actualizacion DATETIME, 
    OUT p_result VARCHAR(100)
)
BEGIN
    -- Verificamos la acción solicitada
    IF p_action = 'CREATE' THEN
        -- Crear una nueva opinión de cliente
        INSERT INTO tbd_opiniones_clientes (
            usuario_id,
            descripcion,
            tipo,
            respuesta,
            estatus,
            registro_fecha,
            registro_actualizacion
        )
        VALUES (
            p_usuario_id,
            p_descripcion,
            p_tipo,
            p_respuesta,
            p_estatus,
            p_fecha_registro,
            p_fecha_actualizacion
        );
        SET p_result = 'Opinión de cliente creada exitosamente';
        
    ELSEIF p_action = 'UPDATE' THEN
        -- Actualizar la información de una opinión de cliente existente
        UPDATE tbd_opiniones_clientes
        SET 
            usuario_id = p_usuario_id,
            descripcion = p_descripcion,
            tipo = p_tipo,
            respuesta = p_respuesta,
            estatus = p_estatus,
            registro_fecha = p_fecha_registro,
            registro_actualizacion = p_fecha_actualizacion
        WHERE id = p_id;
        SET p_result = 'Opinión de cliente actualizada exitosamente';
        
    ELSEIF p_action = 'DELETE' THEN
        -- Eliminar una opinión de cliente
        DELETE FROM tbd_opiniones_clientes WHERE id = p_id;
        SET p_result = 'Opinión de cliente eliminada exitosamente';
        
    ELSEIF p_action = 'VIEW' THEN
        -- Consultar la información de una opinión de cliente específica
        SELECT 
            usuario_id,
            descripcion,
            tipo,
            respuesta,
            estatus,
            registro_fecha,
            registro_actualizacion
        INTO 
            p_usuario_id,
            p_descripcion,
            p_tipo,
            p_respuesta,
            p_estatus,
            p_fecha_registro,
            p_fecha_actualizacion
        FROM tbd_opiniones_clientes
        WHERE id = p_id;
        
        SET p_result = CONCAT('Usuario ID: ', p_usuario_id, ', Descripción: ', p_descripcion, ', Tipo: ', p_tipo, ', Respuesta: ', p_respuesta, ', Estatus: ', p_estatus, ', Fecha de Registro: ', p_fecha_registro, ', Fecha de Actualización: ', p_fecha_actualizacion);
        
    ELSE
        SET p_result = 'Acción no válida';
    END IF;
END

-- para ejecutarlo
CALL sp_manage_opiniones_clientes(
    'CREATE', 
    NULL,  -- El ID es NULL porque es auto-incremental
    1,      -- Suponiendo que este es el ID del usuario
    'Descripción de prueba', 
    'Tipo de prueba', 
    'Respuesta de prueba', 
    'Atendida', 
    NOW(), 
    NOW(), 
    @resultado
);
SELECT @resultado;

CALL sp_manage_opiniones_clientes(
    'UPDATE', 
    17,      -- ID del registro a actualizar
    2, 
    'Descripción actualizada', 
    'Tipo actualizado', 
    'Respuesta actualizada', 
    'Atendida', 
    NOW(), 
    NOW(), 
    @resultado
);
SELECT @resultado;

CALL sp_manage_opiniones_clientes(
    'DELETE', 
    25,      -- ID del registro a eliminar
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    @resultado
);
SELECT @resultado;

CALL sp_manage_opiniones_clientes(
    'VIEW', 
    36,      -- ID del registro a consultar
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    @resultado
);
SELECT @resultado;
SELECT ID FROM tbb_personas;
SELECT ID FROM tbb_usuarios;
SELECT ID FROM tbd_opiniones_clientes;
-- ***********************************************
-- preguntas
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_manage_preguntas`(
    IN p_action VARCHAR(10), 
    IN p_id INT, 
    IN p_pregunta TEXT, 
    IN p_respuesta TEXT, 
    IN p_categoria VARCHAR(255), 
    IN p_persona_id INT, 
    IN p_estatus ENUM('Atendida', 'Registrada', 'Cancelada', 'Pendiente'), 
    IN p_fecha_creacion TIMESTAMP, 
    IN p_fecha_actualizacion TIMESTAMP, 
    OUT p_result VARCHAR(500)  -- Aumenta el tamaño aquí
)
BEGIN
    -- Verificamos la acción solicitada
    IF p_action = 'CREATE' THEN
        -- Crear una nueva pregunta
        INSERT INTO tbd_preguntas (
            pregunta,
            respuesta,
            categoria,
            persona_id,
            estatus,
            fecha_creacion,
            fecha_actualizacion
        )
        VALUES (
            p_pregunta,
            p_respuesta,
            p_categoria,
            p_persona_id,
            p_estatus,
            p_fecha_creacion,
            p_fecha_actualizacion
        );
        SET p_result = 'Pregunta creada exitosamente';
        
    ELSEIF p_action = 'UPDATE' THEN
        -- Actualizar la información de una pregunta existente
        UPDATE tbd_preguntas
        SET 
            pregunta = p_pregunta,
            respuesta = p_respuesta,
            categoria = p_categoria,
            persona_id = p_persona_id,
            estatus = p_estatus,
            fecha_creacion = p_fecha_creacion,
            fecha_actualizacion = p_fecha_actualizacion
        WHERE id = p_id;
        SET p_result = 'Pregunta actualizada exitosamente';
        
    ELSEIF p_action = 'DELETE' THEN
        -- Eliminar una pregunta
        DELETE FROM tbd_preguntas WHERE id = p_id;
        SET p_result = 'Pregunta eliminada exitosamente';
        
    ELSEIF p_action = 'VIEW' THEN
        -- Consultar la información de una pregunta específica
        SELECT 
            pregunta,
            respuesta,
            categoria,
            persona_id,
            estatus,
            fecha_creacion,
            fecha_actualizacion
        INTO 
            p_pregunta,
            p_respuesta,
            p_categoria,
            p_persona_id,
            p_estatus,
            p_fecha_creacion,
            p_fecha_actualizacion
        FROM tbd_preguntas
        WHERE id = p_id;
        
        SET p_result = CONCAT('Pregunta: ', p_pregunta, ', Respuesta: ', p_respuesta, ', Categoría: ', p_categoria, ', Persona ID: ', p_persona_id, ', Estatus: ', p_estatus, ', Fecha de Creación: ', p_fecha_creacion, ', Fecha de Actualización: ', p_fecha_actualizacion);
        
    ELSE
        SET p_result = 'Acción no válida';
    END IF;
END
-- para correrlo 
SELECT ID FROM tbd_preguntas;
CALL sp_manage_preguntas(
    'CREATE', 
    NULL, 
    '¿Cuál es la capital de Francia?', 
    'París', 
    'Geografía', 
    11, 
    'Pendiente', 
    NOW(), 
    NOW(), 
    @resultado
);
SELECT @resultado;

CALL sp_manage_preguntas(
    'UPDATE', 
    2,  -- ID del registro a actualizar
    '¿Cuál es la capital de Francia?', 
    'París', 
    'Geografía', 
    11, 
    'Atendida', 
    NOW(), 
    NOW(), 
    @resultado
);
SELECT @resultado;

CALL sp_manage_preguntas(
    'DELETE', 
    2,  -- ID del registro a eliminar
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    @resultado
);
SELECT @resultado;
CALL sp_manage_preguntas(
    'VIEW', 
    3,  -- ID del registro a consultar
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    NULL, 
    @resultado
);
SELECT @resultado;