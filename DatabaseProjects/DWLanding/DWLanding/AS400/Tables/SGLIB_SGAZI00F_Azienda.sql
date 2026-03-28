CREATE TABLE [AS400].[SGLIB_SGAZI00F_Azienda] (
    [CDAZI]              CHAR (3)  NOT NULL,
    [DEAZI]              CHAR (35) NOT NULL,
    [IDAzienda]          CHAR (4)  NOT NULL,
    [DataGoLive]         DATE      NULL,
    [DataNumericaGoLive] INT       NOT NULL
);
GO

ALTER TABLE [AS400].[SGLIB_SGAZI00F_Azienda]
    ADD CONSTRAINT [PK_AS400_SGLIB_SGAZI00F_Azienda] PRIMARY KEY CLUSTERED ([CDAZI] ASC);
GO

