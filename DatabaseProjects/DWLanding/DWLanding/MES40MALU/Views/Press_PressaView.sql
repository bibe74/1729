
CREATE VIEW MES40MALU.Press_PressaView
AS
SELECT
    -- Chiavi
    PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description        -- Descrizione

FROM [192.168.216.247\SCADA2017].MES40_RDP.MasterData.Press;
GO

