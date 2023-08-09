-- Crear la base de datos si no existe
CREATE SCHEMA IF NOT EXISTS biblioteca;
USE biblioteca;

-- Tabla de libros
CREATE TABLE biblioteca.libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  autor VARCHAR(100) NOT NULL,
  editorial VARCHAR(100) NOT NULL,
  anio_publicacion INT NOT NULL,
  cantidad_disponible INT NOT NULL
);

-- Tabla de autores
CREATE TABLE biblioteca.autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  nacionalidad VARCHAR(100) NOT NULL
);

-- Tabla de préstamos de libros
CREATE TABLE biblioteca.prestamos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  libro_id INT NOT NULL,
  usuario_id INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  fecha_devolucion DATE
);

-- Tabla de usuarios
CREATE TABLE biblioteca.usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  contrasena VARCHAR(64) NOT NULL -- La contraseña se almacenará en formato SHA256 (2 veces)
);

-- Tabla de categorías de libros
CREATE TABLE biblioteca.categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Tabla de idiomas de libros
CREATE TABLE biblioteca.idiomas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Agregar datos de libros
INSERT INTO biblioteca.libros (titulo, autor, editorial, anio_publicacion, cantidad_disponible) VALUES
  ('Cien años de soledad', 'Gabriel García Márquez', 'Sudamericana', 1967, 5),
  ('1984', 'George Orwell', 'Secker & Warburg', 1949, 8),
  ('El nombre de la rosa', 'Umberto Eco', 'Lumen', 1980, 6),
  ('Don Quijote de la Mancha', 'Miguel de Cervantes', 'Francisco de Robles', 1605, 3),
  ('Orgullo y prejuicio', 'Jane Austen', 'T. Egerton, Whitehall', 1813, 7),
  ('Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Bloomsbury', 1997, 10),
  ('El Señor de los Anillos: La Comunidad del Anillo', 'J.R.R. Tolkien', 'George Allen & Unwin', 1954, 4),
  ('Crimen y castigo', 'Fyodor Dostoyevsky', 'The Russian Messenger', 1866, 9),
  ('El Principito', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', 1943, 2),
  ('La sombra del viento', 'Carlos Ruiz Zafón', 'Planeta', 2001, 1);

-- Agregar datos de autores
INSERT INTO biblioteca.autores (nombre, nacionalidad) VALUES
  ('Gabriel García Márquez', 'Colombiano'),
  ('George Orwell', 'Inglés'),
  ('Umberto Eco', 'Italiano'),
  ('Miguel de Cervantes', 'Español'),
  ('Jane Austen', 'Inglesa');

-- Agregar datos de préstamos de libros
INSERT INTO biblioteca.prestamos (libro_id, usuario_id, fecha_prestamo, fecha_devolucion) VALUES
  (1, 1, '2023-07-15', '2023-08-15'),
  (2, 2, '2023-07-10', NULL),
  (3, 3, '2023-07-20', '2023-08-20'),
  (4, 4, '2023-07-12', NULL),
  (5, 5, '2023-07-18', NULL);

-- Agregar datos de usuarios
INSERT INTO biblioteca.usuarios (nombre, direccion, email, contrasena) VALUES
  ('Juan Pérez González', 'Calle Principal, 123', 'juan@example.com', SHA2(SHA2('liverp00l', 256), 256)),
  ('María Gómez Gómez', 'Avenida Central, 456', 'maria@example.com', SHA2(SHA2('blanket', 256), 256)),
  ('Pedro Ramírez Estrecho', 'Plaza Mayor, 789', 'pedro@example.com', SHA2(SHA2('ramírez2010', 256), 256)),
  ('Ana Ramírez Estrecho', 'Plaza Mayor, 789', 'ana@example.com', SHA2(SHA2('Ramírez2010', 256), 256)),
  ('Laura Fernández Ancho', 'Paseo del Parque, 987', 'laura@example.com', SHA2(SHA2('blanket', 256), 256)),
  ('Roberto López Ortuño', 'Callejón de la Luna, 555', 'roberto@example.com', SHA2(SHA2('alohomora', 256), 256)),
  ('Carla Martínez López', 'Avenida del Sol, 333', 'carla@example.com', SHA2(SHA2('hell666', 256), 256));
