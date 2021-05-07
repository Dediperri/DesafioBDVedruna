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

-- Muestra las distintas ciudades de donde hay institutos que participen en la DUAL, sin repetir ciudad. 
SELECT DISTINCT(city) FROM fpdual.highschool;

-- Muestra las asignaturas que imparte el profesor con id=1, ordenadas por nombre. 
SELECT * FROM fpdual.subjects WHERE idTeacher=1 ORDER BY Name;

-- Muestra de la tabla class, las notas 5 del estudiante con id 8.
SELECT * FROM fpdual.class WHERE score=5 AND idStudent=8;

-- Los institutos de Sevilla y Cádiz
SELECT * FROM fpdual.highschool WHERE city LIKE "Sevilla" OR city LIKE "Cádiz";

-- Los profesores, menos el profesor con id=1
SELECT * FROM fpdual.teachers WHERE NOT idTeacher=1;

-- Comprobar la máxima nota
 SELECT MAX(score) FROM class;
 
-- Comprobar la mínima nota
 SELECT MIN(score) FROM class;
 
-- Comprobar los institutos de Sevilla.
 SELECT name FROM highschool WHERE city LIKE "Sevilla";
 
-- Sacar el número de alumnos con un COUNT()
 SELECT COUNT(idStudent) FROM students;
 
-- Comprobar la media de las notas por el ID de los alumnos.
 SELECT idStudent, AVG(score) FROM class GROUP BY idStudent;
 
-- Comprobar los alumnos con notas entre 6 y 8.
 SELECT idStudent, idSubjects, score FROM class WHERE score BETWEEN 6 AND 8;


-- Primer INNER JOIN, junta varias tablas para conseguir toda la información sobre el estudiante, profesor, asignatura y notas
SELECT sub.idSubjects, sub.name, sub.idTeacher, te.firtsName,
te.lastName AS NOMBRE_FORMADOR, cl.idStudent, st.firstName AS NOMBRE_ESTUDIANTE,
cl.score AS NOTAS FROM subjects sub
INNER JOIN class cl ON sub.idSubjects = cl.idSubjects
INNER JOIN teachers te ON sub.idTeacher = te.idTeacher
INNER JOIN students st ON cl.idStudent = st.idStudent;

-- Primer LEFT JOIN, comprueba los profesores que no imparten ninguna asignatura
SELECT te.FirtsName FROM teachers te LEFT JOIN subjects su ON te.idTeacher = su.idTeacher
WHERE su.idTeacher IS NULL;

-- Primer RIGHT JOIN, comprueba las asignaturas que no tienen asignado ningun profesor
SELECT su.idSubjects, su.name FROM teachers te RIGHT JOIN subjects su ON te.idTeacher = su.idTeacher
WHERE te.idTeacher IS NULL;

-- Cantidad de colegios por ciudades
SELECT city as Ciudad, count(city) as Colegios FROM fpdual.highschool GROUP BY city HAVING Colegios > 2;
 
-- Alumnos por colegios
SELECT highSchool.name as Colegio, count(students.idSchool) as Alumnos FROM students
JOIN highschool ON students.idSchool = highschool.idSchool GROUP BY students.idSchool HAVING Alumnos > 5;
 
-- Asignaturas por profesores
SELECT teachers.firtsname as Profesor, count(subjects.idTeacher) as Asignaturas FROM subjects JOIN teachers ON subjects.idTeacher=teachers.idTeacher 
GROUP BY Profesor HAVING Asignaturas > 2;


-- BONUS

-- PROCEDIMIENTO QUE DEVUELVE LA MEDIA DE LAS NOTAS
DELIMITER $$
CREATE PROCEDURE getMedia()
BEGIN
SELECT idStudent, AVG(score) FROM class GROUP BY idStudent;
END$$
DELIMITER ;
 
CALL getMedia();
