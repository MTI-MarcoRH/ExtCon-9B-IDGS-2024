--Elaborado por: Mario Gutierrez Rosales
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.

-- Funciones utilizadas para problación dinamica de rutinas y ejercicios-rutinas
CREATE DEFINER=`marinho`@`%` FUNCTION `fn_genera_estatus_rutina`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_estatus_generado varchar(100) default null; 
	SET v_estatus_generado = ELT (fn_numero_aleatorio_rangos(1,3),
	"Actual", "Suspendida", "Concluido");
RETURN v_estatus_generado;
RETURN 1;
END

CREATE DEFINER=`marinho`@`%` FUNCTION `fn_genera_fecha_registro`() RETURNS datetime
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

CREATE DEFINER=`marinho`@`%` FUNCTION `fn_genera_nombre_rutina`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_nombre_generado varchar(100) default null; 
	SET v_nombre_generado = ELT (fn_numero_aleatorio_rangos(1,20),
	"Desafío de Hierro", "Fuerza Explosiva", "Circuito de Poder", "Definición Extrema", "Cuerpo de Acero",
	"Héroe de Acero", "Resistencia Total", "Carga Máxima", "Metamorfosis Muscular", "Elevación Suprema",
	"Fortaleza Física", "Transformación Fit", "Potencia y Velocidad", "Construcción Corporal", "Máxima Intensidad",
	"Vértigo de Fuerza", "Silueta de Campeón", "Dominio del Hierro", "Revolución Muscular", "Despliegue de Fuerza");
RETURN v_nombre_generado;
RETURN 1;
END

CREATE DEFINER=`marinho`@`%` FUNCTION `fn_genera_observaciones_ejrt`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_observacion_generado varchar(100) default null; 
	SET v_observacion_generado = ELT (fn_numero_aleatorio_rangos(1,20),
	"Mantén la postura correcta durante todo el ejercicio.", "Evita el balanceo o el uso del impulso para levantar el peso.", "Controla la respiración, exhala al levantar y inhala al bajar.", 
    "No sobrecargues el peso más allá de tus capacidades.", "Realiza cada repetición de manera lenta y controlada.", "Asegúrate de calentar adecuadamente antes de comenzar.", 
    "Enfócate en la contracción muscular durante el ejercicio.", "Mantén el core firme para proteger la zona lumbar.", "Aumenta progresivamente el peso para evitar lesiones.", 
    "No olvides estirar después de la rutina para mejorar la flexibilidad.", "Evita bloquear las articulaciones al final de un movimiento.", 
    "Mantén una hidratación adecuada durante el entrenamiento.", "Asegúrate de hacer un descanso adecuado entre series.", "Concéntrate en la técnica más que en la cantidad de peso.",
    "Varía la rutina para evitar estancamientos y mantener el progreso.", "No te olvides de entrenar todos los grupos musculares por igual.", 
    "Escucha a tu cuerpo y detén el ejercicio si sientes dolor agudo.", "Utiliza un compañero de entrenamiento para mayor seguridad en ejercicios pesados.", 
    "Ajusta las máquinas a tu altura y proporciones corporales.", "Mantén un registro de tus progresos para evaluar mejoras.");
RETURN v_observacion_generado;
RETURN 1;
END

CREATE DEFINER=`marinho`@`%` FUNCTION `fn_genera_resultado_rutina`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_resultado_generado varchar(100) default null; 
	SET v_resultado_generado = ELT (fn_numero_aleatorio_rangos(1,20),
	"Aumento de masa muscular", "Pérdida de grasa corporal", "Mejora en la resistencia", "Incremento de la fuerza", "Definición muscular",
	"Mayor flexibilidad", "Reducción del estrés", "Aumento de la energía diaria", "Mejora en la postura", "Incremento del metabolismo",
	"Tono muscular firme", "Aumento de la autoestima", "Mejora de la salud cardiovascular", "Reducción de dolores musculares", "Mejor equilibrio y coordinación",
	"Mayor capacidad pulmonar", "Mejora en la movilidad articular", "Mejor calidad del sueño", "Reducción de la fatiga diaria", "Aumento de la concentración y enfoque");
RETURN v_resultado_generado;
RETURN 1;
END

CREATE DEFINER=`marinho`@`%` FUNCTION `fn_numero_aleatorio_rangos`(v_limite_inferior int, v_limite_superior int) RETURNS int
    DETERMINISTIC
BEGIN	
	declare v_numero_generado INT 
    default floor(Rand()* (v_limite_superior - v_limite_inferior + 1) + v_limite_inferior);
    SET @numero_generado = v_numero_generado;
RETURN v_numero_generado;
END

CREATE DEFINER=`marinho`@`%` FUNCTION `fn_obtener_tiempo`() RETURNS time
    DETERMINISTIC
BEGIN
    DECLARE minutos_aleatorios INT;
    SET minutos_aleatorios = FLOOR(20 + (RAND() * (40 - 20 + 1)));
    RETURN ADDTIME('00:00:00', CONCAT('00:', minutos_aleatorios, ':00'));
END