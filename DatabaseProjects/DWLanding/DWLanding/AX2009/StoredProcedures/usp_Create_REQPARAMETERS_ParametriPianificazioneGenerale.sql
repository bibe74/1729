
CREATE PROCEDURE AX2009.usp_Create_REQPARAMETERS_ParametriPianificazioneGenerale
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE AX2009.REQPARAMETERS_ParametriPianificazioneGenerale (
    -- Chiavi
    DATAAREAID        CHAR(4) NOT NULL,
    RECID        BIGINT NOT NULL,

    -- Dimensioni
    TODAYSDATECALENDARID        NVARCHAR(10) NOT NULL


    -- Constraint
    CONSTRAINT PK_REQPARAMETERS_ParametriPianificazioneGenerale PRIMARY KEY CLUSTERED (
        DATAAREAID
    )
);

END;
GO

