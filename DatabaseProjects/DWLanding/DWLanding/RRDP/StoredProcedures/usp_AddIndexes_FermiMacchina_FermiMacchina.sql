
CREATE PROCEDURE RRDP.usp_AddIndexes_FermiMacchina_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_RRDP_FermiMacchina_FermiMacchina_DowntimeType_BatchDowntimeID ON RRDP.FermiMacchina_FermiMacchina (DowntimeType, BatchDowntimeID);

END;
GO

