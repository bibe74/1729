CREATE TABLE [MSE].[tbl_segnalazioni_Segnalazioni] (
    [ID]                       INT            NOT NULL,
    [data]                     DATE           NULL,
    [sigla]                    NVARCHAR (50)  NULL,
    [codiceCliente]            NVARCHAR (6)   NULL,
    [bolla_n]                  NVARCHAR (50)  NULL,
    [bolla_del]                DATE           NULL,
    [finitura_altro]           NVARCHAR (150) NULL,
    [Company]                  CHAR (4)       NULL,
    [DataChiusuraSegnalazione] DATE           NULL,
    [NumeroOrdineAX]           NVARCHAR (20)  NULL
);
GO

ALTER TABLE [MSE].[tbl_segnalazioni_Segnalazioni]
    ADD CONSTRAINT [PK_tbl_segnalazioni_Segnalazioni] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

