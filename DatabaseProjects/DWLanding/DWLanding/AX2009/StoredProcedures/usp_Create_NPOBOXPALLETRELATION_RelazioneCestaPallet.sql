
CREATE PROCEDURE AX2009.usp_Create_NPOBOXPALLETRELATION_RelazioneCestaPallet
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.NPOBOXPALLETRELATION_RelazioneCestaPallet (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    NPOBOXID        NVARCHAR(20) NOT NULL,
    NPOPACKINGID        NVARCHAR(18) NOT NULL,
    PRODID        NVARCHAR(20) NOT NULL,
    OPRNUM        INT NOT NULL,
    INBOX        BIT NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    OPRID        NVARCHAR(10) NOT NULL,

    -- Misure
    QTY        NUMERIC(28, 12) NOT NULL,
    NPOSECONDUNITQTY        NUMERIC(28, 12) NOT NULL

    -- Constraint
    CONSTRAINT PK_NPOBOXPALLETRELATION_RelazioneCestaPallet PRIMARY KEY CLUSTERED (
        DATAAREAID,
        NPOBOXID,
        NPOPACKINGID,
        PRODID,
        OPRNUM,
        INBOX
    )
);

END;
GO

