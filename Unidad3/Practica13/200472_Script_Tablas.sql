CREATE TABLE tbd_horarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo ENUM(
        'Sucursal',
        'Tiempo completo mañana',
        'Tiempo completo tarde',
        'Medio tiempo mañana',
        'Medio tiempo tarde',
        'Medio tiempo noche',
        'Descanso'
    ) NOT NULL,
    Dia VARCHAR(20) NOT NULL,
    Hora_Inicio TIME,
    Hora_Fin TIME,
    Empleado_ID INT UNSIGNED NOT NULL,
    Sucursal_ID INT UNSIGNED NOT NULL,
    Servicio_ID INT UNSIGNED NOT NULL,
    Estatus bit(1) NOT NULL,
    Fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_actualizacion DATETIME DEFAULT NULL,
    KEY Empleado_ID_idx (Empleado_ID),
    KEY Sucursal_ID_idx (Sucursal_ID),
    KEY Servicio_ID_idx (Servicio_ID),
    CONSTRAINT FK_Empleado_ID FOREIGN KEY (Empleado_ID) REFERENCES tbb_empleados(ID),
    CONSTRAINT FK_Sucursal_ID FOREIGN KEY (Sucursal_ID) REFERENCES tbc_sucursales(ID),
    CONSTRAINT FK_Servicio_ID FOREIGN KEY (Servicio_ID) REFERENCES tbd_servicios_sucursales(ID)
);