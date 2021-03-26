import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/features/features.dart';
import 'package:flutter_auth/Screens/feed/feed.dart';
import 'package:flutter_auth/Screens/profile/profile.dart';

class Page1 extends StatefulWidget {
  @override
  pagestate3 createState() => new pagestate3();
}

class pagestate3 extends State<Page1> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.purple[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.connect_without_contact),
              title: Text("Features")),
          BottomNavigationBarItem(
              icon: Icon(Icons.article), title: Text("Feed")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile")),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
