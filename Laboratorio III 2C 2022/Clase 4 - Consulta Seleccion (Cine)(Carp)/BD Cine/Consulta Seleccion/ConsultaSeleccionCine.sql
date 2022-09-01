-- Listado con todos los datos de todas las pel�culas
SELECT * FROM PELICULAS
-- Listado con todas las pel�culas ordenadas por t�tulo ascendentemente
SELECT * FROM PELICULAS ORDER BY NOMBRE ASC

-- Listado con t�tulo de la pel�cula y a�o de estreno
SELECT 
	NOMBRE AS TITULO, 
	YEAR(FechaEstrenoMundial) AS ANIO
FROM PELICULAS

-- Listado con t�tulo de la pel�cula, a�o de estreno y cu�nto tiempo pas� (en d�as) entre el estreno y la fecha actual
SELECT 
	NOMBRE AS TITULO,
	YEAR(FechaEstrenoMundial) AS ANIO,
	DATEDIFF (DAY,FechaEstrenoMundial,GETDATE()) AS DiasTranscurridos,
	CAST (GETDATE () AS DATE )AS FechaActual
FROM PELICULAS 

-- Listado con t�tulo de la pel�cula y a�o de estreno ordenado por a�o de mayor a menor 
--y luego por t�tulo de menor a mayor

SELECT 
	NOMBRE AS Titulo,
	YEAR(FechaEstrenoMundial) AS AnioEstreno
FROM PELICULAS
ORDER BY AnioEstreno DESC, TITULO ASC


-- Listado con t�tulo y fecha de estreno de la pel�cula m�s antigua
SELECT TOP 1
	NOMBRE AS TITULO,
	FechaEstrenoMundial
FROM PELICULAS 
ORDER BY FechaEstrenoMundial ASC


-- Listado con t�tulo y duraci�n de la pel�cula m�s extensa. Si existen varias pel�culas que 
--cumplan esta condici�n, incluirlas a todas.
SELECT TOP 1 WITH TIES
	NOMBRE AS TITULO, 
	Duracion

FROM PELICULAS 
ORDER BY Duracion DESC

-- Listado de todos los datos de las pel�culas que tengan una duraci�n mayor a 150 minutos
SELECT * FROM PELICULAS WHERE Duracion>150


-- Listado de todos los datos de las pel�culas que tengan una duraci�n entre 60 y 120 minutos
SELECT * FROM PELICULAS WHERE Duracion>=60 AND Duracion<=120 

SELECT * FROM PELICULAS WHERE Duracion BETWEEN 60 AND 120
-- Listado de todos los datos de las pel�culas que pertenezcan a las categor�as 1, 3 y  5
SELECT * FROM PELICULAS WHERE IDCategoria = 1 OR IDCategoria = 3 OR IDCategoria = 5

SELECT * FROM PELICULAS WHERE IDCategoria In (1,3,5)

-- Listado de todos los datos de las pel�culas que no pertenezcan a las categor�as 1, 3 y  5
SELECT * FROM PELICULAS WHERE IDCategoria <> 1 AND IDCategoria != 3 AND IDCategoria <> 5

SELECT * FROM PELICULAS WHERE IDCategoria NOT IN (1,3,5)



-- Listado con t�tulo de la pel�cula, duraci�n y tipo de duraci�n siendo:
    -- Cortometraje - Hasta 30 minutos
    -- Mediometraje - Hasta 75 minutos
    -- Largometraje - Mayor a 75 minutos

	SELECT 
	NOMBRE AS TITULO, 
	CASE 
	WHEN Duracion <=30 THEN 'Cortometraje'
	WHEN Duracion <=75 THEN 'Mediometraje'
	ELSE 'Largometraje'
	END AS TipoPelicula
	FROM PELICULAS



-- Listado de todos los datos de todos los clientes que no indicaron un celular

SELECT * FROM Clientes WHERE Celular IS NULL


-- Listado de todos los datos de todos los clientes que indicaron un mail pero no un celular

SELECT * FROM CLIENTES WHERE Email IS NOT NULL AND Celular IS NULL

-- Listado de apellidos y nombres de los clientes y su informaci�n de contacto. La informaci�n
--de contacto debe ser el mail en primer lugar, si no tiene mail el celular y si no tiene celular 
--el domicilio.

SELECT 
	Apellidos, 
	Nombres,
	IsNull (Email, IsNull(Celular,Direccion)) as infoContacto
FROM CLIENTES

-- Listado de todos los clientes cuyo apellido es Smith

SELECT * FROM CLIENTES WHERE Apellidos LIKE 'SMITH'

-- Listado de todos los datos de todos los clientes cuyo apellido finalice con 'Son'.

SELECT * FROM Clientes WHERE Apellidos LIKE '%SON'

-- Listado de todos los datos de todos los clientes cuyo apellido comience con vocal y 
--finalice con vocal.

SELECT * FROM Clientes WHERE Apellidos LIKE '[AEIOU]%[AEIOU]'

-- Listado de todos los datos de todos los clientes cuyo apellido contenga 5 car�cteres.
SELECT * FROM CLIENTES WHERE Apellidos LIKE '_____'

-- Listado de clientes con apellidos, nombres y mail de aquellos clientes que tengan un mail con dominio .jp

SELECT 
	Apellidos,
	Nombres,
	Email
FROM Clientes
WHERE Email LIKE '%@%.JP'

-- Listado de clientes con apellidos, nombres y mail de aquellos clientes que tengan un mail cuya organizaci�n comience con vocal.

SELECT 
	Apellidos,
	Nombres,
	Email
FROM Clientes
WHERE Email LIKE '%@[AEIOU]%'
-- Listado de clientes con apellidos, nombre y mail de aquellos clientes que tengan un mail
--cuyo nombre de usuario comience con E y tenga 9 car�cteres en total pero no sea de tipo '.COM'

SELECT 
	Apellidos,
	Nombres,
	Email
FROM Clientes
WHERE EMAIL LIKE 'E________@%' AND EMAIL NOT LIKE '%.COM'

-- Listado con todos los apellidos sin repetir
SELECT DISTINCT
	Apellidos
FROM Clientes
ORDER BY Apellidos ASC