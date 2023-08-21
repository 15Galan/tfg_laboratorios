-- Crear el esquema "el_gran_garaje"
CREATE SCHEMA IF NOT EXISTS el_gran_garaje;

-- Tabla de usuarios con contraseñas hasheadas en MD5
CREATE TABLE el_gran_garaje.usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contrasena VARCHAR(32) NOT NULL -- La contraseña se almacenará en formato MD5
);

-- Tabla de clientes
CREATE TABLE el_gran_garaje.clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  email VARCHAR(100),
  direccion VARCHAR(200)
);

-- Tabla de vehículos
CREATE TABLE el_gran_garaje.vehiculos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  ano INT NOT NULL,
  matricula VARCHAR(10) NOT NULL,
  km_actual INT NOT NULL,
  ultima_revision DATE,
  proxima_revision DATE
);

-- Tabla de órdenes de trabajo
CREATE TABLE el_gran_garaje.ordenes_trabajo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vehiculo_id INT NOT NULL,
  descripcion TEXT NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  fecha_finalizacion DATETIME,
  costo DECIMAL(10, 2),
  estado VARCHAR(20)
);

-- Tabla de repuestos
CREATE TABLE el_gran_garaje.repuestos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL
);

-- Tabla de repuestos utilizados en órdenes de trabajo
CREATE TABLE el_gran_garaje.repuestos_utilizados (
  id INT AUTO_INCREMENT PRIMARY KEY,
  orden_id INT NOT NULL,
  repuesto_id INT NOT NULL,
  cantidad INT NOT NULL
);

-- Agregar datos de usuarios con contraseñas hasheadas en MD5
INSERT INTO el_gran_garaje.usuarios (nombre, email, contrasena) VALUES
  ('Juan Pérez', 'juan@example.com', MD5('contrasena1')),
  ('María Gómez', 'maria@example.com', MD5('contrasena2')),
  ('Pedro Ramírez', 'pedro@example.com', MD5('contrasena3'));

-- Agregar datos de clientes
INSERT INTO el_gran_garaje.clientes (nombre, telefono, email, direccion) VALUES
  ('Carlos Sánchez', '123456789', 'carlos@example.com', 'Calle Principal, 123'),
  ('Laura Fernández', '987654321', 'laura@example.com', 'Avenida Central, 456'),
  ('Roberto López', '555555555', 'roberto@example.com', 'Plaza Mayor, 789');

-- Agregar datos de vehículos
INSERT INTO el_gran_garaje.vehiculos (cliente_id, marca, modelo, ano, matricula, km_actual, ultima_revision, proxima_revision) VALUES
  (1, 'Toyota', 'Corolla', 2019, '1234ABC', 50000, '2023-05-10', '2023-11-10'),
  (2, 'Honda', 'Civic', 2020, '5678XYZ', 40000, '2023-04-15', '2023-10-15'),
  (3, 'Ford', 'Focus', 2018, '9999XYZ', 60000, '2023-06-20', '2023-12-20');

-- Agregar datos de órdenes de trabajo
INSERT INTO el_gran_garaje.ordenes_trabajo (vehiculo_id, descripcion, fecha_creacion, fecha_finalizacion, costo, estado) VALUES
  (1, 'Cambio de aceite y filtro', '2023-07-10 09:00:00', '2023-07-10 11:30:00', 80.00, 'Completada'),
  (1, 'Revisión general', '2023-07-20 14:00:00', NULL, NULL, 'En progreso'),
  (2, 'Reparación de frenos', '2023-07-12 10:30:00', '2023-07-13 15:00:00', 250.00, 'Completada');

-- Agregar datos de repuestos
INSERT INTO el_gran_garaje.repuestos (nombre, descripcion, precio) VALUES
  ('Aceite de motor', 'Aceite sintético para motor', 30.00),
  ('Filtro de aceite', 'Filtro de aceite de alta calidad', 10.00),
  ('Pastillas de freno', 'Pastillas de freno delanteras', 60.00),
  ('Filtro de aire', 'Filtro de aire para motor', 15.00);

-- Agregar datos de repuestos utilizados en órdenes de trabajo
INSERT INTO el_gran_garaje.repuestos_utilizados (orden_id, repuesto_id, cantidad) VALUES
  (1, 1, 1),
  (1, 2, 1),
  (3, 3, 2);
