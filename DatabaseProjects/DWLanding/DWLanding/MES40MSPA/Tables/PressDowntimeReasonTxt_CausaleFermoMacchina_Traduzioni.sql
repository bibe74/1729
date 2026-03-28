CREATE TABLE [MES40MSPA].[PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni] (
    [PressDowntimeReasonTxtID] SMALLINT      NOT NULL,
    [PressDowntimeReasonID]    SMALLINT      NOT NULL,
    [LanguageID]               CHAR (5)      NOT NULL,
    [Description]              NVARCHAR (50) NOT NULL
);
GO

ALTER TABLE [MES40MSPA].[PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni]
    ADD CONSTRAINT [PK_PressDowntimeReasonTxt_CausaleFermoMacchina_Traduzioni] PRIMARY KEY CLUSTERED ([PressDowntimeReasonTxtID] ASC);
GO

