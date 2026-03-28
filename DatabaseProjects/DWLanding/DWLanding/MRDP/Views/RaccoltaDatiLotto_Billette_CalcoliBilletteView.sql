
CREATE VIEW MRDP.RaccoltaDatiLotto_Billette_CalcoliBilletteView
AS
SELECT
    -- Chiavi
    ID,        -- ID

    -- Dimensioni
	COALESCE(Turno, '') AS Turno,		-- Turno
	COALESCE(TurnoData, '19000101') AS TurnoData,		-- TurnoData
	COALESCE(TurnoDataMetra, '19000101') AS TurnoDataMetra,		-- TurnoDataMetra
    COALESCE(Lega, N'') AS Lega,        -- Lega
    COALESCE(IsCambioMatrice, 0) AS IsCambioMatrice,        -- IsCambioMatrice

    -- Misure
    COALESCE(KgNettiTaglio, 0.0) AS KgNettiTaglio,        -- KgNettiTaglio
    COALESCE(KgNettiImballo, 0.0) AS KgNettiImballo,        -- KgNettiImballo
    COALESCE(KgImballati, 0.0) AS KgImballati,        -- KgImballati
    COALESCE(KgImballatiAXPesa, 0.0) AS KgImballatiAXPesa,        -- KgImballatiAXPesa
    COALESCE(KgImballatiAXTeorico, 0.0) AS KgImballatiAXTeorico,        -- KgImballatiAXTeorico
    COALESCE(KgScartoCesoia, 0.0) AS KgScartoCesoia,        -- KgScartoCesoia
    COALESCE(SecondiFermo, 0) AS SecondiFermo,        -- SecondiFermo
    COALESCE(SecondiCiclo, 0) AS SecondiCiclo,        -- SecondiCiclo
    COALESCE(SecondiEstrusione, 0) AS SecondiEstrusione        -- SecondiEstrusione

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto_Billette;
GO

