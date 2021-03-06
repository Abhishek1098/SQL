# Assignment 1 CS 442

**Name:** Abhishek Yadav\
**CWID:** 10451216\
**Pledge:** "I pledge my honor that I have abided by the Stevens Honor System."

## Query 1
> For each customer, compute the minimum and maximum sales quantities
> - [x] corresponding products
> - [x] dates(i.e., dates of those maximum and minimum sales quantities)
> - [x] the states in which the sale transactions took place 
> - [x] also compute the average sales quantity
 
```sql
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
```

## Query 2
> For each combination of customer and product, output the maximum sales quantities for 
> - [x] October (regardless of the year, that is, both 10/11/2016 and 10/23/2019 are considered sales transactions for October)  
> - [x] minimum sales quantities for November 
> - [x] December (again, regardless of the year) 

*Like the first report, display the corresponding dates (i.e., dates of those maximum and minimum sales quantities).* 

*Furthermore, for October (MAX), include only the sales that occurred after 2017 (that is, not to include sales that occurred in 2017 or earlier). For November (MIN) and December (MIN), include all sales*

```sql
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
```

## Query 3
> For each of the 12 months (regardless of the year), 
- [x] find the most ???popular??? 
- [x] least ???popular??? products (those products with most and least total sales quantities) 
- [x] the corresponding total sales quantities (i.e., SUMs).

```sql
select most_pop.*, least_pop.LEAST_POPULAR_PROD, least_pop.LEAST_POP_TOTAL_Q
from
	(select month_max.month, prod_month_sum.prod as MOST_POPULAR_PROD, prod_month_sum.sum_quant as MOST_POP_TOTAL_Q
	from
		(select month, max(sum_quant) as max_quant
		from 	(select prod, month, sum(quant) as sum_quant
				from sales
				group by month, prod) prod_month_sum
		group by month) month_max,
		(select prod, month, sum(quant) as sum_quant
		from sales
		group by month, prod) prod_month_sum
	where month_max.month = prod_month_sum.month
	and month_max.max_quant = prod_month_sum.sum_quant) most_pop,

	(select month_min.month, prod_month_sum.prod as LEAST_POPULAR_PROD, prod_month_sum.sum_quant as LEAST_POP_TOTAL_Q
	from
		(select month, min(sum_quant) as min_quant
		from 	(select prod, month, sum(quant) as sum_quant
				from sales
				group by month, prod) prod_month_sum
		group by month) month_min,
		(select prod, month, sum(quant) as sum_quant
		from sales
		group by month, prod) prod_month_sum
	where month_min.month = prod_month_sum.month
	and month_min.min_quant = prod_month_sum.sum_quant) least_pop
where most_pop.month = least_pop.month
order by most_pop.month;
```

## Query 4
> For each product, 
- [x] find the ???most favorable??? month (when most amount of the product was sold)  
- [x] the ???least favorable??? month (when the least amount of the product was sold).

```sql
select fav_month.*, least_fav_month.LEAST_FAV_MO
from
	(select DISTINCT t1.prod, month as MOST_FAV_MO
	from 	(select prod, max(tbl.sum) as max
			from 	(select prod, month, sum(quant) as sum
					from sales
					group by prod, month) tbl
			group by prod) t1
	INNER JOIN 	(select prod, month, sum(quant) as sum
			from sales
			group by prod, month) t2
	ON t1.max = t2.sum) fav_month,
	(select DISTINCT t1.prod, month as LEAST_FAV_MO
	from 	(select prod, min(tbl.sum) as min
			from 	(select prod, month, sum(quant) as sum
					from sales
					group by prod, month) tbl
			group by prod) t1
	INNER JOIN 	(select prod, month, sum(quant) as sum
			from sales
			group by prod, month) t2
	ON t1.min = t2.sum) least_fav_month
where fav_month.prod = least_fav_month.prod;
```

## Query 5
> For the years 2016, 2017, 2018, 2019 and 2020, show, for each product and customer combination, 
- [x] the average sales quantities for the 4 states, ???CT???, ???NY???, ???NJ??? and ???PA??? (in four separate columns).  
- [x] compute the average for the ???whole??? year (again ignoring the YEAR component, meaning simply compute AVG) 
- [x] along with the total quantities (SUM) 
- [x] the counts (COUNT).

```sql
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
```