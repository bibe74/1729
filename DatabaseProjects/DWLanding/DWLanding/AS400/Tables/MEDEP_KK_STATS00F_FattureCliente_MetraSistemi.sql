CREATE TABLE [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi] (
    [STDFA]                         NUMERIC (8)     NOT NULL,
    [STNFA]                         NUMERIC (6)     NOT NULL,
    [STNUO]                         NUMERIC (6)     NOT NULL,
    [STRIO]                         NUMERIC (4)     NOT NULL,
    [STDBO]                         NUMERIC (8)     NOT NULL,
    [STNBO]                         NUMERIC (6)     NOT NULL,
    [PKFattureCliente_MetraSistemi] BIGINT          NOT NULL,
    [STNNR]                         NUMERIC (11)    NOT NULL,
    [STDEL]                         CHAR (1)        NOT NULL,
    [STTRK]                         CHAR (1)        NOT NULL,
    [STFL1]                         CHAR (1)        NOT NULL,
    [STFL2]                         CHAR (1)        NOT NULL,
    [STFL3]                         CHAR (1)        NOT NULL,
    [STFL4]                         CHAR (1)        NOT NULL,
    [STFL5]                         CHAR (1)        NOT NULL,
    [STTPO]                         CHAR (2)        NOT NULL,
    [STTIM]                         CHAR (1)        NOT NULL,
    [STTOM]                         CHAR (1)        NOT NULL,
    [STRBO]                         NUMERIC (4)     NOT NULL,
    [STDUO]                         NUMERIC (8)     NOT NULL,
    [STCLI]                         CHAR (6)        NOT NULL,
    [STCLS]                         CHAR (6)        NOT NULL,
    [STPAR]                         CHAR (15)       NOT NULL,
    [STAGE]                         CHAR (2)        NOT NULL,
    [STZON]                         CHAR (2)        NOT NULL,
    [STVALD]                        CHAR (3)        NOT NULL,
    [STIMPD]                        NUMERIC (13, 2) NOT NULL,
    [STIMPE]                        NUMERIC (13, 2) NOT NULL,
    [STCAME]                        NUMERIC (10, 6) NOT NULL,
    [STIMLD]                        NUMERIC (13, 2) NOT NULL,
    [STIMLE]                        NUMERIC (13, 2) NOT NULL,
    [STQTAS]                        NUMERIC (9, 2)  NOT NULL,
    [STUMIS]                        CHAR (2)        NOT NULL,
    [STQTAK]                        NUMERIC (9, 2)  NOT NULL,
    [STUMIK]                        CHAR (2)        NOT NULL,
    [STQTAF]                        NUMERIC (9, 2)  NOT NULL,
    [STUMIF]                        CHAR (2)        NOT NULL,
    [STPRO]                         NUMERIC (4, 2)  NOT NULL,
    [TPPRC]                         CHAR (1)        NOT NULL,
    [STTPR]                         CHAR (1)        NOT NULL,
    [TITIP]                         CHAR (1)        NOT NULL,
    [CLMER]                         CHAR (2)        NOT NULL,
    [PROFI]                         CHAR (7)        NOT NULL,
    [LAVOR]                         CHAR (3)        NOT NULL,
    [LUNBA]                         NUMERIC (5)     NOT NULL,
    [STEWA]                         CHAR (1)        NOT NULL,
    [CALAV]                         CHAR (3)        NOT NULL,
    [MIORJE]                        CHAR (1)        NOT NULL,
    [STFLG1]                        CHAR (1)        NOT NULL,
    [STPRZT]                        NUMERIC (15, 5) NOT NULL,
    [STMACA]                        CHAR (3)        NOT NULL
);
GO

CREATE STATISTICS [PKFattureCliente_MetraSistemi]
    ON [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]([PKFattureCliente_MetraSistemi]);
GO

CREATE STATISTICS [STDBO]
    ON [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]([STDBO]);
GO

CREATE STATISTICS [STNUO]
    ON [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]([STNUO]);
GO

CREATE STATISTICS [STNBO]
    ON [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]([STNBO]);
GO

CREATE STATISTICS [STRIO]
    ON [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]([STRIO]);
GO

CREATE STATISTICS [STNFA]
    ON [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]([STNFA]);
GO

ALTER TABLE [AS400].[MEDEP_KK_STATS00F_FattureCliente_MetraSistemi]
    ADD CONSTRAINT [PK_AS400_MEDEP_KK_STATS00F_FattureCliente_MetraSistemi] PRIMARY KEY CLUSTERED ([STDFA] ASC, [STNFA] ASC, [STNUO] ASC, [STRIO] ASC, [STDBO] ASC, [STNBO] ASC, [PKFattureCliente_MetraSistemi] ASC);
GO

