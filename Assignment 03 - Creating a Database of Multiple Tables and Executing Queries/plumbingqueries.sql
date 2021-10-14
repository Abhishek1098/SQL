/*10.1*/
SELECT ProductName
FROM product;

SELECT OrderDate
FROM orders;

SELECT *
FROM product;

SELECT ProductID, ProductName, UnitsOnOrder * 1.0 / UnitsInStock
FROM product;


/*10.3*/
SELECT ProductName
FROM product
WHERE UnitPrice < 50;

SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM product
WHERE UnitsOnOrder >= .4 * UnitsInStock;

SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM product
WHERE UnitsOnOrder >= .4 * UnitsInStock AND UnitsOnOrder <= 10;

SELECT FirstName, LastName, City, State
FROM customer
WHERE State != "NJ";

SELECT FirstName, LastName, City, State
FROM customer
WHERE State != "NJ" OR FirstName == "Robert";


/*10.5*/
SELECT *
FROM orderdetail
INNER JOIN product
ON orderdetail.ProductID = product.ProductID;

SELECT orderdetail.OrderID, orderdetail.ProductID, orderdetail.Quantity, product.ProductName, product.UnitPrice
FROM orderdetail
INNER JOIN product
ON orderdetail.ProductID = product.ProductID;

SELECT orderdetail.OrderID, orderdetail.ProductID, orderdetail.Quantity, product.ProductName, product.UnitPrice
FROM orderdetail
INNER JOIN product
ON orderdetail.ProductID = product.ProductID AND product.UnitPrice >= 1000;

SELECT orderdetail.Quantity, product.ProductName, product.UnitsInStock
FROM orderdetail
INNER JOIN product
ON orderdetail.ProductID = product.ProductID AND orderdetail.Quantity >= .5*product.UnitsInStock;



/*10.7*/

/*10.10*/

/*10.12*/

/*10.15*/

/*10.17*/
