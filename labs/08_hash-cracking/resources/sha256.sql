-- Crear la base de datos si no existe (opcional si la base de datos "elisa_express" ya existe)
CREATE SCHEMA IF NOT EXISTS elisa_express;

-- Utilizar la base de datos "elisa_express" para crear el esquema "elisa_express"
USE elisa_express;

-- Tabla de usuarios con contraseñas hasheadas en SHA256
CREATE TABLE elisa_express.usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_usuario VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contrasena VARCHAR(64) NOT NULL -- La contraseña se almacenará en formato SHA256
);

-- Tabla de productos
CREATE TABLE elisa_express.productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL
);

-- Tabla de categorías de productos
CREATE TABLE elisa_express.categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla de carrito de compras
CREATE TABLE elisa_express.carrito_compras (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  fecha_agregado DATETIME NOT NULL
);

-- Tabla de pedidos
CREATE TABLE elisa_express.pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  fecha_pedido DATETIME NOT NULL,
  total_pedido DECIMAL(10, 2) NOT NULL
);

-- Tabla de detalles del pedido
CREATE TABLE elisa_express.detalles_pedido (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10, 2) NOT NULL
);

-- Agregar datos de usuarios con contraseñas hasheadas en SHA256
INSERT INTO elisa_express.usuarios (nombre_usuario, email, contrasena) VALUES
  ('john_doe', 'john.doe@example.com', SHA2('athens', 256)),
  ('jane_smith', 'jane.smith@example.com', SHA2('hater1', 256)),
  ('robert_johnson', 'robert.johnson@example.com', SHA2('daddys', 256)),
  ('emily_williams', 'emily.williams@example.com', SHA2('qwe123', 256)),
  ('michael_brown', 'michael.brown@example.com', SHA2('saranghe', 256)),
  ('sophia_jones', 'sophia.jones@example.com', SHA2('alexia', 256)),
  ('william_taylor', 'william.taylor@example.com', SHA2('ateneo', 256)),
  ('olivia_anderson', 'olivia.anderson@example.com', SHA2('iluvmyself', 256)),
  ('james_miller', 'james.miller@example.com', SHA2('FOREVER', 256)),
  ('ava_jackson', 'ava.jackson@example.com', SHA2('mylife', 256));


-- Agregar datos de productos
INSERT INTO elisa_express.productos (nombre, descripcion, precio) VALUES
  ('Laptop HP', 'Laptop HP de 15 pulgadas', 800.00),
  ('Teléfono inteligente', 'Teléfono inteligente con pantalla AMOLED', 400.00),
  ('Smartwatch', 'Smartwatch con seguimiento de actividad', 150.00),
  ('Tablet', 'Tablet de 10 pulgadas', 300.00),
  ('Auriculares inalámbricos', 'Auriculares inalámbricos con cancelación de ruido', 100.00),
  ('Teclado mecánico', 'Teclado mecánico para gamers', 80.00),
  ('Monitor', 'Monitor de 27 pulgadas', 250.00),
  ('Impresora', 'Impresora láser en blanco y negro', 150.00),
  ('Altavoz Bluetooth', 'Altavoz portátil con Bluetooth', 50.00),
  ('Cámara de acción', 'Cámara de acción resistente al agua', 120.00);

-- Agregar datos de categorías de productos
INSERT INTO elisa_express.categorias (nombre) VALUES
  ('Computadoras'),
  ('Teléfonos'),
  ('Accesorios'),
  ('Electrónica'),
  ('Impresión'),
  ('Audio'),
  ('Cámaras'),
  ('Tablets'),
  ('Monitores'),
  ('Gadgets');

-- Agregar datos de carrito de compras
INSERT INTO elisa_express.carrito_compras (usuario_id, producto_id, cantidad, fecha_agregado) VALUES
  (1, 1, 1, NOW()),
  (1, 2, 2, NOW()),
  (2, 3, 1, NOW()),
  (2, 4, 1, NOW()),
  (3, 5, 2, NOW()),
  (4, 6, 1, NOW()),
  (4, 7, 1, NOW()),
  (5, 8, 3, NOW()),
  (6, 9, 2, NOW()),
  (7, 10, 1, NOW());

-- Agregar datos de pedidos
INSERT INTO elisa_express.pedidos (usuario_id, fecha_pedido, total_pedido) VALUES
  (1, NOW(), 1200.00),
  (2, NOW(), 400.00),
  (3, NOW(), 250.00),
  (4, NOW(), 230.00),
  (5, NOW(), 180.00),
  (6, NOW(), 100.00),
  (7, NOW(), 330.00),
  (8, NOW(), 70.00),
  (9, NOW(), 400.00),
  (10, NOW(), 120.00);

-- Agregar datos de detalles del pedido
INSERT INTO elisa_express.detalles_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES
  (1, 1, 1, 800.00),
  (1, 2, 2, 200.00),
  (2, 3, 1, 150.00),
  (3, 4, 1, 300.00),
  (4, 5, 1, 100.00),
  (5, 6, 1, 80.00),
  (5, 7, 1, 250.00),
  (6, 8, 1, 150.00),
  (7, 9, 1, 50.00),
  (8, 10, 3, 40.00);
