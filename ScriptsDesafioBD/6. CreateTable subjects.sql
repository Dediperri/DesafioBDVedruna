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

-- Crea la tabla subject
CREATE TABLE subjects(

	idSubjects INT NOT NULL auto_increment PRIMARY KEY,    
    name VARCHAR(50),
    idTeacher INT
    
);