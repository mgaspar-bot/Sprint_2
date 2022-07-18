DROP DATABASE IF EXISTS opticamgm;
CREATE DATABASE opticamgm CHARACTER SET utf8mb4;
USE opticamgm;

CREATE TABLE proveidors(
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
direccio VARCHAR(100) NOT NULL,
telefon1 INT NOT NULL,
telefon2 INT,
fax INT,
NIF CHAR(9) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

CREATE TABLE marques (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

CREATE TABLE prov_ven_marca (
id_marca INT NOT NULL UNIQUE,
id_prov INT NOT NULL,
FOREIGN KEY(id_marca) REFERENCES marques(id),
FOREIGN KEY(id_prov) REFERENCES proveidors(id)
);

CREATE TABLE ulleres (
id_ullera INT NOT NULL AUTO_INCREMENT,
id_marca INT NOT NULL,
graduacio_dreta DECIMAL(4,2),
grduacio_esquerra DECIMAL(4,2),
tipus_muntura ENUM('flotant','pasta', 'metàl·lica'),
color_muntura VARCHAR(10),
color_vidre_dret VARCHAR(10),
color_vidre_esquerra VARCHAR(10),
preu DECIMAL(6,2),
PRIMARY KEY(id_ullera),
FOREIGN KEY(id_marca) REFERENCES marques(id)
 );
 
CREATE TABLE clients (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
telefon INT,
email VARCHAR(60),
data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
/*TO DO BUSCAR COM FER QUE ES GUARDI LA DATA EN QUE FIQUES LES DADES I NO CANVII MAI MES*/
id_recomana INT,
PRIMARY KEY(id),
FOREIGN KEY(id_recomana) REFERENCES clients(id)
);

CREATE TABLE empleats (
id INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY(id)
);

CREATE TABLE empleat_ven_ullera (
id_empleat INT NOT NULL,
id_ullera INT NOT NULL,
id_client INT,
data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(id_empleat) REFERENCES empleats(id),
FOREIGN KEY(id_ullera) REFERENCES ulleres(id_ullera),
FOREIGN KEY(id_client) REFERENCES clients(id)
);
