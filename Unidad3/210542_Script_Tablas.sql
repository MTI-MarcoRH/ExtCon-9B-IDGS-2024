-- Elaborado por: Dulce Esmeralda Hernández Juárez 210542
-- Grado y Grupo: 9° B
-- Programa Educativo: Ingeniería de Desarrollo y Gestión de Software
-- Fecha elaboración: 6 de Agosto de 2024
-- Tabla: tbd_opiniones_clientes

-- TABLA OPINIONES CLIENTES
CREATE TABLE tbd_opiniones_clientes (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  
    usuario_id INT UNSIGNED NOT NULL,  
    descripcion TEXT,
    tipo VARCHAR(50),
    respuesta TEXT,
    estatus ENUM('Cancelado', 'Registrado', 'Abierto','Atendida') DEFAULT 'Atendida',
    registro_fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    registro_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Atencion_personal INT UNSIGNED,  
    FOREIGN KEY (usuario_id) REFERENCES tbb_usuarios(id),  -- Clave foránea hacia tbb_usuarios
    FOREIGN KEY (Atencion_personal) REFERENCES tbb_personas(id)  -- Clave foránea hacia tbb_personas
);
-- *********************************************************************************
-- Elaborado por: Dulce Esmeralda Hernández Juárez 210542
-- Grado y Grupo: 9° B
-- Programa Educativo: Ingeniería de Desarrollo y Gestión de Software
-- Fecha elaboración: 6 de Agosto de 2024
-- Tabla: tbd_preguntas
-- TABLA PREGUNTAS
CREATE TABLE tbd_preguntas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pregunta TEXT,
    respuesta TEXT,
    categoria VARCHAR(255),
    persona_id INT,
    estatus ENUM('Atendida', 'Registratada', 'Cancelada','Pendiente') DEFAULT 'Atendida',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (persona_id) REFERENCES tbb_personas(persona_id)
);

