SELECT d.nombre, p.apellido1, p.apellido2, p.nombre FROM (profesor pr LEFT JOIN persona p ON pr.id_profesor = p.id) LEFT JOIN departamento d ON pr.id_departamento = d.id ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.apellido1, p.apellido2, p.nombre FROM (profesor pr LEFT JOIN persona p ON pr.id_profesor = p.id) WHERE pr.id_departamento IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_profesor IS NULL;
SELECT p.id, p.nombre, p.apellido1 FROM (persona p INNER JOIN profesor pr ON p.id = pr.id_profesor) LEFT JOIN asignatura asi ON pr.id_profesor = asi.id_profesor WHERE asi.id IS NULL;
SELECT asi.nombre FROM (asignatura asi LEFT JOIN profesor pr ON asi.id_profesor = pr.id_profesor) LEFT JOIN persona p ON pr.id_profesor = p.id WHERE asi.id_profesor IS NULL;
