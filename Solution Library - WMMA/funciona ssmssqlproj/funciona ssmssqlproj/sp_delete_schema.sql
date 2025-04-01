USE Library;

-- DELETE SCHEMAS
CREATE PROCEDURE sp_deleteSchema
	@nameSchema VARCHAR(8) 
AS

BEGIN TRY
	DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'DROP SCHEMA ' + QUOTENAME(@nameSchema);

    EXEC sp_executesql @SQL;

    PRINT 'Esquema eliminado con éxito: ' + @nameSchema;

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


-- EXEC sp_deleteSchema @nameSchema = 'Books';
-- EXEC sp_deleteSchema @nameSchema = 'Autors';
-- EXEC sp_deleteSchema @nameSchema = 'Users';
-- EXEC sp_deleteSchema @nameSchema = 'Partners';
-- EXEC sp_deleteSchema @nameSchema = 'Loans';

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_deleteSchema