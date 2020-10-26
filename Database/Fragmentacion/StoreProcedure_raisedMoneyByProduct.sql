ALTER PROCEDURE raisedMoneyByProduct @idTienda int, @idProducto int,
@tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)

    AS
    BEGIN

        IF(@tipoFecha = 'fechaOrden')
        BEGIN
            SELECT productos.nomProducto, SUM(detalleOrden.precioVenta * (1 - detalleOrden.descuento)) AS ventas FROM detalleOrden 
            INNER JOIN productos ON productos.idProducto = detalleOrden.idProducto
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE (detalleOrden.idProducto = @idProducto AND ordenes.idTienda = @idTienda
            AND ( (ordenes.fechaOrden >= @minFecha AND ordenes.fechaOrden <= @maxFecha) OR ordenes.fechaOrden IS NULL) )
            GROUP BY productos.nomProducto;
        END

        ELSE IF(@tipoFecha = 'required')
        BEGIN
            SELECT productos.nomProducto, SUM(detalleOrden.precioVenta * (1 - detalleOrden.descuento)) AS ventas FROM detalleOrden 
            INNER JOIN productos ON productos.idProducto = detalleOrden.idProducto
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE (detalleOrden.idProducto = @idProducto AND ordenes.idTienda = @idTienda
            AND ( (ordenes.required_date >= @minFecha AND ordenes.required_date <= @maxFecha) OR ordenes.required_date IS NULL) )
            GROUP BY productos.nomProducto;

        END

        ELSE IF(@tipoFecha = 'fechaEnvio')
        BEGIN

            SELECT productos.nomProducto, SUM(detalleOrden.precioVenta * (1 - detalleOrden.descuento)) AS ventas FROM detalleOrden 
            INNER JOIN productos ON productos.idProducto = detalleOrden.idProducto
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE (detalleOrden.idProducto = @idProducto AND ordenes.idTienda = @idTienda
            AND ( (ordenes.fechaEnvio >= @minFecha AND ordenes.fechaEnvio <= @maxFecha) OR ordenes.fechaEnvio IS NULL) )
            GROUP BY productos.nomProducto;

        END
        
    END


