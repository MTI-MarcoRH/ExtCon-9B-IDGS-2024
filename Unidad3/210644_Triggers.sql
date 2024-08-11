--Elaborado por: Suri Jazmin Peña Lira.
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

-----Triggers Tabla Catalogo : Ejercicis-----

-----After Insert------

CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_ejercicio_AFTER_INSERT` AFTER INSERT ON `tbc_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';

if not new.estatus then
set v_estatus = 'Inactivo';
end if;

insert into tbi_bitacora values
(default,
current_user(),
'Create', 
'tbc_ejercicio',
concat_ws(' ', 'Se ha creado un nuevo ejercicio con los siguientes datos:',
'ID: ', new.id, 
'NOMBRE: ', new.nombre, 
'DESCRIPCION: ',new.descripcion,
'VIDEO: ', new.video, 
'TIPO ', new.tipo, 
'ESTATUS ', new.estatus,
'DIFICULTAD ', new.dificultad,  
'FECHA_REGISTRO: ',new.fecha_registro,
'FECHA_ACTUALIZACION: ', new.fecha_actualizacion,
'RECOMENDACIONES: ', new.recomendaciones,
'RESTRICCIONES: ', new.restricciones,
'ESTATUS: ',v_estatus ), default, default
);
END

-----Before Update-----
CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_ejercicio_BEFORE_UPDATE` BEFORE UPDATE ON `tbc_ejercicios` FOR EACH ROW BEGIN
SET NEW.Fecha_actualizacion = current_timestamp();
END
------After Update-----
CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_ejercicio_AFTER_UPDATE` AFTER UPDATE ON `tbc_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus_old varchar(20) default 'Activo';
declare v_estatus_new varchar(20) default 'Activo';

if not old.estatus then
set v_estatus_old = 'Inactivo';
end if;

if not new.estatus then
set v_estatus_new = 'Inactivo';
end if;


insert into tbi_bitacora values
(default,
current_user(),
'Update', 
'tbb_ejercicio',
concat_ws(' ', 'Se ha editado el ejercicio con los siguientes datos:',
'ID: ', old.id, 
'NOMBRE: ', old.nombre, 
'DESCRIPCION: ',old.descripcion,
'VIDEO: ', old.video, 
'TIPO ', old.tipo, 
'ESTATUS ', old.estatus,
'DIFICULTAD ', old.dificultad,  
'FECHA_REGISTRO: ',old.fecha_registro,
'FECHA_ACTUALIZACION: ', old.fecha_actualizacion,
'RECOMENDACIONES: ', old.recomendaciones,
'RESTRICCIONES: ', old.restricciones,
'ESTATUS: ',v_estatus_old, '-',  v_estatus_new  ), default, default
);
END
------Before Delete------
CREATE DEFINER=`root`@`localhost` TRIGGER `tbc_ejercicio_BEFORE_DELETE` BEFORE DELETE ON `tbc_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';

if NOT OLD.estatus then
set v_estatus = 'Inactivo';
end if;


insert into tbi_bitacora values
(default,
current_user(),
'Delete', 
'tbb_ejercicio',
concat_ws(' ', 'Se ha eliminado el ejercicio con los siguientes datos:',
'ID: ', old.id, 
'NOMBRE: ', old.nombre, 
'DESCRIPCION: ',old.descripcion,
'VIDEO: ', old.video, 
'TIPO ', old.tipo, 
'ESTATUS ', old.estatus,
'DIFICULTAD ', old.dificultad,  
'FECHA_REGISTRO: ',old.fecha_registro,
'FECHA_ACTUALIZACION: ', old.fecha_actualizacion,
'RECOMENDACIONES: ', old.recomendaciones,
'RESTRICCIONES: ', old.restricciones,
'ESTATUS: ',v_estatus ), default, default
);
END




-----Triggers Tabla Derivada : Videos_Ejercicios-----

