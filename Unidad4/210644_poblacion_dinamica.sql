--Elaborado por: Suri Jazmin Peña Lira.
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

----Procedimiento dinamico de Tablas ejercicios---------

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_llenado_dinamico_tbc_ejercicios`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_descripcion TEXT;
	DECLARE v_video VARCHAR(50);
	DECLARE v_tipo VARCHAR(50);
    DECLARE v_estatus bit(1);
	DECLARE v_dificultad VARCHAR(50);
    DECLARE v_fecha_registro DATE;
	DECLARE v_fecha_actualizacion DATE;
    DECLARE v_recomendaciones TEXT;
    DECLARE v_restricciones TEXT;

    -- Ciclo para insertar 50 registros
    WHILE i <= 50 DO
        -- Generar datos aleatorios
        SET v_nombre = fn_genera_nombre_ejercicio();
        SET v_descripcion = fn_genera_descripcion_ejercicio();
        SET v_video = fn_genera_nombre_video();
        SET v_tipo = fn_genera_tipo();
		SET v_estatus = fn_genera_estatus();
        SET v_dificultad = fn_genera_dificultad();
        SET v_fecha_registro = CURDATE(); -- Usamos la fecha actual para la creación
        SET v_fecha_actualizacion = CURDATE(); 
		SET v_recomendaciones = fn_genera_recomendaciones();
		SET v_restricciones = fn_genera_restricciones();

        -- Insertar en la tabla tbc_ejercicios
        INSERT INTO tbc_ejercicios (nombre, descripcion,video, tipo, estatus, dificultad, fecha_registro,fecha_actualizacion,recomendaciones,restricciones)
        VALUES (v_nombre, v_descripcion, v_video, v_tipo,v_estatus,  v_dificultad, v_fecha_registro,v_fecha_actualizacion, v_recomendaciones, v_restricciones);

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;
END