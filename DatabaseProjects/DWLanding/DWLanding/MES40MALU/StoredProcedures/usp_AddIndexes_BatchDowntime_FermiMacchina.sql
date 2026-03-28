
CREATE PROCEDURE MES40MALU.usp_AddIndexes_BatchDowntime_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_MES40MALU_BatchDowntime_FermiMacchina_DowntimeType_BatchDowntimeID ON MES40MALU.BatchDowntime_FermiMacchina (DowntimeType, BatchDowntimeID);

END;
GO

