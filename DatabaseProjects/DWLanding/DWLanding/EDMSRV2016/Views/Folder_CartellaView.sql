
CREATE VIEW EDMSRV2016.Folder_CartellaView
AS
SELECT
    -- Chiavi
    ID,        -- IDCartella

    -- Dimensioni
    ParentID,        -- IDCartellaPadre
    COALESCE(Name, N'') COLLATE Latin1_General_CI_AS AS Name        -- Cartella

FROM EDMSRV2016.BCRepository.dbo.Folder;
GO

