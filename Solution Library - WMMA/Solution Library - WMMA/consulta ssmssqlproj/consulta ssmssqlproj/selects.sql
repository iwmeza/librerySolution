USE Library;

-- SELECTS
SET STATISTICS TIME ON;

-- AUTORS
SELECT
    name
FROM Autors.autors
WITH (INDEX(idx_name));  

-- PARTNERS
SELECT 
	P.id AS ID,
	U.name AS Socio,
	P.start_date AS FechaAlta,
	P.end_date AS FechaBaja

FROM Partners.partners AS P
WITH (INDEX(idx_user_id))

INNER JOIN Users.users AS U
	ON U.id = P.userFK

-- Crea una consulta para listar los libros prestados
SELECT 
	L.id AS ID,
	U.name AS Socio,
	B.title AS Libro,
	L.withdrawal_date AS FechaRetiro,
	L.return_date AS FechaEntrega,
	L.isReturn AS Disponibilidad 

FROM Loans.loans AS L

INNER JOIN Users.users AS U
	ON U.id = L.partnerFK

INNER JOIN Books.books AS B
	ON B.id = L.bookFK

WHERE isReturn = 0 AND return_date IS NULL

-- Crea una consulta para listar los libros en la biblioteca
SELECT 
	B.id AS ID,
	B.title AS Titulo,
	B.autorFK AS FechaEdición,
	A.name AS Autor
FROM Books.books AS B
WITH (INDEX(idx_title))

INNER JOIN Autors.autors AS A
	ON A.id = B.autorFK
ORDER BY B.id ASC

/*
	10.	Considerando que el plazo de préstamo es de 30 días, crea una consulta que muestre el nombre, 
		la dirección de mail y el título del libro. 
*/

SELECT
	U.name AS Socio,
	U.email AS Correo,
	B.title AS Libro
FROM Loans.loans AS L

INNER JOIN Users.users AS U
	ON U.id = L.partnerFK

INNER JOIN Books.books AS B
	ON B.id = L.bookFK

WHERE 
    L.isReturn = 0
    AND DATEDIFF(DAY, GETDATE(), DATEADD(DAY, 30, L.withdrawal_date)) <= 5
    AND DATEDIFF(DAY, GETDATE(), DATEADD(DAY, 30, L.withdrawal_date)) >= 0; 