
CREATE VIEW MES40MSPA.PressDowntimeReason_CausaleFermoMacchinaView
AS
SELECT
    -- Chiavi
    PressDowntimeReasonID,        -- IDCausaleFermoMacchina

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description,        -- CausaleFermoMacchina
    OeeCLass,        -- ClasseOEE
    AvailabilityClass,        -- ClasseDisponibilita
    IsActive,        -- IsAttiva
    IsPressUnavailable      -- IsPressaNonDisponibile

FROM [SQL2014\SCADA2014].MES40_Master.MasterData.PressDowntimeReason;
GO

