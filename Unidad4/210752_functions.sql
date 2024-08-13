-- ELABORADO POR: Amisadai Fernandez Reyes
-- GRADO Y GRUPO: 9B
-- PROGRAMA EDUCATIVO: Ingeniería en desarrollo y gestion de software
-- TABLA tbc_puestos


-- Genera descripción de puesto
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_decripcion_puesto`(v_nombre_puesto VARCHAR(50)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_descripcion TEXT;
    
    SET v_descripcion = 
		CASE v_nombre_puesto
			WHEN "Gerente" THEN "Empleado responsable de la Sucursal del Gimnasio."
            WHEN "Entrenador" THEN "Empleado responsable de acompañar al cliente en sus programas saludables"
            WHEN "Nutriologo" THEN "Empleado responsable en dietas y seguimiento alimienticio de los clientes"
            WHEN "Recepcionista" THEN "Empleado responsable de la atención a los clientes del gimnasio,registros de entradas y salidas "
            WHEN "Técnico de Mantenimiento" THEN "Empleado responsable de mantener en funcionamiento el equipamiento de la sucursal."
            WHEN "Instructor" THEN "Especialista en Ejercicios y/o Disciplinas Deportivas"
            ELSE "El puesto no existe"
		END;
RETURN v_descripcion;
END


-- Genera nombre de Puesto
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_puesto`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_nombre VARCHAR(50);
    
    SET v_nombre = ELT(fn_numero_aleatorio(1,6),"Gerente", "Entrenador", "Nutriologo ", "Recepcionista", "Técnico de Mantenimiento","Instructor");
RETURN v_nombre;
END

-- Genera salario
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_salario`(v_nombre_puesto VARCHAR(50)) RETURNS decimal(7,2)
    DETERMINISTIC
BEGIN
    DECLARE v_salario DECIMAL(7,2);
    
    SET v_salario = 
        CASE v_nombre_puesto
            WHEN "Gerente" THEN 20000.00
            WHEN "Entrenador" THEN 12500.00
            WHEN "Nutriologo" THEN 16400.00
            WHEN "Recepcionista" THEN 6300.00
            WHEN "Técnico de Mantenimiento" THEN 10500.00
            WHEN "Instructor" THEN 8500.00
            ELSE 0.00
        END;
RETURN v_salario;
END


-- Genera requisitos

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_requisitos_generado`(v_nombre_puesto VARCHAR(50)) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_requisitos TEXT;
    
    SET v_requisitos = 
        CASE v_nombre_puesto
            WHEN "Gerente" THEN "Carrera Universitaria, Habilidades Informática y Trabajo en Equipo."
            WHEN "Entrenador" THEN "Experiencia en Couching, Desempeño Físico y Primeros Auxilios"
            WHEN "Nutriologo" THEN "Carrera Profesional en Medición o Nutrición."
            WHEN "Recepcionista" THEN "Bachillerato, Habilidades Informáticas."
            WHEN "Técnico de Mantenimiento" THEN "Bachillerato, Mecánica y Electrónica básica."
            WHEN "Instructor" THEN "Bachillerato, Certificaciones"
            ELSE "El puesto no existe"
        END;
RETURN v_requisitos;
END






