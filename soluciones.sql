-- 1)
SELECT COUNT(*)
FROM compras
WHERE cliente = (SELECT id
                 FROM clientes
                 WHERE nombre = 'Juan');
-- 2)
SELECT nombre
FROM ciudades
WHERE provincia = (SELECT id
                   FROM provincias
                   WHERE nombre = 'Cordoba');
-- 3)
SELECT nombre, poblacion
FROM ciudades
WHERE poblacion <= (SELECT poblacion
                    FROM ciudades
                    WHERE nombre = 'Rosario');
-- 4)
SELECT nombre FROM provincias
WHERE id = (SELECT provincia
            FROM ciudades
            WHERE intendente = 'Adan Bahl');
-- 5)
SELECT nombre, fundacion
FROM ciudades
WHERE fundacion < (SELECT fundacion
                   FROM ciudades
                   WHERE nombre = 'Quilmes');
-- 6)
SELECT descripcion, marca
FROM productos
WHERE id NOT IN (SELECT producto
                 FROM compras);
-- 7)
SELECT *
FROM compras
WHERE cliente = (SELECT id FROM clientes
                 WHERE nombre = 'Juana' AND apellido = 'Martinez')
AND   producto IN (SELECT id
                   FROM productos
                   WHERE descripcion LIKE 'Resma %');
-- 8)
SELECT id, nombre, poblacion, region
FROM provincias
WHERE poblacion > ALL (SELECT poblacion
                       FROM provincias
                       WHERE region = 'NOA');
-- 9)
SELECT id, nombre, superficie
FROM provincias
WHERE superficie > (SELECT SUM(superficie)
                    FROM provincias
                    WHERE region = 'Mesopotamia');
-- 10)
SELECT id, nombre, poblacion
FROM provincias
WHERE poblacion > (SELECT AVG(poblacion)
                   FROM provincias);

-- 11) correlated, tambien se puede hacer con NOT IN
SELECT id, nombre
FROM provincias AS P
WHERE NOT EXISTS (SELECT * FROM ciudades AS C
                  WHERE provincia = P.id);

-- 12) no correlated
SELECT id, nombre, capital
FROM provincias AS P
WHERE capital IN (SELECT nombre FROM ciudades);
-- 12) correlated con EXISTS
SELECT id, nombre, capital
FROM provincias AS P
WHERE EXISTS (SELECT * FROM ciudades AS C
              WHERE C.nombre = P.capital);

-- 13) funca, no es correlated
SELECT id, nombre, capital, poblacion, region
FROM provincias
WHERE poblacion IN (SELECT MAX(poblacion) FROM provincias
                    GROUP BY region);

-- 14) correlated subquery in SELECT
SELECT P.id, P.nombre, (SELECT COUNT(*)
                        FROM ciudades AS C
                        WHERE C.provincia = P.id) AS cant_ciudades
FROM provincias AS P;

-- 15) correlated
SELECT id, nombre, poblacion
FROM provincias AS PR1
WHERE poblacion > (SELECT AVG(poblacion) FROM provincias AS PR2
                   WHERE PR2.region = PR1.region);

-- 16)
DELETE FROM provincias
WHERE id NOT IN (SELECT DISTINCT provincia FROM ciudades);

-- 17)
SELECT *
FROM (SELECT C.id, fecha, descripcion, marca, cant, precio*cant
      FROM compras AS C
        JOIN productos AS P ON P.id = C.producto) AS D
WHERE marca = 'Trabi';

-- 18)
DELETE FROM compras
WHERE cliente = (SELECT id FROM clientes
                 WHERE nombre = 'Pedro' AND apellido = 'Gonzalez');

-- 19)
SELECT id, nombre,
       poblacion,
       CONCAT(
         TRUNCATE(poblacion/(SELECT SUM(poblacion) FROM provincias)
                  *100.0,2),
         ' %') AS porcentaje
FROM provincias;

-- 20)
SELECT nombre, poblacion,
       CONCAT(TRUNCATE(poblacion/(SELECT poblacion FROM provincias P WHERE P.id = C.provincia)*100,2),' %') AS porcentaje
FROM ciudades C;
