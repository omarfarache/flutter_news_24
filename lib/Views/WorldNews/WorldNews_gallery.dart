//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:async';
//
//class WorldNewsGallery extends StatefulWidget {
//  @override
//  _WorldNewsGalleryState createState() => _WorldNewsGalleryState();
//}
//
//class _WorldNewsGalleryState extends State<WorldNewsGallery> {
//  Future getAllimage() async {
//    var firestore = Firestore.instance;
//    QuerySnapshot snap =
//        await firestore.collection("WorldAllNews").getDocuments();
//    return snap.documents;
//  }
//
//  Future<Null> getRefresh() async {
//    await Future.delayed(Duration(seconds: 3));
//
//    setState(() {
//      getAllimage();
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0XFF222240),
//      body: FutureBuilder(
//        future: getAllimage(),
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.waiting) {
//            return Center(
//              child: CircularProgressIndicator(),
//            );
//          } else {
//            return RefreshIndicator(
//              onRefresh: getRefresh,
//              child: ListView.builder(
//                  itemBuilder: (context, index) {
//                    return Container(
//                      margin: EdgeInsets.all(6.0),
//                      height: 300.0,
//                      child: Stack(
//                        children: <Widget>[
//                          ClipRRect(
//                            borderRadius: BorderRadius.circular(20.0),
//                            child: Container(
//                              child: Image.network(
//                                  snapshot.data[index].data["image"],
//                                  height: 300,
//                                  fit: BoxFit.cover),
//                            ),
//                          ),
//                          Positioned(
//                            top: 40.0,
//                            left: 30.0,
//                            child: Container(
//                              height: 50.0,
//                              width: 200.0,
//                              decoration: BoxDecoration(
//                                  color: Colors.blueGrey,
//                                  borderRadius: BorderRadius.only(
//                                    bottomLeft: Radius.circular(20.0),
//                                    topRight: Radius.circular(20.0),
//                                  )),
//                              child: Align(
//                                alignment: Alignment.center,
//                                child: Text(
//                                  "World News",
//                                  style: TextStyle(
//                                      fontSize: 20.0, color: Colors.white),
//                                ),
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    );
//                  },
//                  itemCount: snapshot.data.length),
//            );
//          }
//        },
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class In_Gallery extends StatefulWidget {
  @override
  _In_GalleryState createState() => new _In_GalleryState();
}
class _In_GalleryState extends State<In_Gallery> {

  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection("WorldAllNews");

  @override
  void initState() {
    subscription=collectionReference.snapshots().listen((datasnap){
      setState(() {
        snapshot=datasnap.documents;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF222240),
      body:  ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(10.0),
              child:  Stack(
                children: <Widget>[
                   Container(
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child:  Image.network(snapshot[index].data["image"],
                        height: 300.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                   Positioned(
                    top: 40.0,
                    left: 30.0,
                    child:  Container(
                      height: 50.0,
                      width: 250.0,
                      margin: EdgeInsets.all(10.0),
                      decoration:  BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)
                          )
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child:  Text("World News",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            );
          }
      ),

    );
  }
}

