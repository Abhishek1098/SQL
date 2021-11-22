/*
Query 5
For the years 2016, 2017, 2018, 2019 and 2020, show, for each product and customer
combination, the average sales quantities for the 4 states, ‘CT’, ‘NY’, ‘NJ’ and ‘PA’ (in four 
separate columns). Also compute the average for the “whole” year (again ignoring the 
YEAR component, meaning simply compute AVG) along with the total quantities (SUM) 
and the counts (COUNT).
*/
select ct.*, ny.avg as NY_AVG, nj.avg as NJ_AVG, pa.avg as PA_AVG, avg_tbl.avg as Average, sum_tbl.sum as Total, cnt_tbl.cnt as Count
from
	(select prod as Product, cust as Customer, avg(quant) as CT_AVG
	from sales
	where state = 'CT'
	and year BETWEEN 2015 AND 2021
	group by prod, cust, state) ct, 
	
	(select prod, cust, avg(quant) as avg
	from sales
	where state = 'NY'
	and year BETWEEN 2015 AND 2021
	group by prod, cust, state) ny,
	
	(select prod, cust, avg(quant) as avg
	from sales
	where state = 'NJ'
	and year BETWEEN 2015 AND 2021
	group by prod, cust, state) nj,
	
	(select prod, cust, avg(quant) as avg
	from sales
	where state = 'PA'
	and year BETWEEN 2015 AND 2021
	group by prod, cust, state) pa,
	
	(select cust, prod, avg(quant) as avg
	from sales
	group by cust, prod) avg_tbl,
	
	(select cust, prod, sum(quant) as sum
	from sales
	group by cust, prod) sum_tbl,
	
	(select cust, prod, count(quant) as cnt
	from sales
	group by cust, prod) cnt_tbl
WHERE ct.product = ny.prod
AND ct.customer = ny.cust
AND ny.prod = nj.prod
AND ny.cust = nj.cust
AND nj.prod = pa.prod
AND nj.cust = pa.cust
AND pa.prod = avg_tbl.prod
AND pa.cust = avg_tbl.cust
AND avg_tbl.prod = sum_tbl.prod
AND avg_tbl.cust = sum_tbl.cust
AND sum_tbl.prod = cnt_tbl.prod
AND sum_tbl.cust = cnt_tbl.cust
order by ct.customer, ct.product;


