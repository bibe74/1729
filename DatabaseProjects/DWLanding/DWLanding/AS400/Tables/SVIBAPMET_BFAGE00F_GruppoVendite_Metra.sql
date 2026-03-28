CREATE TABLE [AS400].[SVIBAPMET_BFAGE00F_GruppoVendite_Metra] (
    [CDAGE] CHAR (2)        NOT NULL,
    [TRB12] CHAR (3)        NOT NULL,
    [ATB12] CHAR (1)        NOT NULL,
    [NRB12] NUMERIC (9)     NOT NULL,
    [NOMAG] CHAR (35)       NOT NULL,
    [INDAG] CHAR (35)       NOT NULL,
    [LOCAG] CHAR (20)       NOT NULL,
    [PROVN] CHAR (2)        NOT NULL,
    [CAPAA] CHAR (5)        NOT NULL,
    [PROVG] NUMERIC (4, 2)  NOT NULL,
    [PRFAG] NUMERIC (13, 2) NOT NULL,
    [ZONCO] CHAR (20)       NOT NULL,
    [ESCLU] CHAR (1)        NOT NULL,
    [SOCCA] CHAR (1)        NOT NULL,
    [RITAC] NUMERIC (5, 2)  NOT NULL,
    [VAPRO] CHAR (1)        NOT NULL,
    [PROV£] NUMERIC (5, 2)  NOT NULL,
    [PROP1] NUMERIC (4, 2)  NOT NULL,
    [PROP2] NUMERIC (4, 2)  NOT NULL,
    [RCSP1] NUMERIC (7, 2)  NOT NULL,
    [RCVA1] CHAR (3)        NOT NULL,
    [RCSP2] NUMERIC (7, 2)  NOT NULL,
    [RCVA2] CHAR (3)        NOT NULL,
    [RCSP3] NUMERIC (7, 2)  NOT NULL,
    [RCVA3] CHAR (3)        NOT NULL,
    [RCSP4] NUMERIC (7, 2)  NOT NULL,
    [RCVA4] CHAR (3)        NOT NULL,
    [RCSP5] NUMERIC (7, 2)  NOT NULL,
    [RCVA5] CHAR (3)        NOT NULL,
    [PROT£] NUMERIC (5, 2)  NOT NULL
);
GO

ALTER TABLE [AS400].[SVIBAPMET_BFAGE00F_GruppoVendite_Metra]
    ADD CONSTRAINT [PK_AS400_SVIBAPMET_BFAGE00F_GruppoVendite_Metra] PRIMARY KEY CLUSTERED ([CDAGE] ASC);
GO

