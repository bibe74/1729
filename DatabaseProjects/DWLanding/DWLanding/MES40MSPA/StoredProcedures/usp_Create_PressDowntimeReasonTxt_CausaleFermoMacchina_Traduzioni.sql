
CREATE PROCEDURE MES40MSPA.usp_Create_PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE MES40MSPA.PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni (
    -- Chiavi
    PressDowntimeReasonTxtID        SMALLINT NOT NULL,

    -- Dimensioni
    PressDowntimeReasonID        SMALLINT NOT NULL,
    LanguageID        CHAR(5) NOT NULL,
    Description        NVARCHAR(50) NOT NULL


    -- Constraint
    CONSTRAINT PK_PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni PRIMARY KEY CLUSTERED (
        PressDowntimeReasonTxtID
    )
);

END;
GO

