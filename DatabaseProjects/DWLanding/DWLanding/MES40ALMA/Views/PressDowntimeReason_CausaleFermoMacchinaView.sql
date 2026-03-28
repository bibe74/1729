
CREATE VIEW MES40ALMA.PressDowntimeReason_CausaleFermoMacchinaView
AS
SELECT
    -- Chiavi
    PressDowntimeReasonID,        -- IDCausaleFermoMacchina

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description,        -- CausaleFermoMacchina
    OeeCLass,        -- ClasseOEE
    AvailabilityClass,        -- ClasseDisponibilita
    IsActive        -- IsAttiva

FROM [192.168.216.247\SCADA2017].ALMA_MES40_RDP.MasterData.PressDowntimeReason;
GO

