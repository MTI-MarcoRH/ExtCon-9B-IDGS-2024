-- Poblacion opiniones clientes
INSERT INTO tbd_opiniones_clientes (usuario_id, descripcion, tipo, respuesta, estatus, registro_fecha, Atencion_personal)
VALUES 
(5, 'Opinión sobre la calidad de las máquinas de entrenamiento', 'Equipo', 'Las máquinas están en excelente estado', 'Atendida', NOW(), 20),
(5, 'Satisfacción con las clases de yoga', 'Clases', 'Las clases de yoga son muy relajantes y efectivas', 'Atendida', NOW(), 21),
(1, 'Comentario sobre la limpieza de las instalaciones', 'Instalaciones', 'Las instalaciones están siempre limpias y ordenadas', 'Registrado', NOW(), 22),
(2, 'Sugerencia para añadir más pesas libres', 'Equipo', 'Sería ideal contar con más pesas libres para entrenamientos de fuerza', 'Cancelado', NOW(), 23),
(3, 'Opinión sobre el trato del personal', 'Servicio', 'El personal es muy amable y siempre dispuesto a ayudar', 'Atendida', NOW(), 24);


SELECT * FROM tbi_bitacora;
select * from tbd_opiniones_clientes;

UPDATE tbd_opiniones_clientes 
SET descripcion = 'Descripciónnn modificada', estatus = 'Registrado' 
WHERE id = 36;

DELETE FROM tbd_opiniones_clientes WHERE id = 34;



-- Poblacion de tbd_preguntas
INSERT INTO tbd_preguntas (pregunta, respuesta, categoria, persona_id, estatus) 
VALUES 
('¿Cuál es tu objetivo principal en el gimnasio?', 'Perder peso', 'Objetivos', 11, 'Pendiente'),
('¿Qué tipo de entrenamiento prefieres?', 'Entrenamiento de fuerza', 'Preferencias', 13, 'Pendiente'),
('¿Cuántas veces a la semana entrenas?', '4 veces', 'Rutina', 14, 'Pendiente'),
('¿Tienes alguna lesión que debamos conocer?', 'No', 'Salud', 15, 'Pendiente'),
('¿Qué hora del día prefieres para entrenar?', 'Mañana', 'Preferencias', 16, 'Pendiente');


UPDATE tbd_preguntas 
SET respuesta = 'Perder peso', estatus = 'Pendiente' 
WHERE id = 2;
select * from tbd_preguntas;
DELETE FROM tbd_preguntas 
WHERE id = 4;