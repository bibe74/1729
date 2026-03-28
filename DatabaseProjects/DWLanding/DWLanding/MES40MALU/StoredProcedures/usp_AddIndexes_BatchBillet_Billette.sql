
CREATE PROCEDURE MES40MALU.usp_AddIndexes_BatchBillet_Billette
AS
BEGIN
SET NOCOUNT ON;

--CREATE NONCLUSTERED INDEX IX_MES40MALU_BatchBillet_Billette_ ON MES40MALU.BatchBillet_Billette () INCLUDE();
CREATE NONCLUSTERED INDEX IX_MES40MALU_BatchBillet_Billette_StartTs_INCLUDE ON [MES40MALU].[BatchBillet_Billette] ([StartTs]) INCLUDE ([BatchID],[BilletNo]);

END;
GO

