CREATE TABLE [MES40MRAG].[Press_Pressa] (
    [PressID]     CHAR (3)      NOT NULL,
    [Description] NVARCHAR (50) NOT NULL
);
GO

ALTER TABLE [MES40MRAG].[Press_Pressa]
    ADD CONSTRAINT [PK_Press_Pressa] PRIMARY KEY CLUSTERED ([PressID] ASC);
GO

