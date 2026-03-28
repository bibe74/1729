
CREATE PROCEDURE AX2009.usp_Create_INVENTITEMPURCHSETUP_ArticoloImpostazioniAcquisto
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.INVENTITEMPURCHSETUP_ArticoloImpostazioniAcquisto (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    ITEMID        NVARCHAR(20) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    INVENTDIMID        NVARCHAR(20) NOT NULL,
    INVENTDIMIDDEFAULT        NVARCHAR(20) NOT NULL,
    LEADTIME        INT NOT NULL


    -- Constraint
    CONSTRAINT PK_INVENTITEMPURCHSETUP_ArticoloImpostazioniAcquisto PRIMARY KEY CLUSTERED (
        DATAAREAID,
        ITEMID,
        RECID
    )
);

END;
GO

