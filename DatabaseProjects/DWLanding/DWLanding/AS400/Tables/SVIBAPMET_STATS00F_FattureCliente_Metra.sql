CREATE TABLE [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra] (
    [STDFA]                  NUMERIC (8)     NOT NULL,
    [STNFA]                  NUMERIC (6)     NOT NULL,
    [STNUO]                  NUMERIC (6)     NOT NULL,
    [STRIO]                  NUMERIC (4)     NOT NULL,
    [STDBO]                  NUMERIC (8)     NOT NULL,
    [STNBO]                  NUMERIC (6)     NOT NULL,
    [PKFattureCliente_Metra] BIGINT          NOT NULL,
    [STDEL]                  CHAR (1)        NOT NULL,
    [STTRK]                  CHAR (1)        NOT NULL,
    [STCLI]                  CHAR (6)        NOT NULL,
    [STPAR]                  CHAR (15)       NOT NULL,
    [STAGE]                  CHAR (2)        NOT NULL,
    [STZON]                  CHAR (2)        NOT NULL,
    [STMAG]                  CHAR (2)        NOT NULL,
    [STNAZ]                  CHAR (1)        NOT NULL,
    [STVAL]                  CHAR (3)        NOT NULL,
    [STQTS]                  NUMERIC (11, 2) NOT NULL,
    [STUNI]                  CHAR (2)        NOT NULL,
    [STPRZ]                  NUMERIC (15, 4) NOT NULL,
    [STIMP]                  NUMERIC (13, 2) NOT NULL,
    [STIMV]                  NUMERIC (13, 2) NOT NULL,
    [STSC1]                  NUMERIC (4, 2)  NOT NULL,
    [STSC2]                  NUMERIC (4, 2)  NOT NULL,
    [STSC3]                  NUMERIC (4, 2)  NOT NULL,
    [STPRO]                  NUMERIC (4, 2)  NOT NULL,
    [STPRC]                  NUMERIC (4, 2)  NOT NULL,
    [STDIV]                  CHAR (1)        NOT NULL,
    [STTOM]                  CHAR (1)        NOT NULL,
    [STTIP]                  CHAR (1)        NOT NULL,
    [STTIB]                  CHAR (1)        NOT NULL,
    [STNNR]                  NUMERIC (9)     NOT NULL,
    [STFL1]                  CHAR (1)        NOT NULL,
    [STFL2]                  CHAR (1)        NOT NULL,
    [STFL3]                  CHAR (1)        NOT NULL,
    [STPRV]                  NUMERIC (13, 2) NOT NULL,
    [STDAO]                  NUMERIC (8)     NOT NULL,
    [STTIF]                  CHAR (3)        NOT NULL,
    [STCDE]                  CHAR (3)        NOT NULL,
    [STCSE]                  CHAR (2)        NOT NULL,
    [STQTK]                  NUMERIC (11, 2) NOT NULL,
    [STQTQ]                  NUMERIC (11, 2) NOT NULL,
    [STIMQ]                  NUMERIC (13, 2) NOT NULL,
    [STLA1]                  CHAR (3)        NOT NULL,
    [ST£A1]                  NUMERIC (15, 4) NOT NULL,
    [STUA1]                  CHAR (2)        NOT NULL,
    [STLA2]                  CHAR (3)        NOT NULL,
    [ST£A2]                  NUMERIC (15, 4) NOT NULL,
    [STUA2]                  CHAR (2)        NOT NULL,
    [STLA3]                  CHAR (3)        NOT NULL,
    [ST£A3]                  NUMERIC (15, 4) NOT NULL,
    [STUA3]                  CHAR (2)        NOT NULL,
    [STLA4]                  CHAR (3)        NOT NULL,
    [ST£A4]                  NUMERIC (15, 4) NOT NULL,
    [STUA4]                  CHAR (2)        NOT NULL,
    [STLEG]                  CHAR (1)        NOT NULL,
    [PROFI]                  CHAR (7)        NOT NULL,
    [LAVOR]                  CHAR (3)        NOT NULL,
    [OLBAR]                  NUMERIC (5)     NOT NULL,
    [OMFIS]                  CHAR (1)        NOT NULL,
    [ORFAC]                  CHAR (1)        NOT NULL,
    [ORPEL]                  CHAR (1)        NOT NULL,
    [NREWA]                  NUMERIC (1)     NOT NULL,
    [EWAA1]                  CHAR (1)        NOT NULL,
    [EWAA2]                  CHAR (1)        NOT NULL,
    [EWAA3]                  CHAR (1)        NOT NULL,
    [RSPRK]                  NUMERIC (9, 2)  NOT NULL,
    [RSPPF]                  NUMERIC (13, 2) NOT NULL
);
GO

CREATE STATISTICS [STDBO]
    ON [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]([STDBO]);
GO

CREATE STATISTICS [STNUO]
    ON [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]([STNUO]);
GO

CREATE STATISTICS [STNBO]
    ON [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]([STNBO]);
GO

CREATE STATISTICS [STRIO]
    ON [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]([STRIO]);
GO

CREATE STATISTICS [STNFA]
    ON [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]([STNFA]);
GO

CREATE STATISTICS [PKFattureCliente_Metra]
    ON [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]([PKFattureCliente_Metra]);
GO

ALTER TABLE [AS400].[SVIBAPMET_STATS00F_FattureCliente_Metra]
    ADD CONSTRAINT [PK_AS400_SVIBAPMET_STATS00F_FattureCliente_Metra] PRIMARY KEY CLUSTERED ([STDFA] ASC, [STNFA] ASC, [STNUO] ASC, [STRIO] ASC, [STDBO] ASC, [STNBO] ASC, [PKFattureCliente_Metra] ASC);
GO

