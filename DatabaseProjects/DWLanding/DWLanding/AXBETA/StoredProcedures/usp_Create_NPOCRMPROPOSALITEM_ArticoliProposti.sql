
CREATE PROCEDURE AXBETA.usp_Create_NPOCRMPROPOSALITEM_ArticoliProposti
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AXBETA.NPOCRMPROPOSALITEM_ArticoliProposti (
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
    CONSTRAINT PK_NPOCRMPROPOSALITEM_ArticoliProposti PRIMARY KEY CLUSTERED (
        DATAAREAID,
        PROJID,
        PRODLINEID,
        RECID
    )
);

END;
GO

