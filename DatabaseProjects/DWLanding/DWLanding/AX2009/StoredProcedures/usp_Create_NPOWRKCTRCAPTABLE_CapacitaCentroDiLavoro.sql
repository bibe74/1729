
CREATE PROCEDURE AX2009.usp_Create_NPOWRKCTRCAPTABLE_CapacitaCentroDiLavoro
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.NPOWRKCTRCAPTABLE_CapacitaCentroDiLavoro (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    WRKCTRID        NVARCHAR(10) NOT NULL,
    YR        INT NOT NULL,
    WEEK        INT NOT NULL,
    ITEMID        NVARCHAR(20) NOT NULL,
    CUSTACCOUNT        NVARCHAR(20) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    PRODID        NVARCHAR(20) NOT NULL,

    -- Misure
    KG        NUMERIC(28, 12) NOT NULL

    -- Constraint
    CONSTRAINT PK_NPOWRKCTRCAPTABLE_CapacitaCentroDiLavoro PRIMARY KEY CLUSTERED (
        DATAAREAID,
        WRKCTRID,
        YR,
        WEEK,
        ITEMID,
        CUSTACCOUNT
    )
);

END;
GO

