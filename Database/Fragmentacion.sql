--Fragmentos de Tiendas
--SELECT * FROM ventas.dbo.TIENDAS WHERE estado='CA';
--SELECT * FROM ventas.dbo.TIENDAS WHERE estado='NY';
--SELECT * FROM ventas.dbo.TIENDAS WHERE estado='TX';

--Fragmento ordenes por tienda
--SELECT * FROM ventas.dbo.ORDENES WHERE idTienda=1;
--SELECT * FROM ventas.dbo.ORDENES WHERE idTienda=2;
--SELECT * FROM ventas.dbo.ORDENES WHERE idTienda=3;

--Detalles orden por tienda
/*
SELECT * FROM detalleOrden 
INNER JOIN ventas.dbo.ORDENES ON ventas.dbo.ORDENES.idOrden = ventas.dbo.detalleOrden.idOrden
WHERE ventas.dbo.ORDENES.idTienda=1;
*/
/*
SELECT * FROM detalleOrden 
INNER JOIN ventas.dbo.ORDENES ON ventas.dbo.ORDENES.idOrden = ventas.dbo.detalleOrden.idOrden
WHERE ventas.dbo.ORDENES.idTienda=2;
*/
/*
SELECT * FROM detalleOrden 
INNER JOIN ventas.dbo.ORDENES ON ventas.dbo.ORDENES.idOrden = ventas.dbo.detalleOrden.idOrden
WHERE ventas.dbo.ORDENES.idTienda=3;
*/

--Empleados por tienda
--SELECT * FROM ventas.dbo.EMPLEADOS WHERE EMPLEADOS.idTienda = 1;
--SELECT * FROM ventas.dbo.EMPLEADOS WHERE EMPLEADOS.idTienda = 2;
--SELECT * FROM ventas.dbo.EMPLEADOS WHERE EMPLEADOS.idTienda = 3;

--Inventarios por tienda
--SELECT * FROM produccion.dbo.INVENTARIO WHERE INVENTARIO.idTienda = 1;
--SELECT * FROM produccion.dbo.INVENTARIO WHERE INVENTARIO.idTienda = 2;
--SELECT * FROM produccion.dbo.INVENTARIO WHERE INVENTARIO.idTienda = 3;

--Productos por tienda, con nombre de marca y producto
/*
SELECT INVENTARIO.idTienda, PRODUCTOS.*, INVENTARIO.cantidad, MARCAS.nomMarca, CATEGORIAS.descripcion FROM produccion.dbo.PRODUCTOS AS PRODUCTOS
INNER JOIN produccion.dbo.INVENTARIO AS INVENTARIO ON PRODUCTOS.idProducto = INVENTARIO.idProducto
LEFT JOIN produccion.dbo.MARCAS AS MARCAS ON MARCAS.idMarca = PRODUCTOS.idMarca
LEFT JOIN produccion.dbo.CATEGORIAS AS CATEGORIAS ON CATEGORIAS.idCategoria = PRODUCTOS.idCategoria
WHERE INVENTARIO.idTienda=1;
*/
/*
SELECT INVENTARIO.idTienda, PRODUCTOS.*, INVENTARIO.cantidad, MARCAS.nomMarca, CATEGORIAS.descripcion FROM produccion.dbo.PRODUCTOS AS PRODUCTOS
INNER JOIN produccion.dbo.INVENTARIO AS INVENTARIO ON PRODUCTOS.idProducto = INVENTARIO.idProducto
LEFT JOIN produccion.dbo.MARCAS AS MARCAS ON MARCAS.idMarca = PRODUCTOS.idMarca
LEFT JOIN produccion.dbo.CATEGORIAS AS CATEGORIAS ON CATEGORIAS.idCategoria = PRODUCTOS.idCategoria
WHERE INVENTARIO.idTienda=2;
*/
/*
SELECT INVENTARIO.idTienda, PRODUCTOS.*, INVENTARIO.cantidad, MARCAS.nomMarca, CATEGORIAS.descripcion FROM produccion.dbo.PRODUCTOS AS PRODUCTOS
INNER JOIN produccion.dbo.INVENTARIO AS INVENTARIO ON PRODUCTOS.idProducto = INVENTARIO.idProducto
LEFT JOIN produccion.dbo.MARCAS AS MARCAS ON MARCAS.idMarca = PRODUCTOS.idMarca
LEFT JOIN produccion.dbo.CATEGORIAS AS CATEGORIAS ON CATEGORIAS.idCategoria = PRODUCTOS.idCategoria
WHERE INVENTARIO.idTienda=3;
*/
