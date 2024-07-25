-- 1. Alle Produkte der Category "Beverages"
SELECT ProductName FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Beverages'

-- 2. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht mehr verkauft werden (Discontinued)? 
--Wenn ja, wieviel „Geld“ liegt dort noch im Lager?
SELECT ProductName, UnitPrice * UnitsInStock as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0
ORDER BY Wert

-- 3. Bestellungen die Herr King bearbeitet hat
SELECT * FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE LastName = 'King'

SELECT * FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE Employees.EmployeeID = 7

-- 4. Die 10 größten ProductNames vom UnitPrice
SELECT TOP 10 * FROM Products
ORDER BY UnitPrice DESC

-- 5. Alle ShipPostalCode's anzeigen lassen, die mit 0,2,4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'




--Erstellen Sie einen Bericht, der die Gesamtzahl der 
--Bestellungen nach Kunde seit dem 31. Dezember 1996 anzeigt. 
--Der Bericht sollte nur Zeilen zurückgeben, 
--für die die Gesamtzahl der Aufträge größer als 15 ist (5 Zeilen)
SELECT CustomerID, COUNT(OrderID) FROM Orders
WHERE OrderDate > '19961231'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY 2

-- 1. Ist der Spediteur „Speedy Express“ 
-- über die Jahre durchschnittlich teurer geworden? (Freight pro Jahr)
SELECT CompanyName, DATEPART(YEAR,OrderDate) as Geschaeftsjahr, AVG(Freight) FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE CompanyName = 'Speedy Express'
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)


-- 2. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
-- „Seafood“ (Categories) verkauft?
-- Wenn ja, wieviel Lieferkosten sind 
-- dabei insgesamt entstanden (Freight)?
-- Das ganze mit Temporaere Tabellen machen

SELECT SUM(Freight) as Lieferkosten
INTO #TempTable
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE LastName = 'Fuller' AND CategoryName = 'Seafood'

SELECT * FROM #TempTable
GO

-- Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
-- Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) = RechnungsSumme.
CREATE PROCEDURE sp_RechnungsSumme @OrderID INT
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) as RechnungsSumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID
go

exec sp_RechnungsSumme 10250

SELECT SUM(Quantity * UnitPrice + Freight) - (Freight * (Count([Order Details].OrderID) - 1)) 
as Rechnungssumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = 10250
GROUP BY Freight

SELECT (Freight + SUM(Quantity * UnitPrice))
as Rechnungssumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = 10250
GROUP BY Freight

--„Zensiere“ alle Telefonnummern der Kunden (Phone): 
--Es sollen immer nur noch die letzten 4 Ziffern/Symbole angezeigt werden. 
--Alles davor soll mit einem X pro Symbol ersetzt werden.
--Beispiel: Phone „08677 9889 0“; danach „XXXXXXXX89 0“
SELECT STUFF(Phone, 1, LEN(Phone) - 4, REPLICATE('X', LEN(Phone)- 4)) FROM Customers

SELECT COUNT(*), COUNT(Fax) FROM Customers
SELECT Fax FROM Customers

--TRUNCATE TABLE [TABELLE]
