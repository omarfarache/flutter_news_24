import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'Controller/EconomicsNews.dart';
import 'detailsLatestPost.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:news_app/Controller/WorldNews.dart';
import 'package:news_app/Controller/SportsNews.dart';
import 'package:news_app/Controller/LocalNews.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      Firestore.instance.collection("LatestPost");

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
        appBar: AppBar(
          title: Text("News 24"),
          backgroundColor: Color(0XFF222240),
        ),
        drawer: Drawer(
          child: Container(
            color: Color(0XFF272B4A),
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("News 24" , style: TextStyle(fontSize: 22.0),),
                  accountEmail: null,
                  decoration: BoxDecoration(color: Color(0XFF222240)),
                ),
                ListTile(
                  title: Text(
                    "World News",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WorldNews(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.all_inclusive,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Sports News",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SportNews(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.pool,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Local News",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LocalAllNews(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.loop,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Economics News",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EconomicsNews(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.collections_bookmark,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFF222240),
        body: ListView(children: <Widget>[
          Container(
            height: 190.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Latest News",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  margin: EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10.0),
                        width: 300.0,
                        color: Color(0XFF272B4A),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  snapshot[index].data["image"],
                                  fit: BoxFit.cover,
                                  height: 130.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LatestPostDetails(
                                                        snapshot[index])));
                                      },
                                      child: Text(
                                        snapshot[index].data["title"],
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white ),
                                      )),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    snapshot[index].data["content"],
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
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
                                          snapshot[index].data["view"] + " Views",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color:
                                              Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.length,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Center(
            child: Text(
              "News by Pictures" ,style: TextStyle(fontSize: 20.0 , color: Colors.white ) ,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 180.0,
            child: Container(
              height: 130,
              margin: EdgeInsets.only(top: 8.0),
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                borderRadius: true,
                boxFit: BoxFit.cover,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 6.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  NetworkImage(
                      'https://media3.s-nbcnews.com/j/newscms/2020_09/3249881/'
                          '200229-taliban-peace-agreement-al-0930_64f61928fa26554e7f2b7f5319bce6a1.fit-2000w.jpg' ),
                  NetworkImage(
                      'https://media1.s-nbcnews.com/j/newscms/2020_09/3249911/200229-turkey-migrants-al-1058_f9d1f661ad686c3a0d6f3d1e922fbff4.fit-2000w.jpg'),
                  NetworkImage(
                      "https://media2.s-nbcnews.com/j/newscms/2020_09/3249876/france_polanski_45625-jpg-1c924_ff929217b7f0cc2c8b34fdd43484788f.fit-2000w.JPG"),
                  NetworkImage(
                      "https://media4.s-nbcnews.com/j/newscms/2020_09/3247996/200228-makarov-istanbul-mc-935_776e1dae6ec0f1e965b1b5abc09afbc7.fit-2000w.JPG"),
                  NetworkImage(
                      "https://media4.s-nbcnews.com/j/newscms/2016_32/1667416/160814-jurgen-kloop_e774a"
                          "b1bc093dc9343f935fdf103f498.fit-2000w.jpg"),
                  NetworkImage(
                      "https://media4.s-nbcnews.com/j/newscms/2020_02/3176866/200108-prince-harry-meghan-cs-223p_3f5a3a9288b99635d6db5ebae520ba40.fit-2000w.jpg"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            height: 300.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0XFF272b4a)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WorldNews()));
                              },
                              child: Text(
                                "World News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0XFF272b4a)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SportNews()));
                              },
                              child: Text(
                                "Sports News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0XFF272b4a)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LocalAllNews()));
                              },
                              child: Text(
                                "Local News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0XFF272b4a)),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EconomicsNews()));
                              },
                              child: Text(
                                "Economics News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
