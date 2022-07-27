DROP DATABASE IF EXISTS spotifymgm;
CREATE DATABASE spotifymgm;
USE spotifymgm;

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

CREATE TABLE subscripcio (
id_subscripcio BIGINT NOT NULL,
id_usuari BIGINT NOT NULL UNIQUE,
data_inici DATETIME DEFAULT current_timestamp,
data_renovació DATE,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (id_subscripcio)
);

CREATE TABLE targeta_credit (
id_subscripcio BIGINT NOT NULL,
id_targeta BIGINT NOT NULL,
num_targeta INT(16) NOT NULL UNIQUE,
mes_caducitat TINYINT NOT NULL,
any_caducitat TINYINT NOT NULL,
codi_seguretat SMALLINT NOT NULL,
FOREIGN KEY (id_subscripcio) REFERENCES subscripcio(id_subscripcio),
PRIMARY KEY (id_targeta)
);

CREATE TABLE paypal (
id_subscripcio BIGINT NOT NULL,
id_paypal BIGINT NOT NULL,
nom_usuari_paypal VARCHAR(50) NOT NULL UNIQUE,
FOREIGN KEY (id_subscripcio) REFERENCES subscripcio(id_subscripcio),
PRIMARY KEY (id_paypal)
);

CREATE TABLE pagament (
id_pagament BIGINT NOT NULL AUTO_INCREMENT,
id_subscripcio BIGINT NOT NULL,
data_pagament DATETIME DEFAULT CURRENT_TIMESTAMP,
forma_pagament ENUM('targeta','Paypal'),
total INT,
PRIMARY KEY (id_pagament),
FOREIGN KEY (id_subscripcio) REFERENCES subscripcio(id_subscripcio)
);

CREATE TABLE artista (
id_artista INT NOT NULL,
nom VARCHAR(30) NOT NULL,
foto VARCHAR(300),
PRIMARY KEY (id_artista)
);

CREATE TABLE album (
id_album BIGINT NOT NULL AUTO_INCREMENT,
id_artista INT NOT NULL,
titol VARCHAR(100) NOT NULL,
any_publicacio SMALLINT,
portada VARCHAR (300),
PRIMARY KEY (id_album),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE canco (
id_canco BIGINT NOT NULL AUTO_INCREMENT,
id_album BIGINT NOT NULL,
titol VARCHAR(50) NOT NULL,
durada TIME,
reproduccions BIGINT,
PRIMARY KEY (id_canco),
FOREIGN KEY (id_album) REFERENCES album(id_album)
);

CREATE TABLE playlist (
id_playlist BIGINT NOT NULL AUTO_INCREMENT,
id_usuari BIGINT NOT NULL,
titol VARCHAR(50) NOT NULL,
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
id_semblanca BIGINT NOT NULL,
id_artista1 INT NOT NULL,
id_artista2 INT NOT NULL,
FOREIGN KEY (id_artista1) REFERENCES artista(id_artista),
FOREIGN KEY (id_artista2) REFERENCES artista(id_artista),
PRIMARY KEY (id_semblanca)
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
