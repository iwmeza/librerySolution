USE Library;

-- EMPTY DATA TABLE
CREATE PROCEDURE sp_emptyDataTable
    @name VARCHAR(20)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'ALTER TABLE ' + @name + ' NOCHECK CONSTRAINT ALL;';
	EXEC sp_executesql @sql;

	SET @sql = 'TRUNCATE TABLE ' + @name;
	EXEC sp_executesql @sql;

	SET @sql = 'ALTER TABLE ' + @name + ' CHECK CONSTRAINT ALL;';
    EXEC sp_executesql @sql;

    SET @sql = 'DBCC CHECKIDENT (''' + @name + ''', RESEED, 1);';
    EXEC sp_executesql @sql;

END;