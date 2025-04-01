USE Library;

-- INSERT
CREATE PROCEDURE sp_insertUsers
	@name NVARCHAR(50),
	@phone VARCHAR(20),
	@direction NVARCHAR(100),
	@email NVARCHAR(50),
	@isPartner BIT
AS
BEGIN

	    IF EXISTS (SELECT 1 FROM Users.users WHERE email = @email)
		BEGIN
			PRINT CONCAT('No se pudo insertar al usuario: ', @name,  ' ya existe el correo: ', @email);
		END;

		ELSE
		BEGIN TRY
			INSERT INTO Users.users (name, phone, direction, email, isPartner)
				VALUES (@name, @phone, @direction, @email, @isPartner)

			PRINT CONCAT('Usuario insertado con éxito: ', @name;);
		END;

		BEGIN CATCH
			-- HANDLE ERRORS
			DECLARE @ErrorMessage NVARCHAR(4000);
			DECLARE @ErrorSeverity INT;
			DECLARE @ErrorState INT;

			SELECT 
				@ErrorMessage	= ERROR_MESSAGE(),
				@ErrorSeverity	= ERROR_SEVERITY(),
				@ErrorState		= ERROR_STATE();

			PRINT CONCAT('Error al insertar el usuario: ', @ErrorMessage;);
		END CATCH;
END;

/*
EXEC sp_insertUsers @name = 'Juan Pérez', @phone = '555-1234', @direction='Calle 1, Ciudad', @email='juan.perez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'María López', @phone = '555-5678', @direction='Calle 2, Ciudad', @email='maria.lopez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Carlos García', @phone = '555-8765', @direction='Calle 3, Ciudad', @email='carlos.garcia@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Ana Martínez', @phone = '555-4321', @direction='Calle 4, Ciudad', @email='ana.martinez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Luis Rodríguez', @phone = '555-1357', @direction='Calle 5, Ciudad', @email='luis.rodriguez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Sofía Hernández', @phone = '555-2468', @direction='Calle 6, Ciudad', @email='sofia.hernandez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'David Fernández', @phone = '555-3698', @direction='Calle 7, Ciudad', @email='david.fernandez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Laura González', @phone = '555-9512', @direction='Calle 8, Ciudad', @email='laura.gonzalez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Javier Sánchez', @phone = '555-7531', @direction='Calle 9, Ciudad', @email='javier.sanchez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Patricia Romero', @phone = '555-1597', @direction='Calle 10, Ciudad', @email='patricia.romero@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Fernando Torres', @phone = '555-2584', @direction='Calle 11, Ciudad', @email='fernando.torres@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Isabel Ruiz', @phone = '555-3695', @direction='Calle 12, Ciudad', @email='isabel.ruiz@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Eduardo Jiménez', @phone = '555-1478', @direction='Calle 13, Ciudad', @email='eduardo.jimenez@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Verónica Castro', @phone = '555-2589', @direction='Calle 14, Ciudad', @email='veronica.castro@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Raúl Mendoza', @phone = '555-3694', @direction='Calle 15, Ciudad', @email='raul.mendoza@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Carmen Salazar', @phone = '555-7463', @direction='Calle 16, Ciudad', @email='carmen.salazar@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Diego Ortega', @phone = '555-8520', @direction='Calle 17, Ciudad', @email='diego.ortega@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Mariana Morales', @phone = '555-9631', @direction='Calle 18, Ciudad', @email='mariana.morales@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Alberto Vega', @phone = '555-7412', @direction='Calle 19, Ciudad', @email='alberto.vega@example.com', @isPartner=0;
EXEC sp_insertUsers @name = 'Claudia Peña', @phone = '555-2580', @direction='Calle 20, Ciudad', @email='claudia.pena@example.com', @isPartner=0;
*/

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_insertUsers