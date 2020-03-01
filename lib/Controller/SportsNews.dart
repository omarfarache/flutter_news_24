import 'package:flutter/material.dart';
import 'package:news_app/Views/SportNews/SportALLNews.dart' as allsportnews;
import 'package:news_app/Views/SportNews/SportNews_gallery.dart'
    as gallerysport;

class SportNews extends StatefulWidget {
  @override
  _SportNewsState createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews>
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
        title: Text("Sport News"),
        backgroundColor: Color(0xff222240),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          indicatorWeight: 5.0,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_headline),
              text: " Sport News",
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
          allsportnews.SportNews(),
          gallerysport.SportGalleryNews()
        ],
      ),
    );
  }
}
