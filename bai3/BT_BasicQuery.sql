--Cau 1
SELECT *
FROM Customers

SELECT COUNT(CustomerID) 'Customers Count' 
FROM Customers

--Cau 2
SELECT *
FROM Categories

SELECT COUNT(CategoryID) 'Categories Count'
FROM Categories

SELECT c.CategoryName, COUNT(p.ProductID) 'Products Count'
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName

-- Cau 3
SELECT * 
FROM Employees

SELECT COUNT(EmployeeID) 'Employee Count'
FROM Employees

SELECT *
FROM Employees
WHERE Title = 'Sales Manager'

-- Cau 4
SELECT *
FROM Suppliers

SELECT COUNT(SupplierID) 'Suppliers Count'
FROM Suppliers

-- Cau 5
SELECT YEAR(OrderDate) 'Orders Year'
FROM Orders
GROUP BY YEAR(OrderDate)

-- Cau 6	
SELECT Country 
FROM Customers
GROUP BY Country
ORDER BY Country

SELECT Country
FROM Suppliers
GROUP BY Country
ORDER BY Country

-- Cau 7
SELECT *
FROM Customers
WHERE Fax IS NULL

-- Cau 8
SELECT *
FROM Customers
WHERE Country = 'France'

SELECT *
FROM Customers
WHERE Country = 'France' OR Country = 'Spain'

-- Cau 9
SELECT *
FROM Customers
WHERE Country != 'Mexico' AND Country != 'Argentina' AND Country != 'Brazil' AND Country != 'Venezuela' AND Country != 'USA' AND Country != 'Canada' 

-- Cau 10
SELECT *
FROM Orders
WHERE YEAR(OrderDate) = '1997'

-- Cau 11
SELECT TOP 3 *
FROM Orders
ORDER BY OrderDate DESC

-- Cau 12
SELECT *
FROM Orders
WHERE Freight > 100

SELECT TOP 1 *
FROM Orders
ORDER BY Freight

SELECT TOP 1 *
FROM Orders
ORDER BY Freight DESC

-- Cau 13
SELECT COUNT(OrderID) 'Order Count in 1996'
FROM Orders
WHERE YEAR(OrderDate) = '1996'

SELECT COUNT(OrderID) 'Order Count in 1997'
FROM Orders
WHERE YEAR(OrderDate) = '1997'

SELECT COUNT(OrderID) 'Order Count in 1996 and 1997'
FROM Orders
WHERE YEAR(OrderDate) = '1996' OR YEAR(OrderDate) = '1997'

-- Cau 14
SELECT AVG(UnitPrice) 'Average price'
FROM Products

SELECT ProductID, AVG(UnitPrice) 'Average price'
FROM Products
WHERE ProductID = 8
GROUP BY ProductID


-- Cau 15
SELECT TOP 3 *
FROM Products
ORDER BY UnitPrice DESC

-- Cau 16
SELECT *
FROM Products
WHERE ProductName LIKE 'n%'

SELECT *
FROM Products
WHERE ProductName LIKE 'n%' OR ProductName LIKE 'a%'

SELECT *
FROM Products
WHERE ProductName LIKE '[^n]%'

SELECT *
FROM Products
WHERE ProductName LIKE '[^an]%'

-- Cau 17
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 100 AND 200


-- Cau 18
SELECT *
FROM Products
WHERE UnitsInStock < ReorderLevel

-- Cau 19
SELECT COUNT(ProductID) 'Products Count'
FROM Products
WHERE SupplierID = 4

