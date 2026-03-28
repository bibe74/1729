CREATE TABLE [IMETPQ].[tblFoallFornitoriBillette_FornitoreBillette] (
    [CodiceFornitore] NVARCHAR (3)  NOT NULL,
    [ID]              BIGINT        NOT NULL,
    [NomeFornitore]   NVARCHAR (50) NULL
);
GO

ALTER TABLE [IMETPQ].[tblFoallFornitoriBillette_FornitoreBillette]
    ADD CONSTRAINT [PK_tblFoallFornitoriBillette_FornitoreBillette] PRIMARY KEY CLUSTERED ([CodiceFornitore] ASC);
GO

