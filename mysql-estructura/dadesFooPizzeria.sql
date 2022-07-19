USE pizzeriamgm;

DESCRIBE empleat;
INSERT INTO provincia (nom) values
('Barcelona'),('Lleida'),('Girona'),('Tarragona');
INSERT INTO localitat (id_provincia, nom) values (1, 'Cerdanyola del Vallès'),(1, 'St Joan Despí'), (2, 'Alguaire'), (2, 'Sort'),(3, 'Banyoles'),(3,'Calella'),(4,'Deltebre'),(4,"L'ampolla");
INSERT INTO cliente (nom, cognoms, id_localitat, telefon) values 
('nom1','cognom1', 1, '345768234'),
('nom2','cognom2', 2, '345734'),
('nom3','cognom3', 3, '345764234'),
('nom4','cognom4', 4, '368234'),
('nom5','cognom5', 5, '3457834'),
('nom6','cognom6', 6, '97452'),
('nom7','cognom7', 7, '314573'),
('nom8','cognom8', 1, '3457'),
('nom9','cognom9', 5, '345768234');
INSERT INTO botiga (id_localitat) values (1),(2),(3),(4),(5),(6),(7),(8);
INSERT INTO empleat (id_botiga, nom, cognoms, nif, telefon, funcio) values
(1,'Pepe','Martinez','34578943V','934578324','repartidor'),
(2,'Joan','Martinez','44578943V','934578324','repartidor'),
(3,'Pere','Martinez','54578943V','934578324','repartidor'),
(4,'Carles','Martinez','64578943V','934578324','repartidor'),
(5,'Olga','Martinez','74578943V','934578324','repartidor'),
(6,'Fatima','Martinez','84578943V','934578324','repartidor'),
(7,'Laura','Martinez','94578943V','934578324','repartidor'),
(8,'Victoria','Martinez','14578943V','934578324','repartidor'),
(2,'Albert','Martinez','24578943V','934578324','repartidor'),
(3,'Martí','Martinez','35578943V','934578324','repartidor'),
(1,'Bea','Martinez','36578943V','934578324','repartidor');

INSERT INTO producte 


