
CREATE PROCEDURE audit.usp_LogEvent
	@LogMessage				NVARCHAR(255),
	@PKEventSubElaboration	BIGINT OUTPUT,
	@IsElaborationStart		BIT = 0,
	@NumberOfRows			INT = 0
AS
BEGIN
SET NOCOUNT ON;

IF (@IsElaborationStart = 1 OR @PKEventSubElaboration IS NULL)
BEGIN
	IF (@LogMessage IS NULL)
	BEGIN
		SET @LogMessage = N'Inizio elaborazione ' + FORMAT(CURRENT_TIMESTAMP, N'dd/MM/yyyy hh:mm:ss');
	END;
	INSERT INTO audit.EventSubElaboration (TimeStart) VALUES (CURRENT_TIMESTAMP);
	SET @PKEventSubElaboration = SCOPE_IDENTITY();
END

IF (@IsElaborationStart = 1)
	BEGIN
		INSERT INTO audit.EventLog (IsElaborationStart, PKEventSubElaboration, LogMessage) VALUES (1, @PKEventSubElaboration, @LogMessage);
	END
ELSE
	BEGIN
		WITH LastElaboration
		AS (
			SELECT TOP 1 EventTimeStamp FROM audit.EventLog WHERE IsElaborationStart = 1 ORDER BY PKEventLog DESC
		),
		LastSubElaboration
		AS (
			SELECT TOP 1 PKEventSubElaboration, TimeStart FROM audit.EventSubElaboration WHERE PKEventSubElaboration = @PKEventSubElaboration
		),
		LastEventLog
		AS (
			SELECT TOP 1 EventTimeStamp, PKEventSubElaboration FROM audit.EventLog ORDER BY PKEventLog DESC
		)
		INSERT INTO audit.EventLog (PKEventSubElaboration, LogMessage, NumberOfRows, TimeElapsedElaboration, TimeElapsedSubElaboration, TimeElapsedInstruction)
		SELECT
			@PKEventSubElaboration,
			@LogMessage AS LogMessage,
			@NumberOfRows AS NumberOfRows,
			DATEDIFF(ss, LE.EventTimeStamp, CURRENT_TIMESTAMP) AS TimeElapsedElaboration,
			DATEDIFF(ss, COALESCE(LSE.TimeStart, CURRENT_TIMESTAMP), CURRENT_TIMESTAMP) AS TimeElapsedSubElaboration,
			DATEDIFF(ss, LEL.EventTimeStamp, CURRENT_TIMESTAMP) AS TimeElapsedInstruction
		FROM LastElaboration LE
		CROSS JOIN LastEventLog LEL
		LEFT JOIN LastSubElaboration LSE ON LEL.PKEventSubElaboration = LSE.PKEventSubElaboration;
	END
END;
GO

