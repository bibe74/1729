CREATE TABLE [IRDP].[DataTurno_DataTurno] (
    [PKDataTurno]   INT      NOT NULL,
    [PKData]        DATE     NOT NULL,
    [IDTurno]       TINYINT  NOT NULL,
    [Turno]         CHAR (2) NOT NULL,
    [DateTimeStart] DATETIME NULL,
    [DateTimeEnd]   DATETIME NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_IRDP_DataTurno_DataTurno_DateTimeStart_DateTimeEnd_INCLUDE]
    ON [IRDP].[DataTurno_DataTurno]([DateTimeStart] ASC, [DateTimeEnd] ASC)
    INCLUDE([PKData], [IDTurno], [Turno]);
GO

ALTER TABLE [IRDP].[DataTurno_DataTurno]
    ADD CONSTRAINT [PK_DataTurno_DataTurno] PRIMARY KEY CLUSTERED ([PKDataTurno] ASC);
GO

