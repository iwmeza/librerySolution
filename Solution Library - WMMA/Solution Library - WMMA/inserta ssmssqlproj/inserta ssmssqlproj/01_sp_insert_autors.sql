USE Library;

-- INSERT
CREATE PROCEDURE sp_insertAutors
    @name NVARCHAR(22)
AS
BEGIN
    INSERT INTO Autors.autors (name) VALUES (@name);
	PRINT 'Autor insertado con éxito: ' + @name;
END;

EXEC sp_insertAutors @name = 'Ángel Ganivet';
EXEC sp_insertAutors @name = 'Antonio Machado';
EXEC sp_insertAutors @name = 'Azorín';
EXEC sp_insertAutors @name = 'Jacinto Benavente';
EXEC sp_insertAutors @name = 'José Ortega y Gasset';
EXEC sp_insertAutors @name = 'Juan Ramón Jiménez';
EXEC sp_insertAutors @name = 'Miguel de Unamuno';
EXEC sp_insertAutors @name = 'Pío Baroja';
EXEC sp_insertAutors @name = 'Ramiro de Maeztu';
EXEC sp_insertAutors @name = 'Ramón del Valle-Inclán';
EXEC sp_insertAutors @name = 'Ramón Menéndez Pidal';