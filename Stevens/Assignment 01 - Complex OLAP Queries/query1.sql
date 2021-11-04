/*
Query 1
For each customer, compute the minimum and maximum sales quantities along with the 
corresponding products, dates (i.e., dates of those maximum and minimum sales 
quantities) and the states in which the sale transactions took place. For the same 
customer, also compute the average sales quantity
*/

SELECT DISTINCT TABLE_1.*, TABLE_2.MAX_Q, TABLE_2.MAX_PROD, TABLE_2.MAX_DATE, TABLE_2.ST, TABLE_3.AVG_Q 
FROM 
	(SELECT sales.cust as Customer, sales.quant as MIN_Q, sales.prod as MIN_PROD, sales.date as MIN_DATE, sales.state as ST
	FROM 	sales, 
			(SELECT cust, MIN(quant) as min_quant FROM sales GROUP BY cust) min_tbl
	WHERE sales.cust = min_tbl.cust 
	AND sales.quant = min_tbl.min_quant) TABLE_1,

	(SELECT sales.cust as Customer, sales.quant as MAX_Q, sales.prod as MAX_PROD, sales.date as MAX_DATE, sales.state as ST
	FROM 	sales, 
			(SELECT cust, MAX(quant) as max_quant FROM sales GROUP BY cust) max_tbl
	WHERE sales.cust = max_tbl.cust 
	AND sales.quant = max_tbl.max_quant) TABLE_2,

	(select cust, AVG(quant) as AVG_Q
	from sales
	group by cust) TABLE_3
WHERE TABLE_1.Customer = TABLE_2.Customer AND TABLE_1.Customer = TABLE_3.cust;


