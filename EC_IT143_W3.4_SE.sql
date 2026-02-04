/*===============================================================
  EC_IT143_W3.4_SE
  AdventureWorks Q&A Script
  Author: Sakul Engama Nzoko
  Date: Jan 25, 2026
  Runtime Estimate: ~5 minutes total
===============================================================*/

-- Q1 (Author: SE) What are the five cheapest products in terms of list price?
SELECT TOP 5 Name, ListPrice
FROM Production.Product
WHERE ListPrice > 0
ORDER BY ListPrice ASC;

-- Q2 (Author: SE) Which product has the highest standard cost in the Product table?
SELECT TOP 1 Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;

-- Q3 (Author: Peer) Which three product categories generate the highest average list price compared to their standard cost?
SELECT TOP 3 pc.Name AS Category,
       AVG(p.ListPrice) AS AvgListPrice,
       AVG(p.StandardCost) AS AvgStandardCost,
       (AVG(p.ListPrice) - AVG(p.StandardCost)) AS AvgMargin
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE p.ListPrice > 0
GROUP BY pc.Name
ORDER BY AvgMargin DESC;

-- Q4 (Author: Peer) Show the top five customers by total order quantity.
SELECT TOP 5 c.CustomerID, p.FirstName, p.LastName, SUM(sod.OrderQty) AS TotalUnits
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
GROUP BY c.CustomerID, p.FirstName, p.LastName
ORDER BY TotalUnits DESC;

-- Q5 (Author: Peer) Touring bike sales in 2012 by month.
SELECT YEAR(soh.OrderDate) AS OrderYear,
       MONTH(soh.OrderDate) AS OrderMonth,
       SUM(sod.OrderQty) AS TotalQty,
       AVG(p.ListPrice) AS AvgListPrice,
       AVG(p.StandardCost) AS AvgStandardCost,
       SUM((p.ListPrice - p.StandardCost) * sod.OrderQty) AS NetRevenue
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE p.Name LIKE '%Touring Bike%'
  AND YEAR(soh.OrderDate) = 2012
GROUP BY YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY OrderMonth;

-- Q6 (Author: Peer) Helmet sales by size in Q4 2013.
SELECT MONTH(soh.OrderDate) AS OrderMonth,
       p.Size,
       SUM(sod.OrderQty) AS TotalQty,
       AVG(p.ListPrice) AS AvgListPrice,
       SUM((p.ListPrice - p.StandardCost) * sod.OrderQty) AS NetRevenue
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE p.Name LIKE '%Helmet%'
  AND YEAR(soh.OrderDate) = 2013
  AND DATEPART(QUARTER, soh.OrderDate) = 4
GROUP BY MONTH(soh.OrderDate), p.Size
ORDER BY OrderMonth;

-- Q7 (Author: SE) Which tables contain BusinessEntityID?
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'BusinessEntityID';

-- Q8 (Author: SE) List all views with "Sales" in their name.
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME LIKE '%Sales%';
