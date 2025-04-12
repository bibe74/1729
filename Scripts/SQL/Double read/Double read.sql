--DROP TABLE IF EXISTS dbo.Employee;
GO

IF OBJECT_ID('dbo.Employee', 'U') IS NULL
BEGIN

CREATE TABLE dbo.Employee (
    ID INT NOT NULL IDENTITY(1, 1) CONSTRAINT PK_Employee PRIMARY KEY NONCLUSTERED,
    FullName NVARCHAR(80) NOT NULL,
    Salary MONEY
);

CREATE CLUSTERED INDEX CIX_Employee_Salary ON dbo.Employee (Salary);

INSERT INTO dbo.Employee
(
    FullName,
    Salary
)
VALUES (N'Alice Cooper', 1000.0),
    (N'Brian Johnson', 1100.0),
    (N'Chuck Berry', 1200.0);

END;
GO

SELECT * FROM dbo.Employee;
GO

-- Open tab #2:
BEGIN TRANSACTION 
UPDATE dbo.Employee SET Salary = 1400.0 WHERE ID = 2; -- 2: Brian Johnson, was 1100.0
--COMMIT TRANSACTION

-- Go back to tab #1:
SELECT * FROM dbo.Employee; -- the query gets stuck

-- Open tab #3:
UPDATE dbo.Employee SET Salary = 1500.0 WHERE ID = 1; -- 1: Alice Cooper, was 1000.0

-- Go back to tab #2:
COMMIT TRANSACTION

-- Go back to tab #1:
-- ?!?

