-- Pedidos
CREATE DEFINER=`edgar`@`%` PROCEDURE `sp_poblar_pedidos`(v_password varchar(10))
BEGIN
if v_password = "abc123" then 

        insert into tbb_pedidos values
        (default, 1, default, "02-02-02", null, default, 20, 50.25),
        (default, 2, default, "03-02-02", null, default, 40, 30.55),
        (default, 3, default, "04-02-02", null, default, 80, 45.20),
		(default, 4, default, "05-02-02", null, default, 12, 78.99);
        
        update tbb_pedidos set Tipo = 'Promoción' where id = 1;
        update tbb_pedidos set Costo_total = 50.55 where id = 3;
        
        delete from tbb_pedidos where id = 4;
        
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
	end if;
END
-- Promociones
CREATE DEFINER=`edgar`@`%` PROCEDURE `sp_poblar_promociones`(v_password varchar(10))
BEGIN
if v_password = "abc123" then 

        insert into tbb_promociones values
        (default, 1, default, default, default, "20-06-24", null),
        (default, 2, default, default, default, "21-06-24", null),
        (default, 3, default, default, default, "22-06-24", null),
		(default, 4, default, default, default, "23-06-24", null);
        
        update tbb_promociones set Tipo = 'Miembro' where id = 1;
        update tbb_promociones set Aplicacion_en = 'Tienda virtual' where id = 3;
        
        delete from tbb_promociones where id = 4;
        
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
	end if;
END