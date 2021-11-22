/*
Query 2
For each combination of customer and product, output the maximum sales quantities for 
October (regardless of the year, that is, both 10/11/2016 and 10/23/2019 are considered 
sales transactions for October) and minimum sales quantities for November and 
December (again, regardless of the year) in 3 separate columns. Like the first report, 
display the corresponding dates (i.e., dates of those maximum and minimum sales 
quantities). Furthermore, for October (MAX), include only the sales that occurred after 
2017 (that is, not to include sales that occurred in 2017 or earlier); for November (MIN) 
and December (MIN), include all sales
*/

SELECT DISTINCT Oct.*, Nov.PRODUCT, Nov.Nov_min, Nov.Nov_date, December.PRODUCT, December.Dec_min, December.Dec_date
FROM
	(SELECT t1.cust as CUSTOMER, t1.prod as PRODUCT, t1.quant as OCT_MAX, t1.date as OCT_DATE FROM sales t1 
	WHERE month = 10
	AND year > 2016
	AND quant = (SELECT MAX(quant) from sales t2
			 	WHERE t1.cust = t2.cust 
			 	AND month = 10
			 	AND year > 2016
			 	group by cust)) Oct,

	(SELECT t1.cust as CUSTOMER, t1.prod as PRODUCT, t1.quant as NOV_MIN, t1.date as NOV_DATE FROM sales t1 
	WHERE month = 11
	AND quant = (SELECT MIN(quant) from sales t2
			 WHERE t1.cust = t2.cust 
			 AND month = 11
			 group by cust)) Nov,
			 
	(SELECT t1.cust as CUSTOMER, t1.prod as PRODUCT, t1.quant as DEC_MIN, t1.date as DEC_DATE FROM sales t1 
	WHERE month = 12
	AND quant = (SELECT MIN(quant) from sales t2
			 WHERE t1.cust = t2.cust 
			 AND month = 12
			 group by cust)) December
WHERE Oct.Customer = Nov.Customer 
AND Oct.Customer = December.Customer;

