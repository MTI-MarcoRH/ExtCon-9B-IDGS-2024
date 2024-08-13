CREATE DEFINER=`valencia`@`%` TRIGGER `tbc_sucursales_AFTER_INSERT` AFTER INSERT ON `tbc_sucursales` FOR EACH ROW BEGIN
 DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT new.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), 
        "Create", 
        "tbc_sucursales", -- Tabla
        CONCAT_WS(" ", "Se ha insertado un nueva sucursal con los siguientes datos", -- Desde aquí
        "Nombre: ", new.nombre,
        "Direccion: ", new.direccion,
        "Responsable_ID: ", new.responsable_id,
        "Total Clientes Atendidos: ", new.total_clientes_atendidos,
        "Promedio_Clientes_X_Dia: ", new.promedio_clientes_x_dia,
        "Capacidad Maxima: ", new.capacidad_maxima,
		"Total Empleados: ", new.total_empleados,
        "Horario_Disponibilidad: ", new.horario_disponibilidad,
        "Estatus: ", v_estatus,
        "Fecha Registro: ", new.fecha_registro,
        "Fecha Actualización: ", new.fecha_actualizacion), 
        DEFAULT, 
        default
    );

END

-- --------------------------------------------------------------------------



CREATE DEFINER=`valencia`@`%` TRIGGER `tbc_sucursales_BEFORE_UPDATE` BEFORE UPDATE ON `tbc_sucursales` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END




-- --------------------------------------------------------------------------


CREATE DEFINER=`valencia`@`%` TRIGGER `tbc_sucursales_AFTER_UPDATE` AFTER UPDATE ON `tbc_sucursales` FOR EACH ROW BEGIN
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
'tbc_sucursales', -- Tabla
CONCAT_WS(' ','Se ha modificado sucursales prestado con los siguientes datos:', -- Desde Aquí
		"Nombre: ", old.nombre, ' a pasado a: ', new.nombre, ' - ',
        "Direccion: ", old.direccion, ' a pasado a: ', new.direccion,' - ' ,
        "Responsable_ID: ", old.responsable_id, ' a pasado a: ', new.responsable_id, ' - ' ,
        "Total Clientes Atendidos: ", old.total_clientes_atendidos, ' a pasado a: ', new.total_clientes_atendidos,
        "Promedio_Clientes_X_Dia: ", old.promedio_clientes_x_dia, ' a pasado a: ', new.promedio_clientes_x_dia,
        "Capacidad Maxima: ", old.capacidad_maxima, ' a pasado a: ', new.capacidad_maxima,
		"Total Empleados: ", old.total_empleados, ' a pasado a: ', new.total_empleados,
        "Horario_Disponibilidad: ", old.horario_disponibilidad, ' a pasado a: ', new.horario_disponibilidad,
        "Estatus: ", v_estatus_new,
        'Fecha actualización: ', old.fecha_actualizacion,' a pasado a: ',new.fecha_actualizacion,' - '), --   Hasta Aquí -> Descripción
DEFAULT, -- Fecha Registro
default -- Estatus
);

END


-- --------------------------------------------------------------------------


CREATE DEFINER=`valencia`@`%` TRIGGER `tbc_sucursales_AFTER_DELETE` AFTER DELETE ON `tbc_sucursales` FOR EACH ROW BEGIN


DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';

IF not OLD.estatus then 
set v_estatus = 'Inactiva';
END IF;

INSERT INTO tbi_bitacora VALUES(
default, -- ID 
current_user(), -- Usuario
'Delete', -- Operación 
'tbc_sucursales', -- Tabla
CONCAT_WS(" ", "Se ha eliminado sucursal con los siguientes dato: ",' - ', -- Desde Aquí
		"Nombre: ", old.nombre, 
        "Direccion: ", old.direccion, 
        "Responsable_ID: ", old.responsable_id, 
        "Total Clientes Atendidos: ", old.total_clientes_atendidos, 
        "Promedio_Clientes_X_Dia: ", old.promedio_clientes_x_dia, 
        "Capacidad Maxima: ", old.capacidad_maxima,
		"Total Empleados: ", old.total_empleados,
        "Horario_Disponibilidad: ", old.horario_disponibilidad,
        "Estatus: ", v_estatus,
        'Fecha actualización: ', old.fecha_actualizacion),
default, -- Fecha Registro
b'0' -- Estatus
);

