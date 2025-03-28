USE Library;

-- INSERT 
CREATE PROCEDURE sp_insertLoans

	@withdrawal_date DATETIME,
	@return_date DATETIME,
	--@partnerFK TINYINT,
	--@bookFK TINYINT,
	--@isReturn BIT
	@userName NVARCHAR(50),
	@bookName NVARCHAR(50)
AS
BEGIN
	DECLARE @userId TINYINT;
    DECLARE @isPartner BIT;
	DECLARE @bookId TINYINT;
	DECLARE @bookReturn BIT;
	
	-- GET & CHECK PARTNER
	SELECT
		@userId		= U.id,
		@isPartner	= U.isPartner
	FROM Users.users AS U

	WHERE U.name LIKE '%' + @userName + '%'

	IF (@userId IS NOT NULL) AND @isPartner = 1
		-- GET & CHECK BOOK
		BEGIN
			SELECT
				@bookId		= B.id
			FROM Books.books AS B

			WHERE B.title LIKE '%' + @bookName + '%'

			IF (@bookId IS NOT NULL)
			BEGIN
				-- CHECK IF EXISTS REGISTER
				IF EXISTS (SELECT 1 FROM Loans.loans WHERE bookFK = @bookId)
				BEGIN
					-- CHECK IS AVAILABLE
					SELECT
						@bookReturn = L.isReturn
					FROM Loans.loans AS L

					WHERE L.bookFK = @bookId

					IF(@bookReturn = 1)
					BEGIN
						EXEC sp_insertLoan	@withdrawal_date = @withdrawal_date, 
											@return_date = @return_date, 
											@userId = @userId, 
											@bookId = @bookId, 
											@userName = @userName, 
											@bookName = @bookName					
					END;
					ELSE
					BEGIN
						PRINT 'El libro no se encuentra disponible.';
					END;

				END;
				ELSE
				BEGIN
					-- NEW REGISTER LOANS
					EXEC sp_insertLoan	@withdrawal_date = @withdrawal_date, 
											@return_date = @return_date, 
											@userId = @userId, 
											@bookId = @bookId, 
											@userName = @userName, 
											@bookName = @bookName
				END

			END;
			ELSE
			BEGIN
				PRINT 'El libro no existe.';
			END;

		END;
	ELSE
    BEGIN
        PRINT 'El usuario no existe o no partner.';
    END;
END

--EXEC sp_insertLoans @userName = '', @bookName = '', @withdrawal_date = '', @return_date = NULL;
--EXEC sp_changeLoadBookStatus @bookName = '--', @return_date_a = '';