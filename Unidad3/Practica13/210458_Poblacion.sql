--Elaborado por: Jorge Cazarez Cruz
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.


CREATE DEFINER=`jorge`@`%` PROCEDURE `sp_poblar_instructor`()
BEGIN
IF v_password = "xYz$123" THEN
	insert into tbb_instructor values 
	(1, '12', 'Nutriologo','63', default, default, null,'10'),
	(2, '5', 'Entrenador personal','3', default, default, null,'9'),
	(3, '5', 'Instructor de rehabilitacion','45', default, default, null,'8'),
	(4, '5', 'Instructor de deportes','53', default, default, null,'7');


		UPDATE tbb_instructor SET Especialidad = "Nutriologo" WHERE Especialidad ="Entrenador de cardio";
        
        UPDATE tbb_instructor SET Calificacion = "10" WHERE Calificacion="5";
        
        UPDATE tbb_instructor SET Estatus = "1" WHERE Estatus ="0";
	
		DELETE FROM tbb_instructor WHERE Especialidad='Instructor de deportes';

    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;

END