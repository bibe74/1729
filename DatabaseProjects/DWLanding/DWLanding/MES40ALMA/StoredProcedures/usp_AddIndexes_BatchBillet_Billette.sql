
CREATE PROCEDURE MES40ALMA.usp_AddIndexes_BatchBillet_Billette
AS
BEGIN
SET NOCOUNT ON;

--CREATE NONCLUSTERED INDEX IX_MES40ALMA_BatchBillet_Billette_ ON MES40ALMA.BatchBillet_Billette () INCLUDE();
CREATE NONCLUSTERED INDEX IX_MES40ALMA_BatchBillet_Billette_StartTs_INCLUDE ON [MES40ALMA].[BatchBillet_Billette] ([StartTs]) INCLUDE ([BatchID],[BilletNo]);

END;
GO

