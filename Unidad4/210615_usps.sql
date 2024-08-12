--Elaborado por: Marco Antonio Morales Rivera
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.

-- Procedimientos para población dinamica 
-- tbd_programas_saludables
CREATE DEFINER=`morales`@`%` PROCEDURE `sp_inserta_programa_saludable`(v_cuantos INT)
BEGIN
    DECLARE i int default 1;

    WHILE i <= v_cuantos DO
        INSERT INTO tbd_programas_saludables (
            `Nombre`,
            `Usuario_ID`,
            `Instructor_ID`,
            `Estatus`,
            `Duracion`,
            `Porcentaje_Avance`,
            `Fecha_Creacion`
        ) VALUES (
            fn_genera_nombre_programa(),
            DEFAULT,
            DEFAULT, 
            fn_genera_estatus_programa(),
            fn_obtener_tiempo(),
            fn_genera_porcentaje_avance_programa(),
            fn_genera_fecha_registro()
        );
        SET i = i + 1;
    END WHILE;
END;



