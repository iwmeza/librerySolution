USE Library;

-- INSERT LOAD
CREATE PROCEDURE sp_insertLoan
	@userName NVARCHAR(50),
	@bookName NVARCHAR(50),
	@withdrawal_date DATETIME,
	@return_date DATETIME,
	@userId TINYINT,
	@bookId TINYINT

AS
BEGIN TRY

	INSERT INTO Loans.loans (withdrawal_date, return_date, partnerFK, bookFK, isReturn)
		VALUES (@withdrawal_date, @return_date, @userId, @bookId, 0);
						
		PRINT CONCAT('El libro: ', @bookName, ' se le ha prestado al socio: ', @userName;);

END TRY
BEGIN CATCH				
	PRINT ERROR_MESSAGE();
END CATCH;

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_insertLoan