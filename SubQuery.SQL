--join sales and inventory--
SELECT s.employeeId, s.salesAmount, s.soldDate, i.colour, i.year
FROM sales s --the rest functions LIKE a typical INNER JOIN-- 
INNER JOIN inventory i 
	ON s.inventoryId = i.inventoryId 
WHERE i.modelId  IN (
SELECT m.modelId
FROM model m 
WHERE m.EngineType = 'Electric'
)

--WHERE s.soldDate >= '2021-01-01' 
--AND s.soldDate < '2022-01-01'
GROUP BY s.employeeId 
ORDER BY s.salesAmount DESC

