import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class LatestPostDetails extends StatefulWidget {
  final DocumentSnapshot snapshot;
  LatestPostDetails(this.snapshot);
  @override
  _LatestPostDetailsState createState() => _LatestPostDetailsState();
}

class _LatestPostDetailsState extends State<LatestPostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest News"),
        backgroundColor: Color(0XFF222240),
      ),
      backgroundColor: Color(0XFF222240),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            color: Color(0XFF272B4A),
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        child: Text(
                          widget.snapshot.data["title"][0],
                          style: TextStyle(
                            fontSize: 21.0,
                          ),
                        ),
                        backgroundColor: Colors.deepOrange,
                      ),

                      Container(

                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Text(
                          widget.snapshot.data["title"],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),

                Text(widget.snapshot.data["content"],
                style: TextStyle(fontSize: 15.0,
                color: Colors.white),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
