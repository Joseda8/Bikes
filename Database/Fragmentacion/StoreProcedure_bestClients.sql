ALTER PROCEDURE bestClients @tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)

    AS
    BEGIN

        IF(@tipoFecha = 'fechaOrden')
        BEGIN
            SELECT clientes.idCliente, nombre, apellido, estado, compra FROM clientes
            INNER JOIN (SELECT TOP 3 ordenes.idCliente, SUM(detalleOrden.precioVenta) AS compra FROM ordenes
            INNER JOIN detalleOrden ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ((ordenes.fechaOrden >= @minFecha AND ordenes.fechaOrden <= @maxFecha) OR ordenes.fechaOrden IS NULL)
            GROUP BY ordenes.idCliente) AS bestC ON bestC.idCliente = clientes.idCliente
            ORDER BY compra DESC

        END

        ELSE IF(@tipoFecha = 'required')
        BEGIN
            SELECT clientes.idCliente, nombre, apellido, estado, compra FROM clientes
            INNER JOIN (SELECT TOP 3 ordenes.idCliente, SUM(detalleOrden.precioVenta) AS compra FROM ordenes
            INNER JOIN detalleOrden ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ((ordenes.required_date >= @minFecha AND ordenes.required_date <= @maxFecha) OR ordenes.required_date IS NULL)
            GROUP BY ordenes.idCliente) AS bestC ON bestC.idCliente = clientes.idCliente
            ORDER BY compra DESC

        END

        ELSE IF(@tipoFecha = 'fechaEnvio')
        BEGIN
            SELECT clientes.idCliente, nombre, apellido, estado, compra FROM clientes
            INNER JOIN (SELECT TOP 3 ordenes.idCliente, SUM(detalleOrden.precioVenta) AS compra FROM ordenes
            INNER JOIN detalleOrden ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ((ordenes.fechaEnvio >= @minFecha AND ordenes.fechaEnvio <= @maxFecha) OR ordenes.fechaEnvio IS NULL)
            GROUP BY ordenes.idCliente) AS bestC ON bestC.idCliente = clientes.idCliente
            ORDER BY compra DESC

        END

    END


