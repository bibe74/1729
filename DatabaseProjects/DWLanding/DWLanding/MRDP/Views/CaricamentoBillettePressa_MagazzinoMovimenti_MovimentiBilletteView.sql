
CREATE VIEW MRDP.CaricamentoBillettePressa_MagazzinoMovimenti_MovimentiBilletteView
AS
SELECT
    -- Chiavi
    ID,        -- ID

    -- Dimensioni
    Colata,        -- Colata
    TipoAzione,        -- TipoAzione
    DataAzione,        -- DataOraAzione
    IDScaricoBilletta,        -- IDCaricoBillette_Scarico
    IDCaricoBilletta,        -- IDCaricoBillette_Carico

    -- Misure
    Qta        -- Qta

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.CaricamentoBillettePressa_MagazzinoMovimenti;
GO

