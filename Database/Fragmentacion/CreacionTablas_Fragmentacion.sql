CREATE TABLE ordenes_1(
	idOrden int NOT NULL,
	idCliente int FOREIGN KEY REFERENCES clientes(idCliente),
	estadoOrden int,
	fechaOrden nvarchar(10),
	required_date varchar(10),
	fechaEnvio varchar(10),
	idTienda int FOREIGN KEY REFERENCES tiendas(idTienda),
	idEmpleado int FOREIGN KEY REFERENCES empleados(idEmpleado)
);

CREATE TABLE detalleOrden_1(
	idOrden int FOREIGN KEY REFERENCES ordenes(idOrden),
	idItem int,
	idProducto int,
	cantidad int,
	precioVenta float,
	descuento float
);

CREATE TABLE categorias_1(
	idCategoria int NOT NULL,
	descripcion varchar(255)
);

CREATE TABLE productos_1(
	idProducto int NOT NULL,
	nomProducto varchar(255),
	idMarca int FOREIGN KEY REFERENCES marcas(idMarca),
	idCategoria int FOREIGN KEY REFERENCES categorias(idCategoria),
	annoModelo int,
	precioVenta float
);

CREATE TABLE clientes_1(
	idCliente int NOT NULL,
	nombre varchar(255),
	apellido varchar(255),
	telefono varchar(255),
	email varchar(255),
	calle varchar(255),
	ciudad varchar(255),
	estado varchar(255),
	codPostal int
);

CREATE TABLE ordenes_3(
	idOrden int NOT NULL,
	idCliente int FOREIGN KEY REFERENCES clientes(idCliente),
	estadoOrden int,
	fechaOrden nvarchar(10),
	required_date varchar(10),
	fechaEnvio varchar(10),
	idTienda int FOREIGN KEY REFERENCES tiendas(idTienda),
	idEmpleado int FOREIGN KEY REFERENCES empleados(idEmpleado)
);

CREATE TABLE detalleOrden_3(
	idOrden int FOREIGN KEY REFERENCES ordenes(idOrden),
	idItem int,
	idProducto int,
	cantidad int,
	precioVenta float,
	descuento float
);

CREATE TABLE categorias_3(
	idCategoria int NOT NULL,
	descripcion varchar(255)
);

CREATE TABLE productos_3(
	idProducto int NOT NULL,
	nomProducto varchar(255),
	idMarca int FOREIGN KEY REFERENCES marcas(idMarca),
	idCategoria int FOREIGN KEY REFERENCES categorias(idCategoria),
	annoModelo int,
	precioVenta float
);

CREATE TABLE clientes_3(
	idCliente int NOT NULL,
	nombre varchar(255),
	apellido varchar(255),
	telefono varchar(255),
	email varchar(255),
	calle varchar(255),
	ciudad varchar(255),
	estado varchar(255),
	codPostal int
);

