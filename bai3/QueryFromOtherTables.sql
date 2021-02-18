SELECT 
	ProductID,
	COUNT(OrderID) 'Orders Count',
	SUM((1-Discount)*UnitPrice*Quantity) Sales
FROM [Order Details]
GROUP BY ProductID
ORDER BY Sales DESC

SELECT 
	od.ProductID, 
	p.ProductName,
	COUNT(od.OrderID) 'Orders Count',
	SUM((1- od.Discount) * od.UnitPrice * od.Quantity) Sales 
FROM [Order Details] od
	LEFT JOIN Products p ON p.ProductID = od.ProductID
GROUP BY od.ProductID, p.ProductName
ORDER BY Sales DESC

SELECT 
	od.ProductID,
	p.ProductName,
	s.CompanyName Suplier,
	COUNT(od.OrderID) 'Orders Count',
	SUM((1- od.Discount) * od.UnitPrice * od.Quantity) Sales 
FROM [Order Details] od
	LEFT JOIN Products p ON p.ProductID = od.ProductID
	LEFT JOIN Suppliers s ON s.SupplierID = p.SupplierID
GROUP BY od.ProductID, p.ProductName, s.CompanyName
ORDER BY Sales DESC

SELECT Suplier,Sales
FROM
(SELECT 
	od.ProductID,
	p.ProductName,
	s.CompanyName Suplier,
	COUNT(od.OrderID) 'Orders Count',
	SUM((1- od.Discount) * od.UnitPrice * od.Quantity) Sales 
FROM [Order Details] od
	LEFT JOIN Products p ON p.ProductID = od.ProductID
	LEFT JOIN Suppliers s ON s.SupplierID = p.SupplierID
GROUP BY od.ProductID, p.ProductName, s.CompanyName) AS SalesView


SELECT Suplier, Sum(Sales)
FROM
(SELECT 
	od.ProductID,
	p.ProductName,
	s.CompanyName Suplier,
	COUNT(od.OrderID) 'Orders Count',
	SUM((1- od.Discount) * od.UnitPrice * od.Quantity) Sales 
FROM [Order Details] od
	LEFT JOIN Products p ON p.ProductID = od.ProductID
	LEFT JOIN Suppliers s ON s.SupplierID = p.SupplierID
GROUP BY od.ProductID, p.ProductName, s.CompanyName) AS SalesView
GROUP BY Suplier
ORDER BY SUM(Sales) DESC