-- Cau 1
SELECT OrderID, OrderDate, ShippedDate
FROM Orders
WHERE YEAR(ShippedDate) = '1997' AND MONTH(ShippedDate) = '7'

SELECT OrderID, OrderDate, ShippedDate
FROM Orders
WHERE ShippedDate >= '1997-1-1' AND ShippedDate < '1997-4-1'

SELECT OrderID, OrderDate, ShippedDate
FROM Orders
WHERE ShippedDate >= '1997-7-1' AND ShippedDate < '1997-7-15'

-- Cau 2
SELECT 
	EmployeeID, 
	CONCAT(FirstName, ' ',LastName) FullName,
	BirthDate
FROM Employees

-- Cau 3
SELECT c.ContactName 'Customers ordered in 1997'
FROM Orders o
	INNER JOIN Customers c
		ON o.CustomerID = c.CustomerID
WHERE YEAR(OrderDate) = '1997'
GROUP BY c.ContactName

-- Cau 4
SELECT P.ProductName
FROM Products p
	INNER JOIN Suppliers s
		ON p.SupplierID = s.SupplierID
WHERE s.CompanyName = 'Exotic Liquids'

-- Cau 5
SELECT o.OrderID, p.ProductName, od.Quantity, od.UnitPrice, od.Discount
FROM Orders o
	INNER JOIN [Order Details] od
		ON o.OrderID = od.OrderID
	INNER JOIN Products p
		ON od.ProductID = p.ProductID

-- Cau 6
SELECT od.*
FROM [Order Details] od
	INNER JOIN Orders o
		ON od.OrderID = o.OrderID
WHERE o.OrderDate BETWEEN '1998-1-1' AND '1998-1-31'

-- Cau 7
SELECT *, UnitPrice * Quantity * (1-Discount) AS 'Price'
FROM [Order Details]

-- Cau 8
SELECT SUM(Price) Revenue, [Year]
FROM(
	SELECT	od.*, 
			od.UnitPrice * od.Quantity * (1-od.Discount) AS 'Price',
			YEAR(o.OrderDate) 'Year'
	FROM [Order Details] od
		INNER JOIN Orders o
			ON od.OrderID = o.OrderID
) AS [Orders Extend]
GROUP BY [Year]
ORDER BY Revenue ASC

SELECT SUM(Price) Revenue, [Quarter]
FROM(
	SELECT	od.*, 
			od.UnitPrice * od.Quantity * (1-od.Discount) AS 'Price',
			o.OrderDate,
			DATEPART(QUARTER, o.OrderDate) [Quarter]
	FROM [Order Details] od
		INNER JOIN Orders o
			ON od.OrderID = o.OrderID
	WHERE YEAR(o.OrderDate) = '1997'
) AS [Orders Extend]
GROUP BY [Quarter]
ORDER BY [Quarter] ASC

-- Cau 9
SELECT YEAR(OrderDate) AS [Year], COUNT(OrderID) AS 'Total Orders'
FROM Orders
GROUP BY YEAR(OrderDate)

-- Cau 10
SELECT	e.EmployeeID,
		CONCAT(e.FirstName, e.LastName) FullName,
		SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) Turnover
FROM Orders o
	INNER JOIN Employees e
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = '1997'
GROUP BY e.EmployeeID, CONCAT(e.FirstName, e.LastName)
ORDER BY e.EmployeeID ASC

