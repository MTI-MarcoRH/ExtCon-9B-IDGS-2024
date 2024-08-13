CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_miembros_aleatorios`(
    IN p_numero_registros INT
)
BEGIN
    DECLARE v_contador INT DEFAULT 0;
    DECLARE v_membresia_id INT;
    DECLARE v_usuario_id INT;
    DECLARE v_tipo VARCHAR(20);
    DECLARE v_estatus BIT(1);
    DECLARE v_antiguedad VARCHAR(80);
    DECLARE v_fecha_registro DATETIME;
    DECLARE v_fecha_actualizacion DATETIME;

 
    WHILE v_contador < p_numero_registros DO
        
        SET v_membresia_id = fn_numero_aleatorio_rangos(1, 1000); 
        SET v_usuario_id = fn_numero_aleatorio_rangos(1, 1000);   
        SET v_tipo = fn_obtener_tipo_visita();                    
        SET v_estatus = fn_numero_aleatorio_rangos(0, 1);         
        SET v_antiguedad = fn_obtener_antiguedad();               
        SET v_fecha_registro = NOW();                             
        SET v_fecha_actualizacion = NOW();                       

        
        INSERT INTO tbb_miembros (
            Membresia_ID, Usuario_ID, Tipo, Estatus, Antiguedad, Fecha_registro, Fecha_Actualizacion
        ) VALUES (
            v_membresia_id, v_usuario_id, v_tipo, v_estatus, v_antiguedad, v_fecha_registro, v_fecha_actualizacion
        );

      
        SET v_contador = v_contador + 1;
    END WHILE;
END