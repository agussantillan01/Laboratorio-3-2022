--1) Listado con Apellido y nombres de los t�cnicos que, en promedio, hayan 
--demorado m�s de 225 minutos en la prestaci�n de servicios.
SELECT 
	T.Apellido, 
	T.NOMBRE,
	AVG (S.Duracion) AS Promedio
FROM Tecnicos T 
INNER JOIN SERVICIOS S ON S.IDTecnico = T.ID
GROUP BY T.ID, T.APELLIDO, T.Nombre
HAVING AVG (S.Duracion)>225

--2) Listado con Descripci�n del tipo de servicio, el texto 'Particular' y la cantidad de
--clientes de tipo Particular. Luego a�adirle un listado con descripci�n del tipo de
--servicio, el texto 'Empresa' y la cantidad de clientes de tipo Empresa.

-- formas de pago.
--de d�as de garant�a.
--cliente que contrate a un t�cnico por un per�odo determinado. Dicha contrataci�n
--debe poder registrar la fecha de inicio y fin del trabajo, el costo total, el domicilio al
--que debe el t�cnico asistir y la periodicidad del trabajo (1 - Diario, 2 - Semanal, 3 -
--Quincenal).