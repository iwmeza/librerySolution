USE Library;

-- CREATE
CREATE PROCEDURE sp_createSchemas
    @nameSchema VARCHAR(8)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)

    SET @SQL = 'CREATE SCHEMA ' + QUOTENAME(@nameSchema)

    EXEC sp_executesql @SQL;

    PRINT 'Esquema creado con éxito: ' + @nameSchema;
END;

-- EXEC sp_createSchemas @nameSchema = 'Books';
-- EXEC sp_createSchemas @nameSchema = 'Autors';
-- EXEC sp_createSchemas @nameSchema = 'Users';
-- EXEC sp_createSchemas @nameSchema = 'Partners';
-- EXEC sp_createSchemas @nameSchema = 'Loans';

-- SELECT * FROM sys.schemas
-- DROP PROCEDURE sp_createSchemas
