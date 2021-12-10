# Assignment 2 CS 442

**Name:** Abhishek Yadav\
**CWID:** 10451216\
**Pledge:** "I pledge my honor that I have abided by the Stevens Honor System."

## Query 1
> For each customer, product, month and state combination, compute 
> - [ ] the customer's average sale of this product for the given month and state,
> - [ ] the customer’s average sale for the given month and state, 
> - [ ] but for all other products the customer’s average sale for the given product and state, 
> - [ ] but for all other months and the average sale of the product and the month but for all other states.

```sql


```

## Query 2
**For customer, product and state,** 
- [ ] show the average sales before and after each quarter(e.g., for Q2, show average sales of Q1 and Q3). For “before” Q1 and “after” Q4, display <NULL>. 

*The “YEAR” attribute is not considered for this query – for example, both Q1 of 2017 and Q1 of 2018 are considered Q1 regardless of the year.*

```sql

```

## Query 3
**For each product,**
- [ ] find the median sales quantity (assume an odd number of sales for simplicity of presentation).   

*(NOTE –“median” is defined as “denoting or relating to a value or quantity lying at the midpoint of a frequency distribution of observed values or quantities, such that there is an equal probability of falling above or below it.”* \

*E.g., Median value of the list {13, 23, 12, 16, 15, 9, 29} is 15.*

```sql

```

## Query 4
**For customer and product** 
- [ ] find the month by which time, 75% of the sales quantities have been purchased. 

*Again,for this query, the “YEAR” attribute is not considered.*

*Another way to view this query is to pretend all 10,000 rows of sales data are from the same year.*

```sql
select * from sales;
```