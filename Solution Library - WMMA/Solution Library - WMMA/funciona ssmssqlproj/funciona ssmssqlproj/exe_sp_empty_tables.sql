USE Library;

-- DELETE DATA & REINICIATE IDENTITY
CREATE PROCEDURE exe_spDeleteData
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
        END
        ELSE
        BEGIN
            EXEC sp_emptyDataTable @name = @table;
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;

EXEC exe_spDeleteData @opc = 0, @table = 'Books.books'