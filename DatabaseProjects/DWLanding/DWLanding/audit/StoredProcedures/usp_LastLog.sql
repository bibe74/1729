
CREATE PROCEDURE audit.usp_LastLog
AS
BEGIN
SET NOCOUNT ON;

DECLARE @LastPKEventLog BIGINT;

SELECT @LastPKEventLog = MAX(PKEventLog) FROM audit.EventLog (nolock) WHERE IsElaborationStart = 1;

SELECT
	EventTimeStamp,
	LogMessage,
	NumberOfRows,
	CONVERT(NVARCHAR, DATEADD(ss, TimeElapsedInstruction, 0), 108) AS InstructionTime,
	CONVERT(NVARCHAR, DATEADD(ss, TimeElapsedSubElaboration, 0), 108) AS SubElaborationTime,
	CONVERT(NVARCHAR, DATEADD(ss, TimeElapsedElaboration, 0), 108) AS ElaborationTime
FROM audit.EventLog (nolock)
WHERE PKEventLog >= @LastPKEventLog
ORDER BY PKEventLog DESC;

END;
GO

