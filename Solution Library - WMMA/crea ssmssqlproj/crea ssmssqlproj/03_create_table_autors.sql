USE Library;

-- CREATE TABLE
CREATE TABLE Autors.autors(
	id TINYINT IDENTITY(1,1),
	name NVARCHAR(22) NOT NULL
)

-- CREATE PK
ALTER TABLE Autors.autors ADD CONSTRAINT id_PK PRIMARY KEY(id)

-- CREATE IDX
CREATE INDEX idx_name ON Autors.autors(name)