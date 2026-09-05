-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Sofia Ibarra
-- Fecha: 04/09/2026
-- ══════════════════════════════════════════
-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?

SELECT 
    p.producto_id,
    p.nombre AS producto,
    p.categoria,
    v.venta_id,
    v.fecha_venta
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos que no figuran en nuestro catálogo? (posible error de carga de datos)

SELECT 
    p.producto_id AS producto_catalogo_id,
    p.nombre AS producto,
    p.categoria,
    v.venta_id,
    v.producto_id AS venta_producto_id,
    v.fecha_venta
FROM productos p
RIGHT JOIN ventas v ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL;

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre todos los productos y todas las ventas sin perder ninguna fila, identificando tanto productos sin ventas como ventas sin producto.
SELECT 
    p.producto_id,
    p.nombre AS producto,
    p.categoria,
    v.venta_id AS ventas,
    v.fecha_venta
FROM productos p
FULL OUTER JOIN ventas v ON p.producto_id = v.producto_id;
