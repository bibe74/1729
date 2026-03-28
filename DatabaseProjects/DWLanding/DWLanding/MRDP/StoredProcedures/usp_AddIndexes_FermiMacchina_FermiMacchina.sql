
CREATE PROCEDURE MRDP.usp_AddIndexes_FermiMacchina_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_MRDP_FermiMacchina_FermiMacchina_DowntimeType_BatchDowntimeID ON MRDP.FermiMacchina_FermiMacchina (DowntimeType, BatchDowntimeID);

END;
GO

