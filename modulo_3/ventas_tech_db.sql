-- ============================================================
-- 1. CREAR LA BASE
-- ============================================================
CREATE DATABASE Ventas_Tech_DB;
GO
USE Ventas_Tech_DB;
GO
-- ============================================================
-- 2. ELIMINACIÓN DE TABLAS SI EXISTIERAN
-- ============================================================
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- ============================================================
-- 3. CREACION DE TABLAS Y DEPENDENCIAS
-- ============================================================
CREATE TABLE categorias (
id_categoria INT NOT NULL PRIMARY KEY, -- Identificador único numérico entero 
nombre_categoria VARCHAR(50) NOT NULL, -- Cadena de texto de hasta 50 caracteres
descripcion	VARCHAR(200) -- Cadena de texto de hasta 200 caracteres
);
CREATE TABLE clientes (
id_cliente	INT	NOT NULL PRIMARY KEY, -- Identificador único numérico entero 
nombre	VARCHAR(100)	NOT NULL, -- Cadena de texto de hasta 100 caracteres
email	VARCHAR(100)	UNIQUE, -- Cadena de texto de hasta 100 caracteres
ciudad	VARCHAR(50)	​, -- Cadena de texto de hasta 50 caracteres
fecha_registro	DATE	NOT NULL -- Almacena  la fecha (año, mes, día)
);
CREATE TABLE productos (
id_producto	INT	PRIMARY KEY, -- Identificador único numérico entero 
nombre_producto	VARCHAR(100)	NOT NULL, -- Cadena de texto de hasta 100 caracteres
id_categoria INT REFERENCES categorias(id_categoria), --Foreign Key apuntando a la tabla categorias
precio	DECIMAL(10,2)	NOT NULL, --Indicado para importes monetarios, que permite realizar calculos
stock	INT	DEFAULT 0, --Numero entero no fraccionable, la cantidad inicial al ingresar un producto nuevo sera cero a menos que se especifique lo contrario
activo TINYINT DEFAULT 1 --Numero entero que funciona como una bandera booleana (1 para producto activo y disponible, 0 para descontinuado
);
CREATE TABLE ventas (
id_venta	INT	PRIMARY KEY, -- Identificador único numérico entero
id_cliente	INT NOT NULL	REFERENCES clientes(id_cliente), --Foreign Key apuntando a la tabla clientes
id_producto	INT NOT NULL	REFERENCES productos (id_producto), --Foreign Key apuntando a la tabla producto
cantidad	INT	NOT NULL, --Numero entero
precio_unitario	DECIMAL(10,2)	NOT NULL, --Indicado para importes monetarios, que permite realizar calculos
fecha_venta	DATE	NOT NULL -- Almacena  la fecha (año, mes, día)
);
-- ============================================================
-- 4. CARGA DE DATOS
-- ============================================================
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion)
VALUES
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
(1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05'),
(2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10'),
(3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01'),
(4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15'),
(5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
(1, 'Laptop Pro 15',       1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico',   2,   28.00, 80, 1),
(3, 'Monitor 4K 27"',      1,  450.00, 12, 1),
(4, 'Auriculares BT Pro',  3,  120.00, 35, 1),
(5, 'SSD Externo 1TB',     4,  130.00, 18, 1),
(6, 'Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
(1,  1, 1, 2, 1200.00, '2024-03-05'),
(2,  2, 2, 5,   28.00, '2024-03-06'),
(3,  3, 3, 1,  450.00, '2024-03-07'),
(4,  1, 4, 2,  120.00, '2024-03-08'),
(5,  4, 5, 3,  130.00, '2024-03-10'),
(6,  2, 6, 4,   95.00, '2024-03-11'),
(7,  5, 1, 1, 1200.00, '2024-03-12'),
(8,  3, 2, 8,   28.00, '2024-03-13'),
(9,  4, 4, 1,  120.00, '2024-03-14'),
(10, 5, 3, 2,  450.00, '2024-03-15');

-- ============================================================
-- 5. VALIDACIÓN DE QUE LOS DATOS SE CARGARON CORRECTAMENTE
-- ============================================================
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
