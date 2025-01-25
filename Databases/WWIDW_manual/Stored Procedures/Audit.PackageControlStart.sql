SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Audit].[PackageControlStart]
(
    @PackageName varchar(100)
,   @PackageId uniqueidentifier
,   @ParentPackageId uniqueidentifier = NULL
,   @ExecutionId bigint
,   @StartTime DATETIME
,   @StopTime datetime = NULL
,   @InsertRowQuantity int = NULL
,   @UpdateRowQuantity int = NULL
,   @UnchangedRowQuantity int = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @PackageLogId int 
    INSERT INTO [Audit].[Package_Control]
    (
        [Package_NM]
    ,   [Package_ID]
    ,   [Parent_Package_ID]
    ,   [Execution_ID]
    ,   [Start_TS]
    ,   [Stop_TS]
    ,   [Insert_Row_QT]
    ,   [Update_Row_QT]
    ,	[Unchanged_Row_QT]
    )
    SELECT
        @PackageName 
    ,   @PackageId 
    ,   @ParentPackageId 
    ,   @ExecutionId 
    ,   CURRENT_TIMESTAMP
    ,   @StopTime 
    ,   @InsertRowQuantity 
    ,   @UpdateRowQuantity 
    ,	@UnchangedRowQuantity
  SELECT @PackageLogID = SCOPE_IDENTITY()
  SELECT  @PackageLogID as PackageLogID
END
GO
