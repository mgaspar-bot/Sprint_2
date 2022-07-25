DROP DATABASE IF EXISTS youtubemgm;
CREATE DATABASE youtubemgm CHARACTER SET utf8mb4;
USE youtubemgm;

/*CAL PROVARLA ABANS D'ENTREGAR!!*/

CREATE TABLE usuari (
id_usuari BIGINT NOT NULL AUTO_INCREMENT,
email VARCHAR(40),
contrasenya VARCHAR(40) NOT NULL,
nom_usuari VARCHAR(40) NOT NULL UNIQUE,
data_naixement DATE NOT NULL,
sexe CHAR(1),
pais ENUM('Països Catalans', 'Altres (xD)'),
codi_postal CHAR(10),
PRIMARY KEY (id_usuari)
);

CREATE TABLE video (
id_video INT NOT NULL AUTO_INCREMENT,
titol VARCHAR(40) NOT NULL,
descripcio TEXT,
grandaria ENUM('gran','petit'),
nom_arxiu VARCHAR(40),
durada TIME,
thumbnail VARCHAR(300) NOT NULL,
timestamp_pujada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_usuari BIGINT NOT NULL,
reproduccions INT,
likes INT,
dislikes INT,
estat ENUM('public', 'privat','ocult'),
PRIMARY KEY (id_video),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari)
);

CREATE TABLE etiqueta (
id_etiqueta INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(20) NOT NULL UNIQUE,
PRIMARY KEY (id_etiqueta)
);

CREATE TABLE video_te_etiqueta (
id_video INT NOT NULL,
id_etiqueta INT NOT NULL,
FOREIGN KEY (id_video) REFERENCES video(id_video),
FOREIGN KEY (id_etiqueta) REFERENCES etiqueta(id_etiqueta),
PRIMARY KEY (id_video, id_etiqueta) /*Aixo impedeix que hi hagi un parell de ids repetit*/
);

CREATE TABLE canal (
id_canal INT NOT NULL AUTO_INCREMENT,
id_usuari BIGINT NOT NULL,
nom VARCHAR(40) UNIQUE,
descripcio TEXT,
data_creacio DATETIME DEFAULT CURRENT_TIMESTAMP, 
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY(id_canal)
);

/*NO he conseguit que es guardi només la data en DEFAULT:
data_creacio DATE DEFAULT CURRENT_DATE,
data_creacio DATE DEFAULT CURDATE(),
no funcionen, tot i que 
SELECT CURDATE();
SELECT CURRENT_DATE; 
funcionen*/

CREATE TABLE usuari_sub_canal (
id_usuari BIGINT NOT NULL,
id_canal INT NOT NULL,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_canal) REFERENCES canal(id_canal),
PRIMARY KEY (id_usuari, id_canal)
);

CREATE TABLE canal_conte_video (
id_canal INT NOT NULL,
id_video INT NOT NULL,
FOREIGN KEY (id_canal) REFERENCES canal(id_canal),
FOREIGN KEY (id_video) REFERENCES video(id_video),
PRIMARY KEY (id_canal, id_video)
);

CREATE TABLE usuari_like_video (
id_usuari BIGINT NOT NULL,
id_video INT NOT NULL,
like_o_dislike BOOLEAN NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
FOREIGN KEY (id_video) REFERENCES video(id_video),
PRIMARY KEY (id_usuari, id_video)
);

CREATE TABLE playlist (
id_usuari BIGINT NOT NULL,
id_playlist INT NOT NULL AUTO_INCREMENT,
nom VARCHAR(50),
estat BOOLEAN,
data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id_playlist),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari)
);

CREATE TABLE playlist_conte_video (
id_playlist INT NOT NULL,
id_video INT NOT NULL,
FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
FOREIGN KEY (id_video) REFERENCES video(id_video),
PRIMARY KEY (id_playlist, id_video)
);

CREATE TABLE comentari (
id_comentari BIGINT NOT NULL AUTO_INCREMENT,
id_video INT NOT NULL,
id_usuari BIGINT NOT NULL,
comentari VARCHAR(10000),
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_video) REFERENCES video(id_video),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (id_comentari)
);

CREATE TABLE usuari_like_comentari (
id_usuari BIGINT NOT NULL,
id_comentari BIGINT NOT NULL,
like_o_dislike BOOLEAN NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_comentari) REFERENCES comentari(id_comentari),
FOREIGN KEY (id_usuari) REFERENCES usuari(id_usuari),
PRIMARY KEY (id_usuari, id_comentari)
);

/*
Pots fer una primary key de varies columnes i referenciar només una de les
columnes amb una foreign key des d'una altra taula
columnes amb una foreign key des d'una altra taula
*/
