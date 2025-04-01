USE Library;

--CHANGE PARTNER CANCELLATION
CREATE PROCEDURE sp_changeUserPartnerCancellation
		@name NVARCHAR(50)
AS
BEGIN
	DECLARE @userId TINYINT;
    DECLARE @isPartner BIT;

	-- GET USER DATA FROM NAME
	SELECT
		@userId		= U.id,
		@isPartner	= U.isPartner
	FROM Users.users AS U

	WHERE U.name LIKE '%' + @name + '%'

	-- CHECK USER EXISTS AND IS PARTNER
	IF (@userId IS NOT NULL) AND @isPartner = 1
	BEGIN
		IF EXISTS (SELECT 1 FROM Partners.partners WHERE userFK = @userId AND end_date IS NULL)
		BEGIN TRY
			DECLARE @end_date DATETIME;
			DECLARE @formatted_date NVARCHAR(20);
			DECLARE @updateSuccess BIT;

			SET @end_date		= GETDATE();
			SET @formatted_date = FORMAT(@end_date, 'yyyy-MM-dd HH:mm');

			UPDATE Partners.partners SET end_date = @end_date WHERE userFK = @userId

			SET @updateSuccess = 1;

			PRINT CONCAT('El usuario: ', @name, ' ya NO un/a socio/a');

			IF(@updateSuccess = 1)
				BEGIN
					UPDATE Users.users SET @isPartner = 0;
				END
			ELSE
				BEGIN 
					PRINT ERROR_MESSAGE();
				END;

		END TRY
			BEGIN CATCH
				 PRINT ERROR_MESSAGE();
			END CATCH;

		ELSE
		BEGIN
			RETURN;
		END;

	END;
	ELSE
	BEGIN
		PRINT 'El usuario no es socio.';
	END;
END;