CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RM_insertar_equipamientos`(v_cuantos int)
BEGIN
	declare i int default 0;

    
	while i < v_cuantos do

		insert into tbb_equipamientos values(
			default ,
            fn_RM_area_equipamientos(),
            fn_RM_nombres_equipamientos(),
            fn_RM_nombre_marca_equipamiento(),
            fn_RM_nombre_modelo_equipamiento(),
            null,
            default,
            fn_RM_numero_aleatorio_1a15(),
            now(),
            default);
            set i = i + 1 ;
	end while;
END


-- --------------------------------------------------

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RM_insertar_mantenimientos`(v_cuantos int)
BEGIN
	declare i int default 0;

    
	while i < v_cuantos do

		insert into tbb_mantenimientos values(
			default ,
            fn_RM_nombre_equipos(),
            fn_RM_descripcion_equipos(),
            fn_RM_costo_equipos(),
            fn_RM_nombre_responsable_mantenimiento(),
            default,
            now(),
            default);
            set i = i + 1 ;
	end while;
END