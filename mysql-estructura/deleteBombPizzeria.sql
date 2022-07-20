USE pizzeriamgm;

DELETE FROM repartidor_porta_comanda WHERE true;
DELETE FROM empleat WHERE true;
DELETE FROM botiga_gestiona_comanda WHERE true;
DELETE FROM botiga WHERE true;
DELETE FROM llista_compra WHERE true;
DELETE FROM comanda WHERE true;
DELETE FROM producte WHERE true;
DELETE FROM categoria_pizza WHERE true;
DELETE FROM cliente WHERE true;
DELETE FROM localitat WHERE true;
DELETE FROM provincia WHERE true;

/*El ordre dels DELETES es important, sino dona un fallo de que keys depenen d'altres keys i noseque
per solucionar-ho he posat els deletes en el ordre invers de com estan al script de creació

Molt bonic pero els ids no es reinicien quan borres tot, aixi que el script de carrega deixa de funcionar xD
Mes facil tornar a correr el script de creacio que ja ho borra tot al principi*/








