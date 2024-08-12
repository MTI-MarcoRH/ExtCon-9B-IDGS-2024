-- Elaborado por: Luz Adriana Reyes González
-- Grado y Grupo: 9°B
-- Programa Educativo: Ingenieria de Desarrollo de Software.
-- Fecha elaboracion: 11 de Julio del 2024.

-- -- Funciones de Tablas productos---------

-- ---- Nombre-------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_producto`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Tapete', 
               'Mancuernas', 
               'Proteína', 
               'Toallas', 
               'Ropa deportiva');
END

-- ----------- Marca--------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_marca_producto`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'FitForge', 
               'PowerPulse', 
               'EnduraFit', 
               'RevampFit', 
               'MaxMotion');
END

-- ------Descripcion--------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_descripcion_productos`() RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Producto para mejorar el entrenamiento', 
               'Ropa de algodon cómoda ideal para el entrenamiento .', 
               'Tapetes ideales para entrenar', 
               'Toallas de microfibra para mayor absorción' 
               'Aparatos de la mejor calidad a buen precio.');
END

-- ---------Presentacion-----------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_presentacion_producto`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 5), 
               'Grande', 
               'Paquete de 6', 
               'Mediana', 
               'Por kg', 
               'Conjunto');
END


----- ----Precio actual---------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_precio`() RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 4), 
               '1000 MXN', 
               '500 MXN', 
               '250 MXN',
               '400 MXN');
END

---------Estatus---------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estatus`() RETURNS bit(1)
    DETERMINISTIC
BEGIN
    RETURN ELT(fn_numero_aleatorio_rangos(1, 2), b'0', b'1');
END



--------Generar aleatorio-------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(p_min INT, p_max INT) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(p_min + (RAND() * (p_max - p_min + 1)));
END