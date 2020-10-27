CREATE OR ALTER PROCEDURE raiseMoneyByCategory @storage int, @idTienda int, @mes nvarchar(10), @category int
--OR ALTER
    AS
    BEGIN
        IF(@storage = 1)
        BEGIN

            SELECT productos_1.nomProducto,  
            SUM(detalleOrden.cantidad * detalleOrden.precioVenta * (1 - detalleOrden.descuento)) AS precioTotal FROM 
            (SELECT detalleOrden_1.idProducto, detalleOrden_1.cantidad, detalleOrden_1.precioVenta, detalleOrden_1.descuento FROM detalleOrden_1 
            INNER JOIN ordenes_1 ON ordenes_1.idOrden = detalleOrden_1.idOrden
            WHERE ordenes_1.fechaOrden LIKE @mes) AS detalleOrden
            INNER JOIN productos_1 ON detalleOrden.idProducto = productos_1.idProducto
            WHERE (productos_1.idCategoria = @category) 
            GROUP BY productos_1.nomProducto;

        END

        ELSE IF(@storage = 2)
        BEGIN

            SELECT productos.nomProducto, 
            SUM(detalleOrden.cantidad * detalleOrden.precioVenta * (1 - detalleOrden.descuento)) AS precioTotal FROM 
            (SELECT ordenes.idTienda, detalleOrden.idProducto, detalleOrden.cantidad, detalleOrden.precioVenta, detalleOrden.descuento FROM detalleOrden 
            INNER JOIN ordenes ON ordenes.idOrden = detalleOrden.idOrden
            WHERE ordenes.fechaOrden LIKE @mes) AS detalleOrden
            INNER JOIN productos ON detalleOrden.idProducto = productos.idProducto
            WHERE (productos.idCategoria = @category AND idTienda = @idTienda)
            GROUP BY productos.nomProducto;

        END

        ELSE IF(@storage = 3)
        BEGIN

            SELECT productos_3.nomProducto, 
            SUM(detalleOrden.cantidad * detalleOrden.precioVenta * (1 - detalleOrden.descuento)) AS precioTotal FROM 
            (SELECT detalleOrden_3.idProducto, detalleOrden_3.cantidad, detalleOrden_3.precioVenta, detalleOrden_3.descuento FROM detalleOrden_3 
            INNER JOIN ordenes_3 ON ordenes_3.idOrden = detalleOrden_3.idOrden
            WHERE ordenes_3.fechaOrden LIKE @mes) AS detalleOrden
            INNER JOIN productos_3 ON detalleOrden.idProducto = productos_3.idProducto
            WHERE (productos_3.idCategoria = @category)
            GROUP BY productos_3.nomProducto;

        END
    END


--EXEC raiseMoneyByCategory @storage = 3, @idTienda = 3, @mes = '201601%', @category = 6;
