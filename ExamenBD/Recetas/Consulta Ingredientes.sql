-- Consulta Ingredientes Temporada 

SELECT t.nombre AS temporada, COUNT(i.id) AS 'Número ingredientes'
FROM ingredientes i
JOIN temporadas t ON i.temporada_id = t.id
GROUP BY t.nombre;