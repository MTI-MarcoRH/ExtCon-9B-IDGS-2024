CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RM_insertar_sucursales`(v_cuantos int)
BEGIN
	declare i int default 0;

    
	while i < v_cuantos do

		insert into tbc_sucursales values(
			default ,
            fn_RM_nombre_sucursales(),
            fn_RM_direccion_sucursales(),
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_horario_disponibilidad_sucursales(),
            default,
           now(),
            now());
            set i = i + 1 ;
	end while;
END




-- --------------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RM_insertar_instalaciones`(v_cuantos int)
BEGIN
	declare i int default 0;

    
	while i < v_cuantos do

		insert into tbb_instalaciones values(
			default ,
            fn_RM_servicio_instalaciones(),
            fn_RM_descripcion_instalaciones(),
            fn_RM_tipo_instalaciones(),
            fn_RM_observaciones_instalaciones(),
            fn_RM_calificacion_instalaciones(),
            default,
            fn_RM_numero_aleatorio_1a15(),
            fn_RM_horario_disponibilidad_instalacion(),
            now(),
            null);
            set i = i + 1 ;
	end while;
END