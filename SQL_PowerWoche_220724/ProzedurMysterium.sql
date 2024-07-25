-- Erste Variante von einer Prozedur

-- Es wurde nix eingetragen
CREATE PROCEDURE spNewCustomer_Test
@CustomerID char(5) = '12345', @CompanyName varchar(40) = 'Hallo123',
@Country varchar(20) = 'GermanyGermanyGermany123', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test

SELECT * FROM Customers
GO

-- Versuch Nr.2
-- Es wurde nix eingetragen
CREATE PROCEDURE spNewCustomer_Test2
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(20), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test2 '12345', 'ppedv AG', 'GermanyGermanyGermany123', 'Berlin'
GO

-- Versuch Nr.3
CREATE PROCEDURE spNewCustomer_Test3
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(10), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test3 '12345', 'ppedv AG', 'GermanyGermanyGermany123', 'Berlin'