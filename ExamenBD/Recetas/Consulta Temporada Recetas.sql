-- Temporadas Recetas 

SELECT t.nombre AS temporada, COUNT(ir.ingrediente_id) AS 'Número ingredientes'
FROM recetas r
JOIN ingredientes_recetas ir ON r.id = ir.receta_id
JOIN ingredientes i ON ir.ingrediente_id = i.id
JOIN temporadas t ON i.temporada_id = t.id
GROUP BY t.nombre;