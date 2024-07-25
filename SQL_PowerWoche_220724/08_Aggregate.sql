USE Northwind

-- Aggregatfunktionen: Führt eine Berechnung auf einer Menge von Werten durch und gibt einen einzigen Wert zurück

-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatfunktionen schon

-- 5 Grundsätzliche Funktion

SELECT 
SUM(Freight) AS Summe,
MIN(Freight) as Minimum,
MAX(Freight) as Maximum,
AVG(Freight) as Durchschnitt,
COUNT(ShippedDate) as ZähleRows, COUNT(*) as ZähleAlles
FROM Orders

-- AVG Selber berechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders

-- Lösung über GROUP BY
-- GROUP BY - Fasst mehrere Werte in Gruppen zusammen

SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

SELECT CustomerID, Freight FROM Orders
WHERE CustomerID = 'ALFKI'

SELECT CustomerID, ShipCountry, SUM(Freight) FROM Orders
GROUP BY CustomerID, ShipCountry

--Verkaufte Stueckzahlen pro Produkt, aber nur ueber 1000
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE SUM(Quantity) > 1000
GROUP BY ProductName
ORDER BY SummeStueckZahl desc


-- HAVING funktioniert 1zu1 dasselbe wie WHERE, kann aber aggregierte/gruppierte Werte nachträglich ändern
SELECT ProductName as Produkt, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckZahl desc

-- Übung
-- 1. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
SELECT CategoryName, SUM(Quantity) FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName

-- 2. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
SELECT LastName, FirstName, COUNT(OrderID) as Bestellungen FROM Employees
JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName, FirstName
ORDER BY Bestellungen DESC


-- 3. In welcher Stadt (City) waren „Wimmers gute Semmelknödel“ am beliebtesten (Quantity)?
SELECT TOP 1 City, SUM(Quantity) AS Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE ProductName = 'Wimmers gute Semmelknödel'
GROUP BY City
ORDER BY Verkaufsmenge DESC

-- 4. Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel Stück (Quantity)?
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998
GROUP BY ProductName
ORDER BY Verkaufsmenge DESC

-- 5 Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)
SELECT CompanyName, AVG(Freight) as AvgFreight FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName
ORDER BY AvgFreight