-- ELABORADO POR: Maria Lorena Ascencion Andres
--GRADO Y GRUPO: 9°'B'
--PROGRAMA EDUCATIVO: Ingeniería en Desarrollo y Gestión de Software
-- TABLA tbd_evaluaciones_servicios

-- PDT: Mi tabla necesita tener una relación con la de usuarios pero aun no la tiene
-- necesita ser modificada 

-- Genera un usuario
CREATE DEFINER=`lorena`@`%` FUNCTION `fn_genera_usuario`()
RETURNS VARCHAR(50) 
DETERMINISTIC
BEGIN
    DECLARE v_usuario_generado VARCHAR(50) DEFAULT NULL;
    
    -- Selecciona un usuario existente aleatoriamente de la tabla usuarios
    SET v_usuario_generado = (
        SELECT usuario 
        FROM usuarios 
        ORDER BY RAND() 
        LIMIT 1
    );
    
    RETURN v_usuario_generado;
END;


-- Genera un estatus aleatorio
CREATE DEFINER=`lorena`@`%` FUNCTION `fn_genera_estatus_evaluacion`() 
RETURNS VARCHAR(20) 
DETERMINISTIC
BEGIN
    DECLARE v_estatus_generado VARCHAR(20) DEFAULT NULL;
    
    -- Genera un estatus aleatorio (Activo o Inactivo)
    SET v_estatus_generado = ELT(
        fn_numero_aleatorio_rangos(1,2),
        'Activo',
        'Inactivo'
    );
    
    RETURN v_estatus_generado;
END;

-- Genera una fecha de registro 
CREATE DEFINER=`lorena`@`%` FUNCTION `fn_genera_fecha_registro_evaluacion`() 
RETURNS DATETIME 
DETERMINISTIC
BEGIN
    DECLARE fecha_inicio DATETIME;
    DECLARE fecha_fin DATETIME;
    DECLARE fecha_aleatoria DATETIME;
    
   
    SET fecha_inicio = '2022-01-01 00:00:00';
    SET fecha_fin = NOW();  -- Hasta la fecha actual
    
    
    SET fecha_aleatoria = DATE_ADD(
        fecha_inicio, 
        INTERVAL FLOOR(RAND() * (DATEDIFF(fecha_fin, fecha_inicio) + 1)) DAY
    );
    
    RETURN fecha_aleatoria;
END;

-- Genera una calificación 
CREATE DEFINER=`lorena`@`%` FUNCTION `fn_genera_calificacion`() 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE v_calificacion_generada INT;
    
    -- Genera una calificación aleatoria entre 1 y 5
    SET v_calificacion_generada = FLOOR(1 + (RAND() * 5));
    
    RETURN v_calificacion_generada;
END;

-- Genera un servicio
CREATE DEFINER=`lorena`@`%` FUNCTION `fn_genera_servicio`() 
RETURNS ENUM('Servicio de nutrición', 'Horarios y Precios', 'Comunidad', 'Programas de entrenamiento') 
DETERMINISTIC
BEGIN
    DECLARE v_servicio_generado ENUM('Servicio de nutrición', 'Horarios y Precios', 'Comunidad', 'Programas de entrenamiento');
    
    -- Genera un servicio aleatorio
    SET v_servicio_generado = ELT(
        fn_numero_aleatorio_rangos(1,4),
        'Servicio de nutrición',
        'Horarios y Precios',
        'Comunidad',
        'Programas de entrenamiento'
    );
    
    RETURN v_servicio_generado;
END;


-- Genera un criterio 
CREATE DEFINER=`lorena`@`%` FUNCTION `fn_genera_criterio`() 
RETURNS TEXT 
DETERMINISTIC
BEGIN
    DECLARE v_criterio_generado TEXT;
    
    -- Genera un criterio aleatorio
    SET v_criterio_generado = ELT(
        fn_numero_aleatorio_rangos(1,5),
        'Rapidez en la atención',
        'Calidad del servicio',
        'Amabilidad del personal',
        'Disponibilidad de horarios',
        'Eficiencia en la resolución de problemas'
    );
    
    RETURN v_criterio_generado;
END;
