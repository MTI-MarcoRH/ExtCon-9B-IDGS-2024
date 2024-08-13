-- ELABORADO POR: Maria Lorena Ascencion Andres
--GRADO Y GRUPO: 9°'B'
--PROGRAMA EDUCATIVO: Ingeniería en Desarrollo y Gestión de Software
-- TABLA tbd_evaluaciones_servicios

-- PROCEDIMIENTO ALMACENADO
CREATE DEFINER=`lorena`@`localhost` PROCEDURE `sp_manage_evaluacionServicio`(
    IN p_action VARCHAR(10), 
    IN p_id INT, 
    IN p_usuario VARCHAR(50), 
    IN p_servicio ENUM('Servicio de nutrición', 'Horarios y Precios', 'Comunidad', 'Programas de entrenamiento'), 
    IN p_calificacion INT, 
    IN p_criterio TEXT, 
    IN p_fecha_registro DATETIME, 
    IN p_estatus BIT(1), 
    OUT p_result VARCHAR(100)
)
BEGIN
    -- Verificamos la acción solicitada
    IF p_action = 'CREATE' THEN
        -- Crear una nueva evaluación de servicio
        INSERT INTO evaluacionServicio (
            usuario,
            servicio,
            calificacion,
            criterio,
            fecha_registro,
            estatus
        )
        VALUES (
            p_usuario,
            p_servicio,
            p_calificacion,
            p_criterio,
            p_fecha_registro,
            p_estatus
        );
        SET p_result = 'Evaluación de servicio creada exitosamente';
        
    ELSEIF p_action = 'UPDATE' THEN
        -- Actualizar la información de una evaluación de servicio existente
        UPDATE evaluacionServicio
        SET 
            usuario = p_usuario,
            servicio = p_servicio,
            calificacion = p_calificacion,
            criterio = p_criterio,
            fecha_registro = p_fecha_registro,
            estatus = p_estatus
        WHERE id = p_id;
        SET p_result = 'Evaluación de servicio actualizada exitosamente';
        
    ELSEIF p_action = 'DELETE' THEN
        -- Eliminar una evaluación de servicio
        DELETE FROM evaluacionServicio WHERE id = p_id;
        SET p_result = 'Evaluación de servicio eliminada exitosamente';
        
    ELSEIF p_action = 'VIEW' THEN
        -- Consultar la información de una evaluación de servicio específica
        SELECT 
            usuario,
            servicio,
            calificacion,
            criterio,
            fecha_registro,
            estatus
        INTO 
            p_usuario,
            p_servicio,
            p_calificacion,
            p_criterio,
            p_fecha_registro,
            p_estatus
        FROM evaluacionServicio
        WHERE id = p_id;
        SET p_result = CONCAT('Usuario: ', p_usuario, ', Servicio: ', p_servicio, ', Calificación: ', p_calificacion, ', Criterio: ', p_criterio, ', Fecha de Registro: ', p_fecha_registro, ', Estatus: ', IF(p_estatus, 'Activo', 'Inactivo'));
        
    ELSE
        SET p_result = 'Acción no válida';
    END IF;
END;


-- para mandar a llamar
-- crear
CALL sp_manage_evaluacionServicio('CREATE', NULL, 'lorena', 'Servicio de nutrición', 5, 'Criterio de prueba', NOW(), 1, @resultado);

-- actualizar
CALL sp_manage_evaluacionServicio('UPDATE', 1, 'usuario_modificado', 'Comunidad', 4, 'Criterio modificado', NOW(), 0, @resultado);

-- eliminar 
CALL sp_manage_evaluacionServicio('DELETE', 1, NULL, NULL, NULL, NULL, NULL, NULL, @resultado);

-- ver 
CALL sp_manage_evaluacionServicio('VIEW', 1, NULL, NULL, NULL, NULL, NULL, NULL, @resultado);
