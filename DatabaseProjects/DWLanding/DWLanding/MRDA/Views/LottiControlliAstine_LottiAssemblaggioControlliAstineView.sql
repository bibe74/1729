
CREATE VIEW MRDA.LottiControlliAstine_LottiAssemblaggioControlliAstineView
AS
SELECT
	-- Chiavi
	ID,		-- PKLottiAssemblaggioControlliAstine

	-- Dimensioni
	IDLottoControllo,		-- IDLottoAssemblaggioControllo
	CodiceAstina,		-- IDArticoloConfigurato
	LottoAstina		-- LottoAstina

FROM [SQL2014\SCADA2014].RaccoltaDatiAssemblaggio.dbo.LottiControlliAstine;
GO

