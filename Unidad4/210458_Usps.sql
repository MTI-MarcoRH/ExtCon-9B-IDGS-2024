--Elaborado por: Jorge Cazarez Cruz
--Grado y Grupo: 9°B
--Programa Educativo: Ingenieria de Desarrollo de Software.
--Fecha elaboracion: 10 de Julio del 2024.

call gimnasio_9b_idgs_210458.sp_poblado_dinamico_tbb_instructores();
ALTER TABLE tbb_instructores 
MODIFY COLUMN `ID` INT NOT NULL AUTO_INCREMENT;