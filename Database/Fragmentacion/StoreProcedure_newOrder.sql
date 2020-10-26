CREATE OR ALTER PROCEDURE newOrder @idClient int, @state int, @fechaOrden nvarchar(10), 
@required_date varchar(10), @fechaEnvio varchar(10), @idTienda int, @idEmpleado int
    AS
    BEGIN
        DECLARE @MyTableVar table(order_id int);

        INSERT INTO ordenes (idOrden, idCliente, estadoOrden, fechaOrden, required_date, fechaEnvio, idTienda, idEmpleado)
        OUTPUT INSERTED.idOrden INTO @MyTableVar
        VALUES ((SELECT TOP 1 idOrden+1 FROM ordenes ORDER BY idOrden DESC),
        @idClient, @state, @fechaOrden, @required_date, @fechaEnvio, @idTienda, @idEmpleado);

        IF(@idTienda = 1)
        BEGIN
            INSERT INTO ordenes_1 (idOrden, idCliente, estadoOrden, fechaOrden, required_date, fechaEnvio, idTienda, idEmpleado)
            VALUES ((SELECT order_id FROM @MyTableVar), @idClient, @state, @fechaOrden, @required_date, @fechaEnvio, @idTienda, @idEmpleado);
        END
        IF(@idTienda = 3)
        BEGIN
            INSERT INTO ordenes_3 (idOrden, idCliente, estadoOrden, fechaOrden, required_date, fechaEnvio, idTienda, idEmpleado)
            VALUES ((SELECT order_id FROM @MyTableVar), @idClient, @state, @fechaOrden, @required_date, @fechaEnvio, @idTienda, @idEmpleado);
        END

        SELECT order_id FROM @MyTableVar;
    END
