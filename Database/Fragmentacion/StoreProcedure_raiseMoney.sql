CREATE OR ALTER PROCEDURE raisedMoney @storage int, @idTienda int
    AS
    BEGIN
        IF(@storage = 1)
        BEGIN
        SELECT SUM(precioVenta * (1 - descuento)) AS ventas FROM detalleOrden_1;
        END

        ELSE IF(@storage = 2)
        BEGIN
            SELECT SUM(precioVenta * (1 - descuento)) AS ventas FROM detalleOrden 
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ordenes.idTienda = @idTienda;
        END

        ELSE IF(@storage = 3)
        BEGIN
        SELECT SUM(precioVenta * (1 - descuento)) AS ventas FROM detalleOrden_3;
        END
        
    END


