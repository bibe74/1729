CREATE TABLE [MRDP].[RaccoltaDatiLotto_Billette_CalcoliBillette] (
    [ID]                   INT              NOT NULL,
    [Turno]                CHAR (2)         NOT NULL,
    [TurnoData]            DATE             NOT NULL,
    [TurnoDataMetra]       DATE             NOT NULL,
    [Lega]                 NVARCHAR (40)    NOT NULL,
    [IsCambioMatrice]      BIT              NOT NULL,
    [KgNettiTaglio]        DECIMAL (28, 12) NOT NULL,
    [KgNettiImballo]       DECIMAL (28, 12) NOT NULL,
    [KgImballati]          DECIMAL (28, 12) NOT NULL,
    [KgImballatiAXPesa]    DECIMAL (28, 12) NOT NULL,
    [KgImballatiAXTeorico] DECIMAL (28, 12) NOT NULL,
    [KgScartoCesoia]       DECIMAL (28, 12) NOT NULL,
    [SecondiFermo]         INT              NOT NULL,
    [SecondiCiclo]         INT              NOT NULL,
    [SecondiEstrusione]    INT              NOT NULL
);
GO

ALTER TABLE [MRDP].[RaccoltaDatiLotto_Billette_CalcoliBillette]
    ADD CONSTRAINT [PK_RaccoltaDatiLotto_Billette_CalcoliBillette] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

