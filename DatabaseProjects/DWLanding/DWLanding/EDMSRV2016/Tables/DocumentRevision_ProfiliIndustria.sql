CREATE TABLE [EDMSRV2016].[DocumentRevision_ProfiliIndustria] (
    [ID]               INT            NOT NULL,
    [DocumentID]       INT            NOT NULL,
    [Filename]         NVARCHAR (255) NOT NULL,
    [DocumentTypeID]   INT            NOT NULL,
    [RevisionNumber]   NVARCHAR (255) NOT NULL,
    [IsLatestRevision] BIT            NOT NULL,
    [StartDate]        DATE           NOT NULL,
    [ModificationDate] DATE           NOT NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_IsLatestRevision_INCLUDE]
    ON [EDMSRV2016].[DocumentRevision_ProfiliIndustria]([IsLatestRevision] ASC)
    INCLUDE([DocumentID], [DocumentTypeID], [Filename], [StartDate]);
GO

CREATE NONCLUSTERED INDEX [IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_IsLatestRevision_FILTERED]
    ON [EDMSRV2016].[DocumentRevision_ProfiliIndustria]([DocumentID] ASC, [StartDate] ASC) WHERE ([IsLatestRevision]=(1)) WITH (FILLFACTOR = 100);
GO

CREATE NONCLUSTERED INDEX [IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_DocumentTypeID_DocumentID]
    ON [EDMSRV2016].[DocumentRevision_ProfiliIndustria]([DocumentTypeID] ASC, [DocumentID] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_DocumentTypeID_IsLatestRevision_INCLUDE]
    ON [EDMSRV2016].[DocumentRevision_ProfiliIndustria]([DocumentTypeID] ASC, [Filename] ASC, [IsLatestRevision] ASC)
    INCLUDE([DocumentID], [StartDate]);
GO

ALTER TABLE [EDMSRV2016].[DocumentRevision_ProfiliIndustria]
    ADD CONSTRAINT [PK_EDMSRV2016_DocumentRevision_ProfiliIndustria] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

