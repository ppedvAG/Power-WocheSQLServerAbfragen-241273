/*
	Datentypen in SQL: 3 große Datentyp gruppen


	1. Charakter/String Datentypen
	char(10)  =  'Hallo     ' = 10 Byte Speicherplatz = UTF 8
	nchar(10) = 'Hallo     ' = 20 Byte Speicherplatz = UTF 16

	varchar(10) = 'Hallo' = 5 Byte verbrauch = UTF 8
	nvarchar(10) = 'Hallo' = 10 Byte verbrauch = UTF 16

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2GB
	VARCHAR(8000) & nvarchar(4000) sind maximum

	2. Numerische Datentypen
	tinyint		8 Bit = 1 Byte = -255 - +255
	smallint    16 BIT = 2 Byte = -32k - +32k
	int			32 BIT = 4 Byte = -2,14Mrd - +2,14Mrd
	bigint		64 Bit = 8 Byte = -9,2 Trillionen - +9,2 Trillion

	bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool

	decimal(x, y) = x Ziffern insgesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern, davon sind 2 Nachkommastellen
	money = ca 9,2 Trillion
	smallmoney = 214 Tausend

	3. Datum/Zeit Datentypen

	time		= hh:mm:ss.nnnnnnn
	date		= YYYY-MM-DD
	datetime	= date + time in Millisekunden = YYYY-MM-DD hh:mm:ss.mmm
	datetime2	= YYYY-MM-DD hh:mm:ss.nnnnnnn
	smalldatetime = YYYY-MM-DD hh:mm:ss
*/