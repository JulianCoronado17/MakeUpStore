-- Insertar productos
INSERT INTO Productos (id_producto, nombre, descripcion, categoria, precio, stock) VALUES
(1, 'Labial Mate', 'Labial de larga duración', 'Cosmeticos', 12.99, 50),
(2, 'Crema Hidratante', 'Crema para piel seca', 'Cuidado de la piel', 25.50, 30),
(3, 'Perfume Floral', 'Perfume con notas florales', 'Perfumes', 75.00, 15),
(4, 'Espejo Compacto', 'Espejo portátil con luz', 'Accesorios', 10.00, 40);

-- Insertar cosméticos
INSERT INTO Cosmeticos (id_producto, tipo, tono_color, fecha_expiracion) VALUES
(1, 'Labial', 'Rojo Carmesí', '2025-12-31');

-- Insertar cuidado de la piel
INSERT INTO CuidadoPiel (id_producto, tipo_piel, componentes, fecha_expiracion) VALUES
(2, 'Seca', 'Ácido Hialurónico, Aloe Vera', '2024-10-31');

-- Insertar perfumes
INSERT INTO Perfumes (id_producto, tipo_aroma, tamaño) VALUES
(3, 'Floral', '50ml');

-- Insertar accesorios
INSERT INTO Accesorios (id_producto, material) VALUES
(4, 'Plástico');

-- Insertar clientes
INSERT INTO Clientes (id_cliente, nombre_completo, correo_electronico, direccion, telefono) VALUES
(1, 'María López', 'maria.lopez@example.com', 'Calle Falsa 123', '555-1234'),
(2, 'Carlos Pérez', 'carlos.perez@example.com', 'Avenida Siempre Viva 456', '555-5678'),
(3, 'Ana García', 'ana.garcia@example.com', 'Boulevard del Sol 789', '555-9876'),
(4, 'Luis Fernández', 'luis.fernandez@example.com', 'Plaza Mayor 101', '555-3456');

-- Insertar empleados
INSERT INTO Empleados (id_empleado, nombre_completo, puesto, fecha_contratacion) VALUES
(1, 'Laura Martínez', 'Vendedora', '2021-05-15'),
(2, 'Pedro Jiménez', 'Encargado de Bodega', '2020-07-22'),
(3, 'Sofía Torres', 'Administradora', '2019-11-30'),
(4, 'Jorge Ríos', 'Vendedor', '2022-01-10');

-- Insertar ventas
INSERT INTO Ventas (id_venta, fecha_venta, id_cliente, id_empleado) VALUES
(1, '2024-10-10', 1, 1),
(2, '2024-10-11', 2, 2),
(3, '2024-10-09', 3, 3),
(4, '2024-10-08', 4, 4);

-- Insertar detalles de ventas
INSERT INTO DetalleVenta (id_venta, id_producto, cantidad) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 3);

-- Insertar proveedores
INSERT INTO Proveedores (id_proveedor, nombre_empresa, nombre_contacto, telefono, direccion) VALUES
(1, 'Cosmetics Pro', 'Juan González', '555-4321', 'Calle Comercio 100'),
(2, 'Belleza Total', 'Patricia Herrera', '555-8765', 'Avenida Belleza 200'),
(3, 'Fragancias Únicas', 'Miguel Castro', '555-6543', 'Pasaje Aroma 300'),
(4, 'Accesorios Glam', 'Verónica Sánchez', '555-2345', 'Carrera 50 #500');

-- Insertar órdenes de compra
INSERT INTO OrdenCompra (id_orden, id_proveedor, fecha_orden) VALUES
(1, 1, '2024-09-15'),
(2, 2, '2024-09-17'),
(3, 3, '2024-09-18'),
(4, 4, '2024-09-19');

-- Insertar detalles de órdenes de compra
INSERT INTO DetalleOrden (id_orden, id_producto, cantidad) VALUES
(1, 1, 20),
(2, 2, 15),
(3, 3, 10),
(4, 4, 25);
