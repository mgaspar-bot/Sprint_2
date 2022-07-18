CREATE DATABASE optica;
USE optica;

CREATE TABLE proveidors(
id INT(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
direccio VARCHAR(100) NOT NULL,
telefon1 INT(11) NOT NULL,
telefon2 INT(11),
fax INT(11),
NIF VARCHAR(8) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

CREATE TABLE marques (
id INT (11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

CREATE TABLE prov_ven_marca (
id_marca INT(11) NOT NULL,
id_prov INT(11) NOT NULL,
FOREIGN KEY(id_marca) REFERENCES marca(id),
FOREIGN KEY(id_prov) REFERENCES proveidor(id)
);

CREATE TABLE ulleres (
id_ullera INT(11) NOT NULL AUTO_INCREMENT,
id_marca INT(11) NOT NULL,
graduacio_dreta DECIMAL(3,2),
grduacio_esquerra DECIMAL(3,2),
tipus_muntura ENUM('flotant','pasta', 'metàl·lica'),
color_muntura VARCHAR(10),
color_vidre_dret VARCHAR(10),
color_vidre_esquerra VARCHAR(10),
preu DECIMAL(6,2),
PRIMARY KEY(id_ullera),
FOREIGN KEY(id_marca) REFERENCES marca(id)
 );
 
CREATE TABLE clients (
id INT(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
telefon INT(11),
email VARCHAR(60),
data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
/*TO DO BUSCAR COM FER QUE ES GUARDI LA DATA EN QUE FIQUES LES DADES I NO CANVII MAI MES*/
id_recomana INT(11),
PRIMARY KEY(id),
FOREIGN KEY(id_recomana) REFERENCES clientes(id)
);

CREATE TABLE empleats (
id INT(11) NOT NULL AUTO_INCREMENT,
nom VARCHAR(100) NOT NULL UNIQUE,
PRIMARY KEY(id)
);

CREATE TABLE empleat_ven_ullera (
id_empleat INT(11) NOT NULL,
id_ullera INT(11) NOT NULL,
id_client INT (11),
data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
/*TODO COM EM GUARDO LA DATA DE LA VENDA I QUE NO CANVII MAI MES */
FOREIGN KEY(id_empleat) REFERENCES empleat(id),
FOREIGN KEY(id_ullera) REFERENCES ulleres(id),
FOREIGN KEY(id_client) REFERENCES clients(id)
);
