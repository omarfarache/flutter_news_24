import 'package:flutter/material.dart';
import 'package:news_app/Views/LocalNews/LocalALLNews.dart' as localallnews;
import 'package:news_app/Views/LocalNews/LocalNews_gallery.dart'
    as localgallery;

class LocalAllNews extends StatefulWidget {
  @override
  _LocalAllNewsState createState() => _LocalAllNewsState();
}

class _LocalAllNewsState extends State<LocalAllNews>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local News"),
        backgroundColor: Color(0xff222240),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          indicatorWeight: 5.0,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_headline),
              text: " Local News",
            ),
            Tab(
              icon: Icon(Icons.image),
              text: " Gallery",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          localallnews.LocalAllNews(),
          localgallery.LocalNewsGallery(),
        ],
      ),
    );
  }
}
