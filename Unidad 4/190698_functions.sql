-- Función para generar id_usuario

CREATE FUNCTION fn_generate_id_usuario()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN FLOOR(1 + RAND() * 1000);  -- Retorna un id_usuario aleatorio
END;

-- Función para generar id_persona

CREATE FUNCTION fn_generate_id_persona()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN FLOOR(1 + RAND() * 1000);  -- Retorna un id_persona aleatorio
END;

-- Función para generar tipo_servicio

CREATE FUNCTION fn_generate_tipo_servicio()
RETURNS ENUM('Servicio Individual','Servicio Grupal')
DETERMINISTIC
BEGIN
    RETURN IF(RAND() > 0.5, 'Servicio Individual', 'Servicio Grupal');  -- Retorna un tipo de servicio aleatorio
END;


-- Función para generar descripcion

CREATE FUNCTION fn_generate_descripcion()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE v_descripcion TEXT;
    SET v_descripcion = CASE FLOOR(1 + RAND() * 15)
        WHEN 1 THEN 'Descripción 1'
        WHEN 2 THEN 'Descripción 2'
        WHEN 3 THEN 'Descripción 3'
        WHEN 4 THEN 'Descripción 4'
        WHEN 5 THEN 'Descripción 5'
        WHEN 6 THEN 'Descripción 6'
        WHEN 7 THEN 'Descripción 7'
        WHEN 8 THEN 'Descripción 8'
        WHEN 9 THEN 'Descripción 9'
        WHEN 10 THEN 'Descripción 10'
        WHEN 11 THEN 'Descripción 11'
        WHEN 12 THEN 'Descripción 12'
        WHEN 13 THEN 'Descripción 13'
        WHEN 14 THEN 'Descripción 14'
        WHEN 15 THEN 'Descripción 15'
        ELSE 'Descripción por defecto'
    END;
    RETURN v_descripcion;
END;


-- Función para generar comentarios

CREATE FUNCTION fn_generate_comentarios()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE v_comentarios TEXT;
    SET v_comentarios = CASE FLOOR(1 + RAND() * 15)
        WHEN 1 THEN 'Comentario 1'
        WHEN 2 THEN 'Comentario 2'
        WHEN 3 THEN 'Comentario 3'
        WHEN 4 THEN 'Comentario 4'
        WHEN 5 THEN 'Comentario 5'
        WHEN 6 THEN 'Comentario 6'
        WHEN 7 THEN 'Comentario 7'
        WHEN 8 THEN 'Comentario 8'
        WHEN 9 THEN 'Comentario 9'
        WHEN 10 THEN 'Comentario 10'
        WHEN 11 THEN 'Comentario 11'
        WHEN 12 THEN 'Comentario 12'
        WHEN 13 THEN 'Comentario 13'
        WHEN 14 THEN 'Comentario 14'
        WHEN 15 THEN 'Comentario 15'
        ELSE 'Comentario por defecto'
    END;
    RETURN v_comentarios;
END;
