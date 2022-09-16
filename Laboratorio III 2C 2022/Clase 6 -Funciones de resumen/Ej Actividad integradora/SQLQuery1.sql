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
SELECT 	TS.Descripcion, 	'Particular' as clientesParticular,	COUNT (DISTINCT S.IDCliente) AS CantidadParticularFROM TiposServicio TSINNER JOIN Servicios S ON S.IDTipo = TS.IDINNER JOIN Clientes C ON C.ID = S.IDClienteWHERE C.Tipo LIKE 'P'GROUP BY TS.DescripcionUNION SELECT 	TS.Descripcion, 	'Empresa' as clientesParticular,	COUNT (DISTINCT S.IDCliente) AS CantidadParticularFROM TiposServicio TSINNER JOIN Servicios S ON S.IDTipo = TS.IDINNER JOIN Clientes C ON C.ID = S.IDClienteWHERE C.Tipo LIKE 'E'GROUP BY TS.Descripcion--3) Listado con Apellidos y nombres de los clientes que hayan abonado con las cuatro
-- formas de pago.Select C.Apellido,  C.Nombre,  count (distinct S.FormaPago)  AS FormaPagoDistintasfrom Clientes CInner join Servicios S on s.IDCliente = C.ID Group by C.ID, C.Apellido, C.NombreHAVING count (distinct S.FormaPago) = 4--4) La descripci�n del tipo de servicio que en promedio haya brindado mayor cantidad
--de d�as de garant�a.Select  TOP 1 WITH TIES	TS.Descripcion,	AVG(S.DiasGarantia*1.0) AS PromedioDiasGarantiafrom TiposServicio TS Inner  join Servicios S on  S.IDTipo = TS.ID GROUP BY TS.ID, TS.DescripcionORDER BY AVG(S.DiasGarantia) DESC--5) Agregar las tablas y/o restricciones que considere necesario para permitir a un
--cliente que contrate a un t�cnico por un per�odo determinado. Dicha contrataci�n
--debe poder registrar la fecha de inicio y fin del trabajo, el costo total, el domicilio al
--que debe el t�cnico asistir y la periodicidad del trabajo (1 - Diario, 2 - Semanal, 3 -
--Quincenal).CREATE TABLE CONTRATO(	IDCONTRATO BIGINT NOT NULL PRIMARY KEY, 	IDCLIENTE INT NOT NULL FOREIGN KEY REFERENCES CLIENTES (ID),	IDTECNICO INT NOT NULL FOREIGN KEY REFERENCES TECNICOS (ID),	FECHA_INICIO DATE NOT NULL,	FECHA_FIN DATE,	COSTO MONEY NOT NULL, 	DOMICILIO_CLIENTE VARCHAR (50) NOT NULL, 	PERIODICIDAD TINYINT NOT NULL CHECK (PERIODICIDAD IN (1,2,3)))