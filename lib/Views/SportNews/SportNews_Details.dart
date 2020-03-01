import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SportNewsDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  SportNewsDetails(this.snapshot);

  @override
  _SportNewsDetailsState createState() => _SportNewsDetailsState();
}

class _SportNewsDetailsState extends State<SportNewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:  Text("Sport Post Details"),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),
      body:  ListView(
        children: <Widget>[
          //start first container..
           Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //end first container..

           Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF272B4A),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //first container...
                 Container(
                  margin: EdgeInsets.all(10.0),
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       CircleAvatar(
                        child:  Text(widget.snapshot.data["title"][0]),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                      ),
                       SizedBox(
                        width: 8.0,
                      ),
                       Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child:  Text(
                            widget.snapshot.data["title"],
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.white),
                          ))
                    ],
                  ),
                ), //end of first container
                //second container
                 Container(
                  margin: EdgeInsets.all(10.0),
                  child:  Text(
                    widget.snapshot.data["view"] + " View",
                    style: TextStyle(fontSize: 21.0, color: Colors.deepOrange),
                  ),
                ), //end of second container..

                 SizedBox(
                  height: 10.0,
                ),

                Flexible(
                  child:  Text(
                    widget.snapshot.data["des"],
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
