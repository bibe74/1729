
CREATE PROCEDURE EDMSRV2016.usp_AddIndexes_DocumentRevision_ProfiliIndustria
AS
BEGIN
SET NOCOUNT ON;

--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([IsLatestRevision]) INCLUDE ([ID],[DocumentID],[StartDate])
CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_IsLatestRevision_FILTERED ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([DocumentID],[StartDate]) WHERE [IsLatestRevision] = 1;

--CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([DocumentTypeID]) INCLUDE ([ID],[DocumentID])
CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_DocumentTypeID_DocumentID ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([DocumentTypeID],[DocumentID]);

--CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_IsLatestRevision_INCLUDE ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([IsLatestRevision]) INCLUDE ([ID],[DocumentID],[DocumentTypeID],[Filename],[StartDate]);
CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_IsLatestRevision_INCLUDE ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([IsLatestRevision]) INCLUDE ([DocumentID],[DocumentTypeID],[Filename],[StartDate]);

--CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_DocumentTypeID_IsLatestRevision_INCLUDE ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([DocumentTypeID],[Filename],[IsLatestRevision]) INCLUDE ([ID],[DocumentID],[StartDate])
CREATE NONCLUSTERED INDEX IX_EDMSRV2016_DocumentRevision_ProfiliIndustria_DocumentTypeID_IsLatestRevision_INCLUDE ON EDMSRV2016.DocumentRevision_ProfiliIndustria ([DocumentTypeID],[Filename],[IsLatestRevision]) INCLUDE ([DocumentID],[StartDate]);

END;
GO

