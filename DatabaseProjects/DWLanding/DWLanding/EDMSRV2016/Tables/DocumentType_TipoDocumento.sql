CREATE TABLE [EDMSRV2016].[DocumentType_TipoDocumento] (
    [ID]          INT            NOT NULL,
    [Name]        NVARCHAR (255) NOT NULL,
    [DisplayName] NVARCHAR (255) NOT NULL
);
GO

ALTER TABLE [EDMSRV2016].[DocumentType_TipoDocumento]
    ADD CONSTRAINT [PK_EDMSRV2016_DocumentType_TipoDocumento] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

