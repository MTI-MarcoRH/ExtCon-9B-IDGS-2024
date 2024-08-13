CREATE DEFINER=`zahid`@`%` PROCEDURE `sp_poblar_equipamientos`(v_password varchar(10))
BEGIN
if v_password = "qwerty" then 
        insert into tbb_equipamientos values
        (default,'Cardio', 'Cinta de Correr', 'RunFast', 'R-300', 'photo1.jpg', b'1', 5, NOW(), default),
(default,'Cardio', 'Bicicleta Estática', 'CyclePro', 'C-150', 'photo2.jpg', b'1', 8, NOW(), default),
(default,'Pesas', 'Banco de Pesas', 'StrengthMax', 'B-500', 'photo3.jpg', b'1', 12, NOW(), default),
(default,'Pesas', 'Máquina de Prensa', 'PowerLift', 'P-1000', 'photo4.jpg', b'1', 6, NOW(),default),
(default,'Estiramiento', 'Colchoneta de Yoga', 'FlexiMat', 'Y-200', 'photo5.jpg', b'1', 15, NOW(),default);


            -- UPDATE
		update tbb_equipamientos set Area = 'Estiramiento' where id = 1;
        update tbb_equipamientos set Area = 'Estiramiento' where id = 2;
	-- DELETE
        delete from tbb_mantenimientos where id = 3;
        
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
        
        end if;
END


-- -----------------------------------------
CREATE DEFINER=`zahid`@`%` PROCEDURE `sp_poblar_mantenimientos`(v_password varchar(10))
BEGIN
if v_password = "qwerty" then 
        insert into tbb_mantenimientos values
        (default,"Pesas","Es para ejercicios con peso alto",10.00,"Supervisor",b'1','2024-08-10', default),
       (default,"Giyotina","Es para personas corriosas",10,"Supervisor", b'1',"02-02-03",default),        
        (default, "Corredora","Es para principiantes",10,"Supervisor",b'1',"02-02-04",default),       
        (default, "Disco giratorio", "Maquina enfocada a personas discapacitadas",10,"Supervisor", b'1',"02-02-04",default);
            -- UPDATE
		update tbb_mantenimientos set equipo = 'caminadora' where id = 1;
        update tbb_mantenimientos set descripcion = 'Es para principiantes' where id = 2;
	-- DELETE
        delete from tbb_mantenimientos where id = 2;
        
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
        
        end if;
END