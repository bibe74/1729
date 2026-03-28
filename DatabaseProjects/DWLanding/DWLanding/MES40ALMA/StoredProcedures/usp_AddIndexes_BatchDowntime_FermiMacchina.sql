
CREATE PROCEDURE MES40ALMA.usp_AddIndexes_BatchDowntime_FermiMacchina
AS
BEGIN
SET NOCOUNT ON;

CREATE UNIQUE NONCLUSTERED INDEX IX_MES40ALMA_BatchDowntime_FermiMacchina_DowntimeType_BatchDowntimeID ON MES40ALMA.BatchDowntime_FermiMacchina (DowntimeType, BatchDowntimeID);

END;
GO

