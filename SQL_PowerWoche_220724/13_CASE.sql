USE Northwind

-- CASE - unterscheiden wir definierte Fälle, die die Ausgabe abändern

-- Wenn ein Fall gefunden wird, dann passiert XYZ, wenn nichts dann NULL
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock > 20 THEN 'Lager ist ausreichend!'
	WHEN UnitsInStock < 20 THEN 'Lager ist nicht ausreichend!'
END as Pruefung
FROM Products


-- Alternativ mit ELSE einen "Notausgang"
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock > 20 THEN 'Lager ist ausreichend!'
	WHEN UnitsInStock < 20 THEN 'Lager ist nicht ausreichend!'
	ELSE 'Fehler!'
END as Pruefung
FROM Products

-- Funktioniert auch mit dem UPDATE:
UPDATE Customers
SET City =
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END


SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 20 THEN 'Nachbestellen!'
	WHEN UnitsInStock > 20 THEN 'Ausreichend'
	ELSE 'Fehler'
END as Pruefung
FROM Products
GROUP BY
CASE
	WHEN UnitsInStock < 20 THEN 'Nachbestellen!'
	WHEN UnitsInStock > 20 THEN 'Ausreichend'
	ELSE 'Fehler'
END