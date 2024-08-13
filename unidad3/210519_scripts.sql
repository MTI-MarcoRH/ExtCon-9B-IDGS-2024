
    -- a) Revision de la composicion de la tabla
    CREATE TABLE `tbc_ejercicios` (
    `ID` int unsigned NOT NULL AUTO_INCREMENT,
    `Nombre` varchar(100) NOT NULL,
    `Descripcion` text,
    `Video` varchar(100) DEFAULT NULL,
    `Tipo` enum('Aerobico','Resistencia','Fuerza','Flexibilidad') NOT NULL,
    `Estatus` bit(1) NOT NULL DEFAULT b'1',
    `Dificultad` enum('Basico','Avanzado','Intermedio') NOT NULL,
    `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Fecha_Actualizacion` datetime DEFAULT NULL,
    `Recomendaciones` text,
    `Restricciones` text,
    PRIMARY KEY (`ID`)
    ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    -- b) cambios sugeridos
    -- c) Revision de la poblacion estatica (correccion en caso de ser necesaria)
    CREATE DEFINER=`suri`@`%` PROCEDURE `sp_poblar_ejercicios`(v_password varchar(50))
        BEGIN

        -- Corregido por Marco RH - Menos 2 Firmas

        IF v_password = "xYz$123" THEN
            INSERT INTO tbc_ejercicios VALUES 
                (DEFAULT, "Peso Muerto", " consiste esencialmente en extender la cadera y los músculos que la rodean, también incluye todos los ejercicios de musculación que requieren una cierta estabilidad del torso,
                esto incluye levantar una carga desde el suelo o desde la rodilla.", null, "Aerobico",default,'Basico',default,null, 'calentar','No hacer mal la fuerza'), 
                (DEFAULT, "Planchas", " consiste esencialmente en extender la cadera y los músculos que la rodean, también incluye todos los ejercicios de musculación que requieren una cierta estabilidad del torso,
                esto incluye levantar una carga desde el suelo o desde la rodilla.", null, "Fuerza",default,'Intermedio',default,null, 'calentar','No hacer mal la fuerza'), 
                (DEFAULT, "Prensas", " consiste esencialmente en extender la cadera y los músculos que la rodean, también incluye todos los ejercicios de musculación que requieren una cierta estabilidad del torso,
                esto incluye levantar una carga desde el suelo o desde la rodilla.", null, "Fuerza",default,'Intermedio',default,null, 'calentar','No hacer mal la fuerza'), 
                (DEFAULT, "Pesas", " consiste esencialmente en extender la cadera y los músculos que la rodean, también incluye todos los ejercicios de musculación que requieren una cierta estabilidad del torso,
                esto incluye levantar una carga desde el suelo o desde la rodilla.", null, "Fuerza",default,'Avanzado',default,null, 'calentar','No hacer mal la fuerza'), 
                (DEFAULT, "Biceps", " consiste esencialmente en extender la cadera y los músculos que la rodean, también incluye todos los ejercicios de musculación que requieren una cierta estabilidad del torso,
                esto incluye levantar una carga desde el suelo o desde la rodilla.", null, "Aerobico",default,'Avanzado',default,null, 'calentar','No hacer mal la fuerza');
                
                UPDATE tbc_ejercicios SET nombre= "Peso Muerto" WHERE nombre="Remo";
                UPDATE tbc_ejercicios SET tipo= "Aeróbico" WHERE nombre="Prensas";
                UPDATE tbc_ejercicios SET Dificultad= "Básico" WHERE nombre="Biceps";
                
                DELETE FROM tbc_ejercicios WHERE nombre="Pesas";

            ELSE 
            SELECT "La contraseña es incorrecta, no puedo mostrarte el 
            estatus de la Base de Datos" AS ErrorMessage;
            
            END IF;

    END
    -- d) Revision de los 4 triggers (AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, BEFORE DELETE)
    CREATE DEFINER=`suri`@`%` TRIGGER `tbc_ejercicios_AFTER_INSERT` AFTER INSERT ON `tbc_ejercicios` FOR EACH ROW BEGIN
        
        DECLARE v_estatus varchar(20) default 'Activo';
        
        -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
        if not NEW.estatus then
            set v_estatus = "Inactivo";
        end if;
        
        
        -- Insertar en la bitacora
        INSERT INTO tbi_bitacora VALUES(
            DEFAULT,
            USER(),
            "Create",
            "tbc_ejercicios",
            CONCAT_WS(" ","Se ha insertado un nuevo ejercicio con los siguientes datos: ",
            "NOMBRE = ", new.Nombre,
            "DESCRIPCION = ", new.Descripcion,
            "VIDEO = ", new.Video, 
            "TIPO = ", new.Tipo,
            "ESTATUS = ", v_estatus,
            "DIFICULTAD = ", new.Dificultad,
            "FECHA REGISTRO = ", new.Fecha_Registro,
            "FECHA ACTUALIZACION = ", new.Fecha_Actualizacion,
            "RECOMENDACIONES = ", new.Recomendaciones,
            "RESTRICCIONES = ", new.Restricciones),
            DEFAULT,
            DEFAULT  
        );
    END
    --  -----------------------------------------------------------------------------------------
    CREATE DEFINER=`suri`@`%` TRIGGER `tbc_ejercicios_BEFORE_UPDATE` BEFORE UPDATE ON `tbc_ejercicios` FOR EACH ROW BEGIN
        SET NEW.Fecha_Actualizacion = current_timestamp();
    END
    --  -----------------------------------------------------------------------------------------
    CREATE DEFINER=`suri`@`%` TRIGGER `tbc_ejercicios_AFTER_UPDATE` AFTER UPDATE ON `tbc_ejercicios` FOR EACH ROW BEGIN
        DECLARE v_estatus_old varchar(20) default 'Activo';
        declare v_estatus_new varchar(20) default 'Activo';

        if not old.estatus then
        set v_estatus_old = 'Inactivo';
        end if;

        if not new.estatus then
        set v_estatus_new = 'Inactivo';
        end if;


        -- Insertar en la bitacora
            INSERT INTO tbi_bitacora VALUES(
                DEFAULT,
                USER(),
                "Update",
                "tbc_ejercicios",
                CONCAT_WS(" ","Se ha modificado un ejercicio existente con los siguientes datos: ",
                "NOMBRE = ", old.Nombre, '---', new.Nombre,
                "DESCRIPCION = ", old.Descripcion, '---', new.Descripcion,
                "VIDEO = ",old.Video, '---', new.Video, 
                "TIPO = ",old.Tipo, '---', new.Tipo,
                "ESTATUS = ",v_estatus_old, '---', v_estatus_new,
                "DIFICULTAD = ",old.Dificultad, '---', new.Dificultad,
                "FECHA REGISTRO = ",old.Fecha_Registro, '---', new.Fecha_Registro,
                "FECHA ACTUALIZACION = ",old.Fecha_Actualizacion, '---', new.Fecha_Actualizacion,
                "RECOMENDACIONES = ",old.Recomendaciones, '---', new.Recomendaciones,
                "RESTRICCIONES = ",old.Restricciones, '---', new.Restricciones),
                DEFAULT,
                DEFAULT  
            );
    END
    --  -----------------------------------------------------------------------------------------
    CREATE DEFINER=`suri`@`%` TRIGGER `tbc_ejercicios_BEFORE_DELETE` BEFORE DELETE ON `tbc_ejercicios` FOR EACH ROW BEGIN
        DECLARE v_estatus_old varchar(20) default 'Activo';

        if NOT OLD.estatus then
        set v_estatus_old = 'Inactivo';
        end if;


        -- Insertar en la bitacora
            INSERT INTO tbi_bitacora VALUES(
                DEFAULT,
                USER(),
                "Delete",
                "tbc_ejercicios",
                CONCAT_WS(" ","Se ha eliminado un ejercicio existente con los siguientes datos: ",
                "NOMBRE = ", old.Nombre,
                "DESCRIPCION = ", old.Descripcion,
                "VIDEO = ",old.Video,
                "TIPO = ",old.Tipo,
                "ESTATUS = ",v_estatus_old,
                "DIFICULTAD = ",old.Dificultad,
                "FECHA REGISTRO = ",old.Fecha_Registro,
                "FECHA ACTUALIZACION = ",old.Fecha_Actualizacion,
                "RECOMENDACIONES = ",old.Recomendaciones,
                "RESTRICCIONES = ",old.Restricciones),
                DEFAULT,
                DEFAULT  
            );
    END
    -- e) realizar una consulta join (en caso de que aplique) para comprobar la integridad de la informacion 