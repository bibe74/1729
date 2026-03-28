CREATE TABLE [MES40MSPA].[Batch_Lotti] (
    [BatchID]                    CHAR (15)        NOT NULL,
    [PressID]                    CHAR (3)         NOT NULL,
    [DieID]                      VARCHAR (20)     NULL,
    [DieStatusID]                CHAR (1)         NULL,
    [DieCode]                    VARCHAR (20)     NULL,
    [DieNumber]                  SMALLINT         NULL,
    [StartTs]                    DATETIME         NULL,
    [StopTs]                     DATETIME         NULL,
    [ItemMeterWeight_MasterData] DECIMAL (28, 12) NULL,
    [ItemMeterWeight_Mes]        DECIMAL (28, 12) NULL,
    [ItemMeterWeight_Test]       DECIMAL (28, 12) NULL,
    [ItemMeterWeight]            DECIMAL (28, 12) NULL,
    [IsPressClosed]              BIT              NOT NULL,
    [PressClosedTs]              DATETIME         NULL,
    [IsSawClosed]                BIT              NOT NULL,
    [SawClosedTs]                DATETIME         NULL,
    [CustAccount]                NVARCHAR (20)    NULL,
    [BilletFirstNo]              SMALLINT         NULL,
    [KgRaw]                      DECIMAL (28, 12) NULL,
    [KgSheared]                  DECIMAL (28, 12) NULL,
    [KgExtruded]                 DECIMAL (28, 12) NULL,
    [KgCut]                      DECIMAL (28, 12) NULL,
    [KgScrapShear]               DECIMAL (28, 12) NULL,
    [KgScrapPress]               DECIMAL (28, 12) NULL,
    [KgScrapSaw]                 DECIMAL (28, 12) NULL,
    [IsSampling]                 BIT              NOT NULL,
    [IsErpImported]              BIT              NOT NULL,
    [PressBatchClosingReasonID]  SMALLINT         NULL,
    [BarCount]                   INT              NULL,
    [ModuleCount]                SMALLINT         NULL,
    [BilletDiameter]             DECIMAL (28, 12) NULL
);
GO

ALTER TABLE [MES40MSPA].[Batch_Lotti]
    ADD CONSTRAINT [PK_Batch_Lotti] PRIMARY KEY CLUSTERED ([BatchID] ASC);
GO

