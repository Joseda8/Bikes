ALTER PROCEDURE raisedMoneyByStore @tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)

    AS
    BEGIN

        IF(@tipoFecha = 'fechaOrden')
        BEGIN
            SELECT ordenes.idTienda, SUM(precioVenta * (1 - descuento)) AS ganancias FROM detalleOrden 
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ((ordenes.fechaOrden >= @minFecha AND ordenes.fechaOrden <= @maxFecha) OR ordenes.fechaOrden IS NULL)
            GROUP BY ordenes.idTienda;

        END

        ELSE IF(@tipoFecha = 'required')
        BEGIN
            SELECT ordenes.idTienda, SUM(precioVenta * (1 - descuento)) AS ganancias FROM detalleOrden 
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ((ordenes.required_date >= @minFecha AND ordenes.required_date <= @maxFecha) OR ordenes.required_date IS NULL)
            GROUP BY ordenes.idTienda;

        END

        ELSE IF(@tipoFecha = 'fechaEnvio')
        BEGIN

            SELECT ordenes.idTienda, SUM(precioVenta * (1 - descuento)) AS ganancias FROM detalleOrden 
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ((ordenes.fechaEnvio >= @minFecha AND ordenes.fechaEnvio <= @maxFecha) OR ordenes.fechaEnvio IS NULL)
            GROUP BY ordenes.idTienda;

        END

    END


