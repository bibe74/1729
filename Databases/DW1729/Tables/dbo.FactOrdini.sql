CREATE TABLE [dbo].[FactOrdini]
(
[PKDataOrdine] [date] NOT NULL,
[PKArticolo] [tinyint] NOT NULL,
[Qta] [int] NOT NULL,
[Prezzo] [decimal] (10, 2) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactOrdini] ADD CONSTRAINT [PK_FactOrdini] PRIMARY KEY CLUSTERED  ([PKDataOrdine], [PKArticolo]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactOrdini] ADD CONSTRAINT [FK_FactOrdini_PKArticolo] FOREIGN KEY ([PKArticolo]) REFERENCES [dbo].[DimArticolo] ([PKArticolo])
GO
ALTER TABLE [dbo].[FactOrdini] ADD CONSTRAINT [FK_FactOrdini_PKDataOrdine] FOREIGN KEY ([PKDataOrdine]) REFERENCES [dbo].[DimData] ([PKData])
GO
