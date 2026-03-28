CREATE VIEW MES40MALU.PressDowntimeReason_CausaleFermoMacchinaView
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

FROM [192.168.216.247\SCADA2017].MES40_RDP.MasterData.PressDowntimeReason;
GO

