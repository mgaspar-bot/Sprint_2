SELECT COUNT(id) FROM persona WHERE tipo LIKE 'alumno';
SELECT COUNT(id) FROM persona WHERE YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(pr.id_profesor) FROM departamento d INNER JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.id ORDER BY COUNT(pr.id_profesor) DESC;
SELECT d.nombre, COUNT(pr.id_profesor) FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.id;
SELECT g.nombre, COUNT(asi.id) FROM grado g LEFT JOIN asignatura asi ON g.id = asi.id_grado GROUP BY g.id ORDER BY COUNT(asi.id) DESC;
SELECT g.nombre, COUNT(asi.id) FROM grado g LEFT JOIN asignatura asi ON g.id = asi.id_grado GROUP BY g.id HAVING COUNT(asi.id) > 40;
SELECT g.nombre, asi.tipo, SUM(asi.creditos) FROM grado g LEFT JOIN asignatura asi ON g.id = asi.id_grado GROUP BY g.id, asi.tipo;
SELECT ce.anyo_inicio, COUNT(a.id_alumno) FROM (alumno_se_matricula_asignatura a INNER JOIN curso_escolar ce ON ce.id = a.id_curso_escolar) GROUP BY a.id_curso_escolar;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(asi.id) FROM ((profesor pr INNER JOIN persona p ON pr.id_profesor = p.id) LEFT JOIN asignatura asi ON asi.id_profesor = pr.id_profesor) GROUP BY pr.id_profesor ORDER BY COUNT(asi.id) DESC;
SELECT * FROM persona WHERE tipo LIKE 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT pr.id_profesor, p.nombre, p.apellido1 FROM ((profesor pr LEFT JOIN asignatura asi ON pr.id_profesor = asi.id_profesor) INNER JOIN persona p ON pr.id_profesor = p.id) WHERE asi.id IS NULL AND pr.id_departamento IS NOT NULL;






