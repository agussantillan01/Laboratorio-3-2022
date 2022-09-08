--1Por cada producto listar la descripción del producto, el precio y el nombre de la categoría
--a la que pertenece.
SELECT 
	P.ID,
	P.Descripcion, 
	P.Precio,
	C.NOMBRE AS CATEGORIA
FROM Productos P
LEFT JOIN Categorias C ON C.ID=P.IDCategoria

--2Listar las categorías de producto de las cuales no se registren productos.

SELECT 
	C.ID,
	P.Descripcion
FROM Categorias C
LEFT JOIN Productos P ON C.ID = P.IDCategoria
WHERE P.ID IS NULL

--3Listar el nombre de la categoría de producto de aquel o aquellos productos que más tiempo
--lleven en construir.

SELECT TOP 1 WITH TIES
	C.ID AS IdCategoria,
	C.Nombre as nombreProducto,
	P.DiasConstruccion
FROM Categorias C 
LEFT JOIN PRODUCTOS P ON P.IDCategoria=C.ID
ORDER BY P.DiasConstruccion DESC

--4Listar apellidos y nombres y dirección de mail de aquellos clientes que no hayan registrado pedidos.

SELECT
	C.ID AS IDCLIENTE,
	C.Apellidos,
	C.Nombres,
	C.Mail
FROM CLIENTES C
LEFT JOIN PEDIDOS P ON C.ID= P.IDCliente
WHERE P.ID IS NULL



--5Listar apellidos y nombres, mail, teléfono y celular de aquellos clientes que hayan realizado
--algún pedido cuyo costo supere $1000000

SELECT DISTINCT 
	C.Apellidos,
	C.Nombres,
	C.Mail,
	C.Telefono, 
	C.Celular,
	P.COSTO
FROM Clientes C 
LEFT JOIN Pedidos P ON P.IDCliente = C.ID
WHERE P.Costo>1000000

--6Listar IDPedido, Costo, Fecha de solicitud y fecha de finalización,
--descripción del producto, costo y apellido y nombre del cliente. 
--Sólo listar aquellos registros de pedidos que hayan sido pagados.

SELECT	
	P.ID,
	P.Costo,
	P.FechaSolicitud,
	P.FechaFinalizacion,
	PR.Descripcion,
	PR.Costo,
	C.Apellidos,
	C.Nombres,
	P.Pagado
FROM Pedidos P 
LEFT JOIN Productos PR ON P.IDProducto = PR.ID
INNER JOIN CLIENTES C ON P.IDCliente = C.ID
WHERE P.Pagado LIKE 1


--7Listar IDPedido, Fecha de solicitud, fecha de finalización, días de construcción del producto, 
--días de construcción del pedido (fecha de finalización - fecha de solicitud) y una columna llamada
--Tiempo de construcción con la siguiente información:
--'Con anterioridad' → Cuando la cantidad de días de construcción del pedido sea menor a los días de 
--construcción del producto.
--'Exacto'' → Si la cantidad de días de construcción del pedido y el producto son iguales
--'Con demora' → Cuando la cantidad de días de construcción del pedido sea mayor a los días de
--construcción del producto.


SELECT 
	PE.ID AS IdPedido,
	PE.FechaSolicitud,
	PE.FechaFinalizacion,
	PR.DiasConstruccion AS diasConstProductos,
	DATEDIFF(DAY,PE.FechaSolicitud,PE.FechaFinalizacion) AS diasConstPedidos,
	CASE 
		WHEN DATEDIFF(DAY, PE.FechaFinalizacion,PE.FechaSolicitud) < PR.DiasConstruccion THEN 'Con anterioridad'
		WHEN DATEDIFF(DAY, PE.FechaFinalizacion,PE.FechaSolicitud) = PR.DiasConstruccion THEN 'Exacto'
		ELSE'Con demora'
	END	AS TiempoConstruccion
FROM Pedidos PE 
LEFT JOIN Productos PR ON PR.ID = PE.IDProducto


--8Listar por cada cliente el apellido y nombres y los nombres de las categorías de aquellos productos
--de los cuales hayan realizado pedidos. No deben figurar registros duplicados.

	SELECT DISTINCT
		C.Apellidos, 
		C.Nombres,
		CAT.Nombre
	FROM Clientes C 
	LEFT JOIN PEDIDOS PE ON C.ID = PE.IDCliente
	INNER JOIN Productos PR ON PE.IDProducto= PR.ID
	INNER JOIN Categorias CAT ON PR.IDCategoria = CAT.ID

	SELECT * FROM Clientes
	SELECT * FROM Categorias

--9Listar apellidos y nombres de aquellos clientes que hayan realizado algún pedido cuya cantidad sea
--exactamente igual a la cantidad considerada mayorista del producto.


--10Listar por cada producto el nombre del producto, el nombre de la categoría, el precio de venta
--minorista, el precio de venta mayorista y el porcentaje de ahorro que se obtiene por la compra 
--mayorista a valor mayorista en relación al valor minorista.

