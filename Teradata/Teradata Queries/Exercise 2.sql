/* Exercise 2. Use a CASE statement within an aggregate function to determine which sku
had the greatest total sales during the combined summer months of June, July, and August. */

SELECT sku,
       SUM(CASE WHEN (EXTRACT(YEAR from saledate)=2005) AND EXTRACT(MONTH from saledate)=6 THEN amt ELSE 0 END) AS ventas_junio,
       SUM(CASE WHEN (EXTRACT(YEAR from saledate)=2005) AND EXTRACT(MONTH from saledate)=7 THEN amt ELSE 0 END) AS ventas_julio,
       SUM(CASE WHEN (EXTRACT(YEAR from saledate)=2004) AND EXTRACT(MONTH from saledate)=8 THEN amt ELSE 0 END) AS ventas_agosto,
       (ventas_junio + ventas_julio + ventas_agosto) AS ventas_verano
       

FROM trnsact
WHERE stype = 'P'
GROUP BY sku
ORDER BY ventas_verano DESC;