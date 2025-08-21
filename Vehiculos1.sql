-- Comandos para eliminar las tablas para evitar errores al volver a ejecutar
DROP TABLE IF EXISTS Vehiculo CASCADE;
DROP TABLE IF EXISTS Lote_Importacion CASCADE;
DROP TABLE IF EXISTS Concesionario CASCADE;

-- Creación de la tabla 'Concesionario'
CREATE TABLE Concesionario ( /*Entidad*/
    Codigo_concesionario VARCHAR(20) PRIMARY KEY, /*Atributos-Dominio*-LLave Primaria*/
    Nombre_comercial VARCHAR(200),/*Atributos-Dominio*/
    Direccion VARCHAR(255),/*Atributos-Dominio*/
    Persona_de_contacto VARCHAR(100)/*Atributos-Dominio*/
);

-- Creación de la tabla 'Lote_Importacion'
CREATE TABLE Lote_Importacion (/*Entidad*/
    Codigo_identificador VARCHAR(20) PRIMARY KEY,/*Atributos-Dominio*-LLave Primaria*/
    Fecha_de_llegada DATE,/*Atributos-Dominio*/
    Pais_de_origen VARCHAR(100)/*Atributos-Dominio*/
);

-- Creación de la tabla 'Vehiculo' con claves foráneas
CREATE TABLE Vehiculo (/*Entidad*/
    Numero_serie VARCHAR(50) PRIMARY KEY,
    Modelo VARCHAR(100),/*Atributos-Dominio*/
    Marca VARCHAR(100),/*Atributos-Dominio*/
    Año_de_fabricacion INTEGER,/*Atributos-Dominio*/
    Velocidad_maxima INTEGER,/*Atributos-Dominio*/
    Precio_declarado NUMERIC(10, 2),/*Atributos-Dominio*/
    Codigo_Lote VARCHAR(20),/*Atributos-Dominio*/
    Codigo_Concesionario VARCHAR(20),/*Atributos-Dominio*/
    FOREIGN KEY (Codigo_Lote) REFERENCES Lote_Importacion (Codigo_identificador), /*Llave Foránea*/
    FOREIGN KEY (Codigo_Concesionario) REFERENCES Concesionario (Codigo_concesionario)/*Llave Foránea*/
);

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

-- Ver los datos de todas las tablas
SELECT * FROM Concesionario;
SELECT * FROM Lote_Importacion;
SELECT * FROM Vehiculo;