USE Library;

-- CREATE TABLE
CREATE TABLE Partners.partners(
	id TINYINT IDENTITY(1,1),
	start_date DATETIME NOT NULL,
	end_date DATETIME NULL,
	userFK TINYINT NOT NULL
)

-- CREATE PK
ALTER TABLE Partners.partners ADD CONSTRAINT id_PK PRIMARY KEY(id)

-- CREATE FK
ALTER TABLE Partners.partners ADD CONSTRAINT partners_users FOREIGN KEY(userFK) REFERENCES Users.users(id)

-- CREATE IDX
CREATE INDEX idx_start_date ON Partners.partners(start_date)
CREATE INDEX idx_user_id ON Partners.partners(userFK)