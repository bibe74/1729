
CREATE VIEW RRDP.RaccoltaDatiLotto_Billette_CalcoliBilletteView
AS
SELECT
	-- Chiavi
	ID,		-- ID

	-- Dimensioni
	COALESCE(Turno, '') AS Turno,		-- Turno
	COALESCE(TurnoData, '19000101') AS TurnoData,		-- TurnoData
	COALESCE(TurnoDataMetra, '19000101') AS TurnoDataMetra,		-- TurnoDataMetra

	-- Misure
	COALESCE(KgNettiTaglio, 0.0) AS KgNettiTaglio,		-- KgNettiTaglio
	COALESCE(KgNettiImballo, 0.0) AS KgNettiImballo,		-- KgNettiImballo
	COALESCE(SecondiFermo, 0) AS SecondiFermo		-- SecondiFermo

FROM [SQL2014MRAG\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto_Billette;
GO

