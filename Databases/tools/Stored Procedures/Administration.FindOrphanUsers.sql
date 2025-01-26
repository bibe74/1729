SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Administration].[FindOrphanUsers] (
    @DatabaseName                   VARCHAR(256)    = NULL,
    @TryToFix                       BIT             = 0,
    @DropUnfixable                  BIT             = 0,
    @OutputType                     VARCHAR(16)     = 'TABLE', -- 
    @Debug                          BIT             = 0
)
AS
/*
  ===================================================================================
    DESCRIPTION:
        This procedure will find all orphan users that are defined in:
            - all databases when @DatabaseName is NULL or empty
            - the database specified in @DatabaseName 

    PARAMETERS:
        @DatabaseName   the database in which this procedure should look for orphan users
        @TryToFix       set it to 1 for this stored procedure to try to fix it
        @DropUnfixable  set it to 1 to tell stored procedure to drop to try to drop users that cannot be fixed
        @OutputType     tells the stored procedure which type of output should be done. 
                        Possible values are: TABLE, REPORT, NONE.
        @Debug          set it to 1 if you want this procedure to output details of its execution

    REQUIREMENTS:
        Relies on Common.RunQueryAcrossDatabases stored procedure

    EXAMPLE USAGE :
        
        Display Only:
    
            EXEC [Administration].[FindOrphanUsers] @Debug = 1
            
        Report Only 
            EXEC [Administration].[FindOrphanUsers] @OutputType = 'REPORT', @Debug = 1
            
        Display And fix:
            EXEC [Administration].[FindOrphanUsers] @Debug = 1, @TryToFix = 1
            
        Display And fix in a particular database:
            EXEC [Administration].[FindOrphanUsers] @Debug = 1, @TryToFix = 1, @DatabaseName = 'TestMigrationProcess'
  ===================================================================================
*/
BEGIN
    SET NOCOUNT ON;
    DECLARE @tsql               nvarchar(max);
    DECLARE @LineFeed           CHAR(2);
    
    -- Fix and drop related variables
    DECLARE @CurrentDb          VARCHAR(256);
    DECLARE @CurrentUser        VARCHAR(256);
    DECLARE @CanExitLoop        BIT;
    DECLARE @OperationOutcome   VARCHAR(16);

    SELECT
        @tsql               = '',
        @LineFeed           = CHAR(13) + CHAR(10),
        @CurrentDb          = NULL,
        @CurrentUser        = NULL,
        @CanExitLoop        = 0
    ;

    if (@Debug = 1)
    BEGIN
        PRINT '-- -----------------------------------------------------------------------------------------------------------------';
        PRINT '-- Now running [Administration].[FindOrphanUsers] stored procedure.';
        PRINT '-- -----------------------------------------------------------------------------------------------------------------';
    END;

    IF(@TryToFix = 0 AND @DropUnfixable = 1)
    BEGIN
        RAISERROR('Cannot drop unfixable orphan users without trying to fix at first. Review parameters.',12,1) WITH NOWAIT;
        RETURN;
    END;
    
    IF(OBJECT_ID('tempdb..#OrphanUsersData') IS NOT NULL)
    BEGIN
        EXEC sp_executesql N'DROP TABLE #OrphanUsersData;';
    END;
    
    CREATE TABLE #OrphanUsersData (
        DbName              VARCHAR(256),
        UserName            VARCHAR(256),
        UserType            VARCHAR(256),
        DefaultSchemaName   VARCHAR(256),
        CreationDate        DATE,
        ModifiedDate        DATE,
        FixIssue            VARCHAR(16),
        DropIssue           VARCHAR(16),
        DDL2Drop            VARCHAR(MAX),
        DDL2Remap           AS  'Use ' + QUOTENAME(DbName) + ';' + CHAR(13) + CHAR(10) +
                                'EXEC dbo.sp_change_users_login @Action = ''update_one'', @UserNamePattern = ''' + UserName + ''', @LoginName = ''' + UserName + ''';' + CHAR(13) + CHAR(10)
    ); 
    
    SET @tsql = 'INSERT INTO #OrphanUsersData (' + @LineFeed +
                '    DbName,UserName,UserType,DefaultSchemaName,CreationDate,ModifiedDate,DDL2Drop' + @LineFeed +
                ')' + @LineFeed +
                'select DB_NAME(), name as DbUserName, type_desc as UserType,default_schema_name as DefaultSchema,create_date as CreationDate,modify_date as ModifiedDate' + @LineFeed +
                '       , ''USE '' + DB_NAME() + '';''  + CHAR(13) + CHAR(10)  + ' +  @LineFeed +
                '         ''PRINT ''''DbName='' + DB_NAME() + '';User='' + name COLLATE DATABASE_DEFAULT + '';Type='' + type_desc COLLATE DATABASE_DEFAULT + '';DefaultSchema='' + ISNULL(default_schema_name ,''N/A'') COLLATE DATABASE_DEFAULT + '';LastModif='' + CONVERT(VARCHAR,modify_date,121) + '''''';'' + CHAR(13) + CHAR(10) +' + @LineFeed +
                '         ''EXEC [' + DB_NAME() + '].[Administration].[DropDatabaseUser] '' + CHAR(13) + CHAR(10) + ' + 
                '         ''            @DbName             = '''''' + DB_NAME() + '''''', '' + CHAR(13) + CHAR(10) + ' +
                '         ''            @UserName           = '''''' + name + '''''', '' + CHAR(13) + CHAR(10) + ' +
                '         ''            @NewObjectOwner     = ''''dbo'''', '' + CHAR(13) + CHAR(10) + ' +
                '         ''            @ResetOwnership     = 1, '' + CHAR(13) + CHAR(10) + ' +
                '         ''            @Debug              = ' + CONVERT(CHAR(1),@Debug) + ';''' + @LineFeed +
                'from sys.database_principals' + @LineFeed +
                'where type in (''G'',''S'',''U'')' + @LineFeed 
                ;
                
    IF( (CONVERT(INT,left(cast(serverproperty('productversion') as varchar), 2))) > 10) -- SQL Server 2012+
    BEGIN 
        SET @tsql = @tsql + 
                    'and authentication_type<>2 /* Use this filter only if you are running on SQL Server 2012 and major versions and you have "contained databases"*/' + @LineFeed
                    ;
    END;
                
    SET @tsql = @tsql +             
                'and [sid] not in ( select [sid] from sys.server_principals where type in (''G'',''S'',''U'') )' + @LineFeed +
                'and name not in (''dbo'',''guest'',''INFORMATION_SCHEMA'',''sys'',''MS_DataCollectorInternalUser'')' + @LineFeed +
                'order by name;' 
                ;
    
    IF(@Debug = 1)
    BEGIN
        PRINT '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
    END;
    
    if(@DatabaseName IS NULL OR LEN(@DatabaseName) = 0)
    BEGIN 
        exec Common.RunQueryAcrossDatabases @QueryTxt = @tsql
    END;
    ELSE
    BEGIN
        exec Common.RunQueryAcrossDatabases @QueryTxt = @tsql , @DbName_equals = @DatabaseName ;
    END;
    
    
    SET @CanExitLoop        = 0;
    
    if(@TryToFix = 1)
    BEGIN
        PRINT '-- Trying to fix orphan users';
        
        WHILE (@CanExitLoop = 0)
        BEGIN
            SET @OperationOutcome = NULL;
            
            SELECT TOP 1
                @CurrentDb      = DbName,
                @CurrentUser    = UserName ,
                @tsql           = DDL2Remap
            FROM #OrphanUsersData
            WHERE FixIssue IS NULL
            ;
            
            IF(@CurrentDb IS NULL OR LEN(@CurrentDb) = 0)
            BEGIN
                SET @CanExitLoop = 1;
                CONTINUE;
            END; 
            
            IF(@Debug = 1)
            BEGIN
                RAISERROR('Now taking care of user [%s] in database [%s]',0,1,@CurrentUser,@CurrentDb);
            END;
            
            BEGIN TRY 
                
                IF(@Debug = 1)
                BEGIN 
                    PRINT '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
                END;
                
                EXEC sp_executesql @tsql;
                
                SET @OperationOutcome = 'SUCCESS';
            END TRY
            BEGIN CATCH
                SET @OperationOutcome = 'ERROR - ' + CONVERT(VARCHAR(10),ERROR_NUMBER());
            END CATCH 
            
            update #OrphanUsersData
            set FixIssue = @OperationOutcome
            WHERE DbName    = @CurrentDb 
              AND UserName  = @CurrentUser
            
            SET @CurrentDb = NULL;
        END;
        
        
    END;
    
    IF(@DropUnfixable = 1)
    BEGIN
        PRINT '-- Will drop unfixable users';
                PRINT '-- Trying to drop orphan users';
        
        WHILE (@CanExitLoop = 0)
        BEGIN
            SET @OperationOutcome = NULL;
            
            SELECT TOP 1
                @CurrentDb      = DbName,
                @CurrentUser    = UserName ,
                @tsql           = DDL2Drop
            FROM #OrphanUsersData
            WHERE FixIssue LIKE 'ERROR -%'
            AND  DropIssue IS NULL
            ;
            
            IF(@CurrentDb IS NULL OR LEN(@CurrentDb) = 0)
            BEGIN
                SET @CanExitLoop = 1;
                CONTINUE;
            END; 
            
            IF(@Debug = 1)
            BEGIN
                RAISERROR('Now taking care of user [%s] in database [%s]',0,1,@CurrentUser,@CurrentDb);
            END;
            
            BEGIN TRY 
                
                IF(@Debug = 1)
                BEGIN 
                    PRINT '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
                END;
                
                EXEC sp_executesql @tsql;
                
                SET @OperationOutcome = 'SUCCESS';
            END TRY
            BEGIN CATCH
                SET @OperationOutcome = 'ERROR - ' + CONVERT(VARCHAR(10),ERROR_NUMBER());
            END CATCH 
            
            update #OrphanUsersData
            set DropIssue = @OperationOutcome
            WHERE DbName    = @CurrentDb 
              AND UserName  = @CurrentUser
            
            SET @CurrentDb = NULL;
        END;
    END;
    
    IF(@OutputType = 'TABLE')
    BEGIN
        SELECT * FROM #OrphanUsersData ;
    END;
    ELSE IF(@OutputType = 'REPORT')
    BEGIN
        DECLARE @TotalCount     BIGINT;
        DECLARE @TotalFixed     BIGINT;
        DECLARE @TotalDropped   BIGINT;
        DECLARE @TotalInError   BIGINT;
        
        select @TotalCount   = COUNT(*) FROM #OrphanUsersData;
        select @TotalFixed   = COUNT(*) FROM #OrphanUsersData WHERE FixIssue  = 'SUCCESS' ;
        select @TotalDropped = COUNT(*) FROM #OrphanUsersData WHERE DropIssue = 'SUCCESS' ;
        select @TotalInError = COUNT(*) FROM #OrphanUsersData WHERE FixIssue IS NOT NULL AND DropIssue IS NOT NULL AND FixIssue <> 'SUCCESS' AND DropIssue <> 'SUCCESS' ;
        
        SELECT 
            @TotalCount         as TotalCount ,
                @TotalCount 
              - @TotalFixed 
              - @TotalDropped 
              - @TotalInError   as TotalSkipped,
            @TotalFixed         as TotalFixed,
            @TotalDropped       as TotalDropped,
            @TotalInError       as TotalInError
        ;
    END;
    
    -- Cleanups 
    
    IF(OBJECT_ID('tempdb..#OrphanUsersData') IS NOT NULL)
    BEGIN
        EXEC sp_executesql N'DROP TABLE #OrphanUsersData;';
    END;
    
                
    if (@Debug = 1)
    BEGIN
        PRINT '-- -----------------------------------------------------------------------------------------------------------------';    
        PRINT '-- Execution of [Administration].[FindOrphanUsers] completed.';
        PRINT '-- -----------------------------------------------------------------------------------------------------------------';
    END;


END
GO
