DELIMITER $$

CREATE PROCEDURE sp_poblacionD_salc(
    IN p_password VARCHAR(50),
    IN p_num_inserts INT
)
BEGIN
    DECLARE v_counter INT DEFAULT 0;
    DECLARE v_correct_password VARCHAR(50) DEFAULT 'xYz$123';

    -- Verifica si la contraseña es correcta
    IF p_password = v_correct_password THEN
        -- Comienza un ciclo para realizar la cantidad de inserciones solicitadas
        WHILE v_counter < p_num_inserts DO
            -- Inserción de registros en la tabla tbd_servicios_al_cliente
            INSERT INTO tbd_servicios_al_cliente (
                id_usuario, 
                id_persona, 
                tipo_servicio, 
                descripcion, 
                comentarios, 
                estatus, 
                fecha_registro, 
                fecha_actualizacion
            )
            VALUES (
                fn_generate_id_usuario(),  -- Llama a la función para generar id_usuario
                fn_generate_id_persona(),  -- Llama a la función para generar id_persona
                fn_generate_tipo_servicio(),  -- Llama a la función para generar tipo_servicio
                fn_generate_descripcion(),  -- Llama a la función para generar descripción aleatoria
                fn_generate_comentarios(),  -- Llama a la función para generar comentario aleatorio
                b'1',  -- Estatus activo
                CURDATE(),  -- Fecha de registro actual
                NULL  -- Fecha de actualización nula
            );

            -- Incrementa el contador
            SET v_counter = v_counter + 1;
        END WHILE;
    ELSE
        -- Mensaje de error si la contraseña no es correcta
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Contraseña incorrecta. No se realizaron inserciones.';
    END IF;
END $$

DELIMITER ;

-- -----------------------------------------------------------------------------
-- Llamada del proceso
CALL sp_poblacionD_salc('xYz$123', 50);