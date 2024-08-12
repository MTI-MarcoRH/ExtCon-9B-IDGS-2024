-- sp_poblar_opiniones_clientes
CREATE DEFINER=`dulce`@`%` PROCEDURE `sp_poblar_opiniones_clientes`(v_password VARCHAR(20))
BEGIN  
	
    IF v_password = "xYz$123" THEN
		
		INSERT INTO tbd_opiniones_clientes (id, usuario_id, descripcion, tipo, respuesta, estatus, registro_fecha, registro_actualizacion, Atencion_personal) VALUES
        (default, 5, 'Buena atención y equipo en buen estado', 'Opinión', NULL, 'Registrado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 15),
        (default, 2, 'El personal es muy atento y profesional', 'Opinión', NULL, 'Registrado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 12),
        (default, 5, 'Las instalaciones necesitan más mantenimiento', 'Queja', NULL, 'Registrado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 13),
        (default, 3, 'Gran variedad de clases y horarios', 'Opinión', NULL, 'Registrado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 31),
        (default, 1, 'Podrían mejorar el servicio de limpieza', 'Queja', NULL, 'Registrado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 17);
        
        UPDATE tbd_opiniones_clientes SET estatus = 'Atendida' WHERE estatus = 'Registrado';
        
        DELETE FROM tbd_opiniones_clientes WHERE estatus = 'Atendida';
        
    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;

END



-- sp_poblar_preguntas
CREATE DEFINER=`dulce`@`%` PROCEDURE `sp_poblar_preguntas`(v_password VARCHAR(20))
BEGIN  
    -- Verificar la contraseña
    IF v_password = "xYz$123" THEN

        -- Insertar preguntas
        INSERT INTO tbd_preguntas (pregunta, respuesta, categoria, persona_id, estatus) 
        VALUES 
        ('¿Qué horario prefiere para entrenar?', 'Mañana', 'Preferencias', 42, 'Pendiente'),
        ('¿Está satisfecho con los servicios del gimnasio?', 'Sí', 'Satisfacción', 40, 'Pendiente'),
        ('¿Recomendaría el gimnasio a otros?', 'Sí', 'Recomendación', 45, 'Pendiente');
        
        -- Actualizar la categoría de una pregunta específica
        UPDATE tbd_preguntas 
        SET categoria = 'Experiencia' 
        WHERE pregunta = '¿Está satisfecho con los servicios del gimnasio?';
        
        -- Desactivar (cambiar el estatus) de una pregunta específica
        UPDATE tbd_preguntas 
        SET estatus = 'Pendiente' 
        WHERE pregunta = '¿Qué horario prefiere para entrenar?';
        
        -- Eliminar una pregunta específica
        DELETE FROM tbd_preguntas 
        WHERE pregunta = '¿Recomendaría el gimnasio a otros?';
        
    ELSE 
        -- Mensaje de error si la contraseña es incorrecta
        SELECT "La contraseña es incorrecta, no puedo realizar modificaciones en la Base de Datos" AS ErrorMessage;
    
    END IF;
END