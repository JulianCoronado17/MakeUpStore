-- 1. Listar todos los productos de cosméticos de un tipo específico
DELIMITER $$
CREATE PROCEDURE ListarCosmeticosPorTipo(IN tipo_cosmetico VARCHAR(50))
BEGIN
    SELECT p.id_producto, p.nombre, c.tipo, c.tono_color, p.precio, p.stock
    FROM Productos p
    JOIN Cosmeticos c ON p.id_producto = c.id_producto
    WHERE c.tipo = tipo_cosmetico;
END$$
DELIMITER ;

-- 2. Obtener todos los productos en una categoría cuyo stock sea inferior a un valor dado
DELIMITER $$
CREATE PROCEDURE ProductosConBajoStock(IN categoria_producto VARCHAR(50), IN stock_limite INT)
BEGIN
    SELECT id_producto, nombre, descripcion, precio, stock
    FROM Productos
    WHERE categoria = categoria_producto AND stock < stock_limite;
END$$
DELIMITER ;

-- 3. Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas
DELIMITER $$
CREATE PROCEDURE VentasPorClienteEnRango(IN id_cliente INT, IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT v.id_venta, v.fecha_venta, dv.id_producto, dv.cantidad
    FROM Ventas v
    JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
    WHERE v.id_cliente = id_cliente
      AND v.fecha_venta BETWEEN fecha_inicio AND fecha_fin;
END$$
DELIMITER ;

-- 4. Calcular el total de ventas realizadas por un empleado en un mes dado
DELIMITER $$
CREATE FUNCTION TotalVentasPorEmpleadoEnMes(id_empleado INT, mes INT, anio INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    SELECT SUM(p.precio * dv.cantidad) INTO total
    FROM Ventas v
    JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
    JOIN Productos p ON dv.id_producto = p.id_producto
    WHERE v.id_empleado = id_empleado
      AND MONTH(v.fecha_venta) = mes
      AND YEAR(v.fecha_venta) = anio;
    
    RETURN IFNULL(total, 0);
END$$
DELIMITER ;

-- 5. Listar los productos más vendidos en un período determinado
DELIMITER $$
CREATE PROCEDURE ProductosMasVendidosEnPeriodo(IN fecha_inicio DATE, IN fecha_fin DATE)
BEGIN
    SELECT p.id_producto, p.nombre, SUM(dv.cantidad) AS total_vendido
    FROM Ventas v
    JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
    JOIN Productos p ON dv.id_producto = p.id_producto
    WHERE v.fecha_venta BETWEEN fecha_inicio AND fecha_fin
    GROUP BY p.id_producto, p.nombre
    ORDER BY total_vendido DESC;
END$$
DELIMITER ;

-- 6. Consultar el stock disponible de un producto por su nombre o identificador
DELIMITER $$
CREATE PROCEDURE ConsultarStockProducto(IN producto_nombre VARCHAR(100), IN id_producto INT)
BEGIN
    SELECT id_producto, nombre, stock
    FROM Productos
    WHERE (nombre = producto_nombre OR id_producto = id_producto);
END$$
DELIMITER ;

-- 7. Mostrar las órdenes de compra realizadas a un proveedor específico en el último año
DELIMITER $$
CREATE PROCEDURE OrdenesCompraPorProveedorEnUltimoAnio(IN id_proveedor INT)
BEGIN
    SELECT oc.id_orden, oc.fecha_orden, do.id_producto, do.cantidad
    FROM OrdenCompra oc
    JOIN DetalleOrden do ON oc.id_orden = do.id_orden
    WHERE oc.id_proveedor = id_proveedor
      AND oc.fecha_orden >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END$$
DELIMITER ;

-- 8. Listar los empleados que han trabajado más de un año en la tienda
DELIMITER $$
CREATE PROCEDURE EmpleadosConMasDeUnAnio()
BEGIN
    SELECT id_empleado, nombre_completo, puesto, fecha_contratacion
    FROM Empleados
    WHERE fecha_contratacion <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
END$$
DELIMITER ;

-- 9. Obtener la cantidad total de productos vendidos en un día específico
DELIMITER $$
CREATE PROCEDURE TotalProductosVendidosEnDia(IN fecha DATE)
BEGIN
    SELECT SUM(dv.cantidad) AS total_vendido
    FROM Ventas v
    JOIN DetalleVenta dv ON v.id_venta = dv.id_venta
    WHERE v.fecha_venta = fecha;
END$$
DELIMITER ;

-- 10. Consultar las ventas de un producto específico y cuántas unidades se vendieron
DELIMITER $$
CREATE PROCEDURE ConsultarVentasDeProducto(IN producto_nombre VARCHAR(100), IN id_producto INT)
BEGIN
    SELECT p.id_producto, p.nombre, SUM(dv.cantidad) AS total_vendido
    FROM DetalleVenta dv
    JOIN Productos p ON dv.id_producto = p.id_producto
    WHERE (p.nombre = producto_nombre OR p.id_producto = id_producto)
    GROUP BY p.id_producto, p.nombre;
END$$
DELIMITER ;

