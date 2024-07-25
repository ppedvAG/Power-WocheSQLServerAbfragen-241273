-- Einmal per code die datenbank ansprechen
-- Einmal per Dropdown menü die datenbank ansprechen
USE Northwind


-- SELECT [Spalte1] FROM [Table]

-- Ich möchte die Spalte CompanyName von der Tabelle Customers aufrufen
SELECT CompanyName FROM Customers

/*
	SELECT: wählt Spalten aus, die im Ergebnisfenster
	angezeigt werden sollen
*/

SELECT * FROM Customers -- wählt mir alle Spalten aus der Tabelle Customers aus

-- Einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentar
*/

-- "Custom"-Werte und mathematische Operatoren benutzen
SELECT 100, 500, 1000

SELECT 'Hallo', 100

SELECT 100 + 5, 5 * 5

-- SQL ist nicht Case-sensitive
sElEcT			cOuNtry,

		ComPanYName
FrOm				CusTomeRs

SELECT * FROM [Order Details]



-- ORDER BY: Spalten sortieren
SELECT * FROM Customers
ORDER BY City ASC


SELECT * FROM Customers
ORDER BY City DESC
-- Order BY sortiert immer
-- ORDER BY steht syntaktisch immer Ende
-- DESC = descending = absteigend
-- ASC (default) = ascending = aufsteigend

SELECT City, CompanyName FROM Customers
--		 Z-A			A-Z
ORDER BY City DESC, CompanyName ASC


SELECT City, CompanyName FROM Customers
ORDER BY 1 DESC, 2 ASC


-- TOP X gibt nur die X obersten Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT * FROM Customers

SELECT TOP 100 * FROM Customers

-- Geht auch Prozentual
-- TOP X Percent
SELECT TOP 10 PERCENT * FROM Customers

/*
	1. Die 20 kleinsten Frachtkosten haben

	2. Die 20 größten Frachtkosten haben
	Tabelle: Orders 
*/

-- 1.
SELECT TOP 10 * FROM Orders
ORDER BY Freight

-- 2.
SELECT TOP 10 * FROM Orders
ORDER BY Freight DESC

--SELECT BOTTOM 10 * FROM Orders
--ORDER BY Freight
/*
	Wichtig!: "Bottom" X existiert nicht, Ergebnisse einfach umdrehen mit Order By
*/


SELECT Country from Customers
-- Duplikate "filtern" mit DISTINCT
-- Der filtert alle Datensätze deren Werte exakt gleich sind

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

-- UNION führt mehrere Ergebnistabellen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein + Datentypen müssen Kompatibel sein

SELECT * FROM Customers
UNION
SELECT * FROM Customers

-- mit UNION ALL wird KEIN Distinct ausgeführt
SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

SELECT 100, 'Hallo'
UNION
SELECT 'Hallo', 500

SELECT 100, 'Hallo', 100
UNION
SELECT 'Hallo', 500

-- Geht wiederrum
SELECT 100, 'Hallo'
UNION
SELECT 500, 'Hallo'


-- Aliase / AS
SELECT 100 as Zahl, 'Hallo' as Begrüßung