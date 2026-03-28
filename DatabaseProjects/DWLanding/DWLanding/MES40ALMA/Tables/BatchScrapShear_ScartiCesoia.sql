CREATE TABLE [MES40ALMA].[BatchScrapShear_ScartiCesoia] (
    [BatchScrapShearID] INT              NOT NULL,
    [Ts]                DATETIME         NULL,
    [BatchID]           CHAR (15)        NULL,
    [KgScrapShear]      DECIMAL (28, 12) NULL,
    [IsManualScrap]     BIT              NULL
);
GO

ALTER TABLE [MES40ALMA].[BatchScrapShear_ScartiCesoia]
    ADD CONSTRAINT [PK_BatchScrapShear_ScartiCesoia] PRIMARY KEY CLUSTERED ([BatchScrapShearID] ASC);
GO

