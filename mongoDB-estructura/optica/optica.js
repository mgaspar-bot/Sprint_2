db.dropDatabase();

db.proveidors.insertOne(
    {
        "_id":0,
        "nom":"Proveidor 1",
        "adreca":"c del Mig, 123, 2on 1a BCN",
        "telefon":'93567893',
        "NIF": '68957423D',
        "marques": [
            "marca1",
            "marca2"
        ]
    }
);
db.clients.insertOne(
    {
        "_id":0,
        "nom":"Xavi Jubany",
        "adreca": "la de Xavi Jubany",
        "telefon":"el de Xavi Jubany",
        "email": "xavi@gmail.com",
        "ulleres": [
            {
                "marca":"marca1",
                "proveidor": {
                    $ref: "proveidors",
                    $id: 0
                },
                "vidres": {
                    "dret": {
                        "graduacio": "2.6",
                        "color":"transp"
                    },
                    "esquerre": {
                        "graduacio": "2.6",
                        "color": "transp"
                    }
                },
                "muntura": {
                    "tipus":"pasta",
                    "color": "verd"
                },
                "preu": "50",
                "venuda_per": {
                    "nom": "Marc",
                    "num_empleat":"6"
                }
            }
        ]
    }
);
db.clients.insertOne(
    {
        "_id":1,
        "nom":"Júlia Jubany",
        "adreca": "un lloc en concret",
        "telefon": "una string amb 9 digits",
        "email":"algo@algo.algo",
        "recomanador":{
            $ref:"clients",
            $id: 0
        }
    }
);
db.clients.insertOne(
    {
        "nom":"Novia de Júlia Jubany",
        "adreca":"pel Baix Llobregat",
        "telefon":"123456789",
        "email":"ei@quepassa.com",
        "recomanador": {
            $ref: "clients",
            $id: 1
        },
        "ulleres": [
            {
                "marca":"marca2",
                "vidres": {
                    "dret": {
                        "graduacio": "5.3",
                        "color":"transp"
                    },
                    "esquerre": {
                        "graduacio": "1.2",
                        "color": "transp"
                    }
                },
                "muntura": {
                    "tipus":"flotant",
                    "color": "negre"
                },
                "preu": "240",
                "venuda_per": {
                    "nom": "Marc",
                    "num_empleat":"6"
                }
            },
            {
                "marca":"marca2",
                "vidres": {
                    "dret": {
                        "graduacio": "5.3",
                        "color":"transp"
                    },
                    "esquerre": {
                        "graduacio": "1.2",
                        "color": "transp"
                    }
                },
                "muntura": {
                    "tipus":"flotant",
                    "color": "blanc"
                },
                "preu": "240",
                "venuda_per": {
                    "nom": "Alba",
                    "num_empleat":"8"
                }
            }
        ]
    }
);
