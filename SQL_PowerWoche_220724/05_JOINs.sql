USE Northwind

--Die Customers Tabell & die Orders Tabelle in einem Fenster ausgeben
SELECT * FROM Customers
SELECT * FROM Orders

/*

	JOIN SYNTAX:

	SELECT [Spalten] FROM [Tabelle A]
	INNER JOIN [Tabelle B] ON [Tabelle A].Key = [Tabelle B].Key

*/

SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Orders 
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID

-- Customers - Orders - Order Details
SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID


-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
-- Products - Order Details - Employees - Orders
SELECT DISTINCT ProductName FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE LastName = 'Leverling'

-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
-- Orders & Customers
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
-- Tabellen: [Order Details] - Products
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC


-- 4. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 5. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
SELECT * FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE Discontinued = 1

-- 6. Alle Bestellungen (Orders) aus den USA (Customers Country) die im Jahr 1997 aufgegeben wurden
-- (OrderDate in Orders)
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '19970101' AND '19971231'

-- Outer JOINS

-- LEFT:
SELECT * FROM Orders as o
LEFT JOIN Customers as cus ON o.CustomerID = cus.CustomerID

-- Right join
SELECT * FROM Orders as o
Right JOIN Customers as cus ON o.CustomerID = cus.CustomerID

-- JOIN "invertieren" d.h keine Schnittmenge anzeigen lassen, durch Filtern nach NULL
SELECT * FROM Orders as o
Right JOIN Customers as cus ON o.CustomerID = cus.CustomerID
WHERE o.OrderID IS NULL

-- FULL OUTER JOIN
SELECT * FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen (Tabella A x Tabelle B)
-- Orders Tabelle: 830; Customers Tabelle: 93
SELECT * FROM Orders CROSS JOIN Customers

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, 
E2.EmployeeID, E2.LastName as Mitarbeiter
FROM Employees as E1 
RIGHT JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo