
/*
Creación de las Bases de Datos
*/

GO
CREATE DATABASE produccion;
CREATE DATABASE ventas;
GO


/*Indica cual DB se va a utilizar*/
USE produccion;

GO 
CREATE TABLE marcas(
	idMarca int NOT NULL PRIMARY KEY,
	nomMarca nvarchar(255)
);
GO

/*Indica cual DB se va a utilizar*/
USE produccion;

GO 
CREATE TABLE categorias(
	idCategoria int NOT NULL PRIMARY KEY,
	descripcion varchar(255)
);
GO

/*Indica cual DB se va a utilizar*/
USE produccion;

GO 
CREATE TABLE productos(
	idProducto int NOT NULL PRIMARY KEY,
	nomProducto varchar(255),
	idMarca int FOREIGN KEY REFERENCES marcas(idMarca),
	idCategoria int FOREIGN KEY REFERENCES categorias(idCategoria),
	annoModelo int,
	precioVenta float
);
GO

-------------------------------------------------------------------------------------------------------------

/*Indica cual DB se va a utilizar*/
USE ventas;

GO 
CREATE TABLE clientes(
	idCliente int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(255),
	apellido varchar(255),
	telefono varchar(255),
	email varchar(255),
	calle varchar(255),
	ciudad varchar(255),
	estado varchar(255),
	codPostal int
);
GO

/*Indica cual DB se va a utilizar*/
USE ventas;

GO 
CREATE TABLE tiendas(
	idTienda int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomTienda varchar(255),
	telefono varchar(255),
	email varchar(255),
	calle varchar(255),
	ciudad varchar(255),
	estado varchar(255),
	codPostal int
);
GO


/*Indica cual DB se va a utilizar*/
USE ventas;

GO 
CREATE TABLE empleados(
	idEmpleado int NOT NULL PRIMARY KEY,
	nombre varchar(255),
	apellido varchar(255),
	email varchar(255),
	telefono varchar(255),
	activo int,
	idTienda int FOREIGN KEY REFERENCES tiendas(idTienda),
	idJefe int
);
GO


/*Indica cual DB se va a utilizar*/
USE ventas;

GO 
CREATE TABLE ordenes(
	idOrden int NOT NULL PRIMARY KEY,
	idCliente int FOREIGN KEY REFERENCES clientes(idCliente),
	estadoOrden int,
	fechaOrden nvarchar(10),
	required_date varchar(10),
	fechaEnvio varchar(10),
	idTienda int FOREIGN KEY REFERENCES tiendas(idTienda),
	idEmpleado int FOREIGN KEY REFERENCES empleados(idEmpleado)
);
GO

/*Indica cual DB se va a utilizar*/
USE ventas;

GO 
CREATE TABLE detalleOrden(
	idOrden int FOREIGN KEY REFERENCES ordenes(idOrden),
	idItem int,
	idProducto int,
	cantidad int,
	precioVenta float,
	descuento float
);
GO

-------------------------------------------------------------------------------------------------------------

/*Indica cual DB se va a utilizar*/
USE produccion;

GO 
CREATE TABLE inventario(
	idTienda int,
	idProducto int FOREIGN KEY REFERENCES productos(idProducto),
	cantidad int,
);
GO


/*
Para eliminar las DB


DROP DATABASE produccion;
DROP DATABASE ventas;

*/

