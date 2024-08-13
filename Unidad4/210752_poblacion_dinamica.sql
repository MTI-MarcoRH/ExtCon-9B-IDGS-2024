-- ELABORADO POR: Amisadai Fernandez Reyes
-- GRADO Y GRUPO: 9B
-- PROGRAMA EDUCATIVO: Ingenieria en desarrollo y gestion de software
-- TABLA tbc_puestos

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_puesto_d`(v_password VARCHAR(20), v_cuantos int)
    DETERMINISTIC
BEGIN
    -- Declaración de variables
    DECLARE i INT DEFAULT 1;
    DECLARE v_nombre VARCHAR(50);
    DECLARE v_descripcion TEXT;
    DECLARE v_puesto_id INT DEFAULT 0;
    DECLARE v_salario DECIMAL(7,2);  
    DECLARE v_requisitos TEXT;

    IF v_password = "abcde" THEN
        WHILE i <= v_cuantos DO
            -- Generando el nombre del puesto
            SET v_nombre = fn_genera_nombre_puesto();
            
            -- Generando descripción, salario y requisitos
            SET v_descripcion = fn_genera_decripcion_puesto(v_nombre);
            SET v_salario = fn_genera_salario(v_nombre);  
            SET v_requisitos = fn_requisitos_generado(v_nombre);

            -- Insertar los datos en la tabla de puestos
            INSERT INTO tbc_puestos (Nombre, Descripcion, Salario, Requisitos) 
            VALUES (v_nombre, v_descripcion, v_salario, v_requisitos);
            SET v_puesto_id = LAST_INSERT_ID();
             
             
            UPDATE tbc_puestos 
            SET Estatus = b'0' 
            WHERE ID = v_puesto_id;

            SET i = i + 1;
        END WHILE;
        
        DELETE FROM tbc_puestos WHERE id=1; 

    ELSE 
        SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    END IF;
END