USE Northwind

-- Subqueries / nested queries/ Unterabfragen

/*
	- Müssen eigenständig funktionieren
	- Können generell überall eingebaut werden (wenn es Sinn macht)
	- Abfragen die von "innen nach außen" der Reihe nach ausgeführt werden

*/

SELECT AVG(Freight) FROM Orders -- 78,2442

SELECT * FROM Orders
WHERE Freight > 78.2442

-- Lösung -> Unterabfrage
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, Stückpreis) mit einem überdurchschnittlichen Preis zu erhalten.
SELECT ProductID,ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice DESC
