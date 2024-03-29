db.dropDatabase();

db.producte.insertOne(
    {
        "_id":0,
        "tipus":"hamburguesa",
        "nom":"hamburguesa completa",
        "descripcio":"no li falta res",
        "img_url":".com/img/completa.png",
        "preu":"5,5"
    }
); //en insertar un Objecte queden definides les propietats
//de la coleccio i no es poden afegir altres??

db.producte.insertOne(
    {
        "_id":1,
        "tipus":"pizza",
        "categoria_pizza":{
            "id_categoria":"0",
            "nom":"vegetariana"
        },
        "nom":"Reina Hortalissa",
        "descripcio":"nomes disponible al octubre, quan floreix la pizza",
        "img_url":".com/img/hortalissa.png",
        "preu":"8"
    }
);

db.botiga.insertOne(
    {
        "_id":0,
        "adreca":"pl eivissa, 4",
        "cp":"08032",
        "localitat":"barcelona",
        "provincia":"barcelona",
        "empleats":[
            {
                "id_empleat":"0",
                "nom":"Pere",
                "cognoms":"Llimoner i Pera",
                "NIF":"12345678C",
                "telf":"935678932",
                "posicio":"repartidor"
            }
        ]    
    }
);
db.client.insertOne(
    {
        "nom":"Carla",
        "cognoms":"Camp i Platja",
        "adreca":"C Major, 47",
        "cp": "08290",
        "localitat": "Cerdanyola",
        "provincia":"Barcelona",
        "telf":"659874213",
        "botiga_assignada": {
            $ref:"botiga",
            $id:0
        },
        "comandes": [
            {
                "id_comanda":"0",
                "datetime_demana":new Date(Date.now()),
                "domi":"1",
                "productes": [
                    0,
                    1
                ],
                "quantitats_tipus": {
                    "pizza": 1,
                    "hamburguesa": 0,
                    "beguda": 1
                },
                "preu_total": "25",
                "repartida":{
                    "id_empleat":"1",
                    "datetime_entrega":Date(Date.now()+1500)
                }
            },{
                "id_comanda":"1",
                "datetime_demana": new Date(154875632547),
                "quantitats_tipus": {
                    "pizza": 1,
                    "hamburguesa": 2,
                    "beguda": 3
                },
                "preu_total": "25"
            }
        ]
    }
);