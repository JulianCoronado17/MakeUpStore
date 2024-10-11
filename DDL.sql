create schema maqui;
use maqui;

-- Tabla Productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla Cosméticos (Subentidad de Productos)
CREATE TABLE Cosmeticos (
    id_producto INT PRIMARY KEY,
    tipo VARCHAR(50),
    tono_color VARCHAR(50),
    fecha_expiracion DATE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Cuidado de la Piel (Subentidad de Productos)
CREATE TABLE CuidadoPiel (
    id_producto INT PRIMARY KEY,
    tipo_piel VARCHAR(50),
    componentes TEXT,
    fecha_expiracion DATE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Perfumes (Subentidad de Productos)
CREATE TABLE Perfumes (
    id_producto INT PRIMARY KEY,
    tipo_aroma VARCHAR(50),
    tamaño VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Accesorios (Subentidad de Productos)
CREATE TABLE Accesorios (
    id_producto INT PRIMARY KEY,
    material VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre_completo VARCHAR(100),
    correo_electronico VARCHAR(100),
    direccion TEXT,
    telefono VARCHAR(15)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    nombre_completo VARCHAR(100),
    puesto VARCHAR(50),
    fecha_contratacion DATE
);

-- Tabla Ventas
CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    fecha_venta DATE,
    id_cliente INT,
    id_empleado INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- Tabla DetalleVenta
CREATE TABLE DetalleVenta (
    id_venta INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre_empresa VARCHAR(100),
    nombre_contacto VARCHAR(100),
    telefono VARCHAR(15),
    direccion TEXT
);

-- Tabla OrdenCompra
CREATE TABLE OrdenCompra (
    id_orden INT PRIMARY KEY,
    id_proveedor INT,
    fecha_orden DATE,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

-- Tabla DetalleOrden
CREATE TABLE DetalleOrden (
    id_orden INT,
    id_producto INT,
    cantidad INT,
    PRIMARY KEY (id_orden, id_producto),
    FOREIGN KEY (id_orden) REFERENCES OrdenCompra(id_orden),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);