
CREATE VIEW IRDP.RaccoltaDatiTaglierina_DatiIncestamentoView
AS
SELECT
	-- Chiavi
	ID,		-- PKDatiIncestamento

	-- Dimensioni
	LunghezzaTagliata,		-- LunghezzaTagliata
	NumeroLotto,		-- NumeroLotto
	NumeroCesta,		-- NumeroCesta
	Tipo,		-- Tipo

	-- Misure
	Qta		-- Qta

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.RaccoltaDatiTaglierina;
GO

