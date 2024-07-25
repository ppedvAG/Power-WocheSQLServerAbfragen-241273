USE Northwind

-- INTERSECT/EXCEPT -- Vergleichen Abfrageergebnisse von mehr als einer Abfrage

-- INTERSECT = Schnittmenge (gleiche Datensätzen) zweier Abfragen
SELECT * FROM Customers -- => 94 Rows
INTERSECT
SELECT * FROM Customers -- => 13 Rows
WHERE Country = 'Germany'

-- EXCEPT = Das gegenteil von Intersect

SELECT * FROM Customers -- => 94 Rows
EXCEPT
SELECT * FROM Customers -- => 13 Rows
WHERE Country = 'Germany'