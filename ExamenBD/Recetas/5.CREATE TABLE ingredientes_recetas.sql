-- Crear tabla ingredientes_recetas

CREATE TABLE ingredientes_recetas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    receta_id INT FOREIGN KEY REFERENCES recetas(id),
    ingrediente_id INT FOREIGN KEY REFERENCES ingredientes(id),
    cantidad_gramos INT CHECK (cantidad_gramos >= 1)
);

