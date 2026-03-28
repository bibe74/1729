
CREATE VIEW AX2009.LEDGERJOURNALTRANS_GiornaliRegistrazioneContabile_RigaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	JOURNALNUM,		-- IDGiornaleRegistrazioneContabile
	LINENUM,		-- NumeroRiga
	RECID,		-- PKGiornaleRegistrazioneContabile_Riga

	-- Dimensioni
	VENDTRANSID,		-- PKTransazioniFornitore
	PAYMENT		-- IDTerminiPagamento

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.LEDGERJOURNALTRANS;
GO

