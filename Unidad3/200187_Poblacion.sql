CREATE DEFINER=`hugo`@`%` PROCEDURE `sp_poblar_membresias`(v_password VARCHAR(20))
BEGIN
IF v_password = "hugo1234" THEN
      INSERT INTO tbc_membresias VALUES 
      (DEFAULT, "0001", "Individual", "Basicos",  "Anual","Nuevo", DEFAULT,DEFAULT, DEFAULT,DEFAULT,DEFAULT),
      (DEFAULT, "0002", "Familiar", "Basicos",  "Semestral","Plata", DEFAULT,DEFAULT, DEFAULT,DEFAULT,DEFAULT),
      (DEFAULT, "0003", "Individual", "Completa",  "Trimestral","Oro", DEFAULT,DEFAULT, DEFAULT,DEFAULT,DEFAULT),
      (DEFAULT, "0004", "Familiar", "Completa",  "Mensual","Diamante", DEFAULT,DEFAULT, DEFAULT,DEFAULT,DEFAULT),
      (DEFAULT, "0005", "Empresarial", "Coaching",  "Diaria","Nuevo", DEFAULT,DEFAULT, DEFAULT,DEFAULT,DEFAULT);
									
									
      UPDATE tbc_membresias SET Tipo_Plan= "Mensual" WHERE id=2;
      UPDATE tbc_membresias SET Nivel= "Diamante" WHERE id=3;
      -- Agrega más sentencias UPDATE aquí según sea necesario.
      
      DELETE FROM tbc_membresias WHERE Tipo ="Empresarial";
      -- Reemplaza con el nombre real de la dieta a eliminar.

    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;
END