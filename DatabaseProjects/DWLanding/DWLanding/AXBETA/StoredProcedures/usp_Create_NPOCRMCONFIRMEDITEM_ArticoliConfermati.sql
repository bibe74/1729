
CREATE PROCEDURE AXBETA.usp_Create_NPOCRMCONFIRMEDITEM_ArticoliConfermati
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AXBETA.NPOCRMCONFIRMEDITEM_ArticoliConfermati (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    PROJID        NVARCHAR(10) NOT NULL,
    PRODLINEID        NVARCHAR(40) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni

    -- Misure
    QTY        NUMERIC(28, 12) NOT NULL,
    MQ        NUMERIC(28, 12) NOT NULL,
    KG        NUMERIC(28, 12) NOT NULL,
    EURO        NUMERIC(28, 12) NOT NULL

    -- Constraint
    CONSTRAINT PK_NPOCRMCONFIRMEDITEM_ArticoliConfermati PRIMARY KEY CLUSTERED (
        DATAAREAID,
        PROJID,
        PRODLINEID,
        RECID
    )
);

END;
GO

