CREATE TABLE [EDMSRV2016].[Folder_Cartella] (
    [ID]       INT            NOT NULL,
    [ParentID] INT            NULL,
    [Name]     NVARCHAR (255) NOT NULL
);
GO

ALTER TABLE [EDMSRV2016].[Folder_Cartella]
    ADD CONSTRAINT [PK_Folder_Cartella] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_EDMSRV2016_Folder_Cartella_ParentID]
    ON [EDMSRV2016].[Folder_Cartella]([ParentID] ASC) WITH (FILLFACTOR = 100);
GO

