USE Library;

-- CHANGE LOAN BOOK STATUS
CREATE PROCEDURE sp_changeLoadBookStatus
	@bookName NVARCHAR(50),
	@return_date_a DATETIME

AS
BEGIN
	DECLARE @bookId TINYINT;
	DECLARE @bookReturn BIT;
	DECLARE @return_date DATETIME;
	DECLARE @id TINYINT;

	SELECT
		@bookId		= B.id
	FROM Books.books AS B
	WHERE B.title LIKE '%' + @bookName + '%'

	IF (@bookId IS NOT NULL)
	BEGIN
		IF EXISTS (SELECT 1 FROM Loans.loans WHERE bookFK = @bookId AND isReturn = 0 AND return_date IS NULL)
		BEGIN
			SELECT
				@id				= L.id,
				@bookReturn		= L.isReturn,
				@return_date	= L.return_date
			FROM Loans.loans AS L

			WHERE L.bookFK = @bookId

			IF(@return_date IS NULL)
			BEGIN TRY
				UPDATE Loans.loans SET isReturn = 1, return_date = @return_date_a WHERE id = @id 

				PRINT CONCAT('El libro: ', @bookName, ' a sido entregado en fecha: ', @return_date_a);

			END TRY
			BEGIN CATCH				
				PRINT ERROR_MESSAGE();
			END CATCH;
		END;
		ELSE
		BEGIN
			PRINT 'El libro no se puede actualizar, no ha sido entregado.';
		END;

	END;
	
	ELSE
	BEGIN
		PRINT 'El libro no existe.';
	END;
END;