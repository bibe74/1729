
CREATE PROCEDURE MES40MSPA.usp_AddIndexes_BatchBillet_Billette
AS
BEGIN
SET NOCOUNT ON;

--CREATE NONCLUSTERED INDEX IX_MES40MSPA_BatchBillet_Billette_ ON MES40MSPA.BatchBillet_Billette () INCLUDE();
CREATE NONCLUSTERED INDEX IX_MES40MSPA_BatchBillet_Billette_StartTs_INCLUDE ON [MES40MSPA].[BatchBillet_Billette] ([StartTs]) INCLUDE ([BatchID],[BilletNo]);

END;
GO

