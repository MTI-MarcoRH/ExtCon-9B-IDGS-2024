CREATE DEFINER=`alejandro`@`%` PROCEDURE `sp_poblar_horarios`(v_password VARCHAR(20))
BEGIN
    IF v_password = "xYz$123" THEN

        INSERT INTO tbd_horarios  VALUES
        ('Tiempo completo mañana', 'Lunes', '08:00:00', '16:00:00', 101, 1, 1001,1),
        ('Tiempo completo tarde', 'Martes', '14:00:00', '22:00:00', 102, 2, 1002,1),
        ('Tiempo completo noche', 'Miércoles', '22:00:00', '06:00:00', 103, 1, 1003, 0);

    ELSE
        SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    END IF;
END
