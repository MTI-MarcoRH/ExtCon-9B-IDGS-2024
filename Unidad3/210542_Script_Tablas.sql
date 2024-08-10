-- TABLA OPINIONES CLIENTES
CREATE TABLE tbd_opiniones_clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    descripcion TEXT,
    tipo VARCHAR(50),
    respuesta TEXT,
    estatus ENUM('Cancelado', 'Registrado', 'Abierto','Atendida') DEFAULT 'Atendida',
    registro_fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    registro_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Atencion_personal INT,
    FOREIGN KEY (usuario_id) REFERENCES tbb_personas(atencion_personal),
    FOREIGN KEY (Atencion_personal) REFERENCES tbb_usuarios(usuario_id)
);

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

