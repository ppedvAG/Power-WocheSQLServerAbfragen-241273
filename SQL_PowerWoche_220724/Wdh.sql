
-- Folgende vorgabe

CREATE TABLE Wiederholung
(
	datum date,
	umsatz float
)

BEGIN TRANSACTION
DECLARE @i int = 0
WHILE @i < 20000
BEGIN
	INSERT INTO Wiederholung VALUES
	(DATEADD(DAY, FLOOR(RAND()*1095), '20240725'), RAND() * 1000)
	SET @i += 1
END
COMMIT

SELECT * FROM Wiederholung

/*
	Verwende mithilfe von Dateigruppen und Partitionierung um die Umsätze zu unterteilen
	Bereiche: 0-300, 300-600, 600-1000

	Zum Schluss:
	Komprimieren der Tabelle "Wiederholung"

	Jeweils Keine,Row & Page Compression verwenden und folgendes Ausgeben:
	- CPU-Zeit
	- Lesevorgänge
*/

CREATE PARTITION FUNCTION pf_Wdh(float)
AS RANGE LEFT FOR VALUES(300, 600, 1000)

CREATE PARTITION SCHEME sch_Wdh
AS PARTITION pf_Wdh TO (Wdh1, Wdh2, Wdh3, Wdh4)

CREATE TABLE WiederholungSchema
(
	datum date,
	umsatz float
) ON sch_Wdh(umsatz)

SELECT $partition.pf_Wdh(1001)

-- Mehr Datensätze generieren für Kompression
INSERT INTO Wiederholung
SELECT * FROM Wiederholung
GO 8

SET STATISTICS time, IO on

-- CPU-Zeit = 390ms     
-- Lesevorgänge = 12676
SELECT * FROM Wiederholung

-- Row Compression
-- CPU-Zeit = 469ms
-- Lesevorgänge = 10124
SELECT * FROM Wiederholung

-- Page Compression
-- CPU-Zeit = 563ms
-- Lesevorgänge = 10121
SELECT * FROM Wiederholung
