-- Insertar Ingredientes Recetas 

INSERT INTO ingredientes_recetas (receta_id, ingrediente_id, cantidad_gramos)
VALUES 
(1, (SELECT id FROM ingredientes WHERE nombre = 'Calabaza'), 500),
(1, (SELECT id FROM ingredientes WHERE nombre = 'Cebolla tierna'), 150),
(1, (SELECT id FROM ingredientes WHERE nombre = 'Perejil'), 5);
