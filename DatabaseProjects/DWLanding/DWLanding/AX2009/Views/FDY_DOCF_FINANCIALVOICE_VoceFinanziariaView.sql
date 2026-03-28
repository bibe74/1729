
CREATE VIEW AX2009.FDY_DOCF_FINANCIALVOICE_VoceFinanziariaView
AS
SELECT
    -- Chiavi
    FDY_DOCF_VOCEFINANZIARIA,        -- IDVoceFinanziaria
    RECID,        -- PKVoceFinanziaria

    -- Dimensioni
    DESCRIPTION        -- VoceFinanziaria

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.FDY_DOCF_FINANCIALVOICE;
GO

