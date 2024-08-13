CREATE DEFINER=`hugo`@`%` PROCEDURE `sp_inserta_membresias`(v_cuantos INT)
BEGIN
    declare i int default 1;
    declare fecha_membresia datetime;
    declare fecha_actualizacion datetime;
	while i <= v_cuantos do
    SET fecha_membresia = fn_genera_fechahora('2024-01-01', CURDATE(), '00:00:00', '23:59:59');
        IF DATE(fecha_membresia) < CURDATE() THEN 
			SET fecha_actualizacion = fn_genera_fechahora(fecha_membresia, CURDATE(), '00:00:00', '23:59:59');
		ELSE
			SET fecha_actualizacion = NULL;
        END IF;
    insert into tbc_membresias values(
		default,
		fn_numero_aleatorio(1,3),
        fn_numero_aleatorio(1,3),
        fn_numero_aleatorio(1,4),
        fn_numero_aleatorio(1,7),
        fn_numero_aleatorio(1,4),
        fecha_membresia,
        fecha_actualizacion,
        fn_numero_aleatorio(0,1),
		fecha_membresia,
		fecha_actualizacion);
		set i = i+1;
    END WHILE;
END
