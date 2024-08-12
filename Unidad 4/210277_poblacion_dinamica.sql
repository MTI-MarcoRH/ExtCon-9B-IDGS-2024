-- Elaborado por: Luz Adriana Reyes González
-- Grado y Grupo: 9°B
-- Programa Educativo: Ingenieria de Desarrollo de Software.
-- Fecha elaboracion: 11 de Julio del 2024.

-- --Procedimiento dinamico de Productos---------

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_llenado_dinamico_tbb_productos`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_marca VARCHAR(100);
	DECLARE v_descripcion text;
	DECLARE v_presentacion VARCHAR(50);
	DECLARE v_precio_actual VARCHAR(50);
	DECLARE v_estatus bit(1);
    DECLARE v_fecha_registro DATE;
	DECLARE v_fecha_actualizacion DATE;
  


    -- Ciclo para insertar 30 registros
    WHILE i <= 30 DO
        -- Generar datos aleatorios
        SET v_nombre = fn_genera_nombre_producto();
        SET v_marca = fn_genera_marca_producto();
        SET v_descripcion = fn_genera_descripcion_producto();
        SET v_presentacion = fn_genera_presentacion();
		SET v_precio_actual = fn_genera_precio_actual();
		SET v_estatus = fn_genera_estatus();
        SET v_fecha_registro = CURDATE(); 
        SET v_fecha_actualizacion = CURDATE(); 
		
        -- Insertar en la tabla tbc_ejercicios
        INSERT INTO tbb_productos (nombre, marca,descripcion, presentacion, precio_actual, estatus, fecha_registro,fecha_actualizacion)
        VALUES (v_nombre, v_marca, v_descripcion, v_presentacion,v_precio_actual,  v_estatus, v_fecha_registro,v_fecha_actualizacion);

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;
END