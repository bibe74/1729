SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Audit].[PackageControlStop]
(
    @PackageId uniqueidentifier
,   @ExecutionId bigint
,   @InsertRowQuantity int = NULL
,   @UpdateRowQuantity int = NULL
,	@UnchangedRowQuantity int = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    -- Close out the execution.
    UPDATE PC
    SET [Stop_TS] = CURRENT_TIMESTAMP  
    ,   [Insert_Row_QT] = @InsertRowQuantity
    ,   [Update_Row_QT] = @UpdateRowQuantity
	,	[Unchanged_Row_QT] = @UnchangedRowQuantity
    FROM  [Audit].[Package_Control] AS PC
    WHERE PC.Package_ID = @PackageId
        AND PC.Execution_ID = @ExecutionId
        AND PC.[Stop_TS] IS NULL;  
END
GO
