-- Procedimento de poblacion dinamica de la tabla de indicadores nutricionales

CREATE DEFINER=`aldair`@`%` PROCEDURE `sp_inserta_indicadores_nutricionales`(v_cantidad int)
BEGIN
	declare i int default 0;
    declare altura decimal(5,2);
    declare peso decimal(5,2);
    declare usuario_id int;
    declare genero char(1);
    DECLARE fecha_registro DATETIME;
    DECLARE fecha_actualizacion DATETIME;
    
    while i < v_cantidad do 
		set altura = fn_genera_altura();
		set peso = fn_genera_peso();
        set usuario_id = (select id from tbb_usuarios order by rand() limit 1);
        set genero = (select p.genero from tbb_usuarios u join tbb_personas p on u.persona_id = p.id limit 1);
        SET fecha_registro = fn_genera_fecha_hora('2024-01-01', CURDATE(), '00:00:00', CURTIME());
        IF DATE(fecha_registro) < CURDATE() THEN 
			SET fecha_actualizacion = fn_genera_fecha_hora(fecha_registro, CURDATE(), '00:00:00', CURTIME());
		ELSE
			SET fecha_actualizacion = NULL;
        END IF;
		insert into tbb_indicadores_nutricionales values (
			default,
            altura,
            peso,
            fn_genera_imc(altura,peso),
            fn_genera_pgc(genero,altura),
            fn_numero_aleatorio(1,5),
            fecha_registro,
            fecha_actualizacion,
            usuario_id
        );
		set i = i + 1;
    end while;
END