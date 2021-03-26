import 'package:flutter/material.dart';
import 'posts.dart' as grid1;
import 'news.dart' as grid2;

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var article_sharp = Icons.article_sharp;
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Daily Feed!'),
          backgroundColor: Colors.grey[600],
          bottom: new TabBar(
            controller: controller,
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.post_add_rounded),
                text: "Posts",
              ),
              new Tab(
                icon: new Icon(article_sharp),
                text: "News",
              ),
            ],
          ),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new grid1.gridone(),
            new grid2.gridtwo(),
          ],
        ));
  }
}
