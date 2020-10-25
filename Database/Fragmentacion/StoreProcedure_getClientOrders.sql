CREATE OR ALTER PROCEDURE getClientOrders @storage int, @idTienda int, @idCliente int, 
@tipoFecha nvarchar(10), @minFecha nvarchar(10), @maxFecha nvarchar(10)
--OR ALTER
    AS
    BEGIN
        IF(@storage = 1)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT * FROM ordenes_1 WHERE(idCliente = @idCliente 
                AND ( (fechaOrden >= @minFecha AND fechaOrden <= @maxFecha) OR fechaOrden IS NULL))
                ORDER BY fechaOrden;
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT * FROM ordenes_1 WHERE(idCliente = @idCliente
                AND ( (required_date >= @minFecha AND required_date <= @maxFecha) OR required_date IS NULL))
                ORDER BY required_date;
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT * FROM ordenes_1 WHERE(idCliente = @idCliente
                AND ( (fechaEnvio >= @minFecha AND fechaEnvio <= @maxFecha) OR fechaEnvio IS NULL))
                ORDER BY fechaEnvio;
            END

        END

        ELSE IF(@storage = 2)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT * FROM ordenes WHERE(idCliente = @idCliente AND idTienda = @idTienda
                AND ( (fechaOrden >= @minFecha AND fechaOrden <= @maxFecha) OR fechaOrden IS NULL))
                ORDER BY fechaOrden;
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT * FROM ordenes WHERE(idCliente = @idCliente AND idTienda = @idTienda
                AND ( (required_date >= @minFecha AND required_date <= @maxFecha) OR required_date IS NULL))
                ORDER BY required_date;
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT * FROM ordenes WHERE(idCliente = @idCliente AND idTienda = @idTienda
                AND ( (fechaEnvio >= @minFecha AND fechaEnvio <= @maxFecha) OR fechaEnvio IS NULL))
                ORDER BY fechaEnvio;
            END

        END

        ELSE IF(@storage = 3)
        BEGIN

            IF(@tipoFecha = 'fechaOrden')
            BEGIN
                SELECT * FROM ordenes_3 WHERE(idCliente = @idCliente
                AND ( (fechaOrden >= @minFecha AND fechaOrden <= @maxFecha) OR fechaOrden IS NULL))
                ORDER BY fechaOrden;
            END

            ELSE IF(@tipoFecha = 'required')
            BEGIN
                SELECT * FROM ordenes_3 WHERE(idCliente = @idCliente
                AND ( (required_date >= @minFecha AND required_date <= @maxFecha) OR required_date IS NULL))
                ORDER BY required_date;
            END

            ELSE IF(@tipoFecha = 'fechaEnvio')
            BEGIN
                SELECT * FROM ordenes_3 WHERE(idCliente = @idCliente
                AND ( (fechaEnvio >= @minFecha AND fechaEnvio <= @maxFecha) OR fechaEnvio IS NULL))
                ORDER BY fechaEnvio;
            END


        END
    END
