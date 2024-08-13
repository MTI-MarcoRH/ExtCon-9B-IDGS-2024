-- TABLA tbd_evaluaciones_servicios
-- ELABORADO POR: Maria Lorena Ascencion Andres
--GRADO Y GRUPO: 9°'B'
--PROGRAMA EDUCATIVO: Ingeniería en Desarrollo y Gestión de Software


CREATE DEFINER=`lorena`@`%` PROCEDURE `sp_poblar_evaluaciones_servicios`(v_password VARCHAR(20))
BEGIN  
	
    IF v_password = "lolos" THEN
		
		INSERT INTO tbd_evaluaciones_servicios (usuario, servicio, calificacion, criterio, fecha_registro, estatus) VALUES 
        ('Lorena', 'Servicio de nutrición', 5, 'Excelente servicio y asesoramiento', NOW(), 1),
        ('Daniela', 'Horarios y Precios', 4, 'Buenos precios y horarios flexibles', NOW(), 1),
        ('Carlos', 'Comunidad', 3, 'Buena comunidad pero puede mejorar', NOW(), 1),
        ('Edgar', 'Programas de entrenamiento', 5, 'Programas muy efectivos y bien estructurados', NOW(), 1),
        ('Dulce', 'Servicio de nutrición', 2, 'Podrían mejorar en la atención', NOW(), 1),
        ('Eliezer', 'Horarios y Precios', 3, 'Horarios decentes pero precios algo elevados', NOW(), 1),
        ('Abel', 'Comunidad', 4, 'Buena interacción y apoyo entre miembros', NOW(), 1),
        ('Ameli', 'Programas de entrenamiento', 4, 'Muy buenos entrenadores y programas', NOW(), 1);
        
        -- Actualiza la calificación y el criterio de un usuario específico
        UPDATE tbd_evaluaciones_servicios SET calificacion = 1, criterio = 'No me gustó el servicio' WHERE usuario = 'Dulce';
        
        -- Desactiva una evaluación específica
        UPDATE tbd_evaluaciones_servicios SET estatus = b'0' WHERE usuario = 'Carlos';
        
        -- Elimina una evaluación específica
        DELETE FROM tbd_evaluaciones_servicios WHERE usuario = 'Daniela';
        
    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;
		

END