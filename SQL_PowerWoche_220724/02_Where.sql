USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM Orders
WHERE Freight = 100

-- ale boolsche Vergleichsoperatoren
-- (<, >, =, != bzw <>, <=, >=)

SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Orders
WHERE Freight < 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- AND = "Beide" Bedingungen "wahr" sein
-- OR = Ein Ausdruck muss wahr sein
-- Beliebig viel kombinieren

SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND ist stärker bindent als OR; Notfalls Klammern setzen!

SELECT * FROM Orders
WHERE Freight > 100 AND Freight < 500

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternative mit Between, Randwerte mit inbegriffen
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France' OR Country = 'Austria'

-- Kürzere Schreibweise => IN
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France', 'Austria')

-- Übungen:
-- 1. Alle ContactNames die als Title "Owner" haben
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Madrid, Berlin oder Brasilien
SELECT * FROM Customers
WHERE City IN ('Paris', 'Madrid', 'Berlin') OR Country = 'Brazil'

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France'

-- 4. Alle Kunden die eine Fax Nummer haben
SELECT * FROM Customers
WHERE Fax != 'NULL'

-- alternative

SELECT * FROM Customers
WHERE Fax IS NULL

SELECT * FROM Customers
WHERE Fax IS NOT NULL
