USE tools;
GO

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;
GO

/*requires Schema.Common.sql*/

DECLARE @TypeSchema NVARCHAR(256);
DECLARE @TypeName   NVARCHAR(256);

SET @TypeSchema = 'Common' ;
SET @TypeName = 'DatabaseNameList' ;

PRINT '--------------------------------------------------------------------------------------------------------------';
PRINT 'TYPE [' + @TypeSchema + '].[' + @TypeName +  ']';

IF  NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = @TypeName AND ss.name = @TypeSchema)
BEGIN
    BEGIN TRY 
        EXECUTE ('CREATE  TYPE [Common].[DatabaseNameList] AS TABLE ( ' +  
                 '    database_name SYSNAME NOT NULL )') ;
    END TRY 
    BEGIN CATCH 
        PRINT '   Error while trying to create type';
        RETURN;
    END CATCH 

    IF (@@ERROR = 0)
    BEGIN 
        PRINT '   TYPE created.';
	END;
    ELSE
    BEGIN
        PRINT '   Error while trying to alter type';
        RETURN
    END;
END
ELSE
BEGIN
	PRINT '    Already exists.';
END;
GO

PRINT '--------------------------------------------------------------------------------------------------------------';
PRINT '';
GO
