USE Library;

-- CHANGE USER PARTNER STATUS
CREATE PROCEDURE sp_changeUserPartnerOk
	@id INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Users.users WHERE id = @id)
		BEGIN
			UPDATE Users.users SET isPartner = 1 WHERE id = @id;

			PRINT 'Usuario actualizado correctamente.';
		END; 
	ELSE
		BEGIN
			PRINT 'El usuario no existe.';
		END
END;

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_changeUserPartnerOk