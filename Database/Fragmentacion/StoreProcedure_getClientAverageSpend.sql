ALTER PROCEDURE getClientAverageSpend @storage int, @idTienda int, 
@tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)
--OR ALTER
    AS
    BEGIN
        IF(@storage = 1)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT ordenes_1.idCliente,  clientes_1.nombre, clientes_1.apellido, 
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden_1 
                INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
                INNER JOIN clientes_1 ON clientes_1.idCliente = ordenes_1.idCliente
                WHERE ((ordenes_1.fechaOrden >= @minFecha AND ordenes_1.fechaOrden <= @maxFecha) OR ordenes_1.fechaOrden IS NULL)
                GROUP BY ordenes_1.idCliente, clientes_1.nombre, clientes_1.apellido;
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT ordenes_1.idCliente,  clientes_1.nombre, clientes_1.apellido, 
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden_1 
                INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
                INNER JOIN clientes_1 ON clientes_1.idCliente = ordenes_1.idCliente
                WHERE ((ordenes_1.required_date >= @minFecha AND ordenes_1.required_date <= @maxFecha) OR ordenes_1.required_date IS NULL)
                GROUP BY ordenes_1.idCliente, clientes_1.nombre, clientes_1.apellido;
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT ordenes_1.idCliente,  clientes_1.nombre, clientes_1.apellido, 
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden_1 
                INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
                INNER JOIN clientes_1 ON clientes_1.idCliente = ordenes_1.idCliente
                WHERE ((ordenes_1.fechaEnvio >= @minFecha AND ordenes_1.fechaEnvio <= @maxFecha) OR ordenes_1.fechaEnvio IS NULL)
                GROUP BY ordenes_1.idCliente, clientes_1.nombre, clientes_1.apellido;

            END

        END

        ELSE IF(@storage = 2)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT ordenes.idCliente, clientes.nombre, clientes.apellido,
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden 
                INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
                INNER JOIN clientes ON clientes.idCliente = ordenes.idCliente
                WHERE (idTienda = @idTienda
                AND ( (ordenes.fechaOrden >= @minFecha AND ordenes.fechaOrden <= @maxFecha) OR ordenes.fechaOrden IS NULL) )
                GROUP BY ordenes.idCliente, clientes.nombre, clientes.apellido;

            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT ordenes.idCliente, clientes.nombre, clientes.apellido,
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden 
                INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
                INNER JOIN clientes ON clientes.idCliente = ordenes.idCliente
                WHERE (idTienda = @idTienda
                AND ( (ordenes.required_date >= @minFecha AND ordenes.required_date <= @maxFecha) OR ordenes.required_date IS NULL) )
                GROUP BY ordenes.idCliente, clientes.nombre, clientes.apellido;

            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT ordenes.idCliente, clientes.nombre, clientes.apellido,
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden 
                INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
                INNER JOIN clientes ON clientes.idCliente = ordenes.idCliente
                WHERE (idTienda = @idTienda
                AND ( (ordenes.fechaEnvio >= @minFecha AND ordenes.fechaEnvio <= @maxFecha) OR ordenes.fechaEnvio IS NULL) )
                GROUP BY ordenes.idCliente, clientes.nombre, clientes.apellido;
            END

        END

        ELSE IF(@storage = 3)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT ordenes_3.idCliente, clientes_3.nombre, clientes_3.apellido,
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden_3 
                INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
                INNER JOIN clientes_3 ON clientes_3.idCliente = ordenes_3.idCliente
                WHERE ((ordenes_3.fechaOrden >= @minFecha AND ordenes_3.fechaOrden <= @maxFecha) OR ordenes_3.fechaOrden IS NULL)
                GROUP BY ordenes_3.idCliente, clientes_3.nombre, clientes_3.apellido;
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT ordenes_3.idCliente, clientes_3.nombre, clientes_3.apellido,
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden_3 
                INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
                INNER JOIN clientes_3 ON clientes_3.idCliente = ordenes_3.idCliente
                WHERE ((ordenes_3.required_date >= @minFecha AND ordenes_3.required_date <= @maxFecha) OR ordenes_3.required_date IS NULL)
                GROUP BY ordenes_3.idCliente, clientes_3.nombre, clientes_3.apellido;

            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT ordenes_3.idCliente, clientes_3.nombre, clientes_3.apellido,
                AVG(cantidad * precioVenta * (1 - descuento)) AS monto FROM detalleOrden_3 
                INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
                INNER JOIN clientes_3 ON clientes_3.idCliente = ordenes_3.idCliente
                WHERE ((ordenes_3.fechaEnvio >= @minFecha AND ordenes_3.fechaEnvio <= @maxFecha) OR ordenes_3.fechaEnvio IS NULL)
                GROUP BY ordenes_3.idCliente, clientes_3.nombre, clientes_3.apellido;

            END

        END
    END
