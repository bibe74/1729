CREATE TABLE [Staging].[T_Distributore]
(
[PKDistributore] [int] NOT NULL IDENTITY(1, 1),
[LocalitaDistributore] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumeroRifornimenti] [int] NULL,
[LocalitaDistributore_cleaned] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[T_Distributore] ADD CONSTRAINT [PK_staging_T_Distributore] PRIMARY KEY CLUSTERED  ([PKDistributore]) ON [PRIMARY]
GO
