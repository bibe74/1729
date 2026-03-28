
CREATE VIEW MES40ALMA.Press_PressaView
AS
SELECT
    -- Chiavi
    PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description        -- Descrizione

FROM [192.168.216.247\SCADA2017].ALMA_MES40_RDP.MasterData.Press;
GO

