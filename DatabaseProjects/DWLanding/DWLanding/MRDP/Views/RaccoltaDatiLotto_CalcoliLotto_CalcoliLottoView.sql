
CREATE VIEW MRDP.RaccoltaDatiLotto_CalcoliLotto_CalcoliLottoView
AS
SELECT
    -- Chiavi
    ID,        -- ID

    -- Dimensioni
    DiametroBilletta,        -- DiametroBilletta
    PesoProfiloAlMetroMatrice,        -- PesoProfiloAlMetroMatrice

    -- Misure
    BarreTagliate,        -- BarreTagliate
    NumeroCeste,        -- NumeroCeste
    KgImballati,        -- KgImballati
    KgImballatiAXPesa,        -- KgImballatiAXPesa
    KgImballatiAXTeorico        -- KgImballatiAXTeorico

FROM [SQL2014\SCADA2014].RaccoltaDatiProduzione.dbo.RaccoltaDatiLotto_CalcoliLotto;
GO