END

















-- --------------------------------------------------------------------------
CREATE DEFINER=`valencia`@`%` TRIGGER `tbb_instalaciones_AFTER_INSERT` AFTER INSERT ON `tbb_instalaciones` FOR EACH ROW BEGIN
 DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';
    
    IF NOT new.estatus = b'1' THEN
        SET v_estatus = 'Inactivo';
    END IF;
    
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT, -- ID
        current_user(), -- Usuario
        "Create", -- Operación
        "tbb_instalaciones", -- Tabla
        CONCAT_WS(" ", "Se ha insertado un nueva instalacion con los siguientes datos", -- Desde aquí
        "Servicio: ", new.servicio,
        "Descripcion: ", new.descripcion,
        "Tipo: ", new.tipo,
        "Observaciones: ", new.observaciones,
        "Calificacion: ", new.calificacion,
		"Estatus: ", v_estatus,
        "ID_Sucursal: ", new.id_sucursal,
		"Horario_Disponibilidad: ", new.horario_disponibilidad,
		"Fecha Registro: ", new.fecha_registro,
        "Fecha Actualización: ", new.fecha_actualizacion), -- Hasta aquí -> Descripción 
        DEFAULT, -- Fecha registro 
        default -- Estatus
    );

END


-- --------------------------------------------------------------------------
CREATE DEFINER=`valencia`@`%` TRIGGER `tbb_instalaciones_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_instalaciones` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END



-- --------------------------------------------------------------------------

CREATE DEFINER=`valencia`@`%` TRIGGER `tbb_instalaciones_AFTER_UPDATE` AFTER UPDATE ON `tbb_instalaciones` FOR EACH ROW BEGIN
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
'tbb_instalaciones', -- Tabla
CONCAT_WS(' ','Se ha modificado instalacion prestado con los siguientes datos:', -- Desde Aquí
         "Servicio: ", old.servicio, ' a pasado a: ',new.servicio,
        "Descripcion: ",old.descripcion, ' a pasado a: ', new.descripcion,
        "Tipo: ",old.tipo, ' a pasado a: ', new.tipo,
        "Observaciones: ",old.observaciones, ' a pasado a: ', new.observaciones,
        "Calificacion: ", old.calificacion, ' a pasado a: ',new.calificacion,
		"Estatus: ", v_estatus_new,
        "ID_Sucursal: ",old.id_sucursal, ' a pasado a: ', new.id_sucursal,
		"Horario_Disponibilidad: ", old.horario_disponibilidad, ' a pasado a: ',new.horario_disponibilidad,
        "Fecha Actualización: ", old.fecha_actualizacion, ' a pasado a: ',new.fecha_actualizacion), --   Hasta Aquí -> Descripción
DEFAULT, -- Fecha Registro
default -- Estatus
);

END



-- --------------------------------------------------------------------------
CREATE DEFINER=`valencia`@`%` TRIGGER `tbb_instalaciones_AFTER_DELETE` AFTER DELETE ON `tbb_instalaciones` FOR EACH ROW BEGIN


DECLARE v_estatus VARCHAR(20) DEFAULT 'Activo';

IF not OLD.estatus then 
set v_estatus = 'Inactiva';
END IF;

INSERT INTO tbi_bitacora VALUES(
default, -- ID 
current_user(), -- Usuario
'Delete', -- Operación 
'tbb_instalaciones', -- Tabla
CONCAT_WS(" ", "Se ha eliminado instalacion con los siguientes dato: ",' - ', -- Desde Aquí
		  "Servicio: ", old.servicio, 
        "Descripcion: ",old.descripcion, 
        "Tipo: ",old.tipo, 
        "Observaciones: ",old.observaciones,
        "Calificacion: ", old.calificacion,
		"Estatus: ", v_estatus,
        "ID_Sucursal: ",old.id_sucursal,
		"Horario_Disponibilidad: ", old.horario_disponibilidad, 
        "Fecha Actualización: ", old.fecha_actualizacion), --   Hasta Aquí -> Descripción
default, -- Fecha Registro
b'0' -- Estatus
);

END