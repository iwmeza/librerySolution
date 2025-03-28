USE Library;

-- INSERT
CREATE PROCEDURE sp_insertAutors
    @name NVARCHAR(22)
AS
BEGIN
    INSERT INTO Autors.autors (name) VALUES (@name);
	PRINT 'Autor insertado con �xito: ' + @name;
END;

EXEC sp_insertAutors @name = '�ngel Ganivet';
EXEC sp_insertAutors @name = 'Antonio Machado';
EXEC sp_insertAutors @name = 'Azor�n';
EXEC sp_insertAutors @name = 'Jacinto Benavente';
EXEC sp_insertAutors @name = 'Jos� Ortega y Gasset';
EXEC sp_insertAutors @name = 'Juan Ram�n Jim�nez';
EXEC sp_insertAutors @name = 'Miguel de Unamuno';
EXEC sp_insertAutors @name = 'P�o Baroja';
EXEC sp_insertAutors @name = 'Ramiro de Maeztu';
EXEC sp_insertAutors @name = 'Ram�n del Valle-Incl�n';
EXEC sp_insertAutors @name = 'Ram�n Men�ndez Pidal';