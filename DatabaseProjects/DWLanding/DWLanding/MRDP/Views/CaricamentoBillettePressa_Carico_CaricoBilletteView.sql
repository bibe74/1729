
CREATE VIEW MRDP.CaricamentoBillettePressa_Carico_CaricoBilletteView
AS
SELECT
    -- Chiavi
    ID,        -- IDCaricoBillette

    -- Dimensioni
    Ingresso        -- Ingresso

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.CaricamentoBillettePressa_Carico;
GO

