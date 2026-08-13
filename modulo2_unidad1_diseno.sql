--CREAR BASE DE DATOS--
CREATE DATABASE "RetailPro";
--USAR LA BASE--
USE RetailPro;
--CREAR TABLA CLIENTES--
CREATE TABLE Clientes(
id_cliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY, -- Identificador único numérico entero autoincremental
nombre VARCHAR (100) NOT NULL, -- Cadena de texto de longitud variable hasta 100 caracteres
perfil_bio TEXT, -- Texto de longitud libre para biografías extensas
fecha_registro DATE -- Almacena únicamente la fecha (año, mes, día) sin hora
)

--CREAR TABLA PRODUCTOS--
CREATE TABLE Productos (
id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY, --Entero clave primaria autoincremental
descripcion VARCHAR (255), --Texto variable acotado a 255 caracteres
precio DECIMAL (10,2), --Precisión exacta para importes monetarios, que permite realizar calculos con dichos importes
esta_activo CHAR (2) --Texto de tamaño fijo de 2 caracteres (Se usaran las opciones 'SI' / 'NO' para determinar si se encuentra activo)
)
