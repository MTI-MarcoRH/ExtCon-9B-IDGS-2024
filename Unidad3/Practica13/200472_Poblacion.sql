CREATE DEFINER=`alejandro`@`%` PROCEDURE `sp_poblar_horarios`(v_password VARCHAR(20))
BEGIN
    IF v_password = "xYz$123" THEN

        INSERT INTO tbd_horarios  VALUES
        ('Tiempo completo mañana', 'Lunes', '08:00:00', '16:00:00', 1, 1, 1, b'1'),
        ('Tiempo completo tarde', 'Martes', '14:00:00', '22:00:00', 1, 1, 1, b'1'),
        ('Medio tiempo noche', 'Miércoles', '22:00:00', '06:00:00', 1, 1, 1, b'0'),
        ('Medio tiempo mañana', 'Jueves', '08:00:00', '12:00:00', 1, 1, 1, b'1'),
        ('Medio tiempo tarde', 'Viernes', '14:00:00', '18:00:00', 1, 1, 1, b'1'),
        ('Descanso', 'Sábado', '00:00:00', '00:00:00', 1, 1, 1, b'1');
    ELSE
        SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    END IF;
END
