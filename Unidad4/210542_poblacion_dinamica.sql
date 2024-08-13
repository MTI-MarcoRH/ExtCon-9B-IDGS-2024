-- sp_poblado_dinamico_opiniones_clientes
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblado_dinamico_opiniones_clientes`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_usuario_id INT;
    DECLARE v_descripcion TEXT;
    DECLARE v_tipo VARCHAR(50);
    DECLARE v_respuesta TEXT;
    DECLARE v_estatus ENUM('Cancelado', 'Registrado', 'Abierto','Atendida');
    DECLARE v_registro_fecha DATETIME;
    DECLARE v_registro_actualizacion DATETIME;
    DECLARE v_Atencion_personal INT;

    WHILE i <= 200 DO
        -- Generar datos aleatorios
        SET v_usuario_id = (SELECT id FROM tbb_usuarios ORDER BY RAND() LIMIT 1);
        SET v_Atencion_personal = (SELECT id FROM tbb_personas ORDER BY RAND() LIMIT 1);
        SET v_descripcion = fn_genera_descripcion_opinion();
        SET v_tipo = fn_genera_tipo_opinion();
        SET v_respuesta = fn_genera_respuesta_opinion();
        SET v_estatus = 'Registrado';  -- Cambiado para usar un valor válido del ENUM
        SET v_registro_fecha = NOW();
        SET v_registro_actualizacion = NOW();

        -- Insertar en la tabla tbd_opiniones_clientes
        INSERT INTO tbd_opiniones_clientes (
            usuario_id,
            descripcion,
            tipo,
            respuesta,
            estatus,
            registro_fecha,
            registro_actualizacion,
            Atencion_personal
        )
        VALUES (
            v_usuario_id,
            v_descripcion,
            v_tipo,
            v_respuesta,
            v_estatus,
            v_registro_fecha,
            v_registro_actualizacion,
            v_Atencion_personal
        );

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;
END


-- *************************************************
-- sp_poblado_dinamico_tbd_preguntas
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblado_dinamico_tbd_preguntas`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_pregunta TEXT;
    DECLARE v_respuesta TEXT;
    DECLARE v_categoria VARCHAR(255);
    DECLARE v_persona_id INT;
    DECLARE v_estatus ENUM('Atendida', 'Registrada', 'Cancelada', 'Pendiente');
    DECLARE v_fecha_creacion DATETIME;
    DECLARE v_fecha_actualizacion DATETIME;

    -- Ciclo para insertar 200 registros
    WHILE i <= 200 DO
        -- Generar datos aleatorios
        SET v_pregunta = fn_genera_pregunta();
        SET v_respuesta = fn_genera_respuesta_pregunta();
        SET v_categoria = fn_genera_categoria_pregunta();
        SET v_persona_id = fn_genera_persona_id_pregunta();  -- Selecciona un ID válido de la tabla relacionada
        SET v_estatus = fn_genera_estatus_pregunta();
        SET v_fecha_creacion = NOW();
        SET v_fecha_actualizacion = NOW();

        -- Insertar en la tabla tbd_preguntas
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
            v_pregunta,
            v_respuesta,
            v_categoria,
            v_persona_id,
            v_estatus,
            v_fecha_creacion,
            v_fecha_actualizacion
        );

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;
END