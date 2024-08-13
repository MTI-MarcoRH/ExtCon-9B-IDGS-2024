--  
CREATE DEFINER=`valencia`@`%` PROCEDURE `sp_poblar_sucursales`(v_password varchar(10))
BEGIN

if v_password = 'xYz$123' then
	-- INSERT
    INSERT INTO tbc_sucursales VALUES
    (DEFAULT, "Xicotepec", "Calle Matamoros #125, Planta Alta", NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT,
    "Lunes a Viernes 07:00 a 21:00, Sábados y Domingos de 11:00 a 23:00", DEFAULT, DEFAULT, NULL),
    (DEFAULT, "Huauchinango", "Calle 5 de Mayo #72", NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT,
    "Lunes a Viernes 08:00 a 20:00, Sábados y Domingos de 12:00 a 20:00", DEFAULT, DEFAULT, NULL), 
    (DEFAULT, "Juan Galindo", "Avenida 1ro. de Mayo #205", NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT,
    "Martes a Viernes 06:00 a 20:00, Sábados y Domingos de 08:00 a 20:00", DEFAULT, DEFAULT, NULL), 
    (DEFAULT, "Villa Ávila Camacho", "Calle Morelos #25", NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT,
    "Lunes a Viernes 10:00 a 21:00, Sábados y Domingos de 10:00 a 20:00", DEFAULT, DEFAULT, NULL);
    
    -- UPDATE
		update tbc_sucursales set direccion = 'Zaragoza, #208' where id = 1;
        update tbc_sucursales set horario_disponibilidad = 'Lunes a Viernes 06:00 a 21:00, 
        Sábados y Domingos de 13:00 a 21:00' where id = 2;
	-- DELETE
        delete from tbc_sucursales where id = 4;
        
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
	end if;
END





-- --------------------------------------------------------------------

CREATE DEFINER=`valencia`@`%` PROCEDURE `sp_poblar_instalaciones`(v_password varchar(10))
BEGIN

if v_password = 'xYz$123' then
	-- INSERT
    INSERT INTO tbb_instalaciones VALUES
    (
    default,
    'Entrenamiento de fuerza y cardio',
    'Área equipada con máquinas de pesas, cintas de correr, y bicicletas estáticas.',
    'Gimnasio',
    'Espacio amplio, ideal para entrenamientos individuales y en grupo.',
    'Exelente servicio',
    b'1',  -- Estatus activo
    1,  -- ID de la sucursal correspondiente
    'Lunes a Viernes: 06:00 a 22:00, Sábados y Domingos: 08:00 a 20:00',
    NOW(),  -- Fecha de registro actual
    null  -- Fecha de actualización actual
    )
    ,
(
default,
    'Clases de Yoga y Pilates',
    'Sala con colchonetas, bloques, y bandas elásticas para clases de yoga y pilates.',
    'Sala de clases',
    'Sala tranquila con ambiente relajante.',
    'Buen servicio',
    b'1',  -- Estatus activo
    2,  -- ID de la sucursal correspondiente
    'Lunes a Viernes: 07:00 a 21:00, Sábados: 09:00 a 14:00',
    NOW(),  -- Fecha de registro actual
  null  -- Fecha de actualización actual
),
(
default,
    'Piscina semiolímpica',
    'Piscina de 25 metros con carriles marcados para natación.',
    'Piscina',
    'Disponibilidad de entrenadores de natación durante las horas pico.',
    'Exelente servicio',
    b'1',  -- Estatus activo
    3,  -- ID de la sucursal correspondiente
    'Lunes a Viernes: 06:00 a 20:00, Sábados y Domingos: 08:00 a 18:00',
    NOW(),  -- Fecha de registro actual
    null   -- Fecha de actualización actual
),
(
default,
    'Clases de Zumba y Aeróbicos',
    'Sala con espejos y equipo de sonido para clases de zumba y aeróbicos.',
    'Sala de clases',
    'Clases dirigidas por instructores certificados.',
    'Buen servicio',
    b'1',  -- Estatus activo
    4,  -- ID de la sucursal correspondiente
    'Lunes a Viernes: 08:00 a 22:00, Sábados: 09:00 a 13:00',
    NOW(),  -- Fecha de registro actual
    null   -- Fecha de actualización actual
),
(default,
    'Sauna y Spa',
    'Instalación con sauna seca y sala de masajes.',
    'Spa',
    'Relajación completa después del entrenamiento.',
    'Exelente servicio',
    b'1',  -- Estatus activo
    5,  -- ID de la sucursal correspondiente
    'Lunes a Viernes: 09:00 a 21:00, Sábados y Domingos: 10:00 a 18:00',
    NOW(),  -- Fecha de registro actual
    null   -- Fecha de actualización actual
);
   
    -- UPDATE
		update tbb_instalaciones set Calificacion = 'Buen servicio' where id = 1;
        update tbb_instalaciones set Horario_Disponibilidad= 'Lunes a Viernes: 09:00 a 21:00, Sábados y Domingos: 10:00 a 18:00' where id = 2;

    -- DELETE
        delete from tbb_instalaciones where id = 4;
    
        
		else
		select "La contraseña es incorrecta, no puedo insertar registros de la BD" as Mensaje;
	end if;
END