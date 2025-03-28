USE Library;

-- CREATE TABLE
CREATE TABLE Loans.loans(
	id TINYINT IDENTITY(1,1),
	withdrawal_date DATETIME NOT NULL,
	return_date DATETIME NULL,
	isReturn BIT DEFAULT 1, -- 1 is available/ 0 is not available
	partnerFK TINYINT NOT NULL,
	bookFK TINYINT NOT NULL
)

-- CREATE PK
ALTER TABLE Loans.loans ADD CONSTRAINT id_PK PRIMARY KEY(id)

-- CREATE FK
ALTER TABLE Loans.loans ADD CONSTRAINT loans_partners_FK FOREIGN KEY(partnerFK) REFERENCES Users.users(id)
ALTER TABLE Loans.loans ADD CONSTRAINT loans_books_FK FOREIGN KEY(bookFK) REFERENCES Books.books(id)

-- CREATE IDX
CREATE INDEX idx_partner ON Loans.loans(partnerFK)
CREATE INDEX idx_books ON Loans.loans(bookFK)