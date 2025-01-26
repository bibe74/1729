SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Common].[RunQueryAcrossDatabases] (
    @QueryTxt                   VARCHAR(MAX),
    @IncludeSystemDatabases     BIT          = 1,
    @OnlyAccessibleDatabases    BIT          = 1,
    @DbName_like         VARCHAR(256) = NULL,
    @DbName_not_like     VARCHAR(256) = NULL,
    @DbName_equals       VARCHAR(256) = NULL,
    @database_list              Common.DatabaseNameList READONLY,
    @Debug                      BIT          = 0   
)
AS
/*
  ===================================================================================
    DESCRIPTION:		
        Sometimes we want to run a query or a set of queries across all databases on a SQL server.  
        A common application is to collect usage metrics using database-specific dynamic management views.  
        If the databases share a common structure, then many other reporting, maintenance, AND integrity needs 
        could be met by frequently checking their structure, usage, or metadata regularly.

        sp_msforeachdb is an undocumented stored procedure that does just that.  
        Because it is undocumented, though, it gets no mention on MSDN, nor does it get much attention from the SQL Server community.  
        While it does the job seemingly well, it has several weaknesses.  
        As a result, I have come to classify it as unreliable AND NEVER to be used in any environment where accuracy AND predictability are important. 
        
        We can do better, so let’s start from scratch AND build a simple,
        yet effective stored procedure that will reliably run T-SQL commands across databases.  
        In addition, we’ll include options that we would actually want to use! 
        
        This is inspired from http://www.sqlservercentral.com/articles/sp_msforeachdb/117654/
        
        
    PARAMETERS:
   
        @IncludeSystemDatabases     when set to 0, will explicitly filter out msdb, master, tempdb, and model from our database list.
        @DbName_like         will filter out any databases that are not like the string passed in for the parameter (with wildcards before and after).
        @DbName_not_like     will filter out any databases that are like the string passed in for the parameter (also with wildcards surrounding it).
        @DbName_equals       will filter out any databases that do not have the exact name specified (with no wildcards).

   REQUIREMENTS:
   
   EXAMPLE USAGE :
   
        CREATE TABLE ##database_files (
               database_name NVARCHAR(128),
               fileid INT,
               file_type TINYINT,
               name NVARCHAR(128),
               physical_name NVARCHAR(260)
        );

        EXEC [Common].[RunQueryAcrossDatabases] '
               INSERT INTO ##database_files
               (      database_name,
                      fileid,
                      file_type,
                      name,
                      physical_name)
               SELECT
                      DB_NAME(),
                      file_id,
                      type,
                      name,
                      physical_name
               FROM sys.database_files'
        ;

        SELECT * FROM ##database_files ;

        DROP TABLE ##database_files   ;
*/
BEGIN 
    SET NOCOUNT ON;
    DECLARE @tsql             	    nvarchar(max);
	DECLARE @LineFeed 		        VARCHAR(10);
    DECLARE @DbListItemsCount       INT ;
    DECLARE @CurrentDbName          VARCHAR(300) -- Stores database name for use in the cursor
    
    SELECT 
        @tsql               = '',
		@LineFeed 			= CHAR(13) + CHAR(10);
    
    -- Check if there is a database list to parse
    SELECT @DbListItemsCount = COUNT(*) FROM @database_list;
    
    if @Debug = 1 
	BEGIN 
        PRINT '-- --------------------------------------------------------------------';
        PRINT 'Now running [Common].[RunQueryAcrossDatabases] stored procedure.';
        PRINT '-- --------------------------------------------------------------------';
    END 
        
    -- Stores our final list of databases to iterate through, after filters have been applied
    DECLARE @CurrentDbNames TABLE(database_name SYSNAME);

    SET @tsql = 'SELECT' + @LineFeed +
                '    SD.name AS database_name' + @LineFeed +
                'FROM sys.databases SD' + @LineFeed +
                'WHERE 1 = 1' + @LineFeed 
                ;
                
    IF @IncludeSystemDatabases = 0 -- Check if we want to omit system databases
    BEGIN
          SET @tsql = @tsql + 
                      'AND SD.name NOT IN (''master'', ''model'', ''msdb'', ''tempdb'')' + @LineFeed 
                      ;
    END;
    
    IF @OnlyAccessibleDatabases = 1 
    BEGIN
        SET @tsql = @tsql +
                    'AND SD.state_desc NOT IN (''RESTORING'',''RECOVERING'',''RECOVERY_PENDING'',''SUSPECT'',''OFFLINE'')' + @LineFeed 
                    ;
    END;
    
    IF @DbName_like IS NOT NULL -- Check if there is a LIKE filter AND apply it if one exists
    BEGIN
          SET @tsql = @tsql + 
                      'AND SD.name LIKE ''%' + @DbName_like + '%''' + @LineFeed
                      ;
    END;
    
    IF @DbName_not_like IS NOT NULL -- Check if there is a NOT LIKE filter AND apply it if one exists
    BEGIN
          SET @tsql = @tsql + '
                      AND SD.name NOT LIKE ''%' + @DbName_not_like + '%''' + @LineFeed 
                      ;
    END;
    
    IF @DbName_equals IS NOT NULL -- Check if there is an equals filter AND apply it if one exists
    BEGIN
          SET @tsql = @tsql + 
                      'AND SD.name = ''' + @DbName_equals + '''' + @LineFeed
                      ;
    END;
    
    IF (@DbListItemsCount IS NOT NULL AND @DbListItemsCount > 0)
    BEGIN
        SELECT
            DBLIST.database_name
        INTO ##database_list
        FROM @database_list DBLIST
        ;

        SET @tsql = @tsql + 
                    'AND SD.name IN (SELECT database_name FROM ##database_list)' + @LineFeed
                    ;
    END;

    -- Prepare database name list
    INSERT INTO @CurrentDbNames(database_name)
    EXEC (@tsql);

    DECLARE db_cursor CURSOR FOR 
        SELECT database_name FROM @CurrentDbNames;
        
    OPEN db_cursor;

    FETCH NEXT FROM db_cursor INTO @CurrentDbName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @tsql = 'USE ' + QUOTENAME(@CurrentDbName) + ';' + @LineFeed + @QueryTxt; -- Replace "?" with the database name
        
        EXEC sp_executesql @tsql;

        FETCH NEXT FROM db_cursor INTO @CurrentDbName;
    END;

    CLOSE db_cursor;
    DEALLOCATE db_cursor;

    IF (SELECT OBJECT_ID('tempdb..##database_list')) IS NOT NULL
    BEGIN
        DROP TABLE ##database_list;
    END

    if @Debug = 1 
	BEGIN 
        PRINT '--';
        PRINT '-- --------------------------------------------------------------------';
        PRINT '-- Execution of [Common].[RunQueryAcrossDatabases] completed.';
        PRINT '-- --------------------------------------------------------------------';
    END; 

END 
GO
