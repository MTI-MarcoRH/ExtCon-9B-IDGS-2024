--Elaborado por: Jorge Cazarez Cruz
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

--1:Generar Especialidad
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_especialidad_instructor`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Entrenamiento Funcional', 
               'CrossFit', 
               'Yoga', 
               'Pilates', 
               'Entrenamiento de Fuerza');
END;

--Generar Total Años de Experiencia
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_anos_experiencia`() RETURNS int
    DETERMINISTIC
BEGIN
    RETURN fn_numero_aleatorio_rangos(1, 20); 
END;


--Generar Total de Clientes Atendidos
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_total_clientes_atendidos`() RETURNS int unsigned
    DETERMINISTIC
BEGIN
    RETURN fn_numero_aleatorio_rangos(10, 1000); 
END;


--Generar Estatus
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus_instructor`() RETURNS bit(1)
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 2), b'0', b'1');
END;


--Generar Calificación
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_calificacion`() RETURNS int unsigned
    DETERMINISTIC
BEGIN
    RETURN fn_numero_aleatorio_rangos(1, 5); 
END;


--Generar Números Aleatorios en un Rango
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(p_min INT, p_max INT) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(p_min + (RAND() * (p_max - p_min + 1)));
END;

