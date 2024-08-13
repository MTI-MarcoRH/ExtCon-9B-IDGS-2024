CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_area_adeudo`() RETURNS varchar(90) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_area_adeudo varchar(100) DEFAULT NULL; 

    -- Selecciona un nombre aleatorio de equipo
    SET v_nombre_area_adeudo = ELT(fn_RM_numero_aleatorio_rangos(1, 5),
        'Área de Entrenamiento',
        'Área de Cardio',
        'Área de Pesas',
        'Área de Estiramiento',
        'Área de Funcional');
  -- Retorna el nombre del equipo generado
    RETURN v_nombre_area_adeudo;
END






-- -------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_numero_aleatorio_1a15`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN FLOOR(1 + (RAND() * (16-1)));
END



-- ----------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_descripcion_adeudo`() RETURNS varchar(90) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_descripcion_adeudo varchar(100) DEFAULT NULL; 

    -- Selecciona un nombre aleatorio de equipo
    SET v_nombre_descripcion_adeudo = ELT(fn_RM_numero_aleatorio_rangos(1, 5),
       'Maltrato de equipo',
        'Pérdida de equipo',
        'Descomposición de equipo',
        'Robo de equipo',
        'Falta de mantenimiento');
  -- Retorna el nombre del equipo generado
    RETURN v_nombre_descripcion_adeudo;
END


-- --------------------------------------------------------------------

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_RM_tipo_adeudo`() RETURNS varchar(90) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_tipo_adeudo varchar(100) DEFAULT NULL; 

    -- Selecciona un nombre aleatorio de equipo
    SET v_tipo_adeudo = ELT(fn_RM_numero_aleatorio_rangos(1,3),
        'Producto',
        'Equipamiento',
        'Servicio');
  -- Retorna el nombre del equipo generado
    RETURN v_tipo_adeudo;
END