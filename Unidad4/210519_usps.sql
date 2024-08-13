-- Pedidos
CREATE DEFINER=`edgar`@`%` PROCEDURE `sp_inserta_pedidos`(v_cuanto int)
    DETERMINISTIC
BEGIN
	DECLARE i INT default 1;
    DECLARE v_id_persona INT;
    DECLARE v_id_productos INT;
    declare v_fecha_inicio_registro date;
    declare v_fecha_fin_registro date;
    DECLARE v_horario_inicio_registro TIME;
    DECLARE v_horario_fin_registro TIME;
    
    -- considerando que el gimnasio empezo a funcionar el 01 de Enero de 2020 y que continua en operación
    SET v_fecha_inicio_registro = "2020-01-01";
    SET v_fecha_fin_registro = curdate();
    -- considera que el área de membresias 
    set v_horario_inicio_registro = "08:00:00";
    set v_horario_fin_registro = "20:00:00";
    while i <= v_cuanto do
		
		call sp_inserta_usuarios(1,null);
		set v_id_persona = last_insert_id();
        
        call sp_inserta_productos(1);
		set v_id_productos = last_insert_id();
	
		INSERT INTO pedidos 
        VALUES(default,
				v_id_persona,
                v_id_productos,
				fn_genera_precios(),
				fn_genera_fecha_registro(v_fecha_inicio_registro, v_fecha_fin_registro, v_horario_inicio_registro,v_horario_fin_registro),
				default);
		set i = i+1;
    END WHILE;
END

-- Promociones
CREATE DEFINER=`edgar`@`%` PROCEDURE `sp_inserta_promociones`(v_cuanto int, v_tipo varchar(200))
    DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE v_id_productos INT;
    DECLARE v_aplica varchar(200) DEFAULT NULL;
    
     while i <= v_cuanto DO
	
			SET v_tipo = null;
			SET v_aplica = NULL;
            
			call sp_inserta_productos(1);
			set v_id_productos = last_insert_id();
        
        if v_tipo IS NULL THEN
			set v_tipo = ELT(fn_numero_aleatorio_rangos(1,4), "membresias","personalizado","complementarios", "recompensas");
		END IF;
        
        if v_aplica IS NULL THEN
			set v_aplica = ELT(fn_numero_aleatorio_rangos(1,2), "Membresia","Producto");
		END IF;
        
		insert into promociones values(default,
										v_id_productos,
										v_tipo,
										v_aplica,
										default);
    SET i = i +1;
	END while;
END