-----After Insert------
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_videos_ejercicios_AFTER_INSERT` AFTER INSERT ON `tbd_videos_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';
if not new.estatus then
set v_estatus = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Create',
'tbd_videos_ejercicioss',
concat_ws(' ', 'Se han insertado nuevo video en la base de datos:',
'ID: ', new.id, 
' ID EJERCICIO: ', new.ejercicio_id, 
'DESCRIPCIÓN:',new.descripcion,
'DURACION_VIDEO: ', new.duracion_video,
'URL_VIDEO: ', new.url_video,  
'ESTATUS: ',new.estatus,
'ESTATUS: ',v_estatus,
"FECHA REGISTRO:", new.Fecha_Registro, 
"FECHA ACTUALIZACION", new.Fecha_Actualizacion), default, default
);
END
-----Before Update-----

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_videos_ejercicios_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_videos_ejercicios` FOR EACH ROW BEGIN
SET NEW.Fecha_actualizacion = current_timestamp();
END
------After Update-----

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_videos_ejercicios_AFTER_UPDATE` AFTER UPDATE ON `tbd_videos_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus_old varchar(20) default 'Activo';
declare v_estatus_new varchar(20) default 'Activo';
if not old.estatus then
set v_estatus_old = 'Inactivo';
end if;
if not new.estatus then
set v_estatus_new = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Update',
'tbd_videos_ejercicios',
concat_ws(' ', 'Se han editado los detalles de un video de ejercicios:',
'ID: ', old.id, 
'ID EJERCICIO: ', old.ejercicio_id, 
'DESCRIPCIÓN:',old.descripcion,
'DURACION_VIDEO: ', old.duracion_video,
'URL_VIDEO: ', old.url_video, 
'ESTATUS: ',old.estatus,
'ESTATUS: ',v_estatus_old, '-', v_estatus_new ,
"FECHA REGISTRO:", old.Fecha_Registro, 
"FECHA ACTUALIZACION", old.Fecha_Actualizacion), default, default
);
END
------Before Delete------

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_videos_ejercicios_BEFORE_DELETE` BEFORE DELETE ON `tbd_videos_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';
if NOT OLD.estatus then
set v_estatus = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Delete',
'tbd_videos_ejercicios',
concat_ws(' ', 'Se han eliminado los detalles de un video de ejercicios:',
'ID: ', old.id, 
'ID EJERCICIO: ', old.ejercicio_id, 
'DESCRIPCIÓN:',old.descripcion,
'DURACION VIDEO: ', old.duracion_video, 
'URL_VIDEO: ', old.url_video, 
'ESTATUS: ',old.estatus,
'ESTATUS: ',v_estatus ,
"FECHA REGISTRO:", old.Fecha_Registro, 
"FECHA ACTUALIZACION", old.Fecha_Actualizacion), default, default
);
END

-----Triggers Tabla Derivada : Recomendaciones_Ejercicios-----

------After Insert-------
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_recomendaciones_ejercicios_AFTER_INSERT` AFTER INSERT ON `tbd_recomendaciones_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';
if not new.estatus then
set v_estatus = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Create',
'tbd_recomendaciones_ejercicios',
concat_ws(' ', 'Se ha insertado una recomendacion a la base de datos:',
'ID: ', new.id, 
' ID EJERCICIO: ', new.ejercicio_id, 
'DESCRIPCIÓN:',new.descripcion,
'TIPO RECOMENDACION: ', new.tipo_recomendacion,
'ESTATUS: ',new.estatus,
'ESTATUS: ',v_estatus,
"FECHA REGISTRO:", new.Fecha_Registro, 
"FECHA ACTUALIZACION", new.Fecha_Actualizacion), default, default
);
END

-----Before Update-----

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_recomendaciones_ejercicios_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_recomendaciones_ejercicios` FOR EACH ROW BEGIN
SET NEW.Fecha_actualizacion = current_timestamp();
END
------After Update-----
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_recomendaciones_ejercicios_AFTER_UPDATE` AFTER UPDATE ON `tbd_recomendaciones_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus_old varchar(20) default 'Activo';
declare v_estatus_new varchar(20) default 'Activo';
if not old.estatus then
set v_estatus_old = 'Inactivo';
end if;
if not new.estatus then
set v_estatus_new = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Update',
'tbd_recomendaciones_ejercicios',
concat_ws(' ', 'Se han editado las recomendaciones de ejercicios:',
'ID: ', old.id, 
' ID EJERCICIO: ', old.ejercicio_id, 
'DESCRIPCIÓN:',old.descripcion,
'TIPO RECOMENDACION: ', old.tipo_recomendacion,
'ESTATUS: ',old.estatus,
'ESTATUS: ',v_estatus_old, '-', v_estatus_new ,
"FECHA REGISTRO:", old.Fecha_Registro, 
"FECHA ACTUALIZACION", old.Fecha_Actualizacion), default, default
);
END
------Before Delete------
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_recomendaciones_ejercicios_BEFORE_DELETE` BEFORE DELETE ON `tbd_recomendaciones_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';
if NOT OLD.estatus then
set v_estatus = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Delete',
'tbd_recomendaciones_ejercicios',
concat_ws(' ', 'Se han eliminado las recomendacions de ejercicios:',
'ID: ', old.id, 
' ID EJERCICIO: ', old.ejercicio_id, 
'DESCRIPCIÓN:',old.descripcion,
'TIPO RECOMENDACION: ', old.tipo_recomendacion,
'ESTATUS: ',old.estatus,
'ESTATUS: ',v_estatus ,
"FECHA REGISTRO:", old.Fecha_Registro, 
"FECHA ACTUALIZACION", old.Fecha_Actualizacion), default, default
);
END

