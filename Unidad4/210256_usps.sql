CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RM_insertar_adeudos`(v_cuantos int)
BEGIN
	declare i int default 0;

    
	while i < v_cuantos do

		insert into tbd_adeudos values(
			default ,
            fn_RM_area_adeudo(),
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_descripcion_adeudo(),
            fn_RM_tipo_adeudo(),
            fn_RM_detalle_adeudo(),
            default,
            now(),
            null);
            set i = i + 1 ;
	end while;
END





-- ---------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_detalle_adeudo`() RETURNS varchar(90) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_detalle_adeudo varchar(100) DEFAULT NULL; 

    -- Selecciona un nombre aleatorio de equipo
    SET v_detalle_adeudo = ELT(fn_RM_numero_aleatorio_rangos(1,3),
        'Producto',
        'Equipamiento',
        'Servicio');
  -- Retorna el nombre del equipo generado
    RETURN v_detalle_adeudo;
END
