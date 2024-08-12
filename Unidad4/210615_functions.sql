--Elaborado por: Marco Antonio Morales Rivera
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.

-- Funciones utilizadas para problación dinamica de rutinas y ejercicios-rutinas
CREATE DEFINER=`morales`@`%` FUNCTION `fn_genera_estatus_programa`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_estatus_generado varchar(100) default null; 
    SET v_estatus_generado = ELT (fn_numero_aleatorio_rangos(1,9),
    'Registrado','Sugerido','Aprobado por el Médico','Aprobado por el Usuario','Rechazado por el Médico',
    'Rechazado por el Usuario','Terminado','Suspendido','Cancelado');
    RETURN v_estatus_generado;
END;


CREATE DEFINER=`morales`@`%` FUNCTION `fn_genera_fecha_registro`() RETURNS datetime
    DETERMINISTIC
BEGIN
	DECLARE fecha_inicio DATETIME;
    DECLARE fecha_fin DATETIME;
    DECLARE fecha_aleatoria DATETIME;
    -- Establecer las fechas de inicio y fin del intervalo
    SET fecha_inicio = '2022-01-01 00:00:00';
    SET fecha_fin = '2023-12-31 23:59:59';
    -- Generar un número aleatorio entre 0 y 1 para calcular una fecha en el intervalo
    SET fecha_aleatoria = DATE_ADD(fecha_inicio, INTERVAL FLOOR(RAND() * (DATEDIFF(fecha_fin, fecha_inicio) + 1)) SECOND);
    RETURN fecha_aleatoria;
RETURN 1;
END

CREATE DEFINER=`morales`@`%` FUNCTION `fn_genera_nombre_programa`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_nombre_generado varchar(100) default null; 
	SET v_nombre_generado = ELT (fn_numero_aleatorio_rangos(1,20),
"Programa de Alimentación Balanceada", 
"Programa de Alimentación Vegetariana", 
"Programa de Alimentación Mediterránea", 
"Programa de Control Calórico", 
"Programa de Optimización de Fibra", 
"Programa de Enriquecimiento de Proteína", 
"Programa Libre de Gluten", 
"Programa de Control de Hipertensión (DASH)", 
"Programa de Reducción de Colesterol", 
"Programa de Reducción de Grasas"
);
RETURN v_nombre_generado;
RETURN 1;
END

/*CREATE DEFINER=`morales`@`%` FUNCTION `fn_genera_observaciones_programa`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_observacion_generado varchar(100) default null; 
	SET v_observacion_generado = ELT (fn_numero_aleatorio_rangos(1,20),
"Sigue las pautas e instrucciones del instructor para mantener una postura adecuada y obtener el máximo beneficio de tu programa saludable."
"Realiza cada actividad con control para asegurar un impacto positivo en tu salud."
"Gestiona tu respiración para mejorar los efectos de cada práctica de bienestar."
"Adapta la intensidad de las actividades a tu nivel para fomentar una mejora gradual y segura de la salud."
"Completa cada parte del programa con atención plena para optimizar tu bienestar general."
"Inicia cada sesión con un calentamiento adecuado para preparar tu cuerpo y mente."
"Concéntrate en cada movimiento para promover una mejor salud física y mental."
"Mantén la estabilidad en cada actividad para proteger tu bienestar general."
"Incrementa gradualmente la intensidad para mejorar tu salud de manera sostenible."
"Concluye cada sesión con técnicas de relajación para fomentar la recuperación y el bienestar."
"Realiza movimientos seguros para cuidar tus articulaciones y promover un envejecimiento saludable."
"Mantén una hidratación adecuada durante todo el programa para maximizar los beneficios para la salud."
"Respeta los tiempos de descanso entre actividades para permitir la recuperación y mejorar la salud."
"Prioriza técnicas adecuadas en cada actividad para promover la salud a largo plazo."
"Varía las actividades del programa para evitar el estancamiento y mantener una salud óptima."
"Asegúrate de trabajar todas las áreas de tu bienestar para un equilibrio saludable."
"Escucha a tu cuerpo y ajusta el programa si sientes molestias, para mantener un enfoque saludable."
"Busca apoyo y orientación en actividades para mejorar tu bienestar general."
"Personaliza el programa saludable según tus necesidades y capacidades físicas."
"Lleva un registro de tu progreso para evaluar y ajustar el programa de salud según tus objetivos.");
RETURN v_observacion_generado;
RETURN 1;
END*/

CREATE DEFINER=`morales`@`%` FUNCTION `fn_genera_porcentaje_avance_programa`() RETURNS decimal(5,2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_porcentaje_avance_generado decimal(5,2) default null; 
    SET v_porcentaje_avance_generado = ELT(fn_numero_aleatorio_rangos(1,20),
        5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100);
    RETURN v_porcentaje_avance_generado;
END;


CREATE DEFINER=`morales`@`%` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END

CREATE DEFINER=`morales`@`%` FUNCTION `fn_obtener_tiempo`() RETURNS time
    DETERMINISTIC
BEGIN
    DECLARE minutos_aleatorios INT;
    SET minutos_aleatorios = FLOOR(20 + (RAND() * (40 - 20 + 1)));
    RETURN ADDTIME('00:00:00', CONCAT('00:', minutos_aleatorios, ':00'));
END