CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_equipamiento_AFTER_INSERT` AFTER INSERT ON `tbb_equipamientos` FOR EACH ROW BEGIN
 DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT new.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), -- Usuario
        'Create', -- Operación
        'tbb_equipamientos', -- Tabla
        CONCAT_WS(' ', 'Se ha insertado un nuevo equipamiento con los siguientes datos:', -- Desde aquí
            'Área: ', new.Area,
            'Nombre: ', new.Nombre,
            'Marca: ', new.Marca,
            'Modelo: ', new.Modelo,
            'Fotografía: ', new.Fotografia,
            'Estatus: ', v_estatus,
            'Total Existencias: ', new.Total_Existencias,
            'Fecha Registro: ', new.Fecha_Registro,
            'Fecha Actualización: ', new.Fecha_Actualizacion
        ), -- Hasta aquí -> Descripción
        DEFAULT, -- Fecha Registro
        DEFAULT -- Estatus
    );

END
-- --------------------------------------------------



CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_equipamientos_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_equipamientos` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END


-- --------------------------------------------------



CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_equipamientos_AFTER_UPDATE` AFTER UPDATE ON `tbb_equipamientos` FOR EACH ROW BEGIN
DECLARE v_estatus_old VARCHAR(20) DEFAULT 'Activo';
DECLARE v_estatus_new VARCHAR(20) DEFAULT 'Activo';

-- Validaciones para las etiquetas del estatus

IF NOT old.estatus THEN
SET v_estatus_old = 'Inactivo';
END IF;

IF NOT new.estatus THEN
SET v_estatus_new = 'Inactivo';
END IF;

INSERT INTO tbi_bitacora VALUES(
DEFAULT, -- ID
    current_user(), -- Usuario
    'Update', -- Operación 
    'tbb_equipamientos', -- Tabla
    CONCAT_WS(' ', 'Se ha modificado un equipamiento con los siguientes datos:', -- Desde aquí
        'Área: ', old.Area, ' a pasado a: ', new.Area,
        'Nombre: ', old.Nombre, ' a pasado a: ', new.Nombre,
        'Marca: ', old.Marca, ' a pasado a: ', new.Marca,
        'Modelo: ', old.Modelo, ' a pasado a: ', new.Modelo,
        'Fotografía: ', old.Fotografia, ' a pasado a: ', new.Fotografia,
        'Estatus: ', v_estatus_new,
        'Total Existencias: ', old.Total_Existencias, ' a pasado a: ', new.Total_Existencias,
        'Fecha Actualización: ', old.Fecha_Actualizacion, ' a pasado a: ', new.Fecha_Actualizacion
    ), -- Hasta aquí -> Descripción
    DEFAULT, -- Fecha Registro
    default -- Estatus
);

END

-- --------------------------------------------------

CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_equipamiento_AFTER_DELETE` AFTER DELETE ON `tbb_equipamientos` FOR EACH ROW BEGIN


DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';

IF not OLD.estatus then 
set v_estatus = 'Inactiva';
END IF;

INSERT INTO tbi_bitacora VALUES(
default, -- ID 
current_user(), -- Usuario
'Delete', -- Operación 
'tbb_equipamientos', -- Tabla
CONCAT_WS(" ", "Se ha eliminado equipamiento con los siguientes dato: ",' - ', -- Desde Aquí
		   'Área: ', old.Area, 
        'Nombre: ', old.Nombre, 
        'Marca: ', old.Marca,
        'Modelo: ', old.Modelo,
        'Fotografía: ', old.Fotografia, 
        'Estatus: ', v_estatus,
        'Total Existencias: ', old.Total_Existencias, 
        'Fecha Actualización: ', old.Fecha_Actualizacion
    ), -- Hasta aquí -> Descripción
b'0' -- Estatus
);

END












-- --------------------------------------------------

CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_mantenimientos_AFTER_INSERT` AFTER INSERT ON `tbb_mantenimientos` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not NEW.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	-- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        current_user(),
        "Create",
        "tbb_mantenimientos",
        CONCAT_WS(" ","Se ha insertado un nuevo equipo ",
        "EQUIPO = ", new.Equipo,
        "DESCRIPCION = ", NEW.Descripcion, 
        "COSTO = ", NEW.Costo, 
        "RESPONSABLE = ", NEW.Responsable,
        "ESTATUS = ", v_estatus,
		"FECHA MANTENIMIENTO = ", new.fecha_mantenimiento
		
		
		
        ),
        DEFAULT,
		DEFAULT  
    );
END


-- --------------------------------------------------
CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_mantenimientos_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_mantenimientos` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END



-- --------------------------------------------------



CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_mantenimientos_AFTER_UPDATE` AFTER UPDATE ON `tbb_mantenimientos` FOR EACH ROW BEGIN
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
		DEFAULT,
        current_user(),
		'Update' ,
		'tbb_mantenimientos',
		concat_ws(" ","Se ha modificado un equipo",
        "EQUIPO = ", old.Equipo, ' - ', new.Equipo,
        " DESCRIPCION =", old.Descripcion, ' - ', new.Descripcion,
          "COSTO = ", old.Costo, ' - ', NEW.Costo, 
        " RESPONSABLE =", old.Responsable, ' - ', new.Responsable,
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
	DEFAULT,
	DEFAULT );
END






-- --------------------------------------------------

CREATE DEFINER=`zahid`@`%` TRIGGER `tbb_mantenimientos_AFTER_DELETE` AFTER DELETE ON `tbb_mantenimientos` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if  not old.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		"tbb_mantenimientos",
        CONCAT_WS(" ","Se ha eliminado un equipo: ",
        "EQUIPO = ", old.Equipo,
		"DESCRIPCION = ", old.Descripcion, 
        "COSTO = ", old.Costo,
        "RESPONSABLE = ", old.Responsable,
        "ESTATUS = ", v_estatus),
        DEFAULT,
		DEFAULT   );

END