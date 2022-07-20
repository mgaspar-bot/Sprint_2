USE opticamgm;

INSERT INTO clients (nom) values
('Pepi'),('Carmen'),('Gerard'),('Ramona');
INSERT INTO empleats (nom) values
('Alba'),('Marc'),('Pere');
INSERT INTO marques (nom) values
('Carrera'),('Ray-Ban'),('Aflelú');
INSERT INTO ulleres (id_marca, model) values 
(1,'Perro'),(2,'Sanxe'),(3,'Humberto'),(1,'Jaume I'),(1, 'Che Guevara'),(2, 'Thatcher'),(2, 'Sanxe'),(3, 'Jaume I'),(3, 'Gareth Bale'),(2, 'Sanxe'),(2, 'Humberto');
INSERT INTO empleat_ven_ullera (id_empleat, id_ullera, id_client) values
(1,1,1),(1,2,3),(1,3,1),(1,4,1),(2,5,2),(2,6,4),(2,7,3);
INSERT INTO proveidors (nom, direccio, telefon1, NIF) values
('Furtades', 'h', '3','2'),('Caigudes del camion', 'h','3','5'),('"Perdudes" per guiris','p','5','9');
INSERT INTO prov_ven_marca (id_marca, id_prov) values
(1,1),(2,1),(3,3);
