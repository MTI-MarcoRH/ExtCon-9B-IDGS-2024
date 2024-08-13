-- Elaborado por: Ameli Pérez Garrido
-- Grado y Grupo: 9° "B"
-- Programa Educativo: Ingenieria en Desarrollo y Gestion de Software
-- Fecha elaboracion: 12 de agosto 2024

CREATE DEFINER=`ame`@`%` PROCEDURE `sp_inserta_preguntas_nutricionales`(v_cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE fecha_creacion DATETIME;
    DECLARE fecha_actualizacion DATETIME;

    WHILE i < v_cantidad DO
        -- Genera la fecha de creación aleatoria
        SET fecha_creacion = fn_fecha_creacion_aleatoria('2024-01-01', CURDATE());

        -- Genera la fecha de actualización aleatoria si la fecha de creación es anterior a la fecha actual
        IF DATE(fecha_creacion) < CURDATE() THEN 
            SET fecha_actualizacion = fn_fecha_creacion_aleatoria(fecha_creacion, CURDATE());
        ELSE
            SET fecha_actualizacion = NULL;
        END IF;

        -- Inserta una nueva pregunta nutricional en la tabla
        INSERT INTO preguntas_nutricionales (
            Pregunta, 
            Tipo_Respuesta, 
            Descripcion, 
            Fecha_Creacion, 
            Fecha_Actualizacion, 
            Estatus, 
            Opciones_Respuesta
        ) VALUES (
            fn_pregunta_aleatoria(),
            fn_tipo_respuesta_aleatorio(),
            'Descripción generada automáticamente.',
            fecha_creacion,
            fecha_actualizacion,
            fn_estatus_aleatorio(),
            IF(fn_tipo_respuesta_aleatorio() = 'Cerrada', 'Sí;No', NULL)
        );

        -- Incrementa el contador
        SET i = i + 1;
    END WHILE;
END;
