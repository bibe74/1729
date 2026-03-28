
CREATE PROCEDURE METRADTE.usp_Create_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE METRADTE.MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico (
 -- Chiavi
 ID  BIGINT NOT NULL,

 -- Dimensioni
 nomeCognome  NVARCHAR(150)


 -- Constraint
 CONSTRAINT PK_MetraDTE_AnagraficaAgentiTecnici_AgenteTecnico PRIMARY KEY CLUSTERED (
  ID
 )
);

END;
GO

