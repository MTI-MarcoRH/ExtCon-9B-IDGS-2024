CREATE DEFINER=`aldair`@`%` PROCEDURE `sp_poblar_indicadores_nutricionales`(v_password VARCHAR(20))
    DETERMINISTIC
BEGIN
	IF v_password = "abcde" THEN
      INSERT INTO tbb_indicadores_nutricionales VALUES (default, 175.00, 70.50, 20.0, 15.00, 'Moderado',default,default,1),
													  (default,178.00, 80.50, 30.0, 25.00, 'Sedentario',default,default,2),
                                                      (default,165.00, 50.50, 20.0, 12.00, 'Moderado',default,default,3),
                                                      (default,176.00, 70.50, 40.0, 11.00, 'Moderado',default,default,2),
													  (default,165.00, 60.00, 15.5,22.00, 'Activo',default,default,5);
        
      UPDATE tbb_indicadores_nutricionales SET Nivel_Actividad= "Ligero" WHERE id=2;
      -- Agrega más sentencias UPDATE aquí según sea necesario.
      
      DELETE FROM tbb_indicadores_nutricionales WHERE Altura="165.00";
      -- Reemplaza con el nombre real de la dieta a eliminar.

    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;
END