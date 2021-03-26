import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  pagestate1 createState() => pagestate1();
}

class pagestate1 extends State<Page2> {
  int _currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        //  backgroundColor: Colors.purple[200] ,
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases),
              title: Text('NewsFeed'),
              backgroundColor: Colors.purple[200]),
          BottomNavigationBarItem(
              icon: Icon(Icons.connect_without_contact_rounded),
              title: Text('Features'),
              backgroundColor: Colors.purple[200]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.purple[200]),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    ); //scaffold
  }
}
