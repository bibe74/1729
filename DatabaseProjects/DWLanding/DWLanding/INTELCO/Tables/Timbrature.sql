CREATE TABLE [INTELCO].[Timbrature] (
    [ImportTs]           DATETIME       NOT NULL,
    [data]               NCHAR (10)     NOT NULL,
    [cognome]            NVARCHAR (50)  NULL,
    [nome]               NVARCHAR (50)  NULL,
    [centroCosto]        NVARCHAR (50)  NULL,
    [codiceFiscale]      NVARCHAR (50)  NULL,
    [badge]              NVARCHAR (50)  NULL,
    [oreTeoriche]        NCHAR (10)     NULL,
    [oreLavorate]        NCHAR (10)     NULL,
    [entrata_principale] NCHAR (10)     NULL,
    [entrata_intermedia] NCHAR (10)     NULL,
    [data1]              NCHAR (10)     NULL,
    [data2]              NCHAR (10)     NULL,
    [data3]              NCHAR (10)     NULL,
    [data4]              NCHAR (10)     NULL,
    [data5]              NCHAR (10)     NULL,
    [data6]              NCHAR (10)     NULL,
    [data7]              NCHAR (10)     NULL,
    [data8]              NCHAR (10)     NULL,
    [data9]              NCHAR (10)     NULL,
    [data10]             NCHAR (10)     NULL,
    [verso1]             NCHAR (1)      NULL,
    [verso2]             NCHAR (1)      NULL,
    [verso3]             NCHAR (1)      NULL,
    [verso4]             NCHAR (1)      NULL,
    [verso5]             NCHAR (1)      NULL,
    [verso6]             NCHAR (1)      NULL,
    [verso7]             NCHAR (1)      NULL,
    [verso8]             NCHAR (1)      NULL,
    [verso9]             NCHAR (1)      NULL,
    [verso10]            NCHAR (1)      NULL,
    [timbratura1]        NCHAR (10)     NULL,
    [timbratura2]        NCHAR (10)     NULL,
    [timbratura3]        NCHAR (10)     NULL,
    [timbratura4]        NCHAR (10)     NULL,
    [timbratura5]        NCHAR (10)     NULL,
    [timbratura6]        NCHAR (10)     NULL,
    [timbratura7]        NCHAR (10)     NULL,
    [timbratura8]        NCHAR (10)     NULL,
    [timbratura9]        NCHAR (10)     NULL,
    [timbratura10]       NCHAR (10)     NULL,
    [NominativoResp]     NVARCHAR (100) NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_INTELCO_Timbrature_data_cognome_nome]
    ON [INTELCO].[Timbrature]([data] ASC, [cognome] ASC, [nome] ASC);
GO

GRANT DELETE
    ON OBJECT::[INTELCO].[Timbrature] TO [utRW_FlowForce]
    AS [dbo];
GO

GRANT INSERT
    ON OBJECT::[INTELCO].[Timbrature] TO [utRW_FlowForce]
    AS [dbo];
GO

GRANT SELECT
    ON OBJECT::[INTELCO].[Timbrature] TO [utRW_FlowForce]
    AS [dbo];
GO

GRANT UPDATE
    ON OBJECT::[INTELCO].[Timbrature] TO [utRW_FlowForce]
    AS [dbo];
GO

ALTER TABLE [INTELCO].[Timbrature]
    ADD CONSTRAINT [DFT_INTELCO_Timbrature_ImportTs] DEFAULT (getdate()) FOR [ImportTs];
GO

