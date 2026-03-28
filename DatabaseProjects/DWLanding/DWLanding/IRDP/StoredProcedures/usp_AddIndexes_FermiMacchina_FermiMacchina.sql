
CREATE PROCEDURE IRDP.usp_AddIndexes_FermiMacchina_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_IRDP_FermiMacchina_FermiMacchina_DowntimeType_BatchDowntimeID ON IRDP.FermiMacchina_FermiMacchina (DowntimeType, BatchDowntimeID);

END;
GO

