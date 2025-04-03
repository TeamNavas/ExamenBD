-- Crear tabla recetas

CREATE TABLE recetas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    elaboracion TEXT NOT NULL,
    tiempo_minutos INT CHECK (tiempo_minutos BETWEEN 1 AND 240),
    categoria_id INT FOREIGN KEY REFERENCES categorias(id),
    dificultad_id INT FOREIGN KEY REFERENCES dificultades(id)
);
