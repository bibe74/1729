
CREATE VIEW AX2009.DLVMODE_ModalitaConsegnaView
AS
SELECT
    -- Chiavi
    DATAAREAID,        -- IDAzienda
    CODE,        -- IDModalitaConsegna
    RECID,        -- PKModalitaConsegna

    -- Dimensioni
    TXT,        -- ModalitaConsegna
    SHIPCARRIERID,        -- IDVettore
    INTRASTATTRANSPORTID,        -- IDTrasporto
    NPOJOURNEYEXTRAITEMID,        -- IDArticoloExtra
    NPOJOURNEYITEMID,        -- IDArticolo
    NPOJOURNEYPRICEGROUP        -- IDGruppoPrezzi

FROM [AXSQL\AX2009].AX2009_METRA_LIVE.dbo.DLVMODE;
GO

