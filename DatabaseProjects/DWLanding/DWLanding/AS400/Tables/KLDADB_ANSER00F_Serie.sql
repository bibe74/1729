CREATE TABLE [AS400].[KLDADB_ANSER00F_Serie] (
    [SERCD]  CHAR (2)        NOT NULL,
    [SERDS]  CHAR (20)       NOT NULL,
    [SERNR]  NUMERIC (3)     NOT NULL,
    [SERYN]  CHAR (2)        NOT NULL,
    [SERDP]  NUMERIC (15, 4) NOT NULL,
    [SERUM]  CHAR (2)        NOT NULL,
    [SERF1]  CHAR (1)        NOT NULL,
    [SERF2]  CHAR (1)        NOT NULL,
    [SERF3]  CHAR (1)        NOT NULL,
    [SERRA]  CHAR (2)        NOT NULL,
    [SERBM]  NUMERIC (7)     NOT NULL,
    [SERF4]  CHAR (1)        NOT NULL,
    [SERLB]  NUMERIC (5)     NOT NULL,
    [SERQT]  NUMERIC (9, 2)  NOT NULL,
    [SERPE]  NUMERIC (5, 2)  NOT NULL,
    [SERF5]  CHAR (1)        NOT NULL,
    [SERAN]  CHAR (1)        NOT NULL,
    [OKWEBS] CHAR (1)        NOT NULL,
    [SERGF]  CHAR (1)        NOT NULL,
    [SERMS]  CHAR (2)        NOT NULL,
    [SERIS]  CHAR (2)        NOT NULL,
    [SERUG]  CHAR (2)        NOT NULL,
    [SERUL]  CHAR (2)        NOT NULL
);
GO

ALTER TABLE [AS400].[KLDADB_ANSER00F_Serie]
    ADD CONSTRAINT [PK_AS400_KLDADB_ANSER00F_Serie] PRIMARY KEY CLUSTERED ([SERCD] ASC);
GO

