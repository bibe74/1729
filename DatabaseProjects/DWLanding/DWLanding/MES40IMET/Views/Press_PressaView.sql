
CREATE VIEW MES40IMET.Press_PressaView
AS
SELECT
    -- Chiavi
    PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description        -- Descrizione

FROM [SQL2012IMET\SCADA2012].MES40_RDP.MasterData.Press;
GO

