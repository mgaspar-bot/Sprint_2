DROP DATABASE IF EXISTS youtubemgm;
CREATE DATABASE youtubemgm CHARACTER SET utf8mb4;
USE youtubemgm;

CREATE TABLE usuari (
id_usuari BIGINT NOT NULL AUTO_INCREMENT,
email VARCHAR(40),
contrasenya VARCHAR(40) NOT NULL,
nom_usuari VARCHAR(40) NOT NULL UNIQUE,
data_naixement DATE NOT NULL,
sexe CHAR(1),
pais ENUM('Països Catalans', 'Altres (xD)'),
codi_postal CHAR(10),
PRIMARY KEY (id_usuari, email, contrasenya, nom_usuari, data_naixement, sexe, pais, codi_postal) 
/*PRIMARY KEY (id_usuari) HO TENIA AIXI */
/*Trobo que el problema es que tot i que ho posi tot a la primary key, la combinació de email, contrasenya, nom_usuari...
no té perque ser unica, si algu es vol registrar amb EXACTAMENT les mateixes dades, el deixaran pq el AUTO_INCREMENT li 
assignara un id_usuari diferent */
);

CREATE TABLE video (
id_video BIGINT NOT NULL AUTO_INCREMENT,
titol VARCHAR(40) NOT NULL,
descripcio VARCHAR(350),
grandaria ENUM('gran','petit'),
nom_arxiu VARCHAR(40),
durada TIME,
thumbnail VARCHAR(300) NOT NULL,
timestamp_pujada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_usuari BIGINT NOT NULL,
reproduccions BIGINT,
likes BIGINT,
dislikes BIGINT,
estat ENUM('public', 'privat','ocult'),
PRIMARY KEY (id_video, titol, descripcio, grandaria, nom_arxiu, durada, thumbnail, reproduccions, likes, dislikes),
/*PRIMARY KEY (id_video),*/
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari)
);

CREATE TABLE etiqueta (
id_etiqueta BIGINT NOT NULL AUTO_INCREMENT,
nom VARCHAR(20) NOT NULL UNIQUE,
PRIMARY KEY (id_etiqueta)
);

CREATE TABLE video_te_etiqueta (
id_video BIGINT NOT NULL,
id_etiqueta BIGINT NOT NULL,
FOREIGN KEY (id_video) REFERENCES video(id_video),
FOREIGN KEY (id_etiqueta) REFERENCES etiqueta(id_etiqueta),
PRIMARY KEY (id_video, id_etiqueta) /*Aixo impedeix que hi hagi un parell de ids repetits*/
);

CREATE TABLE canal (
id_propietari BIGINT NOT NULL UNIQUE,
nom VARCHAR(40) UNIQUE,
descripcio VARCHAR(500),
data_creacio DATETIME DEFAULT CURRENT_TIMESTAMP, 
/*NO he conseguit que es guardi només la data en DEFAULT:
data_creacio DATE DEFAULT CURRENT_DATE,
data_creacio DATE DEFAULT CURDATE(),
no funcionen, tot i que 
SELECT CURDATE();
SELECT CURRENT_DATE; 
funcionen*/
FOREIGN KEY (id_propietari) REFERENCES usuari(id_usuari),
PRIMARY KEY(nom, descripcio, data_creacio)
);

CREATE TABLE usuari_sub_canal (
id_usuari BIGINT NOT NULL,
id_canal BIGINT NOT NULL,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_canal) REFERENCES canal(id_propietari),
PRIMARY KEY (id_usuari, id_canal)
);

CREATE TABLE usuari_like_video (
id_usuari BIGINT NOT NULL,
id_video BIGINT NOT NULL,
like_o_dislike BOOLEAN NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_video) REFERENCES video(id_video),
PRIMARY KEY (id_usuari, id_video)
);

CREATE TABLE playlist (
id_usuari BIGINT NOT NULL,
id_playlist BIGINT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
estat BOOLEAN,
data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id_playlist, nom, estat, data_creacio),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari)
);

CREATE TABLE playlist_conte_video (
id_playlist BIGINT NOT NULL,
id_video BIGINT NOT NULL,
PRIMARY KEY (id_playlist, id_video),
FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
FOREIGN KEY (id_video) REFERENCES video(id_video) /*Cal posar les foreign keys? */
);

CREATE TABLE comentari (
id_video BIGINT NOT NULL,
id_usuari BIGINT NOT NULL,
comentari VARCHAR(500) NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_video) REFERENCES video(id_video),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (comentari, data_hora)
);

CREATE TABLE usuari_like_comentari (
id_usuari BIGINT NOT NULL,
comentari VARCHAR(500) NOT NULL,
data_hora_comentari TIMESTAMP NOT NULL,
like_o_dislike BOOLEAN NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (comentari, data_hora_comentari) REFERENCES comentari(comentari, data_hora),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (id_usuari, comentari, data_hora_comentari)
);

/*
De cada usuari/ària guardem un identificador únic:
Email.
Password
...
Això vol dir que haig de fer la PRIMARY KEY amb tantes columnes com camps et diu l'enunciat?
Si és així com referencio després el usuari des d'una altra taula, afegint totes les columnes
de la primary i fent-les foreign d'aquella primary?

UPDATE: es pot referenciar des d'una altra taula amb només una de les columnes de la PRIMARY, però
afegir el id a les columnes de la primary no va contra el proposit de fer que nomes hi hagi una 
combinacio unica de valors en aquelles columnes?
*/
