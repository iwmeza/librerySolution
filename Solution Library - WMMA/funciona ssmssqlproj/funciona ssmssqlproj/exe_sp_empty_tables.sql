USE Library;

-- DELETE DATA & REINICIATE IDENTITY
CREATE PROCEDURE exe_sp_DeleteData
	@opc BIT,
	@table VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        IF(@opc = 0)
        BEGIN
		    EXEC sp_emptyDataTable @name = 'Users.users';
			EXEC sp_emptyDataTable @name = 'Partners.partners';
			EXEC sp_emptyDataTable @name = 'Loans.loans';
			EXEC sp_emptyDataTable @name = 'Books.books';
            EXEC sp_emptyDataTable @name = 'Autors.autors';
        END;
        ELSE 
        BEGIN
            EXEC sp_emptyDataTable @name = @table;
        END;
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

		PRINT 'Error al eliminar los datos: ' + @ErrorMessage;
    END CATCH
END;

-- OPTIONS 0 OR 1 (WITH NAME)
-- EXEC exe_spDeleteData @opc =, @table = ''

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE exe_sp_DeleteData