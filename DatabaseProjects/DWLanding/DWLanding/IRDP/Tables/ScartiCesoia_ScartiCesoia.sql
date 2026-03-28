CREATE TABLE [IRDP].[ScartiCesoia_ScartiCesoia] (
    [NumeroLotto]    CHAR (15)        NOT NULL,
    [ID]             INT              NOT NULL,
    [TimeStamp]      DATETIME         NULL,
    [ScartoManuale]  BIT              NULL,
    [KgScartoCesoia] DECIMAL (28, 12) NULL
);
GO

ALTER TABLE [IRDP].[ScartiCesoia_ScartiCesoia]
    ADD CONSTRAINT [PK_ScartiCesoia_ScartiCesoia] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [ID] ASC);
GO

