--Elaborado por: Mario Gutierrez Rosales
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.

-- Procedimientos para población dinamica de tbd_rutinas y tbd_ejercicios_rutinas
-- tbd_rutinas
CREATE DEFINER=`marinho`@`%` PROCEDURE `sp_inserta_rutinas`(v_cuantos INT)
BEGIN
    DECLARE i int default 1;
	DECLARE v_id_programa_saludable int;
    while i <= v_cuantos do
		set v_id_programa_saludable = (select ID from tbd_programas_saludables order by rand() limit 1);
		INSERT INTO tbd_rutinas VALUES (
			default,
			fn_genera_nombre_rutina(),
			v_id_programa_saludable,
            fn_genera_fecha_registro(),
            default,
            fn_obtener_tiempo(),
			fn_genera_estatus_rutina(),
			fn_genera_resultado_rutina()
			);
		set i = i+1;
    END WHILE;
END

-- tbd_ejercicios_rutinas
CREATE DEFINER=`marinho`@`%` PROCEDURE `sp_inserta_ejercicios_rutinas`(v_cuantos INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_id_ejercicio INT;
    DECLARE v_id_rutina INT;
    DECLARE v_cantidad INT;
    DECLARE v_tipo VARCHAR(100);
    WHILE i <= v_cuantos DO
        -- Repetir hasta encontrar una combinación única
        m: LOOP
            SET v_id_ejercicio = (SELECT ID FROM tbc_ejercicios ORDER BY RAND() LIMIT 1);
            SET v_id_rutina = (SELECT ID FROM tbd_rutinas ORDER BY RAND() LIMIT 1);
            -- Verificar si la combinación ya existe en la tabla de destino
            IF NOT EXISTS (
                SELECT 1
                FROM tbd_ejercicios_rutinas
                WHERE Ejercicio_ID = v_id_ejercicio AND Rutina_ID = v_id_rutina
            ) THEN
                -- Si no existe, salir del bucle
                LEAVE m;
            END IF;
        END LOOP;
        -- No se vio la necesidad de crear una función para operaciónes simples
        set v_cantidad = FLOOR(RAND() * (20 - 10 + 1)) + 10;
        set v_tipo = ELT (fn_numero_aleatorio_rangos(1,2), "Repeticiones", "Tiempo");
        
		INSERT INTO tbd_ejercicios_rutinas VALUES (
			v_id_ejercicio,
			v_id_rutina,
            v_cantidad,
            v_tipo,
            fn_genera_observaciones_ejrt(),
            fn_genera_fecha_registro(),
            default,
            default
			);
		set i = i+1;
    END WHILE;
END