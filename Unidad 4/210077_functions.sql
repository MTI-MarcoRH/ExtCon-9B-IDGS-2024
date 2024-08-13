CREATE DEFINER=`emilio`@`%` FUNCTION `fn_genera_decripcion_dieta`(v_nombre_dieta VARCHAR(50)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_descripcion TEXT;
    
    SET v_descripcion = 
		CASE v_nombre_dieta 
			WHEN "Dieta omnivora" THEN "Incluye una variedad de alimentos tanto de origen animal como vegetal. Esto significa que los omnívoros pueden consumir carne, pescado, aves, frutas, verduras, granos, legumbres y lácteos."
            WHEN "Dieta vegetariana" THEN "Esta dieta puede ayudarte a prevenir enfermedades, reducir el riesgo de cáncer y mejorar tu salud. Se basa en alimentos de origen vegetal y excluye la carne."
            WHEN "Dieta mediterránea" THEN "Es una alimentación equilibrada, flexible y saludable que se remonta a la década de 1950 y que se asocia a una mayor longevidad y una menor mortalidad. Incluye frutas, verduras, legumbres, pescado y aceite de oliva."
            WHEN "Dieta modificada en calorías" THEN "Esta dieta se basa en restringir el número de calorías diarias, limitando su consumo a un número inferior al que el cuerpo necesita en una jornada."
            WHEN "Dieta modificada en fibra" THEN "La dieta alta en fibra es indicada como medida preventiva del cáncer de colon, diabetes, enfermedades cardiovasculares, obesidad e hiperlipidemias. Se recomienda: 20 a 35 g al día; de los cuales 1/3 de fibra soluble y 2/3 de fibra insoluble."
            WHEN "Dieta modificada en proteína" THEN "Las dietas altas en proteínas buscan lograr un balance positivo de nitrógeno en pacientes catabólicos o con pérdida de proteínas por orina o pérdida de masa muscular. Las dietas bajas en proteína buscan lograr un balance positivo o en equilibrio."
            WHEN "Dieta libre de gluten" THEN "Esta dieta excluye el gluten, una proteína encontrada en el trigo, la cebada y el centeno, que puede causar problemas de salud en personas con enfermedad celíaca o sensibilidad al gluten."
            WHEN "Dieta DASH" THEN "Esta dieta es un plan de alimentación saludable que ayuda a bajar la presión arterial y el colesterol. Se basa en alimentos ricos en calcio, potasio, magnesio y fibra."
            WHEN "Dieta baja en colesterol" THEN "Esta dieta se enfoca en reducir la ingesta de alimentos ricos en colesterol y grasas saturadas para mejorar la salud del corazón."
            WHEN "Dieta baja en grasas" THEN "Esta dieta se basa en reducir la ingesta de alimentos ricos en grasas, como las carnes grasas, los lácteos enteros, los aceites y las frituras. La idea detrás de esta dieta es favorecer la pérdida de peso y reducir el riesgo de enfermedades del corazón."
            ELSE "La dieta no exixste"
		END;
RETURN v_descripcion;
END

CREATE DEFINER=`emilio`@`%` FUNCTION `fn_genera_detalle_dieta`(v_cuantos INT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE i INT default 1;
	DECLARE v_restricciones TEXT;
    
    WHILE i <= v_cuantos DO
		SET v_restricciones =concat_ws("- ", v_restricciones, ELT(fn_numero_aleatorio(1,21), "Limitar el consumo de alimentos procesados.",
																									"Evitar la ingesta desproporcionada de carne por encima de los vegetales.",
																									"Moderar el consumo de carne en la variante flexitariana de esta dieta.",
																									"Excluir la carne de vaca, ave y pescado, y los huevos.",
																									"Evitar alimentos que contienen gelatina, un agente de espesamiento derivado del colágeno animal.",
																									"Limitar el consumo de alimentos procesados, azúcares añadidos, carnes rojas, grasas saturadas y alimentos altos en sodio.",
																									"Restringir las calorías en forma de alcohol.",
																									"Reducir la cantidad total de calorías que se consume o bebe en un día.",
																									"Evitar las pérdidas mayores de 500 g. de peso a la semana.",
																									"Evitar frutas y verduras crudas.",
																									"Evitar el trigo integral y los productos de grano integral.",
																									"Retirar todos aquellos alimentos que contengan proteínas de alto valor biológico (PAVB), en general, proteínas de origen animal.",
																									"Restringir las legumbres y los frutos secos ya que contienen una gran cantidad de proteínas.",
																									"Evitar todos los alimentos y bebidas que contengan trigo, centeno y cebada.",
																									"Evitar alimentos con demasiada sal.",
																									"Reducir la cantidad que se consume de alimentos con sal agregada (sodio) y agregar sal a las comidas.",
																									"Reducir el consumo de alcohol, bebidas azucaradas, alimentos con alto contenido de grasas saturadas.",
																									"Consumir menos de 300 mg de colesterol.",
																									"Limitar la grasa monoinsaturada a un 15-20% de la dieta.",
																									"Comer solo alimentos con 0 gramos de grasa.",
																									"No usar ningún tipo de grasa (como manteca, margarina o aceite) para preparar alimentos."));
		set i = i+1;
    END WHILE;
RETURN v_restricciones;
END

CREATE DEFINER=`emilio`@`%` FUNCTION `fn_genera_nombre_dieta`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_nombre VARCHAR(50);
    
    SET v_nombre = ELT(fn_numero_aleatorio(1,10),"Dieta omnivora", "Dieta vegetariana", "Dieta mediterránea", "Dieta modificada en calorías", "Dieta modificada en fibra", 
													    "Dieta modificada en proteína", "Dieta libre de gluten", "Dieta DASH", "Dieta baja en colesterol", "Dieta baja en grasas");
RETURN v_nombre;
END

CREATE DEFINER=`emilio`@`%` FUNCTION `fn_genera_objetivos_dieta`(v_cuantos INT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE i INT default 1;
	DECLARE v_objetivo TEXT;
    
    WHILE i <= v_cuantos DO
		SET v_objetivo =concat_ws("- ", v_objetivo, ELT(fn_numero_aleatorio(1,37), "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales.",
																	  "Proporcionar antioxidantes, fibra y otras sustancias que pueden ayudar a prevenir enfermedades crónicas.",
                                                                      "Ofrecer una amplia gama de vitaminas, minerales, proteínas, grasas y carbohidratos.",
                                                                      "Proporcionar una variedad de nutrientes esenciales para una buena salud.",
                                                                      "Bajar la presión arterial.",
                                                                      "Reducir el riesgo de cardiopatía.",
                                                                      "Reducir la posibilidad de desarrollar obesidad.",
                                                                      "Reducir la inflamación y aumentar la sensibilidad a la insulina.",
                                                                      "Mejorar la salud cardiovascular.",
                                                                      "Prevenir enfermedades crónicas que acortan la vida.",
                                                                      "Aumentar la vitalidad.",
                                                                      "Lograr un balance energético positivo.",
                                                                      "Aumentar de peso.",
                                                                      "Mantener el peso en condiciones hipermetabólicas.",
                                                                      "Ayudar a pacientes con déficit de peso corporal del 20% o más.",
                                                                      "Normalizar las deposiciones.",
                                                                      "Mantener la salud intestinal.",
                                                                      "Reducir los niveles de colesterol.",
                                                                      "Ayudar a controlar los niveles de azúcar en la sangre.",
                                                                      "Ayudar a lograr un peso saludable.",
                                                                      "Proporcionar una variedad de nutrientes esenciales para una buena salud.",
                                                                      "Ofrecer una amplia gama de vitaminas, minerales, proteínas, grasas y carbohidratos.",
                                                                      "Proporcionar antioxidantes, fibra y otras sustancias que pueden ayudar a prevenir enfermedades crónicas",
                                                                      "Permitir la flexibilidad y adaptabilidad a las preferencias personales y necesidades nutricionales.",
                                                                      "Tratamiento de la enfermedad celíaca, la sensibilidad no-celíaca al gluten y de la alergia al trigo.",
                                                                      "Mejorar la salud intestinal.",
                                                                      "Reducir los síntomas de la enfermedad celíaca y la sensibilidad al gluten.",
                                                                      "Reducir la presión arterial alta.",
                                                                      "Reducir el riesgo de enfermedades del corazón, insuficiencia cardíaca y accidentes cerebrovasculares.",
                                                                      "Ayudar a prevenir o controlar la diabetes tipo 2.",
                                                                      "Mejorar los niveles de colesterol.",
                                                                      "Reducir las probabilidades de cálculos renales.",
                                                                      "Reducir el riesgo de enfermedades del corazón.",
                                                                      "Reducir el riesgo de enfermedad cardiovascular.",
                                                                      "Reducir el consumo de alimentos procesados.",
                                                                      "Aumentar la cantidad de colesterol bueno.",
                                                                      "Prevenir la obesidad."));
		set i = i+1;
    END WHILE;
RETURN v_objetivo;
END

CREATE DEFINER=`emilio`@`%` FUNCTION `fn_numero_aleatorio`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END