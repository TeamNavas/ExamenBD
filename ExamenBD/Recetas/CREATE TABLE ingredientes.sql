-- Crear tabla ingredientes

CREATE TABLE ingredientes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    temporada_id INT FOREIGN KEY REFERENCES temporadas(id)
);

