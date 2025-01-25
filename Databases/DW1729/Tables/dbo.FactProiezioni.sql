CREATE TABLE [dbo].[FactProiezioni]
(
[PKData] [date] NOT NULL,
[PKArticolo] [tinyint] NOT NULL,
[PKOfferta] [tinyint] NOT NULL,
[Qta] [decimal] (10, 2) NOT NULL,
[Importo] [decimal] (10, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactProiezioni] ADD CONSTRAINT [PK_FactProiezioni] PRIMARY KEY CLUSTERED  ([PKData], [PKArticolo], [PKOfferta]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactProiezioni] ADD CONSTRAINT [FK_FactProiezioni_PKArticolo] FOREIGN KEY ([PKArticolo]) REFERENCES [dbo].[DimArticolo] ([PKArticolo])
GO
ALTER TABLE [dbo].[FactProiezioni] ADD CONSTRAINT [FK_FactProiezioni_PKData] FOREIGN KEY ([PKData]) REFERENCES [dbo].[DimData] ([PKData])
GO
ALTER TABLE [dbo].[FactProiezioni] ADD CONSTRAINT [FK_FactProiezioni_PKOfferta] FOREIGN KEY ([PKOfferta]) REFERENCES [dbo].[DimOfferta] ([PKOfferta])
GO
