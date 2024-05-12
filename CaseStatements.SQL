--CREATE A QUERY THAT SHOWS THE EMPLOYEES THAT SOLD THE MOST IN $ PER MONTH IN 2021 
SELECT e.firstName, e.lastName, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '01' --SUM VALUES THAT HAVE THE CORRESPONDING MONTH 
		THEN s.salesAmount END) AS JanSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '02'
		THEN s.salesAmount END) AS FebSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '03'
		THEN s.salesAmount END) AS MarSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '04'
		THEN s.salesAmount END) AS AprSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '05'
		THEN s.salesAmount END) AS MaySales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '06'
		THEN s.salesAmount END) AS JuneSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '07'
		THEN s.salesAmount END) AS JulySales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '08'
		THEN s.salesAmount END) AS AugSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '09'
		THEN s.salesAmount END) AS SepSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '10'
		THEN s.salesAmount END) AS OctSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '11'
		THEN s.salesAmount END) AS NovSales, 
	SUM(CASE WHEN strftime('%m', s.soldDate) = '12'
		THEN s.salesAmount END) AS DecSales
		
FROM sales s 
INNER JOIN employee e 
	ON s.employeeId = e.employeeId 
WHERE s.soldDate >= '2021-01-01' 
AND s.soldDate < '2022-01-01'
GROUP BY e.employeeId 
ORDER BY e.firstName, e.lastName 
