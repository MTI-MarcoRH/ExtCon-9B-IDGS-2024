CREATE DEFINER=`YairS`@`%` PROCEDURE `sp_poblar_adeudos`(
    IN v_password VARCHAR(10) -- Añadido parámetro para la contraseña
)
BEGIN
    IF v_password = "abc123" THEN
        -- Insertar datos en la tabla tbd_adeudos
        INSERT INTO tbd_adeudos 
        VALUES 
        (default,"Training", 1, "Maltrato equipo", "Producto", "Producto", b'1', NOW(), null),
        (default,"Training", 4, "Perdió equipo", "Producto", "Producto", b'1', NOW(), null),
        (default,"Training", 6, "Descompuso equipo", "Producto", "Producto", b'1', NOW(), null),
        (default,"Training", 8, "Perdió equipo", "Producto", "Producto", b'1', NOW(), null);

        -- Actualizar datos en la tabla tbd_adeudos
        UPDATE tbd_adeudos 
        SET detalle = "Producto", estatus = b'1' 
        WHERE id = 1;

        -- Eliminar datos en la tabla tbd_adeudos
        DELETE FROM tbd_adeudos 
        WHERE cliente = 4;

    ELSE
        -- Mensaje de error si la contraseña es incorrecta
        SELECT "La contraseña es incorrecta" AS ErrorMessage;
    END IF;
END