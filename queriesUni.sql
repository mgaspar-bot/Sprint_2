SELECT apellido1, apellido2, nombre FROM persona WHERE tipo LIKE 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo LIKE 'alumno';
SELECT * FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo LIKE 'alumno';
SELECT * FROM persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND LOWER(nif) LIKE '%k';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre FROM (persona pe INNER JOIN profesor pr ON pe.id = pr.id_profesor) INNER JOIN departamento d ON pr.id_departamento = d.id ORDER BY pe.apellido1 ASC, pe.apellido2 ASC, pe.nombre ASC;
SELECT asi.nombre, c.anyo_inicio, c.anyo_fin  FROM ( (alumno_se_matricula_asignatura a INNER JOIN asignatura asi ON a.id_asignatura = asi.id) INNER JOIN curso_escolar c ON a.id_curso_escolar = c.id) INNER JOIN persona p ON a.id_alumno = p.id WHERE p.id = (SELECT id FROM persona WHERE nif LIKE '26902806M');
SELECT DISTINCT d.nombre FROM ((departamento d INNER JOIN profesor pr ON d.id = pr.id_departamento) INNER JOIN asignatura asi ON pr.id_profesor = asi.id_profesor) INNER JOIN grado g ON asi.id_grado = g.id WHERE LOWER(g.nombre) LIKE '%informática%';
SELECT DISTINCT p.nombre, p.apellido1 FROM (persona p INNER JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno) WHERE a.id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019);
