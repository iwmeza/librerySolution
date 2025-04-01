USE Library;

-- CREATE TABLE
CREATE TABLE Users.users(
	id TINYINT IDENTITY(1,1),
	name NVARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	direction NVARCHAR(100) NOT NULL,
	email NVARCHAR(50) UNIQUE NOT NULL,
	isPartner BIT DEFAULT 0
)

-- CREATE PK
ALTER TABLE Users.users ADD CONSTRAINT id_PK PRIMARY KEY(id)

-- ADD CONSTRAINTS
ALTER TABLE Users.users ADD check_users_email_format CONSTRAINT CHECK (email LIKE '%_@__%.__%')

-- CREATE IDX
CREATE INDEX idx_name ON Users.users(name)