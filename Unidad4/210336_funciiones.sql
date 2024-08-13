CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_nombre_sucursales`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_nombre_sucursal_generado varchar(60) default null; 
	SET v_nombre_sucursal_generado = ELT (fn_RM_numero_aleatorio_rangos(1,14),
	"Xicotepec",
    "Huauchinango", 
    "Zihuateutla", 
    "Jalpan", 
    "Tlacuilotepec",
	"Pahuatlán",
    "Venustiano Carranza",
    "Tulancingo", 
    "Necaxa",
    "Tenango",
    "Francisco Z. Mena",
    "Cuacuila",
    "Villa Ávila Camacho", 
    "Juan Galindo");
return v_nombre_sucursal_generado;
RETURN 1;
END








-- --------------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_direccion_sucursales`() RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_direccion_sucursal_generado varchar(60) default null; 
	SET v_direccion_sucursal_generado = ELT (fn_RM_numero_aleatorio_rangos(1,15),
	"Avenida Reforma #120","Calle 5 de Mayo #45", "Boulevard Hidalgo #980", "Calle Juárez #210"," Avenida Insurgentes #550",
	"Calle Independencia #89","Calle Morelos #305", "Avenida Revolución #670", "Calle Zaragoza #150","Boulevard Benito Juárez #412",
	"Calle Madero #330","Avenida Constitución #88", "Calle 16 de Septiembre #100", "Avenida Universidad #430", "Calle López Mateos #240");
return v_direccion_sucursal_generado;
RETURN 1;
END


-- --------------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_numero_aleatorio_1a15`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN FLOOR(1 + (RAND() * (16-1)));
END


-- --------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_horario_disponibilidad_sucursales`() RETURNS varchar(150) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_horario_sucursal_generado varchar(150) default null; 
	SET v_horario_sucursal_generado = ELT (fn_RM_numero_aleatorio_rangos(1,15),
	"Lunes a Viernes: 06:00 a 22:00, Sábados y Domingos: 07:00 a 20:00",
    "Lunes a Viernes: 07:00 a 21:00, Sábados y Domingos: 08:00 a 19:00", 
    "Lunes a Viernes: 08:00 a 20:00, Sábados y Domingos: 09:00 a 18:00", 
    "Lunes a Viernes: 05:00 a 23:00, Sábados y Domingos: 06:00 a 22:00",
    "Lunes a Viernes: 06:30 a 21:30, Sábados y Domingos: 07:30 a 19:30",
	"Lunes a Viernes: 07:30 a 22:00, Sábados y Domingos: 08:30 a 20:00",
    "Lunes a Viernes: 06:00 a 20:00, Sábados y Domingos: 07:00 a 19:00", 
    "Lunes a Viernes: 05:30 a 21:30, Sábados y Domingos: 06:30 a 20:30", 
    "Lunes a Viernes: 08:00 a 22:00, Sábados y Domingos: 09:00 a 21:00",
    "Lunes a Viernes: 07:00 a 23:00, Sábados y Domingos: 08:00 a 22:00",
	"Lunes a Viernes: 06:00 a 21:00, Sábados y Domingos: cerrrado",
    "Lunes a Viernes: 07:00 a 22:00, Sábados y Domingos: 08:00 a 21:00",
    "Lunes a Viernes: 05:00 a 20:00, Sábados y Domingos: 06:00 a 19:00", 
    "Lunes a Viernes: 06:00 a 22:30, Sábados y Domingos: 07:00 a 21:30", 
    "Lunes a Viernes: 07:30 a 21:00, Sábados y Domingos: 08:30 a 20:00");
return v_horario_sucursal_generado;
RETURN 1;
END







-- --------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_servicio_instalaciones`() RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_servicio_instalaciones_generado varchar(200) DEFAULT NULL; 
	SET v_servicio_instalaciones_generado = ELT(fn_RM_numero_aleatorio_rangos(1,6),
    "Clases de Yoga",
    "Entrenamiento Personalizado",
    "Spa y Masajes",
    "Clases de Zumba",
    "Clases de Spinning",
    "Clases de Natación");

    RETURN v_servicio_instalaciones_generado;
END


-- --------------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_descripcion_instalaciones`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_instalaciones_descripcion_generada text DEFAULT NULL; 
	SET v_instalaciones_descripcion_generada = ELT(fn_RM_numero_aleatorio_rangos(1,6),
    "Un espacio amplio y bien equipado para practicar yoga.",
    "Entrenamiento personalizado con instructores certificados.",
    "Servicio de spa completo con masajes relajantes.",
    "Clases de zumba para todos los niveles.",
    "Entrenamiento de spinning con bicicletas de última generación.",
    "Piscina climatizada para clases de natación.");

    RETURN v_instalaciones_descripcion_generada;
END




-- --------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_tipo_instalaciones`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_tipo_instalacion_generado varchar(50) DEFAULT NULL; 
	SET v_tipo_instalacion_generado = ELT(fn_RM_numero_aleatorio_rangos(1,4),
    "Clase",
    "Área Común",
    "Sala de Entrenamiento",
    "Área de Relajación");

    RETURN v_tipo_instalacion_generado;
END





-- --------------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_observaciones_instalaciones`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_observaciones_instalaciones_generadas text DEFAULT NULL; 
	SET v_observaciones_instalaciones_generadas = ELT(fn_RM_numero_aleatorio_rangos(1,6),
    "Espacio bien iluminado y ventilado.",
    "Cuenta con equipo moderno y en buen estado.",
    "Acceso limitado a socios premium.",
    "Se recomienda reservar con antelación.",
    "Disponible solo en horarios específicos.",
    "Incluye uso de toallas y agua embotellada.");

    RETURN v_observaciones_instalaciones_generadas;
END




-- --------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_calificacion_instalaciones`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_calificacion_instalacion_generada varchar(50) DEFAULT NULL; 
	SET v_calificacion_instalacion_generada = ELT(fn_RM_numero_aleatorio_rangos(1,4),
    "Exelente servicio",
    "Buen servicio",
    "Servicio Regular",
    "Puede mejorar el servicio");

    RETURN v_calificacion_instalacion_generada;
END



-- --------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_numero_aleatorio_1a15`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN FLOOR(1 + (RAND() * (16-1)));
END



-- --------------------------------------------------------------------------


CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_horario_disponibilidad_instalacion`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE v_horario_instalacion_generado text DEFAULT NULL; 
	SET v_horario_instalacion_generado = ELT(fn_RM_numero_aleatorio_rangos(1,5),
    "Lunes a Viernes: 6 AM - 10 PM",
    "Sábados y Domingos: 8 AM - 8 PM",
    "Lunes a Viernes: 7 AM - 9 PM",
    "Sábados: 8 AM - 6 PM, Domingos: Cerrado",
    "Todos los días: 5 AM - 11 PM");

    RETURN v_horario_instalacion_generado;
END