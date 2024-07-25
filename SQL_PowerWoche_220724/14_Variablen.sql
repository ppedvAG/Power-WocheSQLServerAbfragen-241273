USE Northwind

DECLARE @OrderID int = 10250

SELECT * FROM Orders
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM Orders 
WHERE OrderID = @OrderID

-- Schleifen

-- WHILE
DECLARE @Counter INT = 0

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter = @Counter + 1
END

-- Endlosschleife
-- Aufpassen auf Computer
WHILE 1=1
BEGIN
SELECT 'Hallo'
END