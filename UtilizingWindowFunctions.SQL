-- show the number of cars sold for the current month and previous month 
SELECT STRFTIME('%Y-%m', soldDate) AS MonthsSold, -- for the first column extract the year and month from soldDate and name it MonthsSold
  COUNT(salesId) AS NumberOfCarsSold, -- each SalesId row shows a sale, Count them up to get the total number of cars sold 
  LAG (COUNT(salesId),1,0) OVER calMonth AS LastMonthCarsSold  --https://www.sqlitetutorial.net/sqlite-window-functions/sqlite-lag/
-- LAG is a window function that shows us the previous values, if the second parameter is set to 1. the 3rd parameter is required to tell sql how to handle null values. 
FROM sales
GROUP BY STRFTIME('%Y-%m', soldDate) -- even tho this has already been aliased we need to call the original calculation 
WINDOW calMonth AS (ORDER BY STRFTIME('%Y-%m', soldDate)) -- this is needed to utilize the LAG function that we need 
ORDER BY STRFTIME('%Y-%m', soldDate)
