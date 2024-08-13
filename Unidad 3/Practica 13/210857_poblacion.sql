CREATE DEFINER=`max`@`%` PROCEDURE `sp_poblar_miembros`( v_password varchar(50))
BEGIN
	
    IF v_password = "1234" THEN

    INSERT INTO tbb_miembros (ID,Membresia_ID, Usuario_ID, Tipo, Estatus, Antiguedad, Fecha_Registro,Fecha_Actualizacion) VALUES
        (default,1, 1, 'Frecuente', 1, '2 años', default,default),
        (default,2, 2, 'Ocasional', 0, '1 año',default,default ),
        (default,1, 1, 'Nuevo', 1, '6 meses',default,default),
        (default,2, 1, 'Esporádico', 0, '3 meses', default,default),
        (default,1, 1, 'Una sola visita', 1, '1 mes',default,default );
	
		update tbb_miembros set Tipo = 'Nuevo' where id = 4;
        update tbb_miembros set Fecha_Registro = '09-08-24' where id = 3;
        
        delete from tbb_miembros where id = 2;
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
	end if;
END