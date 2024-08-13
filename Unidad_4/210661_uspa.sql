/*Procedimiento para insertar registros aleatorios en tbb_prestamos--------------------------------*/
CREATE DEFINER=`osiel`@`localhost` PROCEDURE `sp_insertar_prestamos_aleatorios`(
    IN p_numero_registros INT
)
BEGIN
    DECLARE v_contador INT DEFAULT 0;
    DECLARE v_fecha_prestamo DATETIME;
    DECLARE v_fecha_devolucion DATETIME;
    DECLARE v_situacion ENUM('pendiente','devuelto','retrasado','cancelado');
    DECLARE v_observaciones TEXT;
    DECLARE v_estatus BIT(1);
    DECLARE v_fecha_registro DATETIME;
    DECLARE v_fecha_actualizacion DATETIME;

    WHILE v_contador < p_numero_registros DO
        
        -- Generar valores aleatorios para los campos
        SET v_fecha_prestamo = NOW() - INTERVAL fn_numero_aleatorio_rangos(1, 10) DAY; 
        SET v_fecha_devolucion = v_fecha_prestamo + INTERVAL fn_numero_aleatorio_rangos(1, 5) DAY;
        SET v_situacion = CASE fn_numero_aleatorio_rangos(1, 4)
                            WHEN 1 THEN 'pendiente'
                            WHEN 2 THEN 'devuelto'
                            WHEN 3 THEN 'retrasado'
                            ELSE 'cancelado'
                          END;
        SET v_observaciones = 'Observación generada automáticamente';
        SET v_estatus = fn_numero_aleatorio_rangos(0, 1);
        SET v_fecha_registro = NOW();
        SET v_fecha_actualizacion = NOW();

        -- Insertar los valores en la tabla tbb_prestamos
        INSERT INTO tbb_prestamos (
            fecha_prestamo, fecha_devolucion, situacion, observaciones, estatus, fecha_registro, fecha_actualizacion
        ) VALUES (
            v_fecha_prestamo, v_fecha_devolucion, v_situacion, v_observaciones, v_estatus, v_fecha_registro, v_fecha_actualizacion
        );

        -- Incrementar el contador
        SET v_contador = v_contador + 1;
    END WHILE;
END;
