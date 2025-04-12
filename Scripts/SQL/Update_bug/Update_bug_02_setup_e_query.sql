/* Setup

USE test;

DROP TABLE IF EXISTS Province;

DROP TABLE IF EXISTS Comuni;

CREATE TABLE Province (
	Id CHAR(2) NOT NULL,
	Nome NVARCHAR(20) NOT NULL
);

INSERT INTO Province VALUES ('BS', N'Brescia'), ('PC', N'Piacenza');

CREATE TABLE Comuni (
	Id CHAR(4) NOT NULL,
	Nome NVARCHAR(30) NOT NULL,
	IdProvincia CHAR(2) NOT NULL,
	NomeProvincia NVARCHAR(20)
);

INSERT INTO Comuni (Id, Nome, IdProvincia) VALUES ('B157', N'Brescia', 'BS'), ('C055', N'Castegnato', 'BS'), ('G535', N'Piacenza', 'PC');

*/

SELECT * FROM province;

SELECT * FROM comuni;

SELECT * FROM province WHERE IdProvincia = 'BS';

SELECT * FROM province WHERE Id = 'BS';

UPDATE comuni SET NomeProvincia = N'Brescia'
WHERE IdProvincia IN (
	SELECT Id FROM province WHERE Nome = N'Brescia'
);

SELECT * FROM comuni;

UPDATE comuni SET NomeProvincia = N'Piacenza' 
WHERE IdProvincia IN (
	SELECT IdProvincia FROM province WHERE Id = N'PC'
);

SELECT * FROM comuni;
