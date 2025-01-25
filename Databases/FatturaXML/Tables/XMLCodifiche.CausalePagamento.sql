CREATE TABLE [XMLCodifiche].[CausalePagamento]
(
[IDCausalePagamento] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CausalePagamento] [nvarchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [XMLCodifiche].[CausalePagamento] ADD CONSTRAINT [PK_XMLCodifiche_CausalePagamento] PRIMARY KEY CLUSTERED  ([IDCausalePagamento]) ON [PRIMARY]
GO
