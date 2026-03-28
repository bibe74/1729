
CREATE VIEW AX2009.NPOPACKINGSLIPEXTERNAL_DDTTerzePartiView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	DELIVERYDATE,		-- DataDDT
	PACKINGCODE,		-- NumeroDDT
	RECID,		-- PKDDTTerzeParti

	-- Dimensioni
	REFDATAAREAID,		-- IDAziendaRiferimento
	DELIVERYNAME,		-- NomeConsegna
	DELIVERYADDRESS,		-- IndirizzoConsegna
	JOURNEYID,		-- IDViaggio
	DLVMODEID,		-- IDModalitaConsegna
	DELIVERYCOUNTY,		-- IDProvinciaConsegna
	DELIVERYCOUNTRYREGIONID,		-- IDNazioneConsegna
	DELIVERYSTATEID,		-- IDRegioneConsegna

	-- Misure
	WEIGHT		-- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOPACKINGSLIPEXTERNAL;
GO

