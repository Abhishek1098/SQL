/*
Query 4
For each product, find the “most favorable” month (when most amount of the product was 
sold) and the “least favorable” month (when the least amount of the product was sold).
*/
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