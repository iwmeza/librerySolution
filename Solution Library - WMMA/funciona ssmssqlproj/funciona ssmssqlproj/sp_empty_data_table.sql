USE Library;

-- EMPTY DATA TABLE
CREATE PROCEDURE sp_emptyDataTable
    @name VARCHAR(20)
AS
BEGIN TRY
    DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'ALTER TABLE ' + @name + ' NOCHECK CONSTRAINT ALL;';
	EXEC sp_executesql @sql;

	SET @sql = 'TRUNCATE TABLE ' + @name;
	EXEC sp_executesql @sql;

	SET @sql = 'ALTER TABLE ' + @name + ' CHECK CONSTRAINT ALL;';
    EXEC sp_executesql @sql;

    SET @sql = 'DBCC CHECKIDENT (''' + @name + ''', RESEED, 1);';
    EXEC sp_executesql @sql;

END TRY
BEGIN CATCH
	-- HANDLE ERRORS
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage	= ERROR_MESSAGE(),
        @ErrorSeverity	= ERROR_SEVERITY(),
        @ErrorState		= ERROR_STATE();

    PRINT 'Error al eliminar el esquema: ' + @ErrorMessage;
END CATCH;

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_emptyDataTable