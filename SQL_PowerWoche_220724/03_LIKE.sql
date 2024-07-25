USE Northwind
-- LIKE: Für ungenaue Filterung/Suche können wir LIKE verwenden
-- (statt Vergleichsoperatoren kommt LIKE)

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- Wildcards
-- "%"-Zeichen: Beliebig viele Symbole, beliebig viel
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- "_"-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- "[]"-Zeichen: Alles in den Klammern ist ein gültiges Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[012345]%'

-- "[a-z]" oder Gegenteil mit ^ [^a-z]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0-5]%'

SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^123]%'

-- Sonderfälle: % '
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- 1. Postleitzahl suchen:
-- erste Stelle: 1-5
-- zweite Stelle: a-g

SELECT PostalCode from Customers
WHERE PostalCode LIKE '[1-5 a-g]%'

SELECT CompanyName FROM Customers
WHERE CompanyName LIKE 'Al_%'