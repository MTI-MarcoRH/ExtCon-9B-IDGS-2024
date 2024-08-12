--Elaborado por: Suri Jazmin Peña Lira.
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

----Funciones de Tablas ejercicios---------

------Nombre-------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_ejercicio`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Flexiones', 
               'Sentadillas', 
               'Plancha', 
               'Burpees', 
               'Abdominales');
END

--------Descripcion--------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_descripcion_ejercicio`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Ejercicio para fortalecer el corazon.', 
               'Ideal para mejorar la resistencia cardiovascular.', 
               'Ayuda a tonificar los músculos de las piernas.', 
               'Ejercicio de alta intensidad para quemar calorías.', 
               'Perfecto para mejorar la flexibilidad.');
END

-----------Video-----------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_video`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'video1.mp4', 
               'video2.mp4', 
               'video3.mp4', 
               'video4.mp4', 
               'video5.mp4');
END


---------Tipo---------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_tipo`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 4), 
               'Aerobico', 
               'Resistencia', 
               'Flexibilidad',
               'Fuerza');
END

---------Estatus---------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus`() RETURNS bit(1)
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 2), b'0', b'1');
END

--------Dificultad------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_dificultad`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 3), 
               'Basico', 
               'Intermedio', 
               'Avanzado');
END


-------Recomendaciones------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_recomendaciones`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Realiza un calentamiento previo de 10 minutos.', 
               'Mantén una buena hidratación durante el ejercicio.', 
               'Asegúrate de mantener la postura correcta.', 
               'No olvides estirar al final de la sesión.', 
               'Escucha a tu cuerpo y descansa si es necesario.');
END


-------Restricciones--------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_restricciones`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'No realizar este ejercicio si tienes problemas de rodilla.', 
               'Evitar si padeces de problemas cardíacos.', 
               'No recomendado para personas con lesiones de espalda.', 
               'Consulta a tu médico si tienes alguna condición preexistente.', 
               'No realizar si sientes dolor intenso en las articulaciones.');
END


--------Generar aleatorio-------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(p_min INT, p_max INT) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(p_min + (RAND() * (p_max - p_min + 1)));
END


