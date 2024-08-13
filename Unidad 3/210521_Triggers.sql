----- AFTER INSERT ------------

CREATE DEFINER=`ame`@`%` TRIGGER `tbb_preguntas_nutricionales_AFTER_INSERT` AFTER INSERT ON `tbb_preguntas_nutricionales` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not NEW.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	-- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbb_preguntas_nutricionales",
        CONCAT_WS(" ","Se ha insertado una nueva pregunta con los siguientes datos: ",
        "PREGUNTA = ", new.Pregunta,
		"TIPO RESPUESTA = ", new.Tipo_Respuesta,
		"DESCRIPCION = ", NEW.Descripcion, 
		"FECHA CREACION = ", NEW.Fecha_Creacion,
		"FECHA ACTUALIZACION = ", NEW.Fecha_Actualizacion, 
        "OPCIONES RESPUESTA = ", NEW.Opciones_Respuesta, 
        "ESTATUS = ", v_estatus),
        DEFAULT,
		DEFAULT  
    );
END

--------- BEFORE UPDATE ------------------------------------------------------
CREATE DEFINER=`ame`@`%` TRIGGER `tbb_preguntas_nutricionales_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_preguntas_nutricionales` FOR EACH ROW BEGIN
set new.Fecha_Actualizacion = current_timestamp();
END

-------------- AFTER UPDATE ---------------
CREATE DEFINER=`ame`@`%` TRIGGER `tbb_preguntas_nutricionales_AFTER_UPDATE` AFTER UPDATE ON `tbb_preguntas_nutricionales` FOR EACH ROW BEGIN
declare v_estatus_old varchar(20) default 'Activo';
    declare v_estatus_new varchar(20) default 'Activo';
    
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not old.estatus then
		set v_estatus_old = "Inactivo";
	end if;
    if not NEW.estatus then
		set v_estatus_new = "Inactivo";
	end if;
    
    insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Update' ,
		'tbb_preguntas_nutricionales',
		concat_ws(" ","Se ha modificado una pregunta existente con los siguientes datos: ",
        "PREGUNTA = ", old.Pregunta, ' - ', new.Pregunta,
        " TIPO RESPUESTA =", old.Tipo_Respuesta, ' - ', new.Tipo_Respuesta,
        " DESCRIPCION =", old.Descripcion, ' - ', new.Descripcion,
        " OPCIONES RESPUESTA =", old.Opciones_Respuesta, ' - ', new.Opciones_Respuesta,
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
	DEFAULT,
	DEFAULT );
END

--------------- AFTER DELETE -----------------
CREATE DEFINER=`ame`@`%` TRIGGER `tbb_preguntas_nutricionales_AFTER_DELETE` AFTER DELETE ON `tbb_preguntas_nutricionales` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if  not old.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		"tbb_preguntas_nutricionales",
        CONCAT_WS(" ","Se ha eliminado una pregunta con los siguientes datos: ",
        "PREGUNTA = ", old.Pregunta,
		"TIPO RESPUESTA = ", old.Tipo_Respuesta,
		"DESCRIPCION = ", old.Descripcion, 
        "OPCIONES RESPUESTA = ", old.Opciones_Respuesta,
        "ESTATUS = ", v_estatus),
        DEFAULT,
		DEFAULT   );
END