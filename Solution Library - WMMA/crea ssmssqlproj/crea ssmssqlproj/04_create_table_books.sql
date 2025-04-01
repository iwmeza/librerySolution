USE Library;

-- CREATE TABLE
CREATE TABLE Books.books(
	id TINYINT IDENTITY(1,1),
	title NVARCHAR(50) UNIQUE NOT NULL,
    edition_date INT NOT NULL,
	autorFK TINYINT
)

-- CREATE PK
ALTER TABLE Books.books ADD CONSTRAINT id_PK PRIMARY KEY(id)

-- CREATE FK 
ALTER TABLE Books.books ADD CONSTRAINT books_autors_FK FOREIGN KEY (autorFK) REFERENCES Autors.autors(id)

-- CREATE CONSTRAINTS
ALTER TABLE Books.books ADD CONSTRAINT check_books_edition_date CHECK (edition_date >= 1900 AND edition_date <= 1940);

-- CREATE IDX
CREATE INDEX idx_title ON Books.books(title)