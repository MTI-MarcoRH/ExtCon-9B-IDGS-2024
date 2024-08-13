CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_nombre_equipos`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
    DECLARE v_nombre_equipo_generado varchar(100) DEFAULT NULL; 

    -- Selecciona un nombre aleatorio de equipo
    SET v_nombre_equipo_generado = ELT(fn_RM_numero_aleatorio_rangos(1, 15),
        "Pesas",
        "Treadmill",
        "Bicicleta Estática",
        "Máquina de Remo",
        "Elíptica",
        "Banco de Pesas",
        "Máquina de Curl de Piernas",
        "Máquina de Prensa de Piernas",
        "Máquina de Abdominales",
        "Máquina de Pecho",
        "Máquina de Espalda",
        "Rueda de Ejercicio",
        "Bicicleta de Spinning",
        "Kettlebell",
        "TRX");

    -- Retorna el nombre del equipo generado
    RETURN v_nombre_equipo_generado;
END


-- ----------------------------------------------------------------------




CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_descripcion_equipos`() RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
    DECLARE v_descripcion_equipo_generado varchar(255) DEFAULT NULL; 

    -- Selecciona una descripción aleatoria de equipo
    SET v_descripcion_equipo_generado = ELT(fn_RM_numero_aleatorio_rangos(1, 15),
        "Pesas para entrenamiento de fuerza, ideales para desarrollo muscular.",
        "Máquina de correr para ejercicios cardiovasculares y mejora de resistencia.",
        "Bicicleta estática para entrenamientos de bajo impacto y quema de calorías.",
        "Máquina de remo que proporciona un entrenamiento completo del cuerpo.",
        "Máquina elíptica que combina movimientos de caminar y correr, reduciendo el impacto.",
        "Banco de pesas ajustable para ejercicios de fuerza y tonificación.",
        "Máquina de curl de piernas para fortalecer los músculos de la parte posterior de las piernas.",
        "Máquina de prensa de piernas para trabajar los músculos de las piernas y glúteos.",
        "Máquina de abdominales para ejercicios focalizados en el fortalecimiento del core.",
        "Máquina de pecho para trabajar los músculos del pecho y tríceps.",
        "Máquina de espalda para fortalecer los músculos de la espalda y mejorar la postura.",
        "Rueda de ejercicio para trabajar la fuerza del core y la estabilidad.",
        "Bicicleta de spinning para entrenamientos intensos y quema de calorías.",
        "Kettlebell para ejercicios funcionales y de fuerza, ideal para entrenamiento de cuerpo completo.",
        "TRX para entrenamiento en suspensión que mejora la fuerza y flexibilidad.");

    -- Retorna la descripción del equipo generado
    RETURN v_descripcion_equipo_generado;
END



-- ----------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_costo_equipos`() RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN 
    DECLARE v_costo_equipo DECIMAL(10,2);
    DECLARE v_min_costo DECIMAL(10,2) DEFAULT 50.00;  -- Costo mínimo
    DECLARE v_max_costo DECIMAL(10,2) DEFAULT 2000.00;  -- Costo máximo

    -- Genera un costo aleatorio en el rango definido
    SET v_costo_equipo = ROUND((RAND() * (v_max_costo - v_min_costo) + v_min_costo), 2);

    -- Retorna el costo generado
    RETURN v_costo_equipo;
END

-- ----------------------------------------------------------------------





CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_nombre_responsable_mantenimiento`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
    DECLARE v_nombre_responsable_generado varchar(100) DEFAULT NULL; 

    -- Selecciona un nombre aleatorio de equipo
    SET v_nombre_responsable_generado = ELT(fn_RM_numero_aleatorio_rangos(1, 5),
        "Supervisor",
        "Gerente",
        "Encargado",
        "Empleado",
        "Cliente");

    -- Retorna el nombre del equipo generado
    RETURN v_nombre_responsable_generado;
END






-- ----------------------------------------------------------------------



CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_area_equipamientos`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_nombre_area_equipamiento_generado varchar(60) default null; 
	SET v_nombre_area_equipamiento_generado = ELT (fn_RM_numero_aleatorio_rangos(1,10),
	  "Cardio",
    "Pesas",
    "Estiramiento",
    "CrossFit",
    "Yoga",
    "Boxeo",
    "Pilates",
    "Zumba",
    "Spinning",
    "Funcional");
return v_nombre_area_equipamiento_generado;
RETURN 1;
END





-- ----------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_nombres_equipamientos`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_nombre_equipamientos_generado varchar(60) default null; 
	SET v_nombre_equipamientos_generado = ELT (fn_RM_numero_aleatorio_rangos(1,15),
	 "Cinta de Correr",
    "Bicicleta Estática",
    "Elíptica",
    "Máquina de Remo",
    "Máquina de Pesas",
    "Máquina de Press de Piernas",
    "Máquina de Pecho",
    "Máquina de Abdominales",
    "Banco de Pesas",
    "Multigimnasio",
    "Escaladora",
    "Máquina de Prensa de Piernas",
    "Máquina de Press de Hombros",
    "Máquina de Poleas",
    "Set de Mancuernas");
return v_nombre_equipamientos_generado;
RETURN 1;
END





-- ----------------------------------------------------------------------





CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_nombre_marca_equipamiento`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_nombre_marcas_equipamiento_generado varchar(60) default null; 
	SET v_nombre_marcas_equipamiento_generado = ELT (fn_RM_numero_aleatorio_rangos(1,15),
 "FitnessCorp",
    "GymMaster",
    "PowerFit",
    "ProGym",
    "StrongTech",
    "BodyBuilder",
    "IronWorks",
    "MaxForce",
    "EnduroFit",
    "TitaniumStrength",
    "FitEquip",
    "ProFit",
    "SteelFlex",
    "MuscleMakers",
    "PerformancePlus");
return v_nombre_marcas_equipamiento_generado;
RETURN 1;
END


-- ----------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_numero_aleatorio_1a15`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN FLOOR(1 + (RAND() * (16-1)));
END