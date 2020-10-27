ALTER PROCEDURE getClientOrders @storage int, @idTienda int,
@tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)
--OR ALTER
    AS
    BEGIN
        IF(@storage = 1)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN 
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_1 AS o
                LEFT JOIN clientes_1 AS c ON c.idCliente = o.idCliente
                WHERE((fechaOrden >= @minFecha AND fechaOrden <= @maxFecha) OR fechaOrden IS NULL)
                ORDER BY c.idCliente, o.fechaOrden;
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_1 AS o
                LEFT JOIN clientes_1 AS c ON c.idCliente = o.idCliente
                WHERE((required_date >= @minFecha AND required_date <= @maxFecha) OR required_date IS NULL)
                ORDER BY c.idCliente, o.required_date;
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_1 AS o
                LEFT JOIN clientes_1 AS c ON c.idCliente = o.idCliente
                WHERE((fechaEnvio >= @minFecha AND fechaEnvio <= @maxFecha) OR fechaEnvio IS NULL)
                ORDER BY c.idCliente, o.fechaEnvio;
            END

        END

        ELSE IF(@storage = 2)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_1 AS o
                LEFT JOIN clientes_1 AS c ON c.idCliente = o.idCliente
                WHERE(idTienda = @idTienda AND 
                ((fechaOrden >= @minFecha AND fechaOrden <= @maxFecha) OR fechaOrden IS NULL) )
                ORDER BY c.idCliente, o.fechaOrden;

            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_1 AS o
                LEFT JOIN clientes_1 AS c ON c.idCliente = o.idCliente
                WHERE(idTienda = @idTienda AND 
                ((required_date >= @minFecha AND required_date <= @maxFecha) OR required_date IS NULL) )
                ORDER BY c.idCliente, o.required_date;

            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_1 AS o
                LEFT JOIN clientes_1 AS c ON c.idCliente = o.idCliente
                WHERE(idTienda = @idTienda AND 
                ((fechaEnvio >= @minFecha AND fechaEnvio <= @maxFecha) OR fechaEnvio IS NULL) )
                ORDER BY c.idCliente, o.fechaEnvio;
            END

        END

        ELSE IF(@storage = 3)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_3 AS o
                LEFT JOIN clientes_3 AS c ON c.idCliente = o.idCliente
                WHERE((fechaOrden >= @minFecha AND fechaOrden <= @maxFecha) OR fechaOrden IS NULL)
                ORDER BY c.idCliente, o.fechaOrden;
                
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_3 AS o
                LEFT JOIN clientes_3 AS c ON c.idCliente = o.idCliente
                WHERE((required_date >= @minFecha AND required_date <= @maxFecha) OR required_date IS NULL)
                ORDER BY c.idCliente, o.required_date;

            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT c.idCliente, c.nombre, c.apellido, o.idOrden, o.fechaOrden, o.required_date, o.fechaEnvio FROM ordenes_3 AS o
                LEFT JOIN clientes_3 AS c ON c.idCliente = o.idCliente
                WHERE((fechaEnvio >= @minFecha AND fechaEnvio <= @maxFecha) OR fechaEnvio IS NULL)
                ORDER BY c.idCliente, o.fechaEnvio;

            END

        END
    END
