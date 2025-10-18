/*
=========================================================
==
==  SCRIPT DE BASE DE DATOS PARA EL PROYECTO API-FLUTTER
==  Base de Datos: PRUEBAS
==  Tabla: usuario
==
=========================================================
*/

-- 1. Crear la Base de Datos
CREATE DATABASE PRUEBAS;
GO

-- 2. Poner en uso la Base de Datos
USE PRUEBAS;
GO

-- 3. Crear la tabla 'usuario'
CREATE TABLE usuario(
    id int,
    nombre varchar(100)
);
GO

-- 4. Insertar un dato de ejemplo
INSERT INTO usuario(id, nombre) VALUES(1, 'Alex Maradiaga');
GO

-- 5. Consulta de ejemplo
SELECT * FROM usuario;
GO

-- 6. Actualización de ejemplo
-- Esta línea no hará nada porque 'Juan Bueno' no existe,
UPDATE usuario SET id = 2 WHERE nombre = 'Juan Bueno';
GO
