
CREATE TABLE `tbd_servicios_al_cliente` (
    `id` INT unsigned AUTO_INCREMENT PRIMARY KEY,
    `id_usuario` INT NOT NULL,
    `id_persona` INT NOT NULL,
    `tipo_servicio` ENUM('Servicio Individual','Servicio Grupal') NOT NULL,
    `descripcion` TEXT NOT NULL,
    `comentarios` TEXT,
    `estatus` bit default b'1',
	`fecha_registro` DATE NOT NULL,
	`fecha_actualizacion` DATE
);