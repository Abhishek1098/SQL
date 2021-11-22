# Sales Table for Assignments 1 & 2

Creating schema in PostgressSQL

To load the data into the 'sales' table:
1. Save file generate_sales_data.sql (e.g., download and save it to your local machine).
2. In a "Query Tool" window of "pgAdmin" (client app which is installed as part of PostgreSQL), click on the "folder" icon (for "Open File").
3. Choose the downloaded file ("load_sales_10000_table.sql"), and it will load the content of this file.
4. Click on "Execute" icon or hit the function key 5 (F5).

```sql
drop table if exists sales;

create table sales
(
	cust	varchar(20),
	prod	varchar(20),
	day		integer,
	month	integer,
	year	integer,
	state	char(2),
	quant	integer,
	date	date
);
insert into sales values ('Dan', 'Ham', 17, 6, 2016, 'PA', 825, '2016-06-17');
insert into sales values ('Claire', 'Fish', 28, 11, 2016, 'CT', 84, '2016-11-28');
insert into sales values ('Dan', 'Apple', 12, 11, 2017, 'CT', 973, '2017-11-12');
insert into sales values ('Chae', 'Jellies', 13, 10, 2016, 'NJ', 756, '2016-10-13');
insert into sales values ('Chae', 'Ham', 11, 4, 2017, 'NY', 464, '2017-04-11');
insert into sales values ('Mia', 'Fish', 25, 9, 2017, 'NJ', 56, '2017-09-25');
insert into sales values ('Mia', 'Dates', 15, 7, 2018, 'PA', 523, '2018-07-15');
insert into sales values ('Claire', 'Fish', 26, 11, 2018, 'CT', 763, '2018-11-26');
insert into sales values ('Dan', 'Butter', 4, 2, 2018, 'NJ', 419, '2018-02-04');
insert into sales values ('Sam', 'Jellies', 5, 7, 2020, 'PA', 156, '2020-07-05');
insert into sales values ('Wally', 'Cherry', 3, 4, 2020, 'CT', 664, '2020-04-03');
insert into sales values ('Chae', 'Apple', 2, 12, 2017, 'NJ', 567, '2017-12-02');
insert into sales values ('Helen', 'Butter', 28, 7, 2020, 'PA', 337, '2020-07-28');
insert into sales values ('Chae', 'Eggs', 2, 2, 2018, 'CT', 665, '2018-02-02');
insert into sales values ('Wally', 'Cherry', 29, 5, 2017, 'NY', 738, '2017-05-29');
insert into sales values ('Dan', 'Dates', 31, 5, 2019, 'CT', 484, '2019-05-31');
insert into sales values ('Chae', 'Dates', 17, 6, 2020, 'NJ', 584, '2020-06-17');
insert into sales values ('Dan', 'Grapes', 11, 9, 2018, 'CT', 966, '2018-09-11');
insert into sales values ('Wally', 'Ham', 18, 10, 2018, 'NY', 461, '2018-10-18');
insert into sales values ('Helen', 'Ham', 15, 11, 2019, 'CT', 392, '2019-11-15');
insert into sales values ('Helen', 'Grapes', 10, 12, 2018, 'PA', 545, '2018-12-10');
insert into sales values ('Claire', 'Grapes', 1, 10, 2017, 'CT', 477, '2017-10-01');
...
```