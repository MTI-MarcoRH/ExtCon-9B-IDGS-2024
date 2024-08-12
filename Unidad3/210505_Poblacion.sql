CREATE DEFINER=`sebastian.marquez`@`%` PROCEDURE `sp_poblar_transaccion`(v_password VARCHAR(20))
BEGIN
	IF v_password = "1234" THEN
		INSERT INTO tbb_transaccion VALUES
		(DEFAULT, 1, 180.00, DEFAULT, DEFAULT, DEFAULT, 1),
		(DEFAULT, 2, 90.00, 0, DEFAULT, DEFAULT, 2),
		(DEFAULT, 1, 320.00, DEFAULT, DEFAULT, DEFAULT, 4),
		(DEFAULT, 2, 180.00, DEFAULT, DEFAULT, DEFAULT, 2),
		(DEFAULT, 2, 320.00, 0, DEFAULT, DEFAULT, 3);
        
        UPDATE tbb_transaccion SET Estatus=1 WHERE ID=2;
        UPDATE tbb_transaccion SET Estatus=1 WHERE ID=5;
        
        DELETE FROM tbb_transaccion WHERE ID=4;
    ELSE
		SELECT "La contraseña es incorrecta" AS ErrorMessage;
    END IF;
END