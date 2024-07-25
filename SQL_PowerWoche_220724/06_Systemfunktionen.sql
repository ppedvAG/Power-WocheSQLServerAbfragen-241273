USE Northwind

-- String Funktionen bzw. Text-Datentypen manipulierungen

-- LEN(Spalte) gibt die länge des Strings zurück als INT
SELECT CompanyName, LEN(CompanyName) as Länge FROM Customers

-- LEFT/RIGHT geben die "linken" bzw. "rechten" X Zeichen von einem String zurück
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zu Position x in einem String und gibt y Zeichen aus
SELECT SUBSTRING(CompanyName, 5, 7), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x
-- mit "replace" Wert (optional)
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX'), Phone
FROM Customers

-- CONCAT fügt mehrere Strings in die Selbe spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName) FROM Employees
SELECT FirstName + ' ' + LastName FROM Employees

-- Datumsfunktionen
SELECT CURRENT_TIMESTAMP
SELECT GETDATE() -- aktuelle Systemzeit mit Zeitstempel

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) AS Tag,
OrderDate FROM Orders

-- "DATEPART"
SELECT
DATEPART(YEAR, OrderDate) AS Jahr,
DATEPART(QUARTER, OrderDate) AS Quartal,
DATEPART(WEEK, OrderDate) AS KW,
DATEPART(WEEKDAY, OrderDate) AS Wochentag
FROM Orders

-- DATENAME
SELECT
DATENAME(MONTH, OrderDate), 
DATENAME(WEEKDAY, OrderDate),
OrderDate FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall
SELECT DATEDIFF(YEAR, '20050213', GETDATE()), GETDATE()
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()) FROM Orders

-- Übungen:
-- 1. Alle Bestellungen (Orders) aus Q2 in 1997
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- 2. Alle Produkte (ProductName) die um Weihnachten herum (+-10 Tage) in
-- 1996 verkauft wurden
SELECT ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN '19961214' AND '19970103'

-- Oder..
SELECT ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN DATEADD(DAY, -10, '19961224') AND DATEADD(DAY, 10, '19961224')

-- 3. Welches Produkt (ProductName) hatte die groeßte Bestellmenge (Quantity in OD) im Februar 1998?
SELECT TOP 1 ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE YEAR(OrderDate) = 1998 AND MONTH(OrderDate) = 2
ORDER BY Quantity DESC

-- 4. Wieviele Bestellungen kamen aus Spain (Customers) in Quartal 2 1997?
--   Sind es mehr oder weniger als aus Frankreich? (2. Abfrage)
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Spain' AND DATEPART(Quarter, OrderDate) = 2
AND DATEPART(YEAR, OrderDate) = 1997

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'France' AND DATEPART(Quarter, OrderDate) = 2
AND DATEPART(YEAR, OrderDate) = 1997

-- BONUS: Gab es Bestellungen (OrderID) an Wochenendtagen (OrderDate)?
SELECT OrderID, DATEPART(WEEKDAY, OrderDate) as Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN(6, 7)
ORDER BY Wochentag DESC

-- CAST und CONVERT, wandeln Datentypen in der AUSGABE um
-- => konvertierung von datetime in date
SELECT CAST(OrderDate as date) FROM Orders
SELECT CONVERT(smalldatetime, OrderDate) FROM Orders

-- ISNULL prüft auf Null Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers

-- Komplexere Datumskonvertierung mit Formatierung kombiniert + Unterabfrage
SELECT FORMAT((SELECT CONVERT(DATE, '20050213')), 'D', 'zh-cn')

-- REPLACE(x, y, z) => y sucht in dem x string um Ihn mit z zu ersetzen
SELECT REPLACE('Hallo Welt', 'Welt', 'und Willkommen!')

-- REPLICATE(x, y) => Setze y Zeichen vor die x Spalte "Phone"
SELECT REPLICATE('0', 3) + Phone FROM Customers

-- REVERSE => Dreht die Zeichenketten um
SELECT CompanyName, REVERSE(CompanyName) FROM Customers

-- LOWER
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- UPPER
SELECT CompanyName, UPPER(CompanyName) FROM Customers

