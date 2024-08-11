----------------------------------------------------------------------------------------------
-------------------------------------sp_poblar_horarios------------------------------------ 
----------------------------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_horarios`(v_password VARCHAR(20), v_cuantos INT)
    DETERMINISTIC
BEGIN
    -- Declaración de variables
    DECLARE i INT DEFAULT 1;
    DECLARE v_tipo_horario VARCHAR(50);
    DECLARE v_dia VARCHAR(20);
    DECLARE v_hora_inicio TIME;
    DECLARE v_hora_fin TIME;
    DECLARE v_empleado_id INT UNSIGNED DEFAULT 1;
    DECLARE v_sucursal_id INT UNSIGNED DEFAULT 1;
    DECLARE v_servicio_id INT UNSIGNED DEFAULT 1;
    DECLARE v_horario_id INT DEFAULT 0;
    
    IF v_password = "xYz$123" THEN
        WHILE i <= v_cuantos DO
            -- Generar tipo de horario
            SET v_tipo_horario = fn_genera_tipo_horario();
            
            -- Generar día de la semana
            SET v_dia = fn_genera_dia_semana();
            
            -- Generar hora de inicio y fin basada en el tipo de horario
            SET v_hora_inicio = fn_genera_hora_tipo_inicio(v_tipo_horario);
            SET v_hora_fin = fn_genera_hora_tipo_fin(v_tipo_horario);
            
            -- Insertar los datos en la tabla de horarios
            INSERT INTO tbd_horarios (Tipo, Dia, Hora_Inicio, Hora_Fin, Estatus, Empleado_ID, Sucursal_ID, Servicio_ID)
            VALUES (v_tipo_horario, v_dia, v_hora_inicio, v_hora_fin, 1, v_empleado_id, v_sucursal_id, v_servicio_id);
            
            -- Obtener el ID del horario insertado
            SET v_horario_id = LAST_INSERT_ID();
            
            -- Actualizar la fecha de actualización para el registro insertado
            UPDATE tbd_horarios
            SET Fecha_actualizacion = CURRENT_TIMESTAMP
            WHERE ID = v_horario_id;
            
            SET i = i + 1;
        END WHILE;
        
    ELSE 
        SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    END IF;
END