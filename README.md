# Practica 3 - Subqueries

## Instrucciones de instalación

1. Instalar MySQL / MariaDB. En Termux `pkg install mariadb`.
2. Asegurarse de poder ejecutar `mysql` en la terminal. En Termux `mysqld_safe &` y luego `mysql`.
3. Clonar este repo `git clone https://github.com/santiagotrini/practica-3-subqueries`.
4. Cambiar al directorio del repo `cd practica-3-subqueries`.
5. Crear la base de datos `mysql < db_schema.sql`.
6. Poblar la base de datos `mysql < db_data.sql`.
7. Logearse a la base de datos `mysql practica_3`.

## Ejercicios

1. Contar cuántas compras hizo Juan Perez sin usar un JOIN.
2. Mostrar los nombres de las ciudades de Córdoba sin usar un JOIN.
3. Nombrar las ciudades que tengan igual o menor población que Rosario.
4. Mostrar en qué provincia vive el intendente Adan Bahl.
5. Mostrar las ciudades más antiguas que Quilmes.
6. Mostrar los productos que no se vendieron.
7. Mostrar las compras de Resmas que hizo Juana Martinez.
8. Mostrar todas las provincias con más población que cualquier provincia del NOA.
9. Mostrar todas las provincias cuya superficie sea mayor a la Mesopotamia entera.
10. Mostrar todas las provincias cuya población esté por encima del promedio nacional.
11. Mostrar los nombres de todas las provincias que tienen ciudades cargadas en la tabla ciudades.
12. Mostrar los nombres de todas las provincias que tienen su capital cargada en la tabla ciudades.
13. Mostrar id, nombre, capital y poblacion de las provincias más pobladas de cada región.
14. Mostrar una lista de las provincias con la cantidad de ciudades que tiene cargadas en la tabla de ciudades.
15. Mostrar todas las provincias cuya población esté por encima del promedio en su región.
16. Borrar todas las provincias que no tengan ciudades cargadas en la tabla ciudades.
17. Sin ejecutarla, ¿qué es lo que muestra la siguiente query?
```
SELECT *
FROM (SELECT C.id, fecha, descripcion, marca, cant, precio*cant
      FROM compras AS C
        JOIN productos AS P ON P.id = C.producto) AS D
WHERE marca = 'Trabi';   
```
18. Borrar todas las compras de Pedro Gonzalez.
19. Mostrar para cada provincia el porcentaje de población con respecto al total de Argentina.
20. Mostrar para cada ciudad el porcentaje de población con respecto al total de su provincia.
