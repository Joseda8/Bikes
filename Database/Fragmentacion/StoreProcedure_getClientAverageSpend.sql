CREATE OR ALTER PROCEDURE getClientAverageSpend @storage int, @idTienda int, @idCliente int, 
@tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)
--OR ALTER
    AS
    BEGIN
        IF(@storage = 1)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden_1 
                INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
                WHERE (ordenes_1.idCliente = @idCliente
                AND ( (ordenes_1.fechaOrden >= @minFecha AND ordenes_1.fechaOrden <= @maxFecha) OR ordenes_1.fechaOrden IS NULL) )
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden_1 
                INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
                WHERE (ordenes_1.idCliente = @idCliente
                AND ( (ordenes_1.required_date >= @minFecha AND ordenes_1.required_date <= @maxFecha) OR ordenes_1.required_date IS NULL) )
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden_1 
                INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
                WHERE (ordenes_1.idCliente = @idCliente
                AND ( (ordenes_1.fechaEnvio >= @minFecha AND ordenes_1.fechaEnvio <= @maxFecha) OR ordenes_1.fechaEnvio IS NULL) )
            END

        END

        ELSE IF(@storage = 2)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden
                INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
                WHERE (ordenes.idCliente = @idCliente AND idTienda = @idTienda
                AND ( (ordenes.fechaOrden >= @minFecha AND ordenes.fechaOrden <= @maxFecha) OR ordenes.fechaOrden IS NULL) )
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden 
                INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
                WHERE (ordenes.idCliente = @idCliente AND idTienda = @idTienda
                AND ( (ordenes.required_date >= @minFecha AND ordenes.required_date <= @maxFecha) OR ordenes.required_date IS NULL) )
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden 
                INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
                WHERE (ordenes.idCliente = @idCliente AND idTienda = @idTienda
                AND ( (ordenes.fechaEnvio >= @minFecha AND ordenes.fechaEnvio <= @maxFecha) OR ordenes.fechaEnvio IS NULL) )
            END

        END

        ELSE IF(@storage = 3)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden_3 
                INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
                WHERE (ordenes_3.idCliente = @idCliente
                AND ( (ordenes_3.fechaOrden >= @minFecha AND ordenes_3.fechaOrden <= @maxFecha) OR ordenes_3.fechaOrden IS NULL) )
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden_3
                INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
                WHERE (ordenes_3.idCliente = @idCliente
                AND ( (ordenes_3.required_date >= @minFecha AND ordenes_3.required_date <= @maxFecha) OR ordenes_3.required_date IS NULL) )
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT AVG(cantidad * precioVenta * (1 - descuento)) FROM detalleOrden_3
                INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
                WHERE (ordenes_3.idCliente = @idCliente
                AND ( (ordenes_3.fechaEnvio >= @minFecha AND ordenes_3.fechaEnvio <= @maxFecha) OR ordenes_3.fechaEnvio IS NULL) )
            END

        END
    END
