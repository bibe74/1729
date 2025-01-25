CREATE TABLE [dbo].[FactSimulazioni]
(
[PKOfferta] [tinyint] NOT NULL,
[PKArticolo] [tinyint] NOT NULL,
[QtaSimulazione] [int] NOT NULL,
[Importo] [decimal] (10, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSimulazioni] ADD CONSTRAINT [PK_FactSimulazioni] PRIMARY KEY CLUSTERED  ([PKOfferta], [PKArticolo], [QtaSimulazione]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSimulazioni] ADD CONSTRAINT [FK_FactSimulazioni_PKArticolo] FOREIGN KEY ([PKArticolo]) REFERENCES [dbo].[DimArticolo] ([PKArticolo])
GO
ALTER TABLE [dbo].[FactSimulazioni] ADD CONSTRAINT [FK_FactSimulazioni_PKOfferta] FOREIGN KEY ([PKOfferta]) REFERENCES [dbo].[DimOfferta] ([PKOfferta])
GO
