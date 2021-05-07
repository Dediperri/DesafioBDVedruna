------------------------------------------------------
-- Autor : Colegio Santa Joaquina de Vedruna
-- Descripción : Script 0 - Formación SQL
-- Responsable : Juan Alejandro Téllez Rubio
-- Alumno 1: Daniel Vazquez Muñoz
-- Alumno 2: Diego López Strickland
-- Alumno 3: Fátima Prieto Alvear
-- Alumno 4: Juan Manuel Hermida Acuña
-- Alumno 5: Alexei Viadero Sanchez
------------------------------------------------------


-- Crea la tabla students
CREATE TABLE students(

	idStudent INT NOT NULL auto_increment PRIMARY KEY,
    firstName VARCHAR(40),
    lastName VARCHAR(40),
    birthdate VARCHAR(40) NOT NULL,
    phone INT NOT NULL,
    idSchool INT NOT NULL
);