CREATE TABLE [AS400].[MEDEP_GRU_DMRJE02F_Deposito] (
    [RJCOD]    CHAR (1)    NOT NULL,
    [RJDES]    CHAR (30)   NOT NULL,
    [RJDSR]    CHAR (15)   NOT NULL,
    [RJCAS]    CHAR (8)    NOT NULL,
    [RJUIS]    CHAR (8)    NOT NULL,
    [RJSOC]    CHAR (3)    NOT NULL,
    [RJFL1]    CHAR (1)    NOT NULL,
    [RJLIB]    CHAR (10)   NOT NULL,
    [RJGCL]    CHAR (1)    NOT NULL,
    [RJAZI]    CHAR (3)    NOT NULL,
    [RJMAG]    CHAR (2)    NOT NULL,
    [RJFL2]    CHAR (1)    NOT NULL,
    [RJFL3]    CHAR (1)    NOT NULL,
    [RJFL4]    CHAR (1)    NOT NULL,
    [RJFL5]    CHAR (1)    NOT NULL,
    [RJFL6]    CHAR (1)    NOT NULL,
    [RJFL7]    CHAR (1)    NOT NULL,
    [RJFL8]    CHAR (1)    NOT NULL,
    [RJFL9]    CHAR (1)    NOT NULL,
    [RJF10]    CHAR (1)    NOT NULL,
    [RJF11]    CHAR (1)    NOT NULL,
    [RJF12]    CHAR (1)    NOT NULL,
    [RJF13]    CHAR (1)    NOT NULL,
    [RJF14]    CHAR (1)    NOT NULL,
    [RJF15]    CHAR (1)    NOT NULL,
    [RJF16]    CHAR (1)    NOT NULL,
    [RJF17]    CHAR (1)    NOT NULL,
    [RJF18]    CHAR (1)    NOT NULL,
    [RJF19]    CHAR (1)    NOT NULL,
    [RJF20]    CHAR (1)    NOT NULL,
    [RJLIN]    CHAR (3)    NOT NULL,
    [RJVAL]    CHAR (3)    NOT NULL,
    [RJNET]    CHAR (10)   NOT NULL,
    [RJAZA]    CHAR (3)    NOT NULL,
    [RJGEO]    NUMERIC (4) NOT NULL,
    [RJMIOCAP] CHAR (5)    NOT NULL
);
GO

ALTER TABLE [AS400].[MEDEP_GRU_DMRJE02F_Deposito]
    ADD CONSTRAINT [PK_AS400_MEDEP_GRU_DMRJE02F_Deposito] PRIMARY KEY CLUSTERED ([RJCOD] ASC);
GO

