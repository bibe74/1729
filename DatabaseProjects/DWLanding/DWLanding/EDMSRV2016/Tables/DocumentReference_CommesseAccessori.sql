CREATE TABLE [EDMSRV2016].[DocumentReference_CommesseAccessori] (
    [ID]              INT NOT NULL,
    [SourceID]        INT NULL,
    [TargetID]        INT NULL,
    [ReferenceTypeID] INT NOT NULL
);
GO

ALTER TABLE [EDMSRV2016].[DocumentReference_CommesseAccessori]
    ADD CONSTRAINT [PK_DocumentReference_CommesseAccessori] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

