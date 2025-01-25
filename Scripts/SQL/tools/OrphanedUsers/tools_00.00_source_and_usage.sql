USE tools;
GO

/* Script source: https://www.sqlshack.com/how-to-discover-and-handle-orphaned-database-users-in-sql-server/ */

/*
SET NOEXEC OFF;
--*/ SET NOEXEC ON;
GO

EXEC Administration.FindOrphanUsers @Debug = 0;
GO

EXEC Administration.FindOrphanUsers @OutputType = 'REPORT', @Debug = 0;
GO

EXEC Administration.FindOrphanUsers @Debug = 0, @TryToFix = 1;
GO
