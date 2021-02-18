SELECT *
FROM Customers

SELECT TOP 10 CustomerID,ContactName, City, Country,Phone
FROM Customers

SELECT *
FROM Orders

SELECT *
FROM Orders
WHERE CustomerID = 'ALFKI'

SELECT TOP 1 *
FROM [Order Details]

SELECT ProductID, COUNT(OrderID) 'Orders Count'
FROM [Order Details]
GROUP BY ProductID

SELECT 
	ProductID,
	COUNT(OrderID) 'Orders Count',
	SUM((1 - Discount) * UnitPrice * Quantity) 'Sale'
FROM [Order Details]
GROUP BY ProductID
ORDER BY Sale DESC