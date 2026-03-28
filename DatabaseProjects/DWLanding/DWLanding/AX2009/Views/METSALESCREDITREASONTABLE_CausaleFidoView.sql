
CREATE VIEW AX2009.METSALESCREDITREASONTABLE_CausaleFidoView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    REASONID,        -- IDCausaleFido
    RECID,        -- PKCausaleFido

    -- Misure
    DESCRIPTION        -- CausaleFido

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.METSALESCREDITREASONTABLE;
GO

