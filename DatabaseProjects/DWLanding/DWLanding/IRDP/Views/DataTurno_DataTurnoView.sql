
CREATE VIEW IRDP.DataTurno_DataTurnoView
AS
SELECT
    -- Chiavi
    PKDataTurno,        -- PKDataTurno

    -- Dimensioni
    PKData,        -- PKData
    IDTurno,        -- IDTurno
    Turno,        -- Turno
    DateTimeStart,        -- DateTimeStart
    DateTimeEnd        -- DateTimeEnd

FROM [SQL2012IMET\SCADA2012].Metra_RaccoltaDatiProduzione.dbo.DataTurno;
GO

