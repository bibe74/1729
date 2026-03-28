
CREATE VIEW IRDP.ScartiCesoia_ScartiCesoiaView
AS
SELECT
	-- Chiavi
	NumeroLotto,		-- NumeroLotto
	ID,		-- PKScartiCesoia

	-- Dimensioni
	TimeStamp,		-- DataOraScartoCesoia
	ScartoManuale,		-- IsScartoManuale

	-- Misure
	KgScartoCesoia		-- KgScartoCesoia

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.ScartiCesoia;
GO

