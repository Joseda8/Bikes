--Ordenes por tienda

INSERT INTO ordenes_1 (idOrden, idCliente, estadoOrden, fechaOrden, required_date, fechaEnvio, idTienda, idEmpleado)
SELECT * FROM ORDENES WHERE idTienda=1;

INSERT INTO detalleOrden_1 (idOrden, idItem, idProducto, cantidad, precioVenta, descuento) 
SELECT detalleOrden.idOrden, idItem, idProducto, cantidad, precioVenta, descuento FROM detalleOrden 
INNER JOIN ordenes ON detalleOrden.idOrden = ordenes.idOrden WHERE ordenes.idTienda=1;

INSERT INTO categorias_1 (idCategoria, descripcion)
SELECT * FROM categorias;

INSERT INTO productos_1 (idProducto, nomProducto, idMarca, idCategoria, annoModelo, precioVenta) 
SELECT * FROM productos;

INSERT INTO inventario_1 (idTienda, idProducto, cantidad) 
SELECT * FROM inventario WHERE (idTienda = 1);

INSERT INTO clientes_1 (idCliente, nombre, apellido, telefono, email, calle, ciudad, estado, codPostal) 
SELECT * FROM clientes;


INSERT INTO ordenes_3 (idOrden, idCliente, estadoOrden, fechaOrden, required_date, fechaEnvio, idTienda, idEmpleado)
SELECT * FROM ORDENES WHERE idTienda=3;

INSERT INTO detalleOrden_3 (idOrden, idItem, idProducto, cantidad, precioVenta, descuento) 
SELECT detalleOrden.idOrden, idItem, idProducto, cantidad, precioVenta, descuento FROM detalleOrden 
INNER JOIN ordenes ON detalleOrden.idOrden = ordenes.idOrden WHERE ordenes.idTienda=3;

INSERT INTO categorias_3 (idCategoria, descripcion)
SELECT * FROM categorias;

INSERT INTO productos_3 (idProducto, nomProducto, idMarca, idCategoria, annoModelo, precioVenta) 
SELECT * FROM productos;

INSERT INTO inventario_3 (idTienda, idProducto, cantidad) 
SELECT * FROM inventario WHERE (idTienda = 3);

INSERT INTO clientes_3 (idCliente, nombre, apellido, telefono, email, calle, ciudad, estado, codPostal) 
SELECT * FROM clientes;
