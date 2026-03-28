
CREATE VIEW AXBETA.PROJTABLE_TargaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    PROJID,        -- IDTarga
    RECID,        -- PKTarga

    -- Dimensioni
    NAME,        -- Nome
    NPOCRMACQUISITION,        -- IDAcquisitoMetra [enum NPOCrmNoYes]
    NPOCRMCONTRACTACQUIRED,        -- IDCapitolatoDisegniMetra [enum NPOCrmNoYes]
    NPOCRMCONTRACTTYPE,        -- IDTipoAppalto [enum NPOCrmPublicPrivate]
    NPOCRMSTATUS,        -- IDStato [enum NPOCrmProjStatus]
    NPOCRMYEAREND,        -- AnnoPresuntoRealizzazione
    NPOCRMEMPLNAME_MAP,        -- NomeMAP
    NPOCRMEMPL_MAP,        -- MAP
    NPOCRMCREATEDDATETIME,        -- DataOraCreazione
    NPOCRMMODIFIEDDATETIME,        -- DataOraModifica
    NPOCRMACQUISITIONFAILCAUSE        -- IDCausaFallimento [enum NPOCrmAcquisitionFailCause]

FROM [AXBETA\AXBETA].AX2009_METRA_BETA.dbo.PROJTABLE;
GO

