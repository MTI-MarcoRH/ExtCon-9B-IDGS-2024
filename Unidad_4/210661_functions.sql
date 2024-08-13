/*función para calcular la duración del préstamo------------------------------------------------------*/
CREATE DEFINER=`osiel`@`localhost` FUNCTION `calcular_duracion_prestamo`(fecha_prestamo DATETIME, fecha_devolucion DATETIME) RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE duracion INT;
    SET duracion = DATEDIFF(fecha_devolucion, fecha_prestamo);
    RETURN duracion;
END;


/*función para verificar si el préstamo está retrasado-------------------------------------------------*/
CREATE DEFINER=`osiel`@`localhost` FUNCTION `verificar_retraso`(fecha_devolucion DATETIME) RETURNS BIT
    DETERMINISTIC
BEGIN
    RETURN IF(NOW() > fecha_devolucion, 1, 0);
END;


/*función para obtener la situación actual del préstamo------------------------------------------------*/
CREATE DEFINER=`osiel`@`localhost` FUNCTION `obtener_situacion_prestamo`(fecha_devolucion DATETIME, estatus BIT) RETURNS ENUM('pendiente','devuelto','retrasado','cancelado')
    DETERMINISTIC
BEGIN
    DECLARE situacion ENUM('pendiente','devuelto','retrasado','cancelado');
    
    IF estatus = 0 THEN
        SET situacion = 'cancelado';
    ELSEIF NOW() > fecha_devolucion THEN
        SET situacion = 'retrasado';
    ELSE
        SET situacion = 'pendiente';
    END IF;
    
    RETURN situacion;
END;


/*función para actualizar el estatus y la situación del préstamo---------------------------------------*/
CREATE DEFINER=`osiel`@`localhost` FUNCTION `actualizar_estatus_situacion_prestamo`(id_prestamo INT) RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
    DECLARE situacion_actual ENUM('pendiente','devuelto','retrasado','cancelado');
    DECLARE estatus_actual BIT;

    -- Obtener el estatus actual y situación del préstamo
    SELECT estatus, obtener_situacion_prestamo(fecha_devolucion, estatus)
    INTO estatus_actual, situacion_actual
    FROM tbb_prestamos
    WHERE id = id_prestamo;

    -- Actualizar el registro en la tabla
    UPDATE tbb_prestamos
    SET situacion = situacion_actual, fecha_actualizacion = NOW()
    WHERE id = id_prestamo;

    RETURN CONCAT('Estatus actualizado a ', situacion_actual);
END;
