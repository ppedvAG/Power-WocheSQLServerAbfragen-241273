USE Northwind
GO

-- Stored Procedures / gespeicherte Prozeduren
/*
	-- Sind gespeichert SQL Abfragen (nicht nur SELECT, sondern alles andere)
	-- Arbeiten mit Variablen
	-- Praktisch zum "automatisieren" von Code
	-- Prozeduren verwenden immer wieder ihren Ausführungsplan
*/

CREATE PROCEDURE spRechnungsByOrderID @OrderID INT
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID
GO

-- Prozedur ausführen
EXEC spRechnungsByOrderID 10250
GO

CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer 'ALDIS', 'ppedv AG', 'Germany', 'Burghausen'
EXEC spNewCustomer LIDLI, TestGmbH, Germany, Burghausen

SELECT * FROM Customers
WHERE CustomerID = 'ALDIS'
GO

-- Default Werte
CREATE PROCEDURE spKundenNachLandCity 
@Country varchar(50) = 'Germany', @City varchar(50) = 'Berlin'
AS
SELECT * FROM Customers
WHERE Country = @Country AND City = @City
GO

EXEC spKundenNachLandCity France, Paris

-- Füge einen Datensatz in die Tabelle Customers hinzu, wo die Country mehr als 15 Zeichen hat
-- Aber die Variable @Country hat 50 Zeichen