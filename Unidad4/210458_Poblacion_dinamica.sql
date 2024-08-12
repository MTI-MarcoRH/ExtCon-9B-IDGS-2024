--Elaborado por: Jorge Cazarez Cruz
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblado_dinamico_tbb_instructores`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_Total_Años_Experiencia INT;
    DECLARE v_Especialidad VARCHAR(100);
    DECLARE v_Total_Clientes_Atendidos INT UNSIGNED;
    DECLARE v_Estatus BIT(1);
    DECLARE v_Fecha_Registro DATETIME;
    DECLARE v_Fecha_Actualizacion DATETIME;
    DECLARE v_Calificacion INT UNSIGNED;

    -- Ciclo para insertar 50 registros
    WHILE i <= 200 DO
        -- Generar datos aleatorios
        SET v_Total_Años_Experiencia = fn_genera_anos_experiencia();
        SET v_Especialidad = fn_genera_especialidad_instructor();
        SET v_Total_Clientes_Atendidos = fn_genera_total_clientes_atendidos();
        SET v_Estatus = fn_genera_estatus_instructor();
        SET v_Fecha_Registro = NOW(); -- Usamos la fecha y hora actual para el registro
        SET v_Fecha_Actualizacion = NOW();
        SET v_Calificacion = fn_genera_calificacion();

        -- Insertar en la tabla tbb_instructores
        INSERT INTO tbb_instructores (
            Total_Años_Experiencia, 
            Especialidad, 
            Total_Clientes_Atendidos, 
            Estatus, 
            Fecha_Registro,
            Fecha_Actualizacion,
            Calificacion
        )
        VALUES (
            v_Total_Años_Experiencia, 
            v_Especialidad, 
            v_Total_Clientes_Atendidos, 
            v_Estatus, 
            v_Fecha_Registro,
            v_Fecha_Actualizacion, 
            v_Calificacion
        );

        -- Incrementar el contador
        SET i = i + 1;
    END WHILE;
END