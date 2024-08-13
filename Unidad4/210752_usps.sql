-- ELABORADO POR: Amisadai Fernandez Reyes
-- GRADO Y GRUPO: 9B
-- PROGRAMA EDUCATIVO: Ingenieria en desarrollo y gestion de software
-- TABLA tbc_puestos

-- PROCEDIMIENTO ALMACENADO
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_manage_puesto`(
    IN p_action VARCHAR(10), 
    IN p_id INT, 
    IN p_nombre VARCHAR(50), 
    IN p_descripcion TEXT, 
    IN p_salario DECIMAL(7,2), 
    IN p_requisitos TEXT, 
    IN p_estatus BIT(1), 
    OUT p_result VARCHAR(100)
)
BEGIN
    -- Verificamos la acción solicitada
    IF p_action = 'CREATE' THEN
        -- Crear un nuevo puesto
        INSERT INTO tbc_puestos (
            Nombre,
            Descripcion,
            Salario,
            Requisitos,
            Estatus
        )
        VALUES (
            p_nombre,
            p_descripcion,
            p_salario,
            p_requisitos,
            p_estatus
        );
        SET p_result = 'Puesto creado exitosamente';
        
    ELSEIF p_action = 'UPDATE' THEN
        -- Actualizar la información de un puesto existente
        UPDATE tbc_puestos
        SET 
            Nombre = p_nombre,
            Descripcion = p_descripcion,
            Salario = p_salario,
            Requisitos = p_requisitos,
            Estatus = p_estatus
        WHERE ID = p_id;
        SET p_result = 'Puesto actualizado exitosamente';
        
    ELSEIF p_action = 'DELETE' THEN
        -- Eliminar un puesto
        DELETE FROM tbc_puestos WHERE ID = p_id;
        SET p_result = 'Puesto eliminado exitosamente';
        
    ELSEIF p_action = 'VIEW' THEN
        -- Consultar la información de un puesto específico
        SELECT 
            Nombre,
            Descripcion,
            Salario,
            Requisitos,
            Estatus
        INTO 
            p_nombre,
            p_descripcion,
            p_salario,
            p_requisitos,
            p_estatus
        FROM tbc_puestos
        WHERE ID = p_id;
        SET p_result = CONCAT(
            'Nombre: ', p_nombre, ', Descripción: ', p_descripcion, 
            ', Salario: ', p_salario, ', Requisitos: ', p_requisitos, 
            ', Estatus: ', IF(p_estatus, 'Activo', 'Inactivo')
        );
        
    ELSE
        SET p_result = 'Acción no válida';
    END IF;
END;
----------------
--- LLamar al procedimiento
-- Crea un nuevo puesto
CALL sp_manage_puesto('CREATE', NULL, 'Gerente', 'Empleado responsable de la sucursal', 20000.00, 'Carrera Universitaria, Habilidades Informática y Trabajo en Equipo.', b'1', @resultado);

-- Actualiza un puesto existente
CALL sp_manage_puesto('UPDATE', 3, 'Director', 'Empleado a cargo de la dirección general', 25000.00, 'Experiencia en gestión y liderazgo.', b'1', @resultado);

-- Elimina un puesto
CALL sp_manage_puesto('DELETE', 5, NULL, NULL, NULL, NULL, NULL, @resultado);

-- Ver detalles de un puesto
CALL sp_manage_puesto('VIEW', 4, NULL, NULL, NULL, NULL, NULL, @resultado);
