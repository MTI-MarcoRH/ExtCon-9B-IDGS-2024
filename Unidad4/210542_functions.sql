-- Funciones para la tabla opinion cliente 

-- 1 Esta función selecciona un usuario_id existente de la tabla tbb_usuarios.
CREATE FUNCTION fn_genera_usuario_id() RETURNS INT
BEGIN
    RETURN (SELECT usuario_id FROM tbb_usuarios ORDER BY RAND() LIMIT 1);
END;


-- 2 Esta función genera una descripción de opinión aleatoria.
CREATE FUNCTION fn_genera_descripcion_opinion() RETURNS TEXT
BEGIN
    RETURN CONCAT('Descripción de la opinión ', FLOOR(1 + RAND() * 1000));
END;

-- 3 Esta función genera un tipo de opinión aleatorio.
CREATE FUNCTION fn_genera_tipo_opinion() RETURNS VARCHAR(50)
BEGIN
    RETURN CASE
        WHEN RAND() < 0.33 THEN 'Sugerencia'
        WHEN RAND() < 0.66 THEN 'Queja'
        ELSE 'Comentario'
    END;
END;

-- 4 Esta función genera una respuesta a la opinión.
CREATE FUNCTION fn_genera_respuesta_opinion() RETURNS TEXT
BEGIN
    RETURN CONCAT('Respuesta a la opinión ', FLOOR(1 + RAND() * 1000));
END;

-- 5 Esta función genera un estatus aleatorio (activo o inactivo).
CREATE FUNCTION fn_genera_estatus_opinion() RETURNS BIT
BEGIN
    RETURN FLOOR(RAND() * 2);  -- Genera 0 o 1
END;

--6 Esta función selecciona un ID válido para Atencion_personal de la tabla tbb_atencion_personal.
CREATE FUNCTION fn_genera_Atencion_personal() RETURNS INT
BEGIN
    RETURN (SELECT id FROM tbb_atencion_personal ORDER BY RAND() LIMIT 1);
END;

-- *********************************************
-- Funciones para la tabla tbd_preguntas
-- 1 Esta función genera una pregunta aleatoria.
CREATE FUNCTION fn_genera_pregunta() RETURNS TEXT
BEGIN
    RETURN CONCAT('¿Cuál es la importancia de ', FLOOR(1 + RAND() * 1000), '?');
END;

-- 2 Esta función genera una respuesta aleatoria.
CREATE FUNCTION fn_genera_respuesta() RETURNS TEXT
BEGIN
    RETURN CONCAT('La respuesta es ', FLOOR(1 + RAND() * 1000));
END;

-- 3 Esta función genera una categoría aleatoria.
CREATE FUNCTION fn_genera_categoria() RETURNS VARCHAR(255)
BEGIN
    RETURN CASE
        WHEN RAND() < 0.33 THEN 'General'
        WHEN RAND() < 0.66 THEN 'Nutrición'
        ELSE 'Ejercicio'
    END;
END;

-- 4 Esta función selecciona un persona_id existente de la tabla tbb_personas.
CREATE FUNCTION fn_genera_persona_id() RETURNS INT
BEGIN
    RETURN (SELECT persona_id FROM tbb_personas ORDER BY RAND() LIMIT 1);
END;

-- 5 Esta función genera un estatus aleatorio para la pregunta.
CREATE FUNCTION fn_genera_estatus_pregunta() RETURNS ENUM('Atendida', 'Registratada', 'Cancelada', 'Pendiente')
BEGIN
    RETURN CASE
        WHEN RAND() < 0.25 THEN 'Atendida'
        WHEN RAND() < 0.5 THEN 'Registratada'
        WHEN RAND() < 0.75 THEN 'Cancelada'
        ELSE 'Pendiente'
    END;
END;
