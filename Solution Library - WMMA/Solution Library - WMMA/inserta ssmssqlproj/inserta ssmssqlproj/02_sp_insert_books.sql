USE Library;

-- INSERT
CREATE PROCEDURE sp_insertBooks
	@title NVARCHAR(50),
	@edition_date INT,
	@autorFK TINYINT

AS
BEGIN

	IF(@edition_date BETWEEN 1900 AND 1940)
	BEGIN
		INSERT INTO Books.books (title, edition_date, autorFK)  
			VALUES (@title, @edition_date, @autorFK)
		PRINT 'Libro insertado con éxito: ' + @title;
	END;

	ELSE
	BEGIN
		PRINT 'No se pudo insertar: ' + @title;
	END;
END;

EXEC sp_insertBooks @title='Niebla', @edition_date=1914, @autorFK=7;
EXEC sp_insertBooks @title='Los trabajos del infatigable creador Pío Cid', @edition_date=1911, @autorFK=8;
EXEC sp_insertBooks @title='Mi religión y otros ensayos filosóficos', @edition_date=1931, @autorFK=7;
EXEC sp_insertBooks @title='Las confesiones de un pequeño filósofo', @edition_date=1912, @autorFK=2;
EXEC sp_insertBooks @title='Camino de perfección (pasión mística)', @edition_date=1902, @autorFK=3;
EXEC sp_insertBooks @title='Soledades. Galerías. Otros poemas', @edition_date=1895, @autorFK=7;
EXEC sp_insertBooks @title='El sentimiento trágico de la vida', @edition_date=1902, @autorFK=8;
EXEC sp_insertBooks @title='Por tierras de Portugal y España', @edition_date=1907, @autorFK=2;
EXEC sp_insertBooks @title='Diario de un poeta recién casado', @edition_date=1903, @autorFK=3;
EXEC sp_insertBooks @title='La estrella del capitán Chimista', @edition_date=1917, @autorFK=7;
EXEC sp_insertBooks @title='Las inquietudes de Shanti Andía', @edition_date=1904, @autorFK=8;
EXEC sp_insertBooks @title='El marqués de Bradomín (serie)', @edition_date=1936, @autorFK=2;
EXEC sp_insertBooks @title='Andanzas y visiones españolas', @edition_date=1904, @autorFK=3;
EXEC sp_insertBooks @title='La guerra carlista (trilogía)', @edition_date=1908, @autorFK=8;
EXEC sp_insertBooks @title='Comedias bárbaras (trilogía)', @edition_date=1934, @autorFK=9;
EXEC sp_insertBooks @title='La leyenda del Cid Campeador', @edition_date=1905, @autorFK=3;
EXEC sp_insertBooks @title='La leyenda de Jaun de Alzate', @edition_date=1902, @autorFK=7;
EXEC sp_insertBooks @title='El mal que hacen los buenos', @edition_date=1904, @autorFK=8;
EXEC sp_insertBooks @title='El laberinto de la fortuna', @edition_date=1908, @autorFK=2;
EXEC sp_insertBooks @title='La agonía del cristianismo', @edition_date=1905, @autorFK=3;
EXEC sp_insertBooks @title='El aprendiz de conspirador', @edition_date=1907, @autorFK=8;
EXEC sp_insertBooks @title='La feria de los discretos', @edition_date=1913, @autorFK=7;
EXEC sp_insertBooks @title='San Manuel Bueno, mártir', @edition_date=1905, @autorFK=8;
EXEC sp_insertBooks @title='Defensa de la hispanidad', @edition_date=1903, @autorFK=3;
EXEC sp_insertBooks @title='Alma española (Ensayos)', @edition_date=1924, @autorFK=10;
EXEC sp_insertBooks @title='El árbol de la ciencia', @edition_date=1902, @autorFK=10;
EXEC sp_insertBooks @title='En torno al casticismo', @edition_date=1903, @autorFK=10;
EXEC sp_insertBooks @title='Zalacaín el aventurero', @edition_date=1904, @autorFK=10;
EXEC sp_insertBooks @title='La ruta de Don Quijote', @edition_date=1905, @autorFK=10;
EXEC sp_insertBooks @title='La lámpara maravillosa', @edition_date=1916, @autorFK=10;
EXEC sp_insertBooks @title='La ciudad de la niebla', @edition_date=1919, @autorFK=10;
EXEC sp_insertBooks @title='Fantasías y realidades', @edition_date=1926, @autorFK=10;
EXEC sp_insertBooks @title='El mayorazgo de Labraz', @edition_date=1907, @autorFK=10;
EXEC sp_insertBooks @title='Los últimos románticos', @edition_date=1907, @autorFK=10;
EXEC sp_insertBooks @title='España y los españoles', @edition_date=1915, @autorFK=10;
EXEC sp_insertBooks @title='Los intereses creados', @edition_date=1907, @autorFK=4;
EXEC sp_insertBooks @title='Troteras y danzaderas', @edition_date=1908, @autorFK=4;
EXEC sp_insertBooks @title='La caverna del duende', @edition_date=1905, @autorFK=4;
EXEC sp_insertBooks @title='Nuevo Mundo (poemas)', @edition_date=1905, @autorFK=4;
EXEC sp_insertBooks @title='El paisaje de España', @edition_date=1909, @autorFK=8;
EXEC sp_insertBooks @title='Sonata de primavera', @edition_date=1897, @autorFK=1;
EXEC sp_insertBooks @title='La casa de Aizgorri', @edition_date=1921, @autorFK=7;
EXEC sp_insertBooks @title='España invertebrada', @edition_date=1904, @autorFK=8;
EXEC sp_insertBooks @title='Campos de Castilla', @edition_date=1902, @autorFK=7;
EXEC sp_insertBooks @title='Sonata de invierno', @edition_date=1900, @autorFK=8;
EXEC sp_insertBooks @title='El caballero Audaz', @edition_date=1929, @autorFK=11;
EXEC sp_insertBooks @title='Nieblas de mi alma', @edition_date=1912, @autorFK=8;
EXEC sp_insertBooks @title='Teresa (reedición)', @edition_date=1911, @autorFK=7;
EXEC sp_insertBooks @title='El alma castellana', @edition_date=1910, @autorFK=8;
EXEC sp_insertBooks @title='En tierra de nadie', @edition_date=1910, @autorFK=7;
EXEC sp_insertBooks @title='El hotel del cisne', @edition_date=1906, @autorFK=8;
EXEC sp_insertBooks @title='Poesías completas', @edition_date=1921, @autorFK=5;
EXEC sp_insertBooks @title='Tierras de España', @edition_date=1943, @autorFK=8;
EXEC sp_insertBooks @title='Hacia otra España', @edition_date=1925, @autorFK=7;
EXEC sp_insertBooks @title='Amor y pedagogía', @edition_date=1922, @autorFK=7;
EXEC sp_insertBooks @title='El Intransigente', @edition_date=1911, @autorFK=8;
EXEC sp_insertBooks @title='Luces de Bohemia', @edition_date=1907, @autorFK=3;
EXEC sp_insertBooks @title='Divinas palabras', @edition_date=1901, @autorFK=8;
EXEC sp_insertBooks @title='Águila de blasón', @edition_date=1912, @autorFK=3;
EXEC sp_insertBooks @title='Romance de lobos', @edition_date=1906, @autorFK=8;
EXEC sp_insertBooks @title='Idearium español', @edition_date=1943, @autorFK=7;
EXEC sp_insertBooks @title='Flor de santidad', @edition_date=1900, @autorFK=8;
EXEC sp_insertBooks @title='El libro de Ruth', @edition_date=1913, @autorFK=10;
EXEC sp_insertBooks @title='Desde el mirador', @edition_date=1907, @autorFK=10;
EXEC sp_insertBooks @title='Juan de Mairena', @edition_date=1904, @autorFK=10;
EXEC sp_insertBooks @title='Sonata de otoño', @edition_date=1908, @autorFK=8;
EXEC sp_insertBooks @title='Sonata de estío', @edition_date=1903, @autorFK=8;
EXEC sp_insertBooks @title='Tirano Banderas', @edition_date=1920, @autorFK=2;
EXEC sp_insertBooks @title='Sangre española', @edition_date=1940, @autorFK=2;
EXEC sp_insertBooks @title='La pena capital', @edition_date=1917, @autorFK=6;
EXEC sp_insertBooks @title='Últimas poesías', @edition_date=1917, @autorFK=6;
EXEC sp_insertBooks @title='La dama errante', @edition_date=1907, @autorFK=7;
EXEC sp_insertBooks @title='Antonio Azorín', @edition_date=1920, @autorFK=2;
EXEC sp_insertBooks @title='Rosas de otoño', @edition_date=1916, @autorFK=7;
EXEC sp_insertBooks @title='Abel Sánchez', @edition_date=1924, @autorFK=2;
EXEC sp_insertBooks @title='César o nada', @edition_date=1907, @autorFK=3;
EXEC sp_insertBooks @title='Paradox, rey', @edition_date=1906, @autorFK=3;
EXEC sp_insertBooks @title='Platero y yo', @edition_date=1921, @autorFK=7;
EXEC sp_insertBooks @title='Las ciudades', @edition_date=1917, @autorFK=3;
EXEC sp_insertBooks @title='La voluntad', @edition_date=1916, @autorFK=8;
EXEC sp_insertBooks @title='Aurora roja', @edition_date=1922, @autorFK=8;
EXEC sp_insertBooks @title='Los pueblos', @edition_date=1922, @autorFK=3;
EXEC sp_insertBooks @title='Mala hierba', @edition_date=1907, @autorFK=3;
EXEC sp_insertBooks @title='Señora Ama', @edition_date=1900, @autorFK=3;
EXEC sp_insertBooks @title='Cancionero', @edition_date=1902, @autorFK=7;
EXEC sp_insertBooks @title='La busca', @edition_date=1901, @autorFK=7;
EXEC sp_insertBooks @title='Castilla', @edition_date=1907, @autorFK=8;
EXEC sp_insertBooks @title='Elegías', @edition_date=1919, @autorFK=8;
EXEC sp_insertBooks @title='La raza', @edition_date=1905, @autorFK=8;
EXEC sp_insertBooks @title='Teresa', @edition_date=1908, @autorFK=8;
EXEC sp_insertBooks @title='Rimas', @edition_date=1909, @autorFK=8;