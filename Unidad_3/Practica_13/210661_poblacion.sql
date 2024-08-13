CREATE DEFINER=`osiel`@`%` PROCEDURE `sp_poblar_prestamos`(v_password varchar(50))
BEGIN
    IF v_password = '1234' THEN
        DELETE FROM tbb_prestamos;

        INSERT INTO tbb_prestamos (fecha_prestamo, fecha_devolucion, situacion, observaciones, estatus, fecha_registro, fecha_actualizacion)
        VALUES 
            ('2024-06-13 10:00:00', '2024-06-20 18:00:00', 'pendiente', 'Préstamo 1', 1, NOW(), NOW()),
            ('2024-06-14 11:00:00', '2024-06-21 19:00:00', 'devuelto', 'Préstamo 2', 1, NOW(), NOW()),
            ('2024-06-15 12:00:00', '2024-06-22 20:00:00', 'retrasado', 'Préstamo 3', 0, NOW(), NOW()),
            ('2024-06-16 13:00:00', '2024-06-23 21:00:00', 'pendiente', 'Préstamo 4', 1, NOW(), NOW()),
            ('2024-06-17 14:00:00', '2024-06-24 22:00:00', 'cancelado', 'Préstamo 5', 0, NOW(), NOW());

         UPDATE tbb_prestamos SET situacion= "retrasado" WHERE id=2;
      
         DELETE FROM tbb_prestamos WHERE situacion="cancelado";
            
    ELSE
        SELECT 'La contraseña es incorrecta. No se pueden poblar préstamos.' AS ErrorMessage;
    END IF;
END