
CREATE VIEW AX2009.CUSTINVOICELINE_FattureClienteTestoLibero_RigaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PARENTRECID,        -- PKFattureClienteTestoLibero
    LINENUM,        -- NumeroRiga
    RECID,        -- PKFattureClienteTestoLibero_Riga

    -- Dimensioni
    LEDGERACCOUNT,        -- IDContoCoGe
    DIMENSION,        -- IDAreaGeografica
    DIMENSION2_,        -- IDProdottoVendita
    DIMENSION3_,        -- IDProdottoAcquisto
    DIMENSION4_,        -- IDFaseDiGruppo
    DIMENSION5_,        -- IDInfraGruppo
    DIMENSION6_        -- IDMacroArea

FROM (
	SELECT
		DATAAREAID,
		PARENTRECID,
		LINENUM,
		RECID,
		LEDGERACCOUNT,
		DIMENSION,
		DIMENSION2_,
		DIMENSION3_,
		DIMENSION4_,
		DIMENSION5_,
		DIMENSION6_,
		ROW_NUMBER() OVER (PARTITION BY PARENTRECID, LINENUM ORDER BY AMOUNTCUR DESC, RECID DESC) AS rn

	FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.CUSTINVOICELINE
) CIL
WHERE CIL.rn = 1;
GO

