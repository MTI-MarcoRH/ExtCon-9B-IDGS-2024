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
    Estatus BIT(1) NOT NULL DEFAULT b'1',
    Fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_actualizacion DATETIME DEFAULT NULL);