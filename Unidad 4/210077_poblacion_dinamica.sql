CREATE DEFINER=`emilio`@`%` PROCEDURE `sp_poblar_dietas`(v_password VARCHAR(20), v_cuantos int)
    DETERMINISTIC
BEGIN
	-- Declaración de variables
    DECLARE i INT default 1;
    DECLARE v_nombre VARCHAR(30);
    DECLARE v_dieta_id int default 0;
    DECLARE v_detalle_dieta_id int default 0;
    DECLARE v_objetivo_dieta_id int default 0;
	DECLARE v_descripcion TEXT;
    
	IF v_password = "abcde" THEN
		while i <= v_cuantos do
			-- Generando el nombre de la dieta
			SET v_nombre = fn_genera_nombre_dieta();
			
			-- Insertar los datos en la tabla de dietas
			INSERT INTO tbd_dietas (nombre, descripcion) values (v_nombre, fn_genera_decripcion_dieta(v_nombre));
			set v_dieta_id = last_insert_id();
			
			-- Insertar los datos en la tabla de detalle dieta
			insert into tbd_detalles_dietas (Dieta_id, Detalle) values(v_dieta_id, fn_genera_detalle_dieta(fn_numero_aleatorio(1,4)));
			set v_detalle_dieta_id= last_insert_id();
			
			-- Insertar los datos en la tabla de objetivo dieta
			insert into tbd_objetivos_dietas (Dieta_id, objetivo) values(v_dieta_id, fn_genera_objetivos_dieta(fn_numero_aleatorio(1,6)));
			set v_objetivo_dieta_id= last_insert_id();
			
			-- Actualizamos los datos en la tabla de dietas
			UPDATE tbd_dietas SET Objetivo=v_objetivo_dieta_id, detalle=v_detalle_dieta_id  WHERE id=v_dieta_id;
			set i = i+1;
		END WHILE;
        
        DELETE FROM tbd_objetivos_dietas WHERE Dieta_id=1;
        DELETE FROM tbd_detalles_dietas WHERE Dieta_id=1;
		DELETE FROM tbd_dietas WHERE id=1;
		-- Reemplaza con el nombre real de la dieta a eliminar.

    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el 
      estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;
END