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

-- Crea las claves foráneas despues de la inserción de datos para que no haya ningún problema
ALTER TABLE students ADD CONSTRAINT fk_Students_idSchool FOREIGN KEY (idSchool) REFERENCES highschool(idSchool);
ALTER TABLE subjects ADD CONSTRAINT fk_Subject_idTeacher FOREIGN KEY (idTeacher) REFERENCES teachers(idTeacher);
ALTER TABLE class ADD CONSTRAINT fk_Class_idStudent FOREIGN KEY (idStudent) REFERENCES students(idStudent);
ALTER TABLE class ADD CONSTRAINT fk_Class_idSubjects FOREIGN KEY (idSubjects) REFERENCES subjects(idSubjects);
ALTER TABLE highschool ADD CONSTRAINT fk_Highschool_idPrincipal FOREIGN KEY (idPrincipal) REFERENCES schoolprincipal(idPrincipal);