# MiniStore — Análisis con Outer JOINs

## Respuestas al cuestionario teórico

### 1. ¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?
Coloque la tabla "productos" a la izquierda y utilice LEFT JOIN para que me muestre todos los productos listados, independientemente de que cuenten con ventas o no. Si utilizara el INNER JOIN no me mostraria todos los productos, sino solamente los que tienen alguna correspondencia (venta) con la tabla de ventas.
### 2. ¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?
Use el RIGHT JOIN para no perder los registros de ventas concretadas y poder identificar inconsistencias, como ventas que hayan sido registradas con id de productos que no esten registrados (no existan) en la tabla productos. La tabla de la izquierda es PRODUCTOS y la de la derecha VENTAS 

### 3. ¿Qué representan los valores NULL en cada resultado?
* **En la Consulta 1:** los campos de "ventas" que figuran "NULL" indican que no hay ventas registradas asociadas al product_id correspondiente a esa fila.
* **En la Consulta 2:** los campos de "producto" que figuran "NULL" indican que hay ventas registradas bajo números de producto inexistentes. 

### 4. ¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?
Lo utilizaria para realizar auditorias y detectar inconsistencias entre los registros de las tablas que se crucen o identificar datos incompletos en ambas tablas. 
