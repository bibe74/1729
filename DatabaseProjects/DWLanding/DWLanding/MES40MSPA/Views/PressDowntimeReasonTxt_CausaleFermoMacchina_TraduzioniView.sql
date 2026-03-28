
CREATE VIEW MES40MSPA.PressDowntimeReasonTxt_CausaleFermoMacchina_TraduzioniView
AS
SELECT
    -- Chiavi
    PressDowntimeReasonTxtID,        -- IDCausaleFermoMacchinaTraduzione

    -- Dimensioni
    PressDowntimeReasonID,        -- IDCausaleFermoMacchina
    LanguageID,        -- LanguageID
    Description        -- CausaleFermoMacchinaTraduzione

FROM [SQL2014\SCADA2014].MES40_Master.MasterData.PressDowntimeReasonTxt;
GO

