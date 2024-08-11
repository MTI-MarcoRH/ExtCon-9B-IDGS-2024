--Elaborado por: Suri Jazmin Peña Lira.
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

-----Poblacion Tabla Catalogo: Ejercicios -------
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_ejercicios`(v_password varchar(50))
BEGIN



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

-----Poblacion Tabla Derivada: Videos_Ejercicios -------
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_videos_ejercicios`(v_password varchar(50))
BEGIN
if v_password = "xYz$123" then
INSERT into tbd_videos_ejercicios values 
(default, 1,"Video para facilitar las sentadillas", "1.30","http://video1.com", default, '2024-06-21',default ),
(default, 2,"Video para facilitar las lagartijas", "1.45","http://video1.com", default, '2024-06-21',default ),
(default, 3,"Video para facilitar las peso muerto", "1.20","http://video1.com", default, '2024-06-21',default ),
(default, 4,"Video para facilitar los biceps", "1.30","http://video1.com", default, '2024-06-21',default ),
(default, 5,"Video para facilitar los abdominales", "1.30","http://video1.com", default, '2024-06-21',default );


update tbd_videos_ejercicios set descripcion = "video para press de banca"  where id=2;
update tbd_videos_ejercicios set estatus = b'1' where id=4;

delete from tbd_videos_ejercicios where ejercicio_id= 5;
else
select "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de datos" as ErrorMessage;

end if;
END


-----Poblacion Tabla Derivada: Recomendaciones_Ejercicios -------

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_recomendaciones_ejercicios`(v_password varchar(50))
BEGIN
if v_password = "xYz$123" then
INSERT into tbd_recomendaciones_ejercicios values 
(default, 1,"Ayudar a mejorar el ejercicio","Tecnica", default, '2024-06-21',default ),
(default, 1,"Ayudar a mejorar el ejercicio","Calentamiento", default, '2024-06-21',default ),
(default, 1,"Ayudar a mejorar el ejercicio","Hidratacion", default, '2024-06-21',default ),
(default, 1,"Ayudar a mejorar el ejercicio","Tecnica", default, '2024-06-21',default ),
(default, 1,"Ayudar a mejorar el ejercicio","Calentamiento", default, '2024-06-21',default );


update tbd_recomendaciones_ejercicios set descripcion = "video para press de banca"  where id=2;
update tbd_recomendaciones_ejercicios set estatus = b'1' where id=3;

delete from tbd_recomendaciones_ejercicios where ejercicio_id= 4;
else
select "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de datos" as ErrorMessage;

end if;
END


-----Poblacion Tabla Derivada: Restricciones_Ejercicios -------

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_restricciones_ejercicios`(v_password varchar(50))
BEGIN
if v_password = "xYz$123" then
INSERT into tbd_restricciones_ejercicios values 
(default, 1,"No realizar con lesiones de rodillas", "Medica",default, '2024-06-21',default ),
(default, 2,"Evitar en superficies inestables","Seguridad", default, '2024-06-21',default ),
(default, 3,"No realizar sin calentamiento previo","Tecnica", default, '2024-06-21',default ),
(default, 5,"Ayudar a mejorar el ejercicio","Tecnica", default, '2024-06-21',default ),
(default, 6,"Ayudar a mejorar el ejercicio","Medica", default, '2024-06-21',default );


update tbd_restricciones_ejercicios set restriccion = "Evitar si tienes problemas cardiovasculares"  where id=1;
update tbd_restricciones_ejercicios set estatus = b'1' where id=3;

delete from tbd_restricciones_ejercicios where ejercicio_id= 4;
else
select "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de datos" as ErrorMessage;

end if;
END