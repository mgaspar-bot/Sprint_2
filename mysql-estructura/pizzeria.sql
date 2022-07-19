DROP DATABASE IF EXISTS pizzeriamgm;
CREATE DATABASE pizzeriamgm CHARACTER SET utf8mb4;
USE pizzeriamgm;

CREATE TABLE provincia (
id_provincia INT AUTO_INCREMENT NOT NULL,
nom VARCHAR(100) NOT NULL,
PRIMARY KEY (id_provincia)
);

CREATE TABLE localitat (
id_localitat INT NOT NULL AUTO_INCREMENT,
id_provincia INT NOT NULL,
nom VARCHAR(100) NOT NULL,
PRIMARY KEY (id_localitat),
FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);

CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(30) NOT NULL,
cognoms VARCHAR(70) NOT NULL,
direccio VARCHAR(100),
codipostal VARCHAR(10),
id_localitat INT NOT NULL,
telefon INT NOT NULL,
PRIMARY KEY (id_cliente),
FOREIGN KEY(id_localitat) REFERENCES localitat(id_localitat)
);

CREATE TABLE comanda (
id_comanda INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
domi_o_recollir ENUM('a domicili', 'recollir'),
/*QUANTITAT DE CADA TIPUS*/
num_pizzes INT,
num_hamburgueses INT,
num_begudes INT,
preu INT,
PRIMARY KEY (id_comanda),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE categoria_pizza (
id_categoria INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(20),
PRIMARY KEY (id_categoria)
);

CREATE TABLE producte (
id_producte INT NOT NULL AUTO_INCREMENT,
tipus ENUM('pizza','hamburguesa','beguda') NOT NULL,
id_categoria_pizza INT,
nom VARCHAR(30) NOT NULL UNIQUE,
descripcio TEXT,
/*IMATGE, m'haig de guardar una ruta en el fs o el binary, o IMAGE?*/
preu INT NOT NULL,
PRIMARY KEY (id_producte),
FOREIGN KEY (id_categoria_pizza) REFERENCES categoria_pizza(id_categoria)
);

CREATE TABLE botiga (
id_botiga INT NOT NULL AUTO_INCREMENT,
direccio VARCHAR(100),
codi_postal VARCHAR(10),
id_localitat INT NOT NULL,
PRIMARY KEY (id_botiga),
FOREIGN KEY (id_localitat) REFERENCES localitat(id_localitat)
);

CREATE TABLE botiga_gestiona_comanda (
id_botiga INT NOT NULL,
id_comanda INT UNIQUE NOT NULL,
FOREIGN KEY (id_botiga) REFERENCES botiga(id_botiga),
FOREIGN KEY (id_comanda) REFERENCES comanda(id_comanda)
);

CREATE TABLE empleat (
id_empleat INT NOT NULL AUTO_INCREMENT,
id_botiga INT NOT NULL,
nom VARCHAR(30) NOT NULL,
cognoms VARCHAR (70) NOT NULL,
nif CHAR(9) NOT NULL UNIQUE,
telefon CHAR(9) NOT NULL,
funcio ENUM('cuiner','repartidor'),
PRIMARY KEY (id_empleat),
FOREIGN KEY (id_botiga) REFERENCES botiga(id_botiga)
);

CREATE TABLE repartidor_porta_comanda (
id_repartidor INT NOT NULL,
id_comanda INT NOT NULL,
hora_assignacio TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
hora_tornada TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (id_repartidor) REFERENCES empleat(id_empleat),
FOREIGN KEY (id_comanda) REFERENCES comanda(id_comanda)
);