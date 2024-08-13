-- Funcion para generar una altura aleatoriamente

CREATE DEFINER=`aldair`@`%` FUNCTION `fn_genera_altura`() RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN
	DECLARE altura_aleatoria DECIMAL(5,2);
    SET altura_aleatoria = 150 + (200 - 150 ) * RAND();
    RETURN altura_aleatoria;
END

-- Funcion para generar fecha y hora aleatoriamente apartir de un rango


CREATE DEFINER=`aldair`@`%` FUNCTION `fn_genera_fecha_hora`(v_fechaInicio DATE, v_fechaFin DATE, v_horaInicio TIME, v_horaFin TIME) RETURNS datetime
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

-- Funcion que genera el imc aparte de un peso y altura


CREATE DEFINER=`aldair`@`%` FUNCTION `fn_genera_imc`(v_altura decimal(5,2),v_peso decimal(5,2)) RETURNS decimal(5,1)
    DETERMINISTIC
BEGIN
	DECLARE imc DECIMAL(5,1);
   SET v_altura = v_altura / 100;

    -- Calcular el IMC
    SET imc = v_peso / (v_altura * v_altura);

    RETURN imc;
END

-- Funcion que genera un peso aleatorio


CREATE DEFINER=`aldair`@`%` FUNCTION `fn_genera_peso`() RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN
	DECLARE peso_aleatoria DECIMAL(5,2);
    SET peso_aleatoria = 50 + (150 - 50 ) * RAND();
    RETURN peso_aleatoria;
END

-- Funcion que genera el porcentaje de grasa corporal apartir de un genero y altura

CREATE DEFINER=`aldair`@`%` FUNCTION `fn_genera_pgc`(genero char(1), altura decimal(5,2)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	DECLARE cintura DECIMAL(10,2);
    DECLARE cuello DECIMAL(10,2);
    DECLARE cadera DECIMAL(10,2);
    DECLARE pgc DECIMAL(10,2);

    -- Generar medidas aleatorias para hombres
    IF genero = 'M' THEN
        SET cintura = altura * (0.4 + RAND() * 0.1); -- Cintura entre 40% y 50% de la altura
        SET cuello = altura * (0.15 + RAND() * 0.05); -- Cuello entre 15% y 20% de la altura
        SET cadera = NULL; -- No se utiliza cadera para hombres

        -- Calcular el PGC para hombres
        SET pgc = 86.010 * LOG10(cintura - cuello) - 70.041 * LOG10(altura) + 36.76;

    -- Generar medidas aleatorias para mujeres
    ELSEIF genero = 'F' THEN
        SET cintura = altura * (0.35 + RAND() * 0.1); -- Cintura entre 35% y 45% de la altura
        SET cuello = altura * (0.13 + RAND() * 0.05); -- Cuello entre 13% y 18% de la altura
        SET cadera = altura * (0.5 + RAND() * 0.1);  -- Cadera entre 50% y 60% de la altura

        -- Calcular el PGC para mujeres
        SET pgc = 163.205 * LOG10(cintura + cadera - cuello) - 97.684 * LOG10(altura) - 78.387;

    ELSE
        -- Si el sexo no es 'M' o 'F', retornar NULL
        SET pgc = NULL;
    END IF;
    return pgc;
END

-- Funcion que genera un numero aleatorio apartir de un rengo

CREATE DEFINER=`aldair`@`%` FUNCTION `fn_numero_aleatorio`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END
