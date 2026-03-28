
CREATE VIEW AX2009.BANKREMITTANCEFILESCUST_FileRimesseClientiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	FILEID,		-- IDFileRimesseClienti
	RECID,		-- PKFileRimesseClienti

	-- Dimensioni
	BANKACCOUNTID,		-- IDContoBancario
	CREATEDDATETIME,		-- DataOraCreazione

	-- Misure
	AMOUNTMST		-- ImportoEuro

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.BANKREMITTANCEFILESCUST;
GO

