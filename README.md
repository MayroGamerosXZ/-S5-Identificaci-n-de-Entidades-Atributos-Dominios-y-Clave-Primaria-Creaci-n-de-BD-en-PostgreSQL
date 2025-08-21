Proyecto de Base de Datos: Vehículos
Este documento describe el diseño y la estructura de una base de datos simple para gestionar información sobre vehículos, lotes de importación y concesionarios. El código SQL adjunto permite la creación de las tablas, la inserción de datos de ejemplo y la verificación de los mismos.

1. Diseño de la Base de Datos
La base de datos está compuesta por tres tablas principales, cada una representando una entidad clave en el sistema.

Concesionario: Almacena información sobre los puntos de venta.

Lote_Importacion: Registra los lotes de vehículos importados.

Vehiculo: Contiene los datos de cada vehículo individual y se relaciona con las otras dos tablas.

El modelo de relación se basa en claves primarias (PRIMARY KEY) y claves foráneas (FOREIGN KEY) para garantizar la integridad de los datos.

Vehiculo tiene una clave foránea (Codigo_Lote) que hace referencia a Lote_Importacion.

Vehiculo tiene otra clave foránea (Codigo_Concesionario) que hace referencia a Concesionario.

2. Comandos SQL
A continuación, se presentan los comandos SQL para la gestión completa de la base de datos.

2.1. Eliminación de Tablas (Opcional)
Estos comandos eliminan las tablas si ya existen. Son útiles para evitar errores al ejecutar el script múltiples veces.

DROP TABLE IF EXISTS Vehiculo CASCADE;
DROP TABLE IF EXISTS Lote_Importacion CASCADE;
DROP TABLE IF EXISTS Concesionario CASCADE;

2.2. Creación de Tablas
Estas sentencias CREATE TABLE definen la estructura de cada tabla, incluyendo sus atributos, dominios (tipos de datos) y las relaciones.

-- Creación de la tabla 'Concesionario'
CREATE TABLE Concesionario (
    Codigo_concesionario VARCHAR(20) PRIMARY KEY,
    Nombre_comercial VARCHAR(200),
    Direccion VARCHAR(255),
    Persona_de_contacto VARCHAR(100)
);

-- Creación de la tabla 'Lote_Importacion'
CREATE TABLE Lote_Importacion (
    Codigo_identificador VARCHAR(20) PRIMARY KEY,
    Fecha_de_llegada DATE,
    Pais_de_origen VARCHAR(100)
);

-- Creación de la tabla 'Vehiculo'
CREATE TABLE Vehiculo (
    Numero_serie VARCHAR(50) PRIMARY KEY,
    Modelo VARCHAR(100),
    Marca VARCHAR(100),
    Año_de_fabricacion INTEGER,
    Velocidad_maxima INTEGER,
    Precio_declarado NUMERIC(10, 2),
    Codigo_Lote VARCHAR(20),
    Codigo_Concesionario VARCHAR(20),
    FOREIGN KEY (Codigo_Lote) REFERENCES Lote_Importacion (Codigo_identificador),
    FOREIGN KEY (Codigo_Concesionario) REFERENCES Concesionario (Codigo_concesionario)
);

2.3. Inserción de Datos
Estos comandos INSERT INTO añaden datos de ejemplo a cada una de las tablas. Es importante ejecutar estos comandos en el orden correcto para que las claves foráneas funcionen.

-- Insertar datos en la tabla 'Concesionario'
INSERT INTO Concesionario (
    Codigo_concesionario,
    Nombre_comercial,
    Direccion,
    Persona_de_contacto
) VALUES
    ('CON001', 'Honda Center', 'Av. Principal 123', 'Juan Perez'),
    ('CON002', 'Toyota Plaza', 'Calle Comercial 456', 'Maria Garcia'),
    ('CON003', 'Nissan Motors', 'Blvd. Autos 789', 'Carlos Lopez'),
    ('CON004', 'Hyundai Point', 'Zona Industrial 321', 'Ana Rodriguez');


-- Insertar datos en la tabla 'Lote_Importacion'
INSERT INTO Lote_Importacion (
    Codigo_identificador,
    Fecha_de_llegada,
    Pais_de_origen
) VALUES (
    '0001', '2025-10-12', 'Japon'),
    ('0002', '2025-10-19', 'Inglaterra'),
    ('0003', '2025-10-15', 'Guatemala'),
    ('0004', '2025-10-14', 'Mexico');


-- Insertar datos en la tabla 'Vehiculo'
INSERT INTO Vehiculo (
    Numero_serie,
    Modelo,
    Marca,
    Año_de_fabricacion,
    Velocidad_maxima,
    Precio_declarado,
    Codigo_Lote,
    Codigo_Concesionario
) VALUES (
    '1A2B3C4D5E','Civic', 'Honda',2023, 200,  25000.50,'0001','CON001'),
    ('2B3C4D5E6F','Corolla', 'Toyota',2022, 180,  22000.00,'0002','CON002'),
    ('3C4D5E6F7G','Altima', 'Nissan',2021, 190,  23000.75,'0003','CON003'),
    ('4D5E6F7G8H','Elantra', 'Hyundai',2020, 170,  21000.00,'0004','CON004'
);

2.4. Visualización de Datos
Estos comandos SELECT te permiten ver los datos que has insertado en cada una de las tablas.

SELECT * FROM Concesionario;
SELECT * FROM Lote_Importacion;
SELECT * FROM Vehiculo;

3. 🚀 Cómo usar

Copiar el script en un archivo llamado concesionarios.sql.

Ejecutarlo en PostgreSQL, MySQL o el gestor de BD compatible.

Verificar las tablas y registros con los comandos SELECT.
