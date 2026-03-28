/**
 * @stored_procedure audit.usp_reload_table
 * @description Script per caricamento tabelle OLAP
*/

CREATE   PROCEDURE audit.usp_reload_table (
	@schema_name			NVARCHAR(128),
	@table_name				NVARCHAR(128),
	@PKEventSubElaboration	BIGINT,
	@NumberOfRows			INT = 0
)
AS
BEGIN
SET NOCOUNT ON;

--DECLARE @schema_name			NVARCHAR(128) = N'Produzione';
--DECLARE @table_name			NVARCHAR(128) = N'FornitoreBillette';
DECLARE @full_table_name		NVARCHAR(261) = @schema_name + N'.' + @table_name;
DECLARE @sqlstatement			NVARCHAR(1000);
DECLARE @createWithSelectInto	BIT = 0;
DECLARE @LM						NVARCHAR(1000) = N'';

IF OBJECT_ID(@full_table_name, 'U') IS NULL
BEGIN
	--print N'Checking existence of procedure ' + @schema_name + N'.usp_Create_' + @table_name;
	IF OBJECT_ID(@schema_name + N'.usp_Create_' + @table_name, 'P') IS NULL
	BEGIN

		SET @createWithSelectInto = 1;

		--print N'Checking existence of view ' + @full_table_name + N'View';
		IF OBJECT_ID(@full_table_name + N'View', 'V') IS NOT NULL
		BEGIN
			SET @sqlstatement = N'SELECT TOP 0 * INTO ' + @full_table_name + N' FROM ' + @full_table_name + N'View;';
			--print @sqlstatement;
			EXEC dbo.sp_ExecuteSQL @sqlstatement;
		END;
	END;
	ELSE
	BEGIN
		SET @sqlstatement = N'EXEC ' + @schema_name + N'.usp_Create_' + @table_name + N';';
		--print @sqlstatement;
		EXEC dbo.sp_ExecuteSQL @sqlstatement;

		IF OBJECT_ID(@schema_name + N'.usp_AddIndexes_' + @table_name, 'P') IS NOT NULL
		BEGIN
			SET @sqlstatement = N'EXEC ' + @schema_name + N'.usp_AddIndexes_' + @table_name + N';';
			--print @sqlstatement;
			EXEC dbo.sp_ExecuteSQL @sqlstatement;
		END;
	END;
END;

SET @sqlstatement = N'TRUNCATE TABLE ' + @full_table_name + N';';
--print @sqlstatement;
EXEC dbo.sp_ExecuteSQL @sqlstatement;

IF OBJECT_ID(@full_table_name + N'View', 'V') IS NOT NULL
BEGIN
	SET @sqlstatement = N'INSERT INTO ' + @full_table_name + N' SELECT * FROM ' + @full_table_name + N'View;';
	--print @sqlstatement;
	SET @LM = N'Tabella ' + @full_table_name + N' OK';
	EXEC dbo.sp_ExecuteSQL @sqlstatement;
	EXEC audit.usp_LogEvent @LogMessage = @LM, @PKEventSubElaboration = @PKEventSubElaboration, @NumberOfRows = @@ROWCOUNT;
END;

IF OBJECT_ID(@schema_name + N'.usp_Load_' + @table_name, 'P') IS NOT NULL
BEGIN
	SET @sqlstatement = N'EXEC ' + @schema_name + N'.usp_Load_' + @table_name + N';';
	--print @sqlstatement;
	EXEC dbo.sp_ExecuteSQL @sqlstatement;
END;

IF (@createWithSelectInto = 1)
BEGIN
	IF OBJECT_ID(@schema_name + N'.usp_AddIndexes_' + @table_name, 'P') IS NOT NULL
	BEGIN
		SET @sqlstatement = N'EXEC ' + @schema_name + N'.usp_AddIndexes_' + @table_name + N';';
		--print @sqlstatement;
		EXEC dbo.sp_ExecuteSQL @sqlstatement;
	END;
END;

IF OBJECT_ID(@schema_name + N'.usp_Elaborate_' + @table_name, 'P') IS NOT NULL
BEGIN
	SET @sqlstatement = N'EXEC ' + @schema_name + N'.usp_Elaborate_' + @table_name + N';';
	--print @sqlstatement;
	EXEC dbo.sp_ExecuteSQL @sqlstatement;
END;

END;
GO

