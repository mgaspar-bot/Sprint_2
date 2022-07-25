DROP DATABASE IF EXISTS spotifymgm;
CREATE DATABASE spotifymgm;
USE spotifymgm;

/*
Aquesta db i la de youtube cal PROVAR_LES ABANS D'ENTREGAR
*/

CREATE TABLE usuari (
id_usuari BIGINT NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
contrasenya VARCHAR(50) NOT NULL,
nom_usuari VARCHAR(20) NOT NULL,
data_naixement DATE,
sexe CHAR(1),
pais VARCHAR(20),
codi_postal VARCHAR(10),
premium BOOLEAN,
PRIMARY KEY (id_usuari)
);

/*
Els usuaris/es prèmium fan subscripcions. Les dades necessàries que caldrà guardar per a cada subscripció són:
Data d'inici de la subscripció.
Data de renovació del servei.
Una forma de pagament, que pot ser mitjançant targeta de crèdit o PayPal.
*/

CREATE TABLE subscripcio (
id_usuari BIGINT NOT NULL,
data_inici DATETIME DEFAULT current_timestamp, /*m'ho guardaras coma date o com a datetime? */
data_renovació DATE,
forma_pagament ENUM('targeta', 'Paypal'),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari)
);

/*
De les targetes de crèdit guardem el número de targeta, mes i any de caducitat i el codi de seguretat. 
Dels usuaris/es que paguen amb PayPal guardem el nom d'usuari/ària de PayPal. Ens interessa portar un registre de tots 
els pagaments que un usuari/ària prèmium ha anat realitzant durant el període que està subscrit. De cada pagament es guarda:
La data.
Un número d'ordre (que és únic).
Un total.
*/

CREATE TABLE targeta_credit (
id_usuari BIGINT NOT NULL,
num_targeta INT(16) NOT NULL UNIQUE,
mes_caducitat TINYINT NOT NULL,
any_caducitat TINYINT NOT NULL,
codi_seguretat SMALLINT NOT NULL,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (num_targeta)
);

CREATE TABLE paypal (
id_usuari BIGINT NOT NULL,
nom_usuari_paypal VARCHAR(50) NOT NULL UNIQUE,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (nom_usuari_paypal)
);

CREATE TABLE pagament (
id_pagament BIGINT NOT NULL AUTO_INCREMENT,
id_usuari BIGINT NOT NULL,
data_pagament DATETIME DEFAULT CURRENT_TIMESTAMP,
total INT,
PRIMARY KEY (id_pagament),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari)
);

CREATE TABLE artista (
id_artista INT NOT NULL,
nom VARCHAR(30),
foto VARCHAR(300),
PRIMARY KEY (id_artista)
);

CREATE TABLE album (
id_album BIGINT NOT NULL AUTO_INCREMENT,
id_artista INT NOT NULL,
any_publicacio SMALLINT,
portada VARCHAR (300),
PRIMARY KEY (id_album),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE canco (
id_canco BIGINT NOT NULL AUTO_INCREMENT,
id_album BIGINT,
id_artista INT NOT NULL,
titol VARCHAR(50),
durada TIME,
reproduccions BIGINT,
PRIMARY KEY (id_canco),
FOREIGN KEY (id_album) REFERENCES album(id_album),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE playlist (
id_playlist BIGINT NOT NULL AUTO_INCREMENT,
id_usuari BIGINT NOT NULL,
titol VARCHAR(50),
nombre_cancons INT,
data_creacio DATETIME DEFAULT CURRENT_TIMESTAMP,
compartida BOOLEAN DEFAULT FALSE,
eliminada BOOLEAN DEFAULT FALSE,
data_eliminacio DATE,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (id_playlist)
);

CREATE TABLE usuari_posa_canco_a_playlist(
id_canco BIGINT NOT NULL,
id_playlist BIGINT NOT NULL,
id_usuari BIGINT NOT NULL,
data_afegencia DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_canco) REFERENCES canco(id_canco),
FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (id_canco, id_playlist)
);

CREATE TABLE artista_semblant_artista (
id_artista1 INT NOT NULL,
id_artista2 INT NOT NULL,
FOREIGN KEY (id_artista1) REFERENCES artista(id_artista),
FOREIGN KEY (id_artista2) REFERENCES artista(id_artista),
PRIMARY KEY (id_artista1, id_artista2)
);

CREATE TABLE usuari_segueix_artista (
id_usuari BIGINT NOT NULL,
id_artista INT NOT NULL,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_artista) REFERENCES artista (id_artista),
PRIMARY KEY (id_usuari, id_artista)
);

CREATE TABLE canco_favorita (
id_usuari BIGINT NOT NULL,
id_canco BIGINT NOT NULL,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_canco) REFERENCES canco(id_canco),
PRIMARY KEY (id_usuari, id_canco)
);

CREATE TABLE album_favorit (
id_usuari BIGINT NOT NULL,
id_album BIGINT NOT NULL,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_album) REFERENCES album(id_album),
PRIMARY KEY (id_usuari, id_album)
);
