CREATE DEFINER=`emilio`@`%` PROCEDURE `sp_poblar_dietas_estatica`(v_password VARCHAR(20))
BEGIN
    IF v_password = "abcde" THEN
		INSERT INTO tbd_dietas  VALUES(default, "Dieta omnivora", default,"Incluye una variedad de alimentos tanto de origen animal como vegetal. Esto significa que los omnívoros pueden consumir carne, pescado, aves, frutas, verduras, granos, legumbres y lácteos.", default, b'1',default,null),
									  (default, "Dieta vegetariana", default,"Incluye una variedad de alimentos tanto de origen animal como vegetal. Esto significa que los omnívoros pueden consumir carne, pescado, aves, frutas, verduras, granos, legumbres y lácteos.", default, b'1',default,null),
                                      (default, "Dieta mediterránea", default,"Incluye una variedad de alimentos tanto de origen animal como vegetal. Esto significa que los omnívoros pueden consumir carne, pescado, aves, frutas, verduras, granos, legumbres y lácteos.", default, b'1',default,null),
                                      (default, "Dieta modificada en calorías", default,"Incluye una variedad de alimentos tanto de origen animal como vegetal. Esto significa que los omnívoros pueden consumir carne, pescado, aves, frutas, verduras, granos, legumbres y lácteos.", default, b'1',default,null),
                                      (default, "Dieta modificada en fibra", default,"Incluye una variedad de alimentos tanto de origen animal como vegetal. Esto significa que los omnívoros pueden consumir carne, pescado, aves, frutas, verduras, granos, legumbres y lácteos.", default, b'1',default,null);
        INSERT INTO tbd_objetivos_dietas  VALUES(1, "Evitar las pérdidas mayores de 500 g. de peso a la semana", b'1', default,null),
												(2, "Evitar las pérdidas mayores de 500 g. de peso a la semana", b'1', default,null),
                                                (3, "Evitar las pérdidas mayores de 500 g. de peso a la semana", b'1', default,null),
                                                (4, "Evitar las pérdidas mayores de 500 g. de peso a la semana", b'1', default,null),
                                                (5, "Evitar las pérdidas mayores de 500 g. de peso a la semana", b'1', default,null);
        INSERT INTO tbd_detalles_dietas  VALUES(1, "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales", b'1', default,null),
												(2, "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales", b'1', default,null),
                                                (3, "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales", b'1', default,null),
                                                (4, "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales", b'1', default,null),
                                                (5, "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales", b'1', default,null);
    ELSE
        SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    END IF;
END