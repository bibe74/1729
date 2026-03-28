
CREATE VIEW AX2009.NPOINVENTTRANSFERPACKINGS20089_DDTCliente_DatiConsegnaView
AS
SELECT
	-- Chiavi
	DATAAREAID,		-- IDAzienda
	DELIVERYDATE,		-- DataDDT
	INVENTPACKINGSLIPID,		-- NumeroDDT
	RECID,		-- PKDDTCliente_DatiConsegna

	-- Dimensioni
	TRANSFERID,		-- OrdineCliente
	DELIVERYNAME,		-- NomeConsegna
	DELIVERYADDRESS,		-- IndirizzoConsegna
	DLVMODE,		-- IDModalitaConsegna
	JOURNEYID,		-- IDViaggio
	REFDATAAREAID,		-- IDAziendaRiferimento

	-- Misure
	WEIGHT		-- QtaKg

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOINVENTTRANSFERPACKINGS20089;
GO

