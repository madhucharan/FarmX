import 'package:flutter/material.dart';
import 'grid.dart' as gridone;

class Screen1 extends StatefulWidget {
  @override
  _featurepage createState() => new _featurepage();
}

class _featurepage extends State<Screen1> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text('FarmX'),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new gridone.Gridviewfeature(),
        ], //children
      ),
    ); //scaffold
  }
}