-------Triggers Tabla Derivada : Restricciones_Ejercicios-----------

-----After Insert-------
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_restricciones_ejercicios_AFTER_INSERT` AFTER INSERT ON `tbd_restricciones_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';
if not new.estatus then
set v_estatus = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Create',
'tbd_restricciones_ejercicios',
concat_ws(' ', 'Se ha insertado una recomendacion a la base de datos:',
'ID: ', new.id, 
' ID EJERCICIO: ', new.ejercicio_id, 
'RESTRICCIONES:',new.restriccion,
'TIPO RESTRICCION: ', new.tipo_restriccion,
'ESTATUS: ',new.estatus,
'ESTATUS: ',v_estatus,
"FECHA REGISTRO:", new.Fecha_Registro, 
"FECHA ACTUALIZACION", new.Fecha_Actualizacion), default, default
);
END
-----Before Update-----
CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_restricciones_ejercicios_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_restricciones_ejercicios` FOR EACH ROW BEGIN
SET NEW.Fecha_actualizacion = current_timestamp();
END
------After Update-----

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_restricciones_ejercicios_AFTER_UPDATE` AFTER UPDATE ON `tbd_restricciones_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus_old varchar(20) default 'Activo';
declare v_estatus_new varchar(20) default 'Activo';
if not old.estatus then
set v_estatus_old = 'Inactivo';
end if;
if not new.estatus then
set v_estatus_new = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Update',
'tbd_restricciones_ejercicios',
concat_ws(' ', 'Se han editado las restricciones de ejercicios:',
'ID: ', old.id, 
' ID EJERCICIO: ', old.ejercicio_id, 
'RESTRICCIONES:',old.restriccion,
'TIPO RESTRICCION: ', old.tipo_restriccion,
'ESTATUS: ',old.estatus,
'ESTATUS: ',v_estatus_old, '-', v_estatus_new ,
"FECHA REGISTRO:", old.Fecha_Registro, 
"FECHA ACTUALIZACION", old.Fecha_Actualizacion), default, default
);
END
------Before Delete------

CREATE DEFINER=`root`@`localhost` TRIGGER `tbd_restricciones_ejercicios_BEFORE_DELETE` BEFORE DELETE ON `tbd_restricciones_ejercicios` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';
if NOT OLD.estatus then
set v_estatus = 'Inactivo';
end if;
insert into tbi_bitacora values
(default,
current_user(),
'Delete',
'tbd_restricciones_ejercicios',
concat_ws(' ', 'Se han eliminado las restricciones de ejercicios:',
'ID: ', old.id, 
'ID EJERCICIO: ', old.ejercicio_id, 
'RESTRICCIONES:',old.restriccion,
'TIPO RESTRICCION: ', old.tipo_restriccion,
'ESTATUS: ',old.estatus,
'ESTATUS: ',v_estatus ,
"FECHA REGISTRO:", old.Fecha_Registro, 
"FECHA ACTUALIZACION", old.Fecha_Actualizacion), default, default
);
END