/*funcion de tipo visita*/
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_obtener_tipo_visita`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_numero INT;
    DECLARE v_tipo_visita VARCHAR(20);
    

    SET v_numero = fn_numero_aleatorio_rangos(1, 5);
    
    
    CASE v_numero
        WHEN 1 THEN SET v_tipo_visita = 'Frecuente';
        WHEN 2 THEN SET v_tipo_visita = 'Ocasional';
        WHEN 3 THEN SET v_tipo_visita = 'Nuevo';
        WHEN 4 THEN SET v_tipo_visita = 'Esporádico';
        WHEN 5 THEN SET v_tipo_visita = 'Una sola visita';
    END CASE;
    
    RETURN v_tipo_visita;
END

/*funcion de antiguedad*/
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_obtener_antiguedad`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_numero INT;
    DECLARE v_antiguedad VARCHAR(20);
    
    
    SET v_numero = fn_numero_aleatorio_rangos(1, 5);
    
    
    CASE v_numero
        WHEN 1 THEN SET v_antiguedad = 'Reciente';
        WHEN 2 THEN SET v_antiguedad = 'Menos de 1 año';
        WHEN 3 THEN SET v_antiguedad = '1 a 3 años';
        WHEN 4 THEN SET v_antiguedad = '3 a 5 años';
        WHEN 5 THEN SET v_antiguedad = 'Más de 5 años';
    END CASE;
    
    RETURN v_antiguedad;
END

/*funcion de numero aleatorios*/
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END