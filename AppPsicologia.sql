-- Crear la base de datos
CREATE DATABASE AppPsicologia;

-- Usar la base de datos
USE AppPsicologia;

-- Crear la tabla para los usuarios
CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(50) NOT NULL UNIQUE,
  contrasena VARCHAR(100) NOT NULL,
  tipo ENUM('paciente', 'psicologo') NOT NULL
);

-- Crear la tabla para los datos adicionales de los pacientes
CREATE TABLE datos_pacientes (
  id INT PRIMARY KEY,
  edad INT,
  genero VARCHAR(20),
  FOREIGN KEY (id) REFERENCES usuarios(id)
);

CREATE TABLE datos_contacto (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  email VARCHAR(50),
  telefono VARCHAR(20),
  direccion VARCHAR(100),
  FOREIGN KEY (id) REFERENCES usuarios(id)
);

-- Crear la tabla para los datos adicionales de los psicólogos
CREATE TABLE datos_psicologos (
  id INT PRIMARY KEY,
  especialidad VARCHAR(50),
  experiencia INT,
  FOREIGN KEY (id) REFERENCES usuarios(id)
);

CREATE TABLE citas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  paciente_id INT,
  psicologo_id INT,
  fecha DATE,
  hora TIME,
  estado ENUM('pendiente', 'confirmada', 'cancelada') DEFAULT 'pendiente',
  FOREIGN KEY (paciente_id) REFERENCES usuarios(id),
  FOREIGN KEY (psicologo_id) REFERENCES usuarios(id)
);

CREATE TABLE mas_informacion (
  id INT PRIMARY KEY,
  sobre_mi TEXT,
  experiencia TEXT,
  especialidad TEXT,
  consultas TEXT,
  contactar TEXT,
  calificacion DECIMAL(3, 2),
  rutaImgen TEXT,
  FOREIGN KEY (id) REFERENCES datos_psicologos(id)
);


DELIMITER //

CREATE TRIGGER datos_psicologos_insert_trigger
AFTER INSERT ON datos_psicologos
FOR EACH ROW
BEGIN
  INSERT INTO mas_informacion (id, rutaImgen) VALUES (NEW.id, '../public/images/1.png');
END//

DELIMITER ;

SELECT * FROM mas_informacion
