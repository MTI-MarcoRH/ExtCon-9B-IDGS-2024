--Elaborado por: Jorge Cazarez Cruz
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

-----Triggers After insert --------
CREATE DEFINER=`jorge`@`%` TRIGGER `tbb_instructores_AFTER_INSERT` AFTER INSERT ON `tbb_instructores` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';

if not new.estatus then
set v_estatus = 'Inactivo';
end if;

insert into tbi_bitacora values
(default,
current_user(),
'Create', 
'tbb_instructores',
concat_ws(' ', 'Se ha creado un nuevo instructor con los siguientes datos:',
'ID: ', new.id, 
'TOTAL_AÑOS_EXPERIENCIA: ', new.total_años_experiencia, 
'ESPECIALIDAD: ',new.especialidad,
'TOTAL_CLIENTES_ATENDIDOS: ', new.total_clientes_atendidos, 
'ESTATUS: ', new.estatus, 
'FECHA_REGISTRO: ',new.fecha_registro,
'FECHA_ACTUALIZACION: ', new.fecha_actualizacion,
'CALIFICACION: ', new.calificacion,
'ESTATUS: ',v_estatus ), default, default
);

END

--------Trigger Before update-------
CREATE DEFINER=`jorge`@`%` TRIGGER `tbb_instructores_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_instructores` FOR EACH ROW BEGIN
SET NEW.Fecha_actualizacion = current_timestamp();
END



--------Trigger after update-----
CREATE DEFINER=`jorge`@`%` TRIGGER `tbb_instructores_AFTER_UPDATE` AFTER UPDATE ON `tbb_instructores` FOR EACH ROW BEGIN
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
'tbb_instructores',
concat_ws(' ', 'Se ha editado el nuevo usuario con los siguientes datos:',
'ID: ', old.id, 
'TOTAL_AÑOS_EXPERIENCIA: ', old.total_años_experiencia, 
'ESPECIALIDAD: ',old.especialidad,
'TOTAL_CLIENTES_ATENDIDOS: ', old.total_clientes_atendidos, 
'ESTATUS: ', old.estatus, 
'FECHA_REGISTRO: ',old.fecha_registro,
'FECHA_ACTUALIZACION: ', old.fecha_actualizacion,
'CALIFICACION: ', old.calificacion,
'ESTATUS: ',v_estatus_old, '-',  v_estatus_new  ), default, default
);

END

-----Triggers Before Update -----
CREATE DEFINER=`jorge`@`%` TRIGGER `tbb_instructores_BEFORE_DELETE` BEFORE DELETE ON `tbb_instructores` FOR EACH ROW BEGIN
DECLARE v_estatus varchar(20) default 'Activo';

if NOT OLD.estatus then
set v_estatus = 'Inactivo';
end if;


insert into tbi_bitacora values
(default,
current_user(),
'Delete', 
'tbb_instructores',
concat_ws(' ', 'Se ha eliminado el usuario con los siguientes datos:',
 
'ID: ', old.id, 
'TOTAL_AÑOS_EXPERIENCIA: ', old.total_años_experiencia, 
'ESPECIALIDAD: ',old.especialidad,
'TOTAL_CLIENTES_ATENDIDOS: ', old.total_clientes_atendidos, 
'ESTATUS: ', old.estatus, 
'FECHA_REGISTRO: ',old.fecha_registro,
'FECHA_ACTUALIZACION: ', old.fecha_actualizacion,
'CALIFICACION: ', old.calificacion,
'ESTATUS: ',v_estatus ), default, default
);

END