
CREATE PROCEDURE METRADTE.usp_Create_MetraDTE_AnagraficaUtenti_Utente
AS
BEGIN
SET NOCOUNT ON;

CREATE TABLE METRADTE.MetraDTE_AnagraficaUtenti_Utente (
 -- Chiavi
 ID  BIGINT NOT NULL,

 -- Dimensioni
 Nome  NVARCHAR(50),
 Cognome  NVARCHAR(50)


 -- Constraint
 CONSTRAINT PK_MetraDTE_AnagraficaUtenti_Utente PRIMARY KEY CLUSTERED (
  ID
 )
);

END;
GO

