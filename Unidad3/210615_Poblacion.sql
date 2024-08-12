/*Procedimiento de poblacion de programas saludables*/

CREATE DEFINER=`morales`@`%` PROCEDURE `sp_poblar_programas_saludables`(v_password VARCHAR(20))
    DETERMINISTIC
BEGIN
	IF v_password = "1234" THEN
insert into tbd_programas_saludables values (default, "Deficit Calorico", 1, 1, "2024-01-01", "Registrado", "40 dias", 60.00, null );
insert into tbd_programas_saludables values (default, "Mes sano", 2, 2, "2024-01-20", "Registrado", "30 dias", 70.00, null );
insert into tbd_programas_saludables values (default, "Bienestar MenteCuerpo", 3, 3, "2024-01-01", "Sugerido", "30 dias", 50.00, null );
insert into tbd_programas_saludables values (default, "Serenidad Salud y Bienestar", 4, 4, "2024-01-20", "Registrado", "30 dias", 40.00, null );
insert into tbd_programas_saludables values (default, "Vida equilibrada", 5, 5, "2024-01-01", "Registrado", "60 dias", 80.00, null );
        
UPDATE tbd_programas_saludables SET Estatus = "Suspendido" WHERE Usuario_ID = 2;
DELETE FROM tbd_programas_saludables WHERE Usuario_ID=4;

    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;
END