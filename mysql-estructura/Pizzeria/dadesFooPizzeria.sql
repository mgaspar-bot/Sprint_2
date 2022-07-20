USE pizzeriamgm;

DESCRIBE empleat;
INSERT INTO provincia (nom) values
('Barcelona'),('Lleida'),('Girona'),('Tarragona');
INSERT INTO localitat (id_provincia, nom) values
 (1, 'Cerdanyola del Vallès'),(1, 'St Joan Despí'), (2, 'Alguaire'), (2, 'Sort'),(3, 'Banyoles'),(3,'Calella'),(4,'Deltebre'),(4,"L'ampolla");
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
(1,'Pepe','Martinez','34588943V','934578324','repartidor'),
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

INSERT INTO producte (tipus, nom, preu) values 
('pizza', 'reina', 11.9),
('hamburguesa','completa',4.9),
('hamburguesa','kebab',4.5),
('beguda','ron',1.2);

INSERT INTO comanda (id_cliente, preu_total) values 
(3, 40.90),
(4, 40.80),
(1, 40.09),
(2, 40.76),
(5, 40.65);


INSERT INTO llista_compra (id_comanda, id_producte, quantitat_producte, preu_parcial) values 
(1,4,4,20.2),(1,4,4,30.10),(1,1,1,2.0);
INSERT INTO llista_compra (id_comanda, id_producte, quantitat_producte, preu_parcial) values 
(2,3,4,20),(2,1,3,56.5),(3,2,5,78.6);
INSERT INTO llista_compra (id_comanda, id_producte, quantitat_producte, preu_parcial) values 
(4,2,12,2000.0),(5,3,5,56.5),(5,4,100,78000);

INSERT INTO repartidor_porta_comanda (id_repartidor, id_comanda) values 
(1,1),(1,2),(2,3),(3,4),(5,5);

INSERT INTO botiga_gestiona_comanda (id_comanda, id_botiga) values
(1,1),(2,2),(3,3),(4,4),(5,5)

/*
Pizzeria:
Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
Llista quantes comandes ha efectuat un determinat empleat/da.
*/

