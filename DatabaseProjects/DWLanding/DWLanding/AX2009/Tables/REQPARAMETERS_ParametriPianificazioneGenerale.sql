CREATE TABLE [AX2009].[REQPARAMETERS_ParametriPianificazioneGenerale] (
    [DATAAREAID]           CHAR (4)      NOT NULL,
    [RECID]                BIGINT        NOT NULL,
    [TODAYSDATECALENDARID] NVARCHAR (10) NOT NULL
);
GO

ALTER TABLE [AX2009].[REQPARAMETERS_ParametriPianificazioneGenerale]
    ADD CONSTRAINT [PK_REQPARAMETERS_ParametriPianificazioneGenerale] PRIMARY KEY CLUSTERED ([DATAAREAID] ASC);
GO

