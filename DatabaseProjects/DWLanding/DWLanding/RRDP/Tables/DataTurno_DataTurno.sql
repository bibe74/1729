CREATE TABLE [RRDP].[DataTurno_DataTurno] (
    [PKDataTurno]   INT      NOT NULL,
    [PKData]        DATE     NOT NULL,
    [IDTurno]       TINYINT  NOT NULL,
    [Turno]         CHAR (2) NOT NULL,
    [DateTimeStart] DATETIME NULL,
    [DateTimeEnd]   DATETIME NULL
);
GO

ALTER TABLE [RRDP].[DataTurno_DataTurno]
    ADD CONSTRAINT [PK_DataTurno_DataTurno] PRIMARY KEY CLUSTERED ([PKDataTurno] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_RRDP_DataTurno_DataTurno_DateTimeStart_DateTimeEnd_INCLUDE]
    ON [RRDP].[DataTurno_DataTurno]([DateTimeStart] ASC, [DateTimeEnd] ASC)
    INCLUDE([PKData], [IDTurno], [Turno]);
GO

