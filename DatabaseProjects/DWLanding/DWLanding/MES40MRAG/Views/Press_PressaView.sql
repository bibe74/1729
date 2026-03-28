
CREATE VIEW MES40MRAG.Press_PressaView
AS
SELECT
    -- Chiavi
    PressID COLLATE DATABASE_DEFAULT AS PressID,        -- IDPressa

    -- Dimensioni
    Description COLLATE DATABASE_DEFAULT AS Description        -- Descrizione

FROM [SQL2014MRAG\SCADA2014].MES40_RDP.MasterData.Press;
GO

