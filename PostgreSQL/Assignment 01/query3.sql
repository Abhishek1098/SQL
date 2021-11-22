/*
Query 3
For each of the 12 months (regardless of the year), find the most “popular” and least 
“popular” products (those products with most and least total sales quantities) and the 
corresponding total sales quantities (i.e., SUMs).
*/

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