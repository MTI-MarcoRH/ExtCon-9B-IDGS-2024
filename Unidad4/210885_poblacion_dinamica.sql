-- ELABORADO POR: Maria Lorena Ascencion Andres
--GRADO Y GRUPO: 9°'B'
--PROGRAMA EDUCATIVO: Ingeniería en Desarrollo y Gestión de Software
-- TABLA tbd_evaluaciones_servicios

CREATE DEFINER=`lorena`@`%` PROCEDURE `sp_poblado_dinamico_evaluacionServicio`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_usuario_generado VARCHAR(50);
    DECLARE v_servicio_generado VARCHAR(50);
    DECLARE v_calificacion_generada INT;
    DECLARE v_criterio_generado TEXT;
    DECLARE v_fecha_registro DATETIME;
    DECLARE v_estatus_generado BIT(1);

    WHILE i <= 15 DO
        -- Generar datos aleatorios
        SET v_usuario_generado = fn_genera_usuario();                 -- Generar un usuario aleatorio
        SET v_servicio_generado = fn_genera_servicio();          -- Generar un tipo de servicio aleatorio
        SET v_calificacion_generada = fn_genera_calificacion();       -- Generar una calificación aleatoria
        SET v_criterio_generado = fn_genera_criterio();   -- Generar una descripción de criterio aleatoria
        SET v_fecha_registro = fn_genera_fecha_registro_evaluacion();  -- Generar una fecha de registro aleatoria
        SET v_estatus_generado = fn_genera_estatus_evaluacion();      -- Generar un estatus aleatorio

        -- Insertar en la tabla evaluacionServicio
        INSERT INTO evaluacionServicio (
            usuario,
            servicio,
            calificacion,
            criterio,
            fecha_registro,
            estatus
        )
        VALUES (
            v_usuario_generado,
            v_servicio_generado,
            v_calificacion_generada,
            v_criterio_generado,
            v_fecha_registro,
            v_estatus_generado
        );

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;
END;
