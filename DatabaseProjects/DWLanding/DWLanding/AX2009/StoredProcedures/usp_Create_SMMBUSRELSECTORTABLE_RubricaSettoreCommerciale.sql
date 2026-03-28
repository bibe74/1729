
CREATE PROCEDURE AX2009.usp_Create_SMMBUSRELSECTORTABLE_RubricaSettoreCommerciale
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.SMMBUSRELSECTORTABLE_RubricaSettoreCommerciale (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    PARTYID        NVARCHAR(20) NOT NULL,
    BUSINESSSECTORID        NVARCHAR(20) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni


    -- Constraint
    CONSTRAINT PK_SMMBUSRELSECTORTABLE_RubricaSettoreCommerciale PRIMARY KEY CLUSTERED (
        DATAAREAID,
        PARTYID,
        BUSINESSSECTORID
    )
);

END;
GO

