
CREATE PROCEDURE AX2009.usp_Create_PRODROUTE_CicloLavorazioneProduzione
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.PRODROUTE_CicloLavorazioneProduzione (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    PRODID        NVARCHAR(20) NOT NULL,
    OPRNUM        INT NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    OPRID        NVARCHAR(10) NOT NULL,
    WRKCTRID        NVARCHAR(10) NOT NULL,
    PROCESSTIME        NUMERIC(28, 12) NOT NULL,
    PROCESSPERQTY        NUMERIC(28, 12) NOT NULL,
    TOHOURS        NUMERIC(28, 12) NOT NULL


    -- Constraint
    CONSTRAINT PK_PRODROUTE_CicloLavorazioneProduzione PRIMARY KEY CLUSTERED (
        DATAAREAID,
        PRODID,
        OPRNUM,
        RECID
    )
);

END;
GO

