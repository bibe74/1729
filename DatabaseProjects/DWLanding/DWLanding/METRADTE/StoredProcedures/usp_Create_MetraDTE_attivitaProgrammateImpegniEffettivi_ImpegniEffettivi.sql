
CREATE PROCEDURE METRADTE.usp_Create_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE METRADTE.MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi (
 -- Chiavi
 ID  BIGINT NOT NULL,

 -- Dimensioni
 IDScheda  BIGINT,

 -- Misure
 impegnoEffettivo  DECIMAL(18, 2)

 -- Constraint
 CONSTRAINT PK_MetraDTE_attivitaProgrammateImpegniEffettivi_ImpegniEffettivi PRIMARY KEY CLUSTERED (
  ID
 )
);

END;
GO

