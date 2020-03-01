import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:news_app/Views/LocalNews/LocalNews_Details.dart';

class EconomicAllNews extends StatefulWidget {
  @override
  _EconomicAllNewsState createState() => _EconomicAllNewsState();
}

class _EconomicAllNewsState extends State<EconomicAllNews> {
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
  Firestore.instance.collection("EconomicAllNews");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.documents;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222240),
      body: ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            return Container(
              height: 170.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF272B4A),
              ),
              margin: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        snapshot[index].data["image"],
                        height: 170.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          snapshot[index].data["title"],
                          maxLines: 1,
                          style: TextStyle(fontSize: 19.0, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          snapshot[index].data["des"],
                          maxLines: 4,
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.deepOrange,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      snapshot[index].data["view"] + "View",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color:
                                          Colors.blueGrey.withOpacity(1.0)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        color: Colors.blueGrey),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LocalNewsDetails(
                                                        snapshot[index])));
                                      },
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
