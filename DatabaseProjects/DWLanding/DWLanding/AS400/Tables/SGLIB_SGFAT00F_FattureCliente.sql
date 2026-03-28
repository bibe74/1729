CREATE TABLE [AS400].[SGLIB_SGFAT00F_FattureCliente] (
    [SGDIT]               CHAR (3)         NOT NULL,
    [SGDFA]               INT              NOT NULL,
    [SGNFA]               INT              NOT NULL,
    [SGKEY]               INT              NOT NULL,
    [SGSTA]               CHAR (1)         NOT NULL,
    [SGTRK]               CHAR (1)         NOT NULL,
    [SGTOM]               CHAR (1)         NOT NULL,
    [SGCLI]               CHAR (7)         NOT NULL,
    [SGDBO]               INT              NOT NULL,
    [SGNBO]               INT              NOT NULL,
    [SGAGE]               CHAR (3)         NOT NULL,
    [SGZON]               CHAR (3)         NOT NULL,
    [SGPAR]               CHAR (15)        NOT NULL,
    [SGTAR]               CHAR (1)         NOT NULL,
    [SGSER]               CHAR (2)         NOT NULL,
    [SGLEG]               CHAR (1)         NOT NULL,
    [SGPRO]               CHAR (7)         NOT NULL,
    [SGLAV]               CHAR (3)         NOT NULL,
    [SGLUB]               INT              NOT NULL,
    [SGMAR]               CHAR (3)         NOT NULL,
    [IDAzienda]           CHAR (4)         NOT NULL,
    [AliasAS400]          NVARCHAR (15)    NOT NULL,
    [CodiceGruppoVendite] NVARCHAR (10)    NOT NULL,
    [SGQTA]               DECIMAL (28, 12) NOT NULL,
    [SGQTK]               DECIMAL (28, 12) NOT NULL,
    [SGVAL]               NVARCHAR (3)     NOT NULL,
    [SGIMP]               DECIMAL (28, 12) NOT NULL,
    [SGPRV]               DECIMAL (28, 12) NOT NULL,
    [SGIMV]               DECIMAL (28, 12) NOT NULL
);
GO

CREATE STATISTICS [SGKEY]
    ON [AS400].[SGLIB_SGFAT00F_FattureCliente]([SGKEY]);
GO

ALTER TABLE [AS400].[SGLIB_SGFAT00F_FattureCliente]
    ADD CONSTRAINT [PK_AS400_SGLIB_SGFAT00F_FattureCliente] PRIMARY KEY CLUSTERED ([SGDIT] ASC, [SGDFA] ASC, [SGNFA] ASC, [SGKEY] ASC);
GO

