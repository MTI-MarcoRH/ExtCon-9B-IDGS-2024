-- Elaborado por: Ameli Pérez Garrido
-- Grado y Grupo: 9° "B"
-- Programa Educativo: Ingenieria en Desarrollo y Gestion de Software
-- Fecha elaboracion: 12 de agosto 2024


-- Función para generar una pregunta aleatoria
CREATE DEFINER=`ame`@`%` FUNCTION `fn_pregunta_aleatoria`() RETURNS VARCHAR(255)
    DETERMINISTIC
BEGIN
    DECLARE v_pregunta VARCHAR(255);

    SET v_pregunta = (SELECT Pregunta FROM (
        SELECT '¿Cuántas porciones de frutas consumes al día?' AS Pregunta
        UNION
        SELECT '¿Cuántos vasos de agua bebes diariamente?' 
        UNION
        SELECT '¿Consumes alimentos ricos en fibra?'
        UNION
        SELECT '¿Cuántas veces a la semana consumes comida rápida?'
        UNION
        SELECT '¿Incluyes proteínas en tus comidas?'
    ) AS Preguntas ORDER BY RAND() LIMIT 1);

    RETURN v_pregunta;
END;

-- Función para generar el tipo de respuesta aleatorio
CREATE DEFINER=`ame`@`%` FUNCTION `fn_tipo_respuesta_aleatorio`() RETURNS ENUM('Abierta', 'Cerrada')
    DETERMINISTIC
BEGIN
    DECLARE v_tipo_respuesta ENUM('Abierta', 'Cerrada');

    SET v_tipo_respuesta = IF(FLOOR(RAND()*2) = 0, 'Abierta', 'Cerrada');

    RETURN v_tipo_respuesta;
END;

-- Función para generar una fecha de creación aleatoria dentro de un rango
CREATE DEFINER=`ame`@`%` FUNCTION `fn_fecha_creacion_aleatoria`(v_fechaInicio DATE, v_fechaFin DATE) RETURNS DATETIME
    DETERMINISTIC
BEGIN
    DECLARE v_fecha_creacion DATETIME;

    SET v_fecha_creacion = DATE_ADD(v_fechaInicio, INTERVAL FLOOR(RAND() * (DATEDIFF(v_fechaFin, v_fechaInicio) + 1)) DAY);

    RETURN v_fecha_creacion;
END;

-- Función para generar un estado aleatorio (activo o inactivo)
CREATE DEFINER=`ame`@`%` FUNCTION `fn_estatus_aleatorio`() RETURNS BIT(1)
    DETERMINISTIC
BEGIN
    DECLARE v_estatus BIT(1);

    SET v_estatus = IF(FLOOR(RAND()*2) = 0, 0, 1);

    RETURN v_estatus;
END;

-- Insertar un registro en la tabla utilizando las funciones
INSERT INTO preguntas_nutricionales (Pregunta, Tipo_Respuesta, Descripcion, Fecha_Creacion, Fecha_Actualizacion, Estatus, Opciones_Respuesta)
VALUES (
    fn_pregunta_aleatoria(),
    fn_tipo_respuesta_aleatorio(),
    'Descripción generada automáticamente.',
    fn_fecha_creacion_aleatoria('2023-01-01', '2024-12-31'),
    NOW(),
    fn_estatus_aleatorio(),
    'Sí;No'
);