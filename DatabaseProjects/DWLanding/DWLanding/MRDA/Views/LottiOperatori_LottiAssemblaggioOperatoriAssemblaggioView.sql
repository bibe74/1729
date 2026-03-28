CREATE VIEW MRDA.LottiOperatori_LottiAssemblaggioOperatoriAssemblaggioView
AS
SELECT
	-- Chiavi
	ID,		-- PKLottiAssemblaggioOperatoriAssemblaggio

	-- Dimensioni
	IDLotto,		-- IDLottoAssemblaggio
	IDOperatore		-- IDOperatoreAssemblaggio

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiOperatori;
GO

