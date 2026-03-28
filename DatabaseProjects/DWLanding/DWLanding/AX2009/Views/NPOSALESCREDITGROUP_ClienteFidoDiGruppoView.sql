CREATE VIEW AX2009.NPOSALESCREDITGROUP_ClienteFidoDiGruppoView
AS
SELECT
    -- Chiavi
    SCG.CUSTOMERCODE,        -- IDCodiceCliente [enum TableGroupAll]
    SCG.CUSTOMERRELATION,        -- IDCliente
    SCG.DATEFROM,        -- DataInizioValidita
    SCG.DATETO,        -- DataFineValidita
    SCG.RECID,        -- PKClienteFidoDiGruppo

    -- Dimensioni
    SCG.REASONID,        -- IDCausaleFido

    -- Misure
    SCG.AMOUNT,        -- ImportoFido
    SCG.INSURANCEAMOUNT        -- ImportoFidoAssicurazione

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.NPOSALESCREDITGROUP SCG;
GO

