/*
Pizzeria:
Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
Llista quantes comandes ha efectuat un determinat empleat/da.
*/
USE pizzeriamgm;
SELECT SUM(quantitat_producte) FROM llista_compra l INNER JOIN producte p ON l.id_producte = p.id_producte INNER JOIN comanda c ON l.id_comanda = c.id_comanda INNER JOIN botiga_gestiona_comanda b ON b.id_comanda = l.id_comanda INNER JOIN botiga bot ON b.id_botiga = bot.id_botiga INNER JOIN localitat loc ON bot.id_localitat = loc.id_localitat WHERE p.tipus LIKE 'beguda' AND loc.nom LIKE '%Cerdanyola%';
SELECT * FROM comanda c INNER JOIN repartidor_porta_comanda r ON c.id_comanda = r.id_comanda;
SELECT COUNT(id_comanda), id_repartidor FROM repartidor_porta_comanda GROUP BY id_repartidor;

/*
Òptica:
Llista el total de factures d'un client/a en un període determinat.
Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
*/
USE opticamgm;
SELECT COUNT(e.id_ullera) FROM clients c INNER JOIN empleat_ven_ullera e ON c.id = e.id_client WHERE c.nom LIKE 'Gerard' GROUP BY e.id_client;
SELECT * FROM empleat_ven_ullera;
SELECT u.model, e.nom FROM ulleres u INNER JOIN empleat_ven_ullera evu ON evu.id_ullera = u.id_ullera INNER JOIN empleats e ON evu.id_empleat = e.id;
SELECT p.nom, u.id_ullera, evu.id_factura FROM (proveidors p INNER JOIN prov_ven_marca pvm ON  p.id = pvm.id_prov) INNER JOIN marques m ON pvm.id_marca = m.id INNER JOIN ulleres u ON m.id = u.id_marca INNER JOIN empleat_ven_ullera evu ON u.id_ullera = evu.id_ullera ORDER BY evu.id_factura;
