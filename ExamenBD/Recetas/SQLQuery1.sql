-- Crear base

CREATE DATABASE recetas_para_aprobar;
GO
USE recetas_para_aprobar;

-- Crear tabla dificultades

CREATE TABLE dificultades (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);

-- Crear tabla categorias

CREATE TABLE categorias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear tabla temporadas

CREATE TABLE temporadas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);


-- Crear tabla recetas

CREATE TABLE recetas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    elaboracion TEXT NOT NULL,
    tiempo_minutos INT CHECK (tiempo_minutos BETWEEN 1 AND 240),
    categoria_id INT FOREIGN KEY REFERENCES categorias(id),
    dificultad_id INT FOREIGN KEY REFERENCES dificultades(id)
);


-- Crear tabla ingredientes

CREATE TABLE ingredientes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    temporada_id INT FOREIGN KEY REFERENCES temporadas(id)
);


-- Crear tabla ingredientes_recetas

CREATE TABLE ingredientes_recetas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    receta_id INT FOREIGN KEY REFERENCES recetas(id),
    ingrediente_id INT FOREIGN KEY REFERENCES ingredientes(id),
    cantidad_gramos INT CHECK (cantidad_gramos >= 1)
);


-- Insertar categorias

INSERT INTO categorias (nombre) VALUES 
('Entrantes'), ('Ensaladas'), ('Sopas'), ('Cremas'), ('Hortalizas'),
('Legumbres'), ('Huevos'), ('Arroces'), ('Pastas'), ('Aves'),
('Carnes'), ('Pescados'), ('Mariscos'), ('Postres');


-- Insertar dificultades

INSERT INTO dificultades (nombre) VALUES 
('muy fácil'), ('elaborada'), ('complicada');


-- Insertar Temporadas

INSERT INTO temporadas (nombre) VALUES 
('invierno'), ('primavera'), ('verano'), ('otoño');


-- Insertar Ingredientes

INSERT INTO ingredientes (nombre, temporada_id) VALUES
('Manzana', 4), ('Pera', 4), ('Calabaza', 4), ('Boniato', 4), ('Nuez', 4),
('Castaña', 4), ('Col', 4), ('Brócoli', 4), ('Coliflor', 4), ('Champiñón', 4),
('Naranja', 1), ('Mandarina', 1), ('Pomelo', 1), ('Kiwi', 1), ('Limón', 1),
('Zanahoria', 1), ('Nabos', 1), ('Remolacha', 1), ('Puerro', 1), ('Col lombarda', 1),
('Fresa', 2), ('Cereza', 2), ('Albaricoque', 2), ('Espárrago', 2), ('Guisante', 2),
('Acelga', 2), ('Espinaca', 2), ('Rabanito', 2), ('Cebolla tierna', 2), ('Lechuga', 2),
('Tomate', 3), ('Pepino', 3), ('Melón', 3), ('Sandía', 3), ('Pimiento', 3),
('Berenjena', 3), ('Calabacín', 3), ('Maíz', 3), ('Albahaca', 3), ('Perejil', 3);


-- Insertar recetas

INSERT INTO recetas (nombre, elaboracion, tiempo_minutos, categoria_id, dificultad_id)
VALUES ('Sopa de Calabaza', 'Cortar la calabaza (500grm) en cubos...', 30, 3, 2);

-- Insertar Ingredientes Recetas 

INSERT INTO ingredientes_recetas (receta_id, ingrediente_id, cantidad_gramos)
VALUES 
(1, (SELECT id FROM ingredientes WHERE nombre = 'Calabaza'), 500),
(1, (SELECT id FROM ingredientes WHERE nombre = 'Cebolla tierna'), 150),
(1, (SELECT id FROM ingredientes WHERE nombre = 'Perejil'), 5);


-- Consulta Peso

SELECT r.nombre AS RECETA, SUM(ir.cantidad_gramos) AS PESO
FROM recetas r
JOIN ingredientes_recetas ir ON r.id = ir.receta_id
GROUP BY r.nombre;

-- Consulta Ingredientes Temporada 

SELECT t.nombre AS temporada, COUNT(i.id) AS 'Número ingredientes'
FROM ingredientes i
JOIN temporadas t ON i.temporada_id = t.id
GROUP BY t.nombre;

-- Temporadas Recetas 

SELECT t.nombre AS temporada, COUNT(ir.ingrediente_id) AS 'Número ingredientes'
FROM recetas r
JOIN ingredientes_recetas ir ON r.id = ir.receta_id
JOIN ingredientes i ON ir.ingrediente_id = i.id
JOIN temporadas t ON i.temporada_id = t.id
GROUP BY t.nombre;

