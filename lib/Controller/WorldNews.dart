import 'package:flutter/material.dart';
import 'package:news_app/Views/WorldNews/WorldALLNews.dart' as allnews;
import 'package:news_app/Views/WorldNews/WorldNews_gallery.dart' as gallery;

class WorldNews extends StatefulWidget {
  @override
  _WorldNewsState createState() => _WorldNewsState();
}

class _WorldNewsState extends State<WorldNews>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
          title: new Text("World News"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,

            tabs: <Widget>[

              new Tab(icon: Icon(Icons.next_week),text: "International News",),
              new Tab(icon: Icon(Icons.image),text: "Gallery",)

            ],
          )
      ),

      body: new TabBarView(
        controller: tabController,
        children: <Widget>[

          new allnews.WorldNews(),
          new gallery.In_Gallery()
        ],
      ),

    );
  }
}
