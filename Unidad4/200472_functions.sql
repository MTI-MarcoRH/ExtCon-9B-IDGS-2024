----------------------------------------------------------------------------------------------
-------------------------------------fn_numero_aleatorio------------------------------------ 
----------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END

----------------------------------------------------------------------------------------------
-------------------------------------fn_genera_tipo_horario------------------------------------ 
----------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_tipo_horario`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_tipo VARCHAR(50);
    SET v_tipo = ELT(fn_numero_aleatorio(1, 7),
        "Sucursal", 
        "Tiempo completo mañana", 
        "Tiempo completo tarde", 
        "Medio tiempo mañana", 
        "Medio tiempo tarde", 
        "Medio tiempo noche",
        "Descanso"
    );
    RETURN v_tipo;
END

----------------------------------------------------------------------------------------------
-------------------------------------fn_genera_hora_tipo_inicio------------------------------------ 
----------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_hora_tipo_inicio`(v_tipo_horario VARCHAR(50)) RETURNS time
    DETERMINISTIC
BEGIN
    DECLARE v_hora_inicio TIME;
    
    SET v_hora_inicio = 
        CASE v_tipo_horario
            WHEN 'Tiempo completo mañana' THEN '08:00:00'
            WHEN 'Tiempo completo tarde' THEN '16:00:00'
            WHEN 'Medio tiempo mañana' THEN '08:00:00'
            WHEN 'Medio tiempo tarde' THEN '12:00:00'
            WHEN 'Medio tiempo noche' THEN '16:00:00'
            WHEN 'Sucursal' THEN '08:00:00'
            WHEN 'Descanso' THEN '00:00:00'
            ELSE '00:00:00' 
        END;
    
    RETURN v_hora_inicio;
END

----------------------------------------------------------------------------------------------
-------------------------------------fn_genera_hora_tipo_fin------------------------------------ 
----------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_hora_tipo_fin`(v_tipo_horario VARCHAR(50)) RETURNS time
    DETERMINISTIC
BEGIN
    DECLARE v_hora_fin TIME;
    
    SET v_hora_fin = 
        CASE v_tipo_horario
            WHEN 'Tiempo completo mañana' THEN '16:00:00'
            WHEN 'Tiempo completo tarde' THEN '00:00:00' 
            WHEN 'Medio tiempo mañana' THEN '12:00:00'
            WHEN 'Medio tiempo tarde' THEN '16:00:00'
            WHEN 'Medio tiempo noche' THEN '00:00:00'  
            WHEN 'Sucursal' THEN '00:00:00'  
            WHEN 'Descanso' THEN '00:00:00'  
            ELSE '00:00:00'  
        END;
    
    RETURN v_hora_fin;
END

----------------------------------------------------------------------------------------------
-------------------------------------fn_genera_dia_semana------------------------------------ 
----------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_dia_semana`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_dia VARCHAR(20);
    SET v_dia = ELT(fn_numero_aleatorio(1, 7),
        'Lunes',
        'Martes',
        'Miércoles',
        'Jueves',
        'Viernes',
        'Sábado',
        'Domingo'
    );
    RETURN v_dia;
END