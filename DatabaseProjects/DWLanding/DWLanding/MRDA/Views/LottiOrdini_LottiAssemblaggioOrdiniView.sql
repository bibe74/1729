
CREATE VIEW MRDA.LottiOrdini_LottiAssemblaggioOrdiniView
AS
SELECT
	-- Chiavi
	ID,		-- PKLottiAssemblaggioOrdini

	-- Dimensioni
	IDLotto,		-- IDLottoAssemblaggio
	OrdineProduzione,		-- OrdineProduzione
	OrdineCliente,		-- OrdineCliente

	-- Misure
	Qta		-- Qta

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiOrdini;
GO

