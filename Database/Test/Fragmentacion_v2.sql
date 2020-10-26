--Fragmentos de Tiendas
--SELECT * FROM TIENDAS WHERE estado='CA';
--SELECT * FROM TIENDAS WHERE estado='NY';
--SELECT * FROM TIENDAS WHERE estado='TX';

--Fragmento ordenes por tienda
--SELECT * FROM ORDENES WHERE idTienda=1;
--SELECT * FROM ORDENES WHERE idTienda=2;
--SELECT * FROM ORDENES WHERE idTienda=3;


--Detalles orden por tienda
/*
SELECT ORDENES.idOrden, idItem, idProducto, cantidad, precioVenta, descuento, idCliente, estadoOrden, fechaOrden, required_date, 
fechaEnvio, idTienda, idEmpleado FROM detalleOrden 
INNER JOIN ORDENES ON ORDENES.idOrden = detalleOrden.idOrden
WHERE ORDENES.idTienda=1;
*/

/*
SELECT ORDENES.idOrden, idItem, idProducto, cantidad, precioVenta, descuento, idCliente, estadoOrden, fechaOrden, required_date, 
fechaEnvio, idTienda, idEmpleado FROM detalleOrden 
INNER JOIN ORDENES ON ORDENES.idOrden = detalleOrden.idOrden
WHERE ORDENES.idTienda=2;
*/
/*
SELECT ORDENES.idOrden, idItem, idProducto, cantidad, precioVenta, descuento, idCliente, estadoOrden, fechaOrden, required_date, 
fechaEnvio, idTienda, idEmpleado FROM detalleOrden  
INNER JOIN ORDENES ON ORDENES.idOrden = detalleOrden.idOrden
WHERE ORDENES.idTienda=3;
*/

--Empleados por tienda
--SELECT * FROM EMPLEADOS WHERE EMPLEADOS.idTienda = 1;
--SELECT * FROM EMPLEADOS WHERE EMPLEADOS.idTienda = 2;
--SELECT * FROM EMPLEADOS WHERE EMPLEADOS.idTienda = 3;

--Inventarios por tienda
--SELECT * FROM INVENTARIO WHERE INVENTARIO.idTienda = 1;
--SELECT * FROM INVENTARIO WHERE INVENTARIO.idTienda = 2;
--SELECT * FROM INVENTARIO WHERE INVENTARIO.idTienda = 3;

--Productos por tienda, con nombre de marca y producto
/*
SELECT INVENTARIO.idTienda, PRODUCTOS.*, INVENTARIO.cantidad, MARCAS.nomMarca, CATEGORIAS.descripcion FROM PRODUCTOS AS PRODUCTOS
INNER JOIN INVENTARIO AS INVENTARIO ON PRODUCTOS.idProducto = INVENTARIO.idProducto
LEFT JOIN MARCAS AS MARCAS ON MARCAS.idMarca = PRODUCTOS.idMarca
LEFT JOIN CATEGORIAS AS CATEGORIAS ON CATEGORIAS.idCategoria = PRODUCTOS.idCategoria
WHERE INVENTARIO.idTienda=1;
*/
/*
SELECT INVENTARIO.idTienda, PRODUCTOS.*, INVENTARIO.cantidad, MARCAS.nomMarca, CATEGORIAS.descripcion FROM PRODUCTOS AS PRODUCTOS
INNER JOIN INVENTARIO AS INVENTARIO ON PRODUCTOS.idProducto = INVENTARIO.idProducto
LEFT JOIN MARCAS AS MARCAS ON MARCAS.idMarca = PRODUCTOS.idMarca
LEFT JOIN CATEGORIAS AS CATEGORIAS ON CATEGORIAS.idCategoria = PRODUCTOS.idCategoria
WHERE INVENTARIO.idTienda=2;
*/
/*
SELECT INVENTARIO.idTienda, PRODUCTOS.*, INVENTARIO.cantidad, MARCAS.nomMarca, CATEGORIAS.descripcion FROM PRODUCTOS AS PRODUCTOS
INNER JOIN INVENTARIO AS INVENTARIO ON PRODUCTOS.idProducto = INVENTARIO.idProducto
LEFT JOIN MARCAS AS MARCAS ON MARCAS.idMarca = PRODUCTOS.idMarca
LEFT JOIN CATEGORIAS AS CATEGORIAS ON CATEGORIAS.idCategoria = PRODUCTOS.idCategoria
WHERE INVENTARIO.idTienda=3;
*/

/*
BEGIN
DROP TABLE ordenes_1;
DROP TABLE detalleOrden_1;
DROP TABLE categorias_1;
DROP TABLE productos_1;
DROP TABLE clientes_1;
DROP TABLE ordenes_3;
DROP TABLE detalleOrden_3;
DROP TABLE categorias_3;
DROP TABLE productos_3;
DROP TABLE clientes_3;
END
*/

/*
BEGIN
DROP TABLE detalleOrden;
DROP TABLE detalleOrden_1;
DROP TABLE detalleOrden_3;
DROP TABLE categorias;
DROP TABLE categorias_1;
DROP TABLE categorias_3;
DROP TABLE empleados;
DROP TABLE inventario;
DROP TABLE marcas;
DROP TABLE ordenes;
DROP TABLE ordenes_1;
DROP TABLE ordenes_3;
DROP TABLE productos;
DROP TABLE productos_1;
DROP TABLE productos_3;
DROP TABLE tiendas;
DROP TABLE clientes;
DROP TABLE clientes_1;
DROP TABLE clientes_3;
END
*/

/*
BEGIN
EXEC newOrder @idClient = 3, @state = 4, @fechaOrden = '20160101', @required_date = '20160101',
 @fechaEnvio = '20160101', @idTienda = 3, @idEmpleado = 1;
SELECT TOP 2 * FROM ordenes ORDER BY idOrden DESC;
SELECT TOP 2 * FROM ordenes_1 ORDER BY idOrden DESC;
SELECT TOP 2 * FROM ordenes_3 ORDER BY idOrden DESC;
END
*/
