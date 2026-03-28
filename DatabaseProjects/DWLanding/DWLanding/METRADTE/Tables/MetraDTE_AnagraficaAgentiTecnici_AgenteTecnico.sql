CREATE TABLE [METRADTE].[MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico] (
    [ID]          BIGINT         NOT NULL,
    [nomeCognome] NVARCHAR (150) NULL
);
GO

ALTER TABLE [METRADTE].[MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico]
    ADD CONSTRAINT [PK_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

