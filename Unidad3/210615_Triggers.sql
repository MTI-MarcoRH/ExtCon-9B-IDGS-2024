/*AFTER INSERT*/
CREATE DEFINER=`morales`@`%` TRIGGER `tbd_programas_saludables_AFTER_INSERT` AFTER INSERT ON `tbd_programas_saludables` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbd_programas_saludables",
        CONCAT_WS(" ","Se ha insertado una nueva relación de PROGRAMAS SALUDABLES con el ID: ",NEW.ID, 
        "con los siguientes datos: ",
        "NOMBRE = ", NEW.Nombre,
        "USUARIO ID = ", new.Usuario_ID,
        "INSTRUCTOR ID = ",  NEW.Instructor_ID,
        "FECHA DE CREACIÓN = ", NEW.Fecha_Creacion,
		"ESTATUS = ", NEW.Estatus,
        "DURACIÓN = ", NEW.Duracion, 
        "PORCENTAJE DE AVANCE = ", NEW.Porcentaje_Avance,
        "FECHA DE ULTIMA ACTUALIZACIÓN = ", NEW.Fecha_Ultima_Actualizacion),
        NOW(),
        DEFAULT
    );
END

/*BEFORE UPDATE*/
CREATE DEFINER=`morales`@`%` TRIGGER `tbd_programas_saludables_BEFORE_UPDATE` BEFORE UPDATE ON `tbd_programas_saludables` FOR EACH ROW BEGIN
set new.fecha_ultima_actualizacion = current_timestamp();
END

/*AFTER UPDATE*/
CREATE DEFINER=`morales`@`%` TRIGGER `tbd_programas_saludables_AFTER_UPDATE` AFTER UPDATE ON `tbd_programas_saludables` FOR EACH ROW BEGIN
 INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Update",
        "tbd_programas_saludables",
        CONCAT_WS(" ","Se han actualizado los datos de la relación PROGRAMAS SALUDABLES con el ID: ",NEW.ID,
        "con los siguientes datos:",
        "NOMBRE = ", OLD.nombre, "cambio a", NEW.nombre,
        "USUARIO ID = ", old.Usuario_ID, "cambio a", NEW.Usuario_ID,
        "INSTRUCTOR ID =",OLD.Instructor_ID,"cambio a", NEW.Instructor_ID,
        "FECHA DE CREACIÓN = ", OLD.fecha_creacion, "cambio a", NEW.fecha_creacion,
        "ESTATUS = ", OLD.estatus, "cambio a", NEW.estatus,
        "DURACIÓN = ", OLD.duracion, "cambio a", NEW.duracion,
        "PORCENTAJE DE AVANCE = ", OLD.porcentaje_avance, "cambio a", NEW.porcentaje_avance,
        "FECHA DE ULTIMA ACTUALIZACIÓN = ", OLD.fecha_ultima_actualizacion, "cambio a", NEW.fecha_ultima_actualizacion),
        NOW(),
        DEFAULT       
    );
END

/*AFTER DELETE*/
CREATE DEFINER=`morales`@`%` TRIGGER `tbd_programas_saludables_AFTER_DELETE` AFTER DELETE ON `tbd_programas_saludables` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora VALUES(
		DEFAULT,
        USER(),
        "Delete",
        "tbd_programas_saludables",
        CONCAT_WS(" ","Se ha eliminado una relación en PROGRAMAS SALUDABLES con el ID: ", OLD.ID),
        now(),
        DEFAULT
    );
    END