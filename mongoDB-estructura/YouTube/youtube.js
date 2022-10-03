db.dropDatabase();

db.user.insertOne(
    {
        "email":"merli@camelot.com",
        "password":"123456",
        "username":"merlinet27",
        "birthdate": new Date(0),
        "sex": "M",
        "country":"camelot",
        "cp":"10101",
        "channels": [
            {
                "_id":new ObjectId("000000000000"),
                "name":"el savi del regne",
                "description":"parlem de magia i aconsellar reis",
                "creation_date":new Date(Date.now()- 360000),
                "videos": [
                    {
                        "_id":new ObjectId(),
                        "title": "arrenquem Excalibur de la pedra... lo que pasó después te sorprenderá",
                        "description":"like & subscribe",
                        "size":"6",
                        "filename":"exca.mp4",
                        "length":"36:09",
                        "views":"5000",
                        "thumbnail":"youtube.com/img2.jpg",
                        "likes":[
                            {
                                "id_user":new ObjectId("000000000123"),
                                "datetime":new Date(Date.now())
                            },
                            {
                                "id_user":new ObjectId("123456789013"),
                                "datetime":new Date(Date.now()-36000)
                            }
                        ],
                        "dislikes":[
                            {
                                "id_user":new ObjectId("123456789014"),
                                "datetime":new Date(Date.now()-5000)
                            },
                            {
                                "id_user":new ObjectId("123456789015"),
                                "datetime":new Date(Date.now()-4000)
                            }
                        ],
                        "state":"public",
                        "upload_date": new Date(5000),
                        "tags": [
                            {
                                "id_tag": new ObjectId("000000000011"),
                                "name":"swords"
                            }
                        ],
                        "comments":[
                            {
                                "id_user": new ObjectId("123456789016"),
                                "comment_text":"who watching this right now",
                                "datetime": new Date(Date.now()-900),
                                "likes":[
                                    {
                                        "id_user":new ObjectId("123456789017"),
                                        "datetime":new Date(Date.now())
                                    },
                                    {
                                        "id_user":new ObjectId("123456789018"),
                                        "datetime":new Date(Date.now()-36000)
                                    }
                                ],
                                "dislikes":[
                                    {
                                        "id_user":new ObjectId("123456789019"),
                                        "datetime":new Date(Date.now()-5000)
                                    },
                                    {
                                        "id_user":new ObjectId("123456789020"),
                                        "datetime":new Date(Date.now()-4000)
                                    }
                                ],
                            }
                        ]
                    }
                ]
            },
            {
                "id_channel":new ObjectId("000000000002"),
                "name":"unboxingMagic",
                "description":"canal de unboxings de escombres voladores",
                "creation_date":new Date(Date.now()),
                "videos": [
                    {
                        "_id":new ObjectId(),
                        "title": "unboxing Nimbus 2000",
                        "description":"qui me l'haurà regalat?...",
                        "size":"4",
                        "filename":"nimbus2000.mp4",
                        "length":"11:34",
                        "views":"0",
                        "thumbnail":"youtube.com/img1.jpg",
                        "likes":[
                            {
                                "id_user":new ObjectId(),
                                "datetime":new Date(Date.now())
                            },
                            {
                                "id_user":new ObjectId("123456789021"),
                                "datetime":new Date(Date.now()-36000)
                            }
                        ],
                        "dislikes":[
                            {
                                "id_user":new ObjectId(),
                                "datetime":new Date(Date.now()-5000)
                            },
                            {
                                "id_user":new ObjectId(),
                                "datetime":new Date(Date.now()-4000)
                            }
                        ],
                        "state":"hidden",
                        "upload_date": new Date(4000),
                        "tags": [
                            {
                                "_id": new ObjectId(),
                                "name":"unboxings"
                            },
                            {
                                "_id": new ObjectId(),
                                "name":"magic"
                            }
                        ]
                    }
                ]
            }
        ],
        "subscriptions": [
            new ObjectId(),
            new ObjectId()
        ],
        "playlists":[
            {
                "name": "lofi hiphop",
                "videos":[
                    new ObjectId()
                ]
            }
        ]

    }
);
db.user.findOne({"channels.videos.tags.name":"magic"},{"channels.videos.tags.id_tag":1});
db.user.insertOne(
    {
        "_id":ObjectId("000000000123"),
        "email":"merliFan@camelot.com",
        "password":"123456",
        "username":"merliMOLA34",
        "birthdate": new Date(5),
        "sex": "M",
        "country":"camelot",
        "cp":"10101",
        "channels": [
            {
                "_id":new ObjectId(),
                "name":"merli reactions",
                "description":"reaccionem al fet que merli parli de magia i aconsellar reis",
                "creation_date":new Date(Date.now()),
                "videos": [
                    {
                        "_id":new ObjectId(),
                        "title": "arrenquen Excalibur de la pedra... i ens sorprenem junts tu i jo amic viewer",
                        "description":"like & subscribe",
                        "size":"6",
                        "filename":"wow.mp4",
                        "length":"38:15",
                        "views":"5005",
                        "thumbnail":"youtube.com/img5.jpg",
                        "likes":[
                            {
                                "id_user":new ObjectId("123456789012"),
                                "datetime":new Date(Date.now())
                            },
                            {
                                "id_user":new ObjectId("123456789013"),
                                "datetime":new Date(Date.now()-36000)
                            }
                        ],
                        "dislikes":[
                            {
                                "id_user":new ObjectId("123456789014"),
                                "datetime":new Date(Date.now()-5000)
                            },
                            {
                                "id_user":new ObjectId("123456789015"),
                                "datetime":new Date(Date.now()-4000)
                            }
                        ],
                        "state":"public",
                        "upload_date": new Date(5000),
                        "tags": [
                            {
                                "_id": new ObjectId("000000000011"),
                                "name":"swords"
                            },
                            {
                                "_id":new ObjectId(),
                                "name":"reactions"
                            }
                        ],
                        "comments":[
                            {
                                "id_user": new ObjectId("123456789016"),
                                "comment_text":"",
                                "datetime": new Date(Date.now()-900),
                                "likes":[
                                    {
                                        "id_user":new ObjectId("123456789017"),
                                        "datetime":new Date(Date.now())
                                    },
                                    {
                                        "id_user":new ObjectId("123456789018"),
                                        "datetime":new Date(Date.now()-36000)
                                    }
                                ]
                            }//comment
                        ]//arraycomments
                    }//video
                ]//arrayVideos
            }//channel
        ],
        "subscriptions": [
            new ObjectId("000000000000"),
            new ObjectId("000000000002")
        ],
        "playlists":[
            {
                "name": "tutorials",
                "videos":[
                    new ObjectId()
                ]
            }
        ]

    }
);