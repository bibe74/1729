
CREATE PROCEDURE METRADTE.usp_Create_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE METRADTE.MetraDTE_AttivitaPreliminariLogModifiche_Modifiche (
 -- Chiavi
 ID  BIGINT NOT NULL,

 -- Dimensioni
 IDSchedaPreliminare  BIGINT,
 dataModifica  DATE,
 IDUtenteModifica  BIGINT,

 -- Misure
 valoreCampo  DECIMAL(18, 2)

 -- Constraint
 CONSTRAINT PK_MetraDTE_AttivitaPreliminariLogModifiche_Modifiche PRIMARY KEY CLUSTERED (
  ID
 )
);

END;
GO

