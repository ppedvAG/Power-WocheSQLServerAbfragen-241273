USE Northwind

-- CREATE / ALTER / DROP
-- INSERT / UPDATE / Delete

-- DDL (Data Definition Language)

-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate date NOT NULL,
	ProductID int not null
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen über ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufügen zu einer bestehenden Tabelle
ALTER TABLE PurchasingOrders
ADD TestDaten INT

-- Spalte aus der Tabelle entfernen
ALTER TABLE PurchasingOrders
DROP COLUMN TestDaten

-- INSERT - Hinzufügen von Datensätzen in die Tabelle


SELECT * FROM PurchasingOrders

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES('20240724', 3, 10)

-- Explizit Spalten befüllen
INSERT INTO PurchasingOrders
(OrderDate, ProductID) VALUES('20240724', 10)

-- Ergebnis einer SELECT-Abfrage können direkt Inserted werden
-- (Datentypen müssen kompatibel sein & Anzahl der Spalten)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 20, NULL


-- DELETE - Löschen von Datensätzen in einer Bestehenden Tabelle

DELETE FROM PurchasingOrders
WHERE ID = 3

-- Primär-/Fremdschlüsselbeziehungen verhinder das löschen von Datensätzen
-- weil sonst die Datensätze "ins leere laufen"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- UPDATE - Ändern von Spaltenwerten in einem vorhanden Datensatz

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 18
WHERE ID = 5

-- "Löschen" von Werten:
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 5

-- Transactions
BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 100

COMMIT --> Die Transaction ausführen bzw. die änderungen übernehmen
ROLLBACK --> Zurück zum Anfang wo ich die Transaction gestartet

--Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
--LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
--HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- Bonus: Aendere die Werte danach um, in eine Person die frei erfunden ist

SELECT * FROM Employees