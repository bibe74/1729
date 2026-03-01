USE tools;
GO

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;
GO

/*requires Schema.Administration.sql*/

DECLARE @ProcedureSchema NVARCHAR(256);
DECLARE @ProcedureName   NVARCHAR(256);

SET @ProcedureSchema = 'Administration' ;
SET @ProcedureName = 'DropDatabaseUser' ;

PRINT '-----------------------------------------------------------------------------------------------------------------';
PRINT 'PROCEDURE [' + @ProcedureSchema + '].[' + @ProcedureName +  ']';

IF  NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[' + @ProcedureSchema + N'].[' + @ProcedureName +  N']') AND type in (N'P'))
BEGIN
    BEGIN TRY
        EXECUTE ('CREATE Procedure [' + @ProcedureSchema + '].[' + @ProcedureName +  '] ( ' +
                ' @ServerName    varchar(512), ' +
                ' @DbName    varchar(50) ' +
                ') ' +
                'AS ' +
                'BEGIN ' +
                '   SELECT ''Not implemented'' ' +
                'END')
    END TRY
    BEGIN CATCH
        PRINT '   Error while trying to create procedure'
        RETURN
    END CATCH

    PRINT '   PROCEDURE created.'
END
GO

ALTER PROCEDURE [Administration].[DropDatabaseUser] (
    @DbName                         VARCHAR(256),
    @UserName                       VARCHAR(256),
    @ResetOwnership                 BIT             = 1, -- reset to schema/objects ownership to @NewObjectOwner 
    @NewObjectOwner                 VARCHAR(256)    = 'dbo',
    @Debug                          BIT             = 0
)
AS
/*
  ===================================================================================
    DESCRIPTION:

    PARAMETERS:

    REQUIREMENTS:

    EXAMPLE USAGE :
    
        EXEC [Administration].[DropDatabaseUser] 
							@DbName     	= 'TestMigrationProcess',
							@UserName		= 'OrphanUserTest',
							@NewObjectOwner = 'dbo',
							@Debug			= 1
                            
        -- should fail "Msg 50000, Level 14, State 1, Procedure DropDatabaseUser, Line 133 - Database user is mandatory"
        EXEC [Administration].[DropDatabaseUser] @DbName = 'MigrationDatabase',@UserName = 'dbo',@NewObjectOwner = 'INFORMATION_SCHEMA', @Debug = 1
        

        -- Test case:
        USE [MigrationDatabase]
        GO
        CREATE USER [blabla] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Administration]
        GO

        ALTER AUTHORIZATION ON SCHEMA::[Administration] TO [blabla]
        GO

        -- should fail 
        EXEC [Administration].[DropDatabaseUser] @DbName = 'MigrationDatabase',@UserName = 'blabla', @Debug = 1, @ResetOwnership = 0
        
        -- should succeed
        EXEC [Administration].[DropDatabaseUser] @DbName = 'MigrationDatabase',@UserName = 'blabla', @Debug = 1
;
  ===================================================================================
*/
BEGIN
    SET NOCOUNT ON;
    DECLARE @tsql               nvarchar(max);
    DECLARE @errorTxt           nvarchar(max);
    DECLARE @TmpCnt             BIGINT;
    DECLARE @tsqlExecRet        INT;
    DECLARE @LineFeed           CHAR(2);
    
    DECLARE @QuotedDbName       SYSNAME;
    DECLARE @QuotedDbUserName   SYSNAME;
    DECLARE @ObjectName         varchar(256);
    DECLARE @ObjectType         varchar(16);
    DECLARE @UserId             SMALLINT;
    DECLARE @CanExitLoop        BIT;
    
    DECLARE @DebugMessage       VARCHAR(256);

    SELECT
        @tsql               = '',
        @LineFeed           = CHAR(13) + CHAR(10),
        @CanExitLoop        = 0,
        @QuotedDbName       = QUOTENAME(ISNULL(@DbName,DB_NAME())),
        @QuotedDbUserName   = QUOTENAME(@UserName)
    ;

    if (@Debug = 1)
    BEGIN
        RAISERROR('-- -----------------------------------------------------------------------------------------------------------------',0,1);
        RAISERROR('-- Now running [Administration].[DropDatabaseUser] stored procedure.',0,1);
        RAISERROR('-- -----------------------------------------------------------------------------------------------------------------',0,1);
    END;
    
    if(@Debug = 1)
    BEGIN 
        RAISERROR('Checking database [%s] exists.',0,1,@DbName);
    END;
    
    IF(DB_ID(@DbName) IS NULL)
    BEGIN
        RAISERROR('Unknown database with name [%s]' , 12, 1,@DbName) WITH NOWAIT;
        RETURN;
    END;
    
    if(@Debug = 1)
    BEGIN 
        RAISERROR('Checking user exists in database',0,1);
    END;
    
    SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed +
                'SELECT @UserId = USER_ID(@UserName) ;';
    
    IF(@Debug = 1)
    BEGIN
        SET @DebugMessage = '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
        RAISERROR(@DebugMessage,0,1);
    END;
    
    exec sp_executesql @tsql, N'@UserId SMALLINT OUTPUT,@UserName VARCHAR(256)',@UserId = @UserId OUTPUT,@UserName = @UserName ;
    
    if(@UserId IS NULL)
    BEGIN
        RAISERROR('User [%s] not found in database [%s]',12,1,@UserName,@DbName) WITH NOWAIT;
        RETURN;
    END;
    
    -- Do not change @tsql before a comment that tells it's ok
    
    if(@ResetOwnership = 1)
    BEGIN 
        if(@Debug = 1)
        BEGIN 
            RAISERROR('Checking new object owner exists in database ',0,1);
        END;
        
        exec sp_executesql @tsql, N'@UserId SMALLINT OUTPUT,@UserName VARCHAR(256)',@UserId = @UserId OUTPUT,@UserName = @NewObjectOwner ;
        
        if(@UserId IS NULL)
        BEGIN
            RAISERROR('User [%s] not found in database [%s]',12,1,@NewObjectOwner,@DbName) WITH NOWAIT;
            RETURN;
        END;
    END;
    
    -- @tsql can now be changed to anything you want
    
    if(@Debug = 1)
    BEGIN 
        RAISERROR('Checking that the user is not a mandatory user like ''dbo'' or ''public''',0,1);
    END;
    
    WITH MSShippedDbUsers (
        LoginName
    )
    AS (
        SELECT 'dbo'
        UNION ALL
        SELECT 'guest'
        UNION ALL
        SELECT 'INFORMATION_SCHEMA'
        UNION ALL
        SELECT 'public'        
        UNION ALL
        SELECT 'sys'
        UNION ALL
        SELECT distinct service_account
        FROM   master.sys.dm_server_services
    )
    SELECT @TmpCnt = COUNT(*)
    FROM MSShippedDbUsers 
    WHERE LoginName = @UserName;
    
    if(@TmpCnt > 0) 
    BEGIN
        RAISERROR('Database user is mandatory',14,1) WITH NOWAIT;
        RETURN;
    END;

    /*
        Avoid following error message :
        
        Msg 15136, Level 16, State 1, Line 2
        The database principal is set as the execution context of one or more procedures, functions, or event notifications and cannot be dropped.
    */
    
    if(@Debug = 1)
    BEGIN 
        RAISERROR('Checking that the user is not set as the execution context of one or more programmability components in database.',0,1);
    END;
    
    SET @tsql = 'USE ' + @QuotedDbName + ';' + @LineFeed +
                'SELECT @cnt = COUNT(*) FROM sys.sql_modules where execute_as_principal_id = user_id(@UserName)';
        
    exec @tsqlExecRet = sp_executesql @tsql, N'@cnt INT OUTPUT,@UserName SYSNAME',@cnt = @TmpCnt OUTPUT,@UserName = @UserName ;
        
    IF(@TmpCnt > 0) 
    BEGIN 
        SET @errorTxt = 'In database ' + @QuotedDbName + ', the database principal ' + @QuotedDbUserName + ' is set as the execution context of one or more procedures, functions, or event notifications and cannot be dropped.' + @LineFeed +
                        'List of modules:' + @LineFeed;
        
        -- Getting back the list
        SET @tsql = 'USE ' + @QuotedDbName + ';' + @LineFeed +
                    'SELECT @moduleList += ''    '' + OBJECT_SCHEMA_NAME(object_id) + ''.'' + OBJECT_NAME(object_id) + CHAR(13) + CHAR(10) FROM sys.sql_modules where execute_as_principal_id = user_id(@UserName)';
        
        exec @tsqlExecRet = sp_executesql @tsql, N'@moduleList NVARCHAR(MAX) OUTPUT,@UserName SYSNAME',@moduleList = @errorTxt OUTPUT,@UserName = @UserName ;    
        RAISERROR(@errorTxt,14,1) WITH NOWAIT;
        RETURN;
    END;
    
    
    if (@Debug = 1)
    BEGIN
        RAISERROR('-- --------------------------------------------------------------------',0,1);
        RAISERROR('-- Parameters:',0,1);
        RAISERROR('--     Database Name : %s',0,1,@QuotedDbName);
        RAISERROR('--     User Name     : %s',0,1,@QuotedDbUserName);
        RAISERROR('-- --------------------------------------------------------------------',0,1);
    END;
    
    IF(OBJECT_ID('tempdb..#OwnedDbObject') IS NOT NULL)
    BEGIN
        EXEC sp_executesql N'DROP TABLE #OwnedDbObject';
    END;
    
    CREATE TABLE #OwnedDbObject (
        ObjectName VARCHAR(256),
        ObjectType VARCHAR(16)
    );
    
    if(@Debug = 1)
    BEGIN
        RAISERROR('Collecting schemas owned by database user',0,1);
    END;
    
    SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed +
                'INSERT INTO #OwnedDbObject' + @LineFeed +
                'select' + @LineFeed +
                '    name, ' + @LineFeed +
                '    ''SCHEMA'' ' + @LineFeed +
                'from sys.schemas ' + @LineFeed +
                'where principal_id = USER_ID(@UserName);' + @LineFeed 
                ;
    
    IF(@Debug = 1)
    BEGIN
        SET @DebugMessage = '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
        RAISERROR(@DebugMessage,0,1);
    END;
    
    exec sp_executesql @tsql, N'@UserName VARCHAR(256)', @UserName = @UserName;
    
    
    if(@Debug = 1)
    BEGIN
        RAISERROR('Collecting roles owned by database user',0,1);
    END;    
    
    SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed +
                'INSERT INTO #OwnedDbObject' + @LineFeed +
                'select' + @LineFeed +
                '    name, ' + @LineFeed +
                '    ''ROLE'' ' + @LineFeed +
                'from sys.database_principals ' + @LineFeed +
                'where type=''R'' and owning_principal_id = USER_ID(@UserName);' + @LineFeed 
                ;
    
    IF(@Debug = 1)
    BEGIN
        SET @DebugMessage = '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
        RAISERROR(@DebugMessage,0,1);
    END;
    
    exec sp_executesql @tsql, N'@UserName VARCHAR(256)', @UserName = @UserName;
    
    SELECT @TmpCnt = COUNT_BIG(*) FROM #OwnedDbObject;
    
    if((@TmpCnt > 0) AND @ResetOwnership = 0)
    BEGIN 
		SET @errorTxt = 'Database user ' + @QuotedDbUserName + ' owns ' + CONVERT(VARCHAR(10),@TmpCnt) + ' schema(s) in the database ' + @QuotedDbName + '.' ;
        RAISERROR (@errorTxt,12,1) WITH NOWAIT;
        RETURN;
    END;
    
    if(@Debug = 1)
    BEGIN
        RAISERROR('Collecting roles memberships for database user',0,1);
    END;
        
    SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed +
                'INSERT INTO #OwnedDbObject' + @LineFeed +
                'select' + @LineFeed +
                '    dp.name, ' + @LineFeed +
                '    ''MEMBERSHIP'' ' + @LineFeed +
                'from sys.database_role_members drm'  + @LineFeed +
                'inner join sys.database_principals dp '  + @LineFeed +
                'on dp.principal_id= drm.role_principal_id'  + @LineFeed +
                'where member_principal_id = USER_ID(@UserName);' + @LineFeed 
                ;
    
    IF(@Debug = 1)
    BEGIN
        SET @DebugMessage = '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
        RAISERROR(@DebugMessage,0,1);
    END;
    
    exec sp_executesql @tsql, N'@UserName VARCHAR(256)', @UserName = @UserName;
    
    if(@Debug = 1)
    BEGIN
        RAISERROR('Setting %s as owner of collected roles and schema',0,1,@NewObjectOwner);
        RAISERROR('And also removing object role memberships for database user [%s]',0,1,@NewObjectOwner,@UserName);
        SELECT * FROM #OwnedDbObject;
    END;
    
    -- ensure we go into the loop
    SET @CanExitLoop = 0;
    
    WHILE(@CanExitLoop = 0)
    BEGIN
        SET @ObjectName = NULL;
        
        SELECT TOP 1
            @ObjectName = ObjectName,
            @ObjectType = ObjectType
        FROM #OwnedDbObject ;
        
        IF(@ObjectName IS NULL)
        BEGIN
            SET @CanExitLoop = 1;
            CONTINUE;
        END;
        
        IF(@Debug = 1)
        BEGIN
            RAISERROR('    > Type: %s | Name: %s',0,1,@ObjectType,@ObjectName);
        END;
        
        if(@ObjectType = 'MEMBERSHIP')
        BEGIN 
            SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed + 
                        'EXEC sp_droprolemember N''' + @ObjectName + ''', N''' + @UserName + ''';'  + @LineFeed
                        ;
        END;
        ELSE 
        BEGIN 
            SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed + 
                        'ALTER AUTHORIZATION ON ' + @ObjectType + '::'+QUOTENAME(@ObjectName) + ' TO [' + @NewObjectOwner + '];'  
                        ;
        END;
        
        IF(@Debug = 1)
        BEGIN
            SET @DebugMessage = '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
            RAISERROR(@DebugMessage,0,1);
        END;
        
        exec sp_executesql @tsql;
        
        DELETE FROM #OwnedDbObject WHERE ObjectName = @ObjectName and ObjectType = @ObjectType;
    
    END;
   
    -- table #OwnedDbObject should be empty
    IF((SELECT COUNT(*) FROM #OwnedDbObject) > 0)
    BEGIN 
        RAISERROR('There are still schemas in the list...',12,1) WITH NOWAIT;
        RETURN;
    END;
    
    IF(@Debug = 1)
    BEGIN
        RAISERROR('Dropping database user',0,1);
    END;
    
    SET @tsql = 'USE [' + @DbName + ']; ' + @LineFeed + 
                'EXEC sp_executesql N''DROP USER ' + QUOTENAME(@UserName) + ''';'
    
    IF(@Debug = 1)
    BEGIN
        SET @DebugMessage = '/* Next Query to run:' + @LineFeed + @tsql + @LineFeed + '*/';
        RAISERROR(@DebugMessage,0,1);
    END;
    
    exec sp_executesql @tsql;    
    
    
    IF(@Debug = 1)
    BEGIN
        RAISERROR('Performing cleanups',0,1);
    END; 
    
    IF(OBJECT_ID('tempdb..#OwnedDbObject') IS NOT NULL)
    BEGIN
        EXEC sp_executesql N'DROP TABLE #OwnedDbObject';
    END;
    
    if (@Debug = 1)
    BEGIN
        RAISERROR('-- -----------------------------------------------------------------------------------------------------------------',0,1);    
        RAISERROR('-- Execution of [Administration].[DropDatabaseUser] completed.',0,1);
        RAISERROR('-- -----------------------------------------------------------------------------------------------------------------',0,1);
    END;


END
GO


IF (@@ERROR = 0)
BEGIN
    PRINT '   PROCEDURE altered.';
END
ELSE
BEGIN
    PRINT '   Error while trying to alter procedure';
    RETURN
END;
GO

PRINT '-----------------------------------------------------------------------------------------------------------------';
PRINT '';
GO
