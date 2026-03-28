CREATE FUNCTION INTELCO.GetBirthDateFromFiscalCode (@FiscalCode NVARCHAR(16))
RETURNS DATE
AS
BEGIN
    DECLARE @YearPart NVARCHAR(2);
    DECLARE @MonthChar NVARCHAR(1);
    DECLARE @DayPart NVARCHAR(2);
    DECLARE @Year INT;
    DECLARE @Month INT;
    DECLARE @Day INT;
    DECLARE @Gender NVARCHAR(1);
    DECLARE @BirthDate DATE;

    -- Controlla la lunghezza del codice fiscale
    IF LEN(@FiscalCode) <> 16
    BEGIN
        RETURN NULL; -- O gestisci l'errore in altro modo
    END

    -- Estrai le parti rilevanti del codice fiscale
    SET @YearPart = SUBSTRING(@FiscalCode, 7, 2);
    SET @MonthChar = SUBSTRING(@FiscalCode, 9, 1);
    SET @DayPart = SUBSTRING(@FiscalCode, 10, 2);

    -- Calcola l'anno (considerando il secolo)
    SET @Year = CAST(@YearPart AS INT);
    -- Assumiamo che se l'anno è <= ultime due cifre dell'anno corrente, sia del 2000.
    -- Altrimenti, sia del 1900. Questo è un'ipotesi comune, ma non infallibile.
    -- Per un'accuratezza perfetta, sarebbe necessaria una logica più complessa
    -- o dati aggiuntivi per determinare il secolo.
    IF @Year <= (CAST(FORMAT(GETDATE(), 'yy') AS INT) + 1) -- Aggiunto +1 per dare un po' di margine al futuro
    BEGIN
        SET @Year = 2000 + @Year;
    END
    ELSE
    BEGIN
        SET @Year = 1900 + @Year;
    END


    -- Converte il carattere del mese in un numero
    SET @Month = CASE @MonthChar
                     WHEN 'A' THEN 1
                     WHEN 'B' THEN 2
                     WHEN 'C' THEN 3
                     WHEN 'D' THEN 4
                     WHEN 'E' THEN 5
                     WHEN 'H' THEN 6
                     WHEN 'L' THEN 7
                     WHEN 'M' THEN 8
                     WHEN 'P' THEN 9
                     WHEN 'R' THEN 10
                     WHEN 'S' THEN 11
                     WHEN 'T' THEN 12
                     ELSE NULL -- Carattere mese non valido
                 END;

    -- Calcola il giorno e determina il sesso
    SET @Day = CAST(@DayPart AS INT);
    IF @Day > 40
    BEGIN
        SET @Day = @Day - 40;
        SET @Gender = 'F'; -- Femmina
    END
    ELSE
    BEGIN
        SET @Gender = 'M'; -- Maschio
    END;

    -- Costruisci la data di nascita
    IF @Year IS NOT NULL AND @Month IS NOT NULL AND @Day IS NOT NULL
    BEGIN
        -- Gestione dei giorni non validi per il mese (es. 31 febbraio)
        IF ISDATE(CAST(@Year AS NVARCHAR(4)) + '-' +
                   RIGHT('0' + CAST(@Month AS NVARCHAR(2)), 2) + '-' +
                   RIGHT('0' + CAST(@Day AS NVARCHAR(2)), 2)) = 1
        BEGIN
            SET @BirthDate = DATEFROMPARTS(@Year, @Month, @Day);
        END
        ELSE
        BEGIN
            SET @BirthDate = NULL; -- Data non valida
        END
    END
    ELSE
    BEGIN
        SET @BirthDate = NULL; -- Una delle parti non è valida
    END

    RETURN @BirthDate;
END;
GO

