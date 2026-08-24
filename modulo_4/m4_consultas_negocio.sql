USE "Ventas_Tech_DB";

--Consulta 1 — Resumen ejecutivo mensual--
SELECT 
MONTH(fecha_venta) AS mes,
SUM (cantidad * precio_unitario) AS total_facturado,
COUNT (id_venta) AS Cantidad_de_pedidos,
AVG (cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta); --en mi caso estoy usando Management Studio, por lo que no me reconoce "EXTRACT(MONTH FROM fecha_venta)", por eso utilice el group by.

---Consulta 2 — Ranking de productos
SELECT TOP 5
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

--Consulta 3 — Clientes recurrentes
SELECT 
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

--Consulta 4 — Meses por encima/por debajo del promedio--
SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
CASE 
WHEN SUM(cantidad * precio_unitario) >= (
SELECT AVG(total_mensual)
FROM (
SELECT SUM(cantidad * precio_unitario) AS total_mensual
FROM ventas
GROUP BY MONTH(fecha_venta)
) AS subconsulta
) THEN 'Por encima'
ELSE 'Por debajo'
END AS estado_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-----------------------------------------------------
--HALLAZGOS ENCONTRADOS--
--El total facturado en Marzo fue de 6444.00, distribuido en 10 pedidos.
--El producto mas vendido fue el Mouse Inalámbrico con 13 unidades vendidas, seguido del Teclado Mecánico con 4 unidades vendidas.
--Todos los clientes realizaron la misma cantidad de pedidos (2), pero el cliente con id 1 (Maria Lopez) fue quien mas gasto (2640.00).
--Al contar solo con registros unicamente del mes de Marzo, no es posible realizar una comparativa de cul es el mes con mayor facturacion o si hubo variaciones en el top de los productos vendidos a lo largo de los meses.
-----------------------------------------------------
