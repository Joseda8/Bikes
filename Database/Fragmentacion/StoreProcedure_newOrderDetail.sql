CREATE OR ALTER PROCEDURE newOrderDetail @idOrden int, @idProducto int, @cantidad int, @descuento float
    AS
    BEGIN

        INSERT INTO detalleOrden (idOrden, idItem, idProducto, cantidad, precioVenta, descuento)
        VALUES (@idOrden, (SELECT COUNT(idOrden) FROM detalleOrden WHERE (idOrden=@idOrden))+1, 
        @idProducto, @cantidad, (SELECT precioVenta*@cantidad FROM productos WHERE idProducto = @idProducto), @descuento);

        UPDATE inventario
        SET inventario.cantidad = inventario.cantidad - @cantidad
        WHERE inventario.idProducto = @idProducto;

        DECLARE @idTienda INT;
        SET @idTienda = (SELECT idTienda FROM ordenes WHERE (idOrden = @idOrden));

        IF(@idTienda = 1)
        BEGIN
            INSERT INTO detalleOrden_1 (idOrden, idItem, idProducto, cantidad, precioVenta, descuento)
            VALUES (@idOrden, (SELECT COUNT(idOrden) FROM detalleOrden_1 WHERE (idOrden=@idOrden))+1, 
            @idProducto, @cantidad, (SELECT precioVenta*@cantidad FROM productos_1 WHERE idProducto = @idProducto), @descuento);

            UPDATE inventario_1
            SET inventario_1.cantidad = inventario_1.cantidad - @cantidad
            WHERE inventario_1.idProducto = @idProducto;
        END

        IF(@idTienda = 3)
        BEGIN
            INSERT INTO detalleOrden_3 (idOrden, idItem, idProducto, cantidad, precioVenta, descuento)
            VALUES (@idOrden, (SELECT COUNT(idOrden) FROM detalleOrden_3 WHERE (idOrden=@idOrden))+1,
            @idProducto, @cantidad, (SELECT precioVenta*@cantidad FROM productos_3 WHERE idProducto = @idProducto), @descuento);

            UPDATE inventario_3
            SET inventario_3.cantidad = inventario_3.cantidad - @cantidad
            WHERE inventario_3.idProducto = @idProducto;
        END
    END

