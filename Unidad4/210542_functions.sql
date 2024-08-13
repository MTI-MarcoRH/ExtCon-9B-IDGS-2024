-- Funciones para la tabla opinion cliente 

-- 1 Esta función selecciona un usuario_id existente de la tabla tbb_usuarios.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_usuario_id`() RETURNS int
    READS SQL DATA
BEGIN
    RETURN (SELECT usuario_id FROM tbb_usuarios ORDER BY RAND() LIMIT 1);
END


-- 2 Esta función genera una descripción de opinión aleatoria.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_descripcion_opinion`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT('Descripción de la opinión ', FLOOR(1 + RAND() * 1000));
END
-- 3 Esta función genera un tipo de opinión aleatorio.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_tipo_opinion`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN RAND() < 0.33 THEN 'Sugerencia'
        WHEN RAND() < 0.66 THEN 'Queja'
        ELSE 'Comentario'
    END;
END

-- 4 Esta función genera una respuesta a la opinión.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_respuesta_opinion`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT('Respuesta a la opinión ', FLOOR(1 + RAND() * 1000));
END

-- 5 Esta función genera un estatus aleatorio (activo o inactivo).
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus_opinion`() RETURNS bit(1)
    DETERMINISTIC
BEGIN
    RETURN FLOOR(RAND() * 2);  -- Genera 0 o 1
END


-- *********************************************
-- Funciones para la tabla tbd_preguntas
-- 1 Esta función genera una pregunta aleatoria.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_pregunta`() RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
    RETURN CONCAT('¿Cuál es la importancia de ', FLOOR(1 + RAND() * 1000), '?');
END

-- 2 Esta función genera una respuesta aleatoria.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_respuesta_pregunta`() RETURNS text CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
    RETURN CONCAT('La respuesta es ', FLOOR(1 + RAND() * 1000));
END

-- 3 Esta función genera una categoría aleatoria.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_categoria_pregunta`() RETURNS varchar(255) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN RAND() < 0.33 THEN 'General'
        WHEN RAND() < 0.66 THEN 'Nutrición'
        ELSE 'Ejercicio'
    END;
END

-- 4 Esta función selecciona un persona_id existente de la tabla tbb_personas.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_persona_id_pregunta`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_persona_id INT;
    
    -- Seleccionar un persona_id existente
    SELECT id INTO v_persona_id FROM tbb_personas ORDER BY RAND() LIMIT 1;
    
    RETURN v_persona_id;
END
-- 5 Esta función genera un estatus aleatorio para la pregunta.
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus_pregunta`() RETURNS enum('Atendida','Registrada','Cancelada','Pendiente') CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN RAND() < 0.25 THEN 'Atendida'
        WHEN RAND() < 0.5 THEN 'Registrada'
        WHEN RAND() < 0.75 THEN 'Cancelada'
        ELSE 'Pendiente'
    END;
END