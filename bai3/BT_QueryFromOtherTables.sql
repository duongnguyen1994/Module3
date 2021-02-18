-- Cau 1
SELECT	EmployeeID,
		CONCAT(FirstName, LastName) FullName,
		DATEDIFF(yyyy, BirthDate, GETDATE()) AS Age
FROM Employees

SELECT o.CustomerID, c.CompanyName, SUM(Freight) TotalFreight
FROM Orders o
	INNER JOIN Customers c
	ON o.CustomerID = c.CustomerID
WHERE	(c.Country = 'France' OR c.Country = 'Spain') 
		AND YEAR(o.OrderDate) = 1997 
		AND (DATEPART(QUARTER,o.OrderDate) = 3 OR DATEPART(QUARTER,o.OrderDate) = 4)
GROUP BY o.CustomerID, c.CompanyName

-- Cau 2
SELECT	c.CustomerID,
		c.CompanyName,
		SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) Total
FROM Orders o
	INNER JOIN Customers c
	ON o.CustomerID = c.CustomerID
	INNER JOIN [Order Details] od
	ON od.OrderID = o.OrderID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY c.CustomerID,c.CompanyName

-- Cau 6
SELECT	e.EmployeeID,
		CONCAT(e.FirstName,' ', e.LastName) FullName,
		SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) Total
FROM Employees e
	INNER JOIN Orders o
	ON e.EmployeeID = o.EmployeeID
	INNER JOIN [Order Details] od
	ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY EmployeeID ASC

-- Cau 7
SELECT	p.ProductID,
		p.ProductName,
		SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) Total
FROM [Order Details] od
	INNER JOIN Products p
	ON od.ProductID = p.ProductID
	INNER JOIN Orders o
	ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY p.ProductID, p.ProductName

SELECT	p.ProductID,
		p.ProductName,
		DATEPART(QUARTER,o.OrderDate) [Quarter],
		SUM(od.UnitPrice * od.Quantity * (1-od.Discount)) Total
FROM [Order Details] od
	INNER JOIN Products p
	ON od.ProductID = p.ProductID
	INNER JOIN Orders o
	ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY p.ProductID, p.ProductName,DATEPART(QUARTER,o.OrderDate)

-- Cau 8
SELECT	Country,
		COUNT(CustomerID) [Count]
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID)>=3

-- Cau 9
SELECT TOP 1 *
FROM Products
ORDER BY UnitsInStock DESC

-- Cau 10
SELECT	TOP 1 c.CustomerID,
		SUM(od.Quantity) TotalQuantity
FROM Customers c
	INNER JOIN Orders o
	ON o.CustomerID = c.CustomerID
	INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY c.CustomerID
ORDER BY SUM(od.Quantity) DESC


SELECT	
		MAX(TotalQuantity) TotalQuantity,
		[Year]
FROM(
SELECT	c.CustomerID,
		SUM(od.Quantity) TotalQuantity,
		YEAR(o.OrderDate) [Year]
FROM Customers c
	INNER JOIN Orders o
	ON o.CustomerID = c.CustomerID
	INNER JOIN [Order Details] od
	ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, o.OrderDate
) AS TEST
GROUP BY [Year]





