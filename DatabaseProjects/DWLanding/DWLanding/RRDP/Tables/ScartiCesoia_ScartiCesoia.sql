CREATE TABLE [RRDP].[ScartiCesoia_ScartiCesoia] (
    [NumeroLotto]    CHAR (15)        NOT NULL,
    [ID]             INT              NOT NULL,
    [TimeStamp]      DATETIME         NOT NULL,
    [ScartoManuale]  BIT              NOT NULL,
    [KgScartoCesoia] DECIMAL (28, 12) NOT NULL
);
GO

ALTER TABLE [RRDP].[ScartiCesoia_ScartiCesoia]
    ADD CONSTRAINT [PK_ScartiCesoia_ScartiCesoia] PRIMARY KEY CLUSTERED ([NumeroLotto] ASC, [ID] ASC);
GO

