CREATE TABLE [EDMSRV2016].[Document_Documento] (
    [ID]       INT NOT NULL,
    [FolderID] INT NOT NULL
);
GO

ALTER TABLE [EDMSRV2016].[Document_Documento]
    ADD CONSTRAINT [PK_EDMSRV2016_Document_Documento] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

