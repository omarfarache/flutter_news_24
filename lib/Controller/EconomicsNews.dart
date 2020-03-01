import 'package:flutter/material.dart';
import 'package:news_app/Views/EconimcNews/EconomicALLNews.dart'
    as alleconomicnews;
import 'package:news_app/Views/EconimcNews/EconomicNews_gallery.dart'
    as galleryeconomic;

class EconomicsNews extends StatefulWidget {
  @override
  _EconomicsNewsState createState() => _EconomicsNewsState();
}

class _EconomicsNewsState extends State<EconomicsNews>
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
        title: Text("Economic News"),
        backgroundColor: Color(0xff222240),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          indicatorWeight: 5.0,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_headline),
              text: " Economic News",
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
          alleconomicnews.EconomicAllNews(),
          galleryeconomic.EconomicNewsGallery(),
        ],
      ),
    );
  }
}
