USE Library;

-- INSERT
CREATE PROCEDURE sp_insertUserToPartner
	--@start_date DATETIME,
	--@end_date DATETIME,
	--@userFK TINYINT,
	@name NVARCHAR(50)
AS
BEGIN
	--DECLARE @name NVARCHAR(50);
	DECLARE @userId TINYINT;
    DECLARE @isPartner BIT;

	-- GET USER DATA FROM NAME
	SELECT
		@userId		= U.id,
		@isPartner	= U.isPartner
	FROM Users.users AS U

	WHERE U.name LIKE '%' + @name + '%'

	-- CHECK USER EXISTS AND IS NOT PARTNER
	IF (@userId IS NOT NULL) AND @isPartner = 0
    BEGIN
		DECLARE @start_date DATETIME;
		DECLARE @end_date DATETIME;
		DECLARE @formatted_date NVARCHAR(20);
		DECLARE @insertSuccess BIT;

		SET @start_date		= GETDATE();
		SET @formatted_date = FORMAT(@start_date, 'yyyy-MM-dd HH:mm');

		BEGIN TRY;
			INSERT INTO Partners.partners (start_date, end_date, userFK)
				VALUES (@start_date, @end_date, @userId);
        
			SET @insertSuccess = 1;

			PRINT CONCAT('El usuario: ', @name, ' es un/a socio/a');
				
			IF(@insertSuccess = 1)
				BEGIN
					 EXEC sp_changeUserPartnerOk @id = @userId;
				END
			ELSE
				BEGIN 
					PRINT ERROR_MESSAGE();
				END;
		END TRY
		BEGIN CATCH
			SET @insertSuccess = 0;
				
			 PRINT ERROR_MESSAGE();
		END CATCH;
    END;
    ELSE
    BEGIN
        PRINT 'El usuario no existe o ya es un socio.';
    END;
END;

-- EXEC sp_insertUserToPartner @name = 'María López'

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_insertUserToPartner