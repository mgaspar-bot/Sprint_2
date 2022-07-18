SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
DESCRIBE producto;
SELECT nombre, precio, ROUND(precio*1.01,2) FROM producto;
SELECT nombre, precio AS 'euros', ROUND(precio*1.01,2) as 'dòlars' FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre,2)) FROM fabricante;
SELECT nombre, ROUND(precio, 0) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante=2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1;
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
SELECT p.codigo, p.nombre, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Lenovo';
SELECT p.codigo, p.nombre, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Crucial' AND p.precio > 200;
SELECT p.codigo, p.nombre, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE LOWER(f.nombre) LIKE '%hewlett%' OR LOWER(f.nombre) LIKE 'seagate' OR LOWER(f.nombre) LIKE 'asus';
SELECT p.codigo, p.nombre, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Hewlett-Packard', 'Asus', 'Seagate'); /*al IN no li agraden els % */
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE LOWER(f.nombre) LIKE '%e'; 
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE LOWER(f.nombre) LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT f.nombre AS fabricante, p.nombre FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo IS NULL;
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'Lenovo');
SELECT * FROM producto WHERE precio = (SELECT precio FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'Lenovo') ORDER BY precio DESC LIMIT 1);
SELECT p.nombre FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Hewlett%' ORDER BY p.precio ASC LIMIT 1;
SELECT * FROM producto WHERE precio >= (SELECT p.precio FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Lenovo' ORDER BY p.precio DESC LIMIT 1);
SELECT p.nombre, p.precio, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Asus' AND p.precio > (SELECT avg(precio) FROM producto);