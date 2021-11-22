/*    bookstorenorm.sql    */

drop table if exists Customer;

create table Customer as 
select distinct customer_numb, customer_name, customer_street, customer_zip, customer_phone, customer_email
from BOOKORDER;

drop table if exists Order_t;

create table Order_t as
select distinct customer_numb, order_numb, order_date, order_filled
from BOOKORDER;

drop table if exists Credit_Card;

create table Credit_Card as
select distinct customer_numb, credit_card_numb, credit_card_exp_date
from BOOKORDER;

drop table if exists Books;

create table Books as
select distinct isbn, quantity, buy_price, author_name, title, publisher_name, book_supplier_numb, retail_price
from BOOKORDER;

drop table if exists Publishers;

create table Publishers as
select distinct publisher_name, publication_year
from BOOKORDER;