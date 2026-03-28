
CREATE PROCEDURE AXBETA.usp_Create_SMMBUSRELTABLE_RelazioneCommerciale
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AXBETA.SMMBUSRELTABLE_RelazioneCommerciale (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    BUSRELACCOUNT        NVARCHAR(20) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    NAME        NVARCHAR(100) NOT NULL


    -- Constraint
    CONSTRAINT PK_SMMBUSRELTABLE_RelazioneCommerciale PRIMARY KEY CLUSTERED (
        DATAAREAID,
        BUSRELACCOUNT
    )
);

END;
GO

