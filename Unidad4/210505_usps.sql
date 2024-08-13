-- Elaborado por: Sebastián Márquez García
-- Grado y Grupo: 9° "B"
-- Programa Educativo: Ingenieria en Desarrollo y Gestion de Software
-- Fecha elaboracion: 12 de agosto 2024

CREATE DEFINER=`sebastian.marquez`@`%` PROCEDURE `sp_inserta_transacciones`(v_cantidad INT)
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE fecha_transaccion DATETIME;
    DECLARE fecha_actualizacion DATETIME;
    DECLARE usuario_id INT;
    
	WHILE i < v_cantidad DO
		SET fecha_transaccion = fn_genera_fechahora('2024-01-01', CURDATE(), '00:00:00', CURTIME());
        IF DATE(fecha_transaccion) < CURDATE() THEN 
			SET fecha_actualizacion = fn_genera_fechahora(fecha_transaccion, CURDATE(), '00:00:00', CURTIME());
		ELSE
			SET fecha_actualizacion = NULL;
        END IF;
        
        SET usuario_id = (SELECT ID FROM tbb_usuarios ORDER BY RAND() LIMIT 1);
        
		INSERT INTO tbb_transacciones VALUES(
			DEFAULT,
            fn_numero_aleatorio(1,2),
            fn_genera_monto_aleatorio(100.0, 2000.0),
            DEFAULT,
            fecha_transaccion,
            fecha_actualizacion,
            usuario_id
		);
        
		SET i = i + 1;
    END WHILE;
END