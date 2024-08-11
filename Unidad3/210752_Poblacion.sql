CREATE DEFINER=`amisadai`@`%` PROCEDURE `sp_poblar_puestos`(v_password VARCHAR(20))
    DETERMINISTIC
BEGIN
IF v_password = "abc123" THEN
	  INSERT INTO tbc_puestos VALUES 
	  (DEFAULT, "Gerente","Empleado responsable de la Sucursal del Gimnasio.", 20000.00, 
      "Carrera Universitaria, Habilidades Informática y Trabajo en Equipo.", DEFAULT, DEFAULT, NULL),
      (DEFAULT, "Entrenador","Empleado responsable de acompañar al cliente en sus programas saludables",
      12500.00, "Experiencia en Couching, Desempeño Físico y Primeros Auxilios", DEFAULT, DEFAULT, NULL),
      (DEFAULT, "Nutriologo","Empleado responsable en dietas 
      y seguimiento alimienticio de los clientes", 16400.00, "Carrera Profesional en 
      Mediciona o Nutrición.", DEFAULT, DEFAULT, NULL),
      (DEFAULT, "Recepcionista","Empleado responsable de la atención a los clientes del gimnasio,
      registros de entradas y salidas ", 6300.00, "Bachillerato, Habilidades Informática.", DEFAULT, DEFAULT, NULL),
      (DEFAULT, "Técnico de Mantenimiento","Empleado responsable de mantener en funcionamiento el
      equipamiento de la sucursal.", 10500.00, 
      "Bachillerato, Mecánica y Electrónica básica.", DEFAULT, DEFAULT, NULL),
      (DEFAULT, "Instructor","Especialista en Ejercicios y/o Disciplinas Deportivas", 8500.00, 
      "Bachillerato, Certificaciones", DEFAULT, DEFAULT, NULL);
      
	   -- 
	   UPDATE tbc_puestos SET salario= "22300.00" WHERE nombre="Gerente";
       UPDATE tbc_puestos SET nombre= "Técnico en Mantenimiento" WHERE nombre="Técnico de Mantenimiento";
       -- 
       DELETE FROM tbc_puestos WHERE nombre="Instructor";

    ELSE 
      SELECT "La contraseña es incorrecta, no puedo mostrarte el estatus de la Base de Datos" AS ErrorMessage;
    
    END IF;

END