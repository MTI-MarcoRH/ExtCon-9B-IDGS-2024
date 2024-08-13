CREATE DEFINER=`ame`@`%` PROCEDURE `sp_poblar_preguntasNutricionales`(v_password varchar(20))
BEGIN
    IF v_password = "1234" THEN

    INSERT INTO tbd_preguntas_nutricionales VALUES
        (default,'¿Conoces la diferencia entre la nutrición y alimentación?', 1, 'No', default, null, default, null),
        (default,'¿Cuántas veces comes al día?', 1, '3 veces al dia', default, null, default, null),
        (default,'¿Crees que la salud y la nutrición están relacionadas?', 1, 'Si', default, null, default, null),
        (default,'¿Quién compra los alimentos en tu hogar?', 1, 'Mis padres', default, null, default, null),
        (default,'¿Cuántos litros de agua bebes al día?', 1, '2 litros de agua por dia', default, null, default, null); 
        
        update tbd_preguntas_nutricionales set Descripcion = 'si' where pregunta='¿Conoces la diferencia entre la nutrición y alimentación?';
        update tbd_preguntas_nutricionales set Descripcion = '2 veces al dia' where pregunta='¿Cuántas veces comes al día?';
        
        delete from tbd_preguntas_nutricionales where pregunta='¿Cuántos litros de agua bebes al día?';
         ELSE
		SELECT "La contraseña es incorrecta" AS ErrorMessage;
    end if;
END