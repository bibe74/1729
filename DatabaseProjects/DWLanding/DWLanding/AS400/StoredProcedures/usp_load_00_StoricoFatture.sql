
CREATE PROCEDURE AS400.usp_load_00_StoricoFatture
AS
BEGIN
SET NOCOUNT ON;

DECLARE @PKESE BIGINT;
DECLARE @LM NVARCHAR(255);

SET @LM = N'AS400.' + OBJECT_NAME(@@PROCID) + N': Inizio';
EXEC audit.usp_LogEvent @LogMessage = @LM, -- nvarchar(255)
    @PKEventSubElaboration = @PKESE OUTPUT
;

--EXEC audit.usp_DropCreateConstraints @operation = 'drop', @schema_name = 'AS400';

--BEGIN TRY

	/* Società del gruppo con GoLive AX il 01-01-2011
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_ALC_CSFAT00F_Fatture_MetraColor';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_ALC_CSFAT00F_Fatture_MetraColor OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_FOA_CSFAT00F_Fatture_Foall';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_FOA_CSFAT00F_Fatture_Foall OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_MET_CSFAT00F_Fatture_Metra';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_MET_CSFAT00F_Fatture_Metra OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_MYS_CSFAT00F_Fatture_MetraSistemi';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_MYS_CSFAT00F_Fatture_MetraSistemi OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	*/
	/* Società del gruppo con GoLive AX il 01-01-2015
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_IME_CSFAT00F_Fatture_Imet';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_IME_CSFAT00F_Fatture_Imet OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_MES_CSFAT00F_Fatture_MetraService';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_MES_CSFAT00F_Fatture_MetraService OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_PUG_CSFAT00F_Fatture_MetraPuglia';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_PUG_CSFAT00F_Fatture_MetraPuglia OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	*/
	/* Società del gruppo con GoLive AX il 01-06-2016
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_ALM_CSFAT00F_Fatture_MetraRagusa';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_ALM_CSFAT00F_Fatture_MetraRagusa OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	*/
	/* Società del gruppo con AS/400 */
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_COM_CSFAT00F_Fatture_MetraComponenti';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_COM_CSFAT00F_Fatture_MetraComponenti OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;
	EXEC audit.usp_reload_table @schema_name = N'AS400', @table_name = N'UNICA_VER_CSFAT00F_Fatture_Verall';
	EXEC audit.usp_LogEvent @LogMessage = N'Tabella AS400.UNICA_VER_CSFAT00F_Fatture_Verall OK', @PKEventSubElaboration = @PKESE OUTPUT, @NumberOfRows = @@ROWCOUNT;

--END TRY
--BEGIN CATCH

--	--EXEC audit.usp_DropCreateConstraints @operation = 'create', @schema_name = 'AS400';
	
--	SET @LM = N'Errore nella procedura AS400.' + OBJECT_NAME(@@PROCID) + N': verificare';
--	EXEC audit.usp_LogEvent @LogMessage = @LM, @PKEventSubElaboration = @PKESE OUTPUT;
--	RAISERROR (@LM, 10, 1);

--END CATCH

--EXEC audit.usp_DropCreateConstraints @operation = 'create', @schema_name = 'AS400';

SET @LM = N'AS400.' + OBJECT_NAME(@@PROCID) + N': Fine';
EXEC audit.usp_LogEvent @LogMessage = @LM, -- nvarchar(255)
	@PKEventSubElaboration = @PKESE OUTPUT
;

END;
GO

