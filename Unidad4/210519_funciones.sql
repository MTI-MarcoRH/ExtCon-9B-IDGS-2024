CREATE DEFINER=`edgar`@`%` FUNCTION `fn_genera_precios`() RETURNS float
    DETERMINISTIC
BEGIN
DECLARE v_precio_producto_generado float default null; 
		SET v_precio_producto_generado = ELT (fn_numero_aleatorio_rangos(1,10),
        10,20,30,40,50,60,70,80,90,100);
RETURN v_precio_producto_generado;
END
-- -----------------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END

-- -------------------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` FUNCTION `fn_genera_fecha_registro`(fechaInicio date, fechaFin date, horaInicio time, horaFin time) RETURNS datetime
    DETERMINISTIC
BEGIN
	DECLARE fechaAleatoria DATE;
	DECLARE horaEntrada time;
    DECLARE horaSalida time;   
	DECLARE horaRegistro time;
	DECLARE fechaHoraGenerada datetime;
    
    SET fechaAleatoria = date_add(fechaInicio, INTERVAL floor(rand() * (datediff(fechaFin, fechaInicio) + 1)) DAY);
    
    SET horaRegistro = addtime(horaInicio, SEC_TO_TIME(FLOOR(RAND() * TIME_TO_SEC(TIMEDIFF(horaFin, horaInicio)))));
    
    set fechaHoraGenerada = concat(fechaAleatoria, " ", horaRegistro);
RETURN fechaHoraGenerada;
END