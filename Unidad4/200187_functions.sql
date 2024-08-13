	CREATE DEFINER=`hugo`@`%` FUNCTION `fn_numero_aleatorio`(v_limite_inferior int, v_limite_superior int) RETURNS int
		DETERMINISTIC
	BEGIN	
		declare v_numero_generado INT 
		default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
		SET @numero_generado = v_numero_generado;
	RETURN v_numero_generado;
	END

    CREATE DEFINER=`hugo`@`%` FUNCTION `fn_genera_fechahora`(v_fechaInicio DATE, v_fechaFin DATE, v_horaInicio TIME, v_horaFin TIME) RETURNS datetime
    DETERMINISTIC
BEGIN
	DECLARE fechaAleatoria DATE;
    DECLARE horaRegistro TIME;
	DECLARE fechaHoraGenerada DATETIME;
    
    -- Generar fecha aleatoria dentro del rango dado
    SET fechaAleatoria = DATE_ADD(v_fechaInicio, INTERVAL FLOOR(RAND() * (DATEDIFF(v_fechaFin, v_fechaInicio) + 1)) DAY);
    
    -- Generar hora de registro aleatoria dentro del rango de hora de entrada y salida
    SET horaRegistro = ADDTIME(v_horaInicio, SEC_TO_TIME(FLOOR(RAND() * TIME_TO_SEC(TIMEDIFF(v_horaFin, v_horaInicio)))));
    
    SET fechaHoraGenerada = CONCAT(fechaAleatoria, " ", horaRegistro);
    
    RETURN fechaHoraGenerada;
END