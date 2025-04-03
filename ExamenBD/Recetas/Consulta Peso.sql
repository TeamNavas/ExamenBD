-- Consulta Peso

SELECT r.nombre AS RECETA, SUM(ir.cantidad_gramos) AS PESO
FROM recetas r
JOIN ingredientes_recetas ir ON r.id = ir.receta_id
GROUP BY r.nombre;