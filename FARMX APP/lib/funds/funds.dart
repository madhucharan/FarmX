import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/funds/detail.dart';

class invest extends StatefulWidget {
  @override
  _workwithState createState() => _workwithState();
}

class _workwithState extends State<invest> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.purple));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          centerTitle: true,
          title: new Text('Funds'),
          bottom: TabBar(
            controller: controller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.notifications))
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            profilelistview(),
            notifi(),
          ],
        ));
  }
}

class profilelistview extends StatefulWidget {
  @override
  _profilelistviewState createState() => _profilelistviewState();
}

class _profilelistviewState extends State<profilelistview> {
  List names = [
    'Farmer 1',
    'Farmer 2',
    'Farmer 3',
    'Farmer 4',
    'Farmer 5',
    'Farmer 6',
    'Farmer 7',
    'Farmer 8',
    'Farmer 9',
    'Farmer 10'
  ];
  List location = [
    'Mylavaram',
    'Konduru',
    'Kondapalli',
    'Naidupet',
    'Ramavarappadu',
    'Gunadala',
    'Gudavalli',
    'Tadepalli',
    'Rayanapadu',
    'Vemavaram'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[400],
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Card(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    shadowColor: Colors.blueGrey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 55.0,
                                height: 55.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.green,
                                  backgroundImage:
                                      AssetImage('assets/images/appicon.png'),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //String n = names[index];
                                  Text(names[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0)),
                                  SizedBox(width: 5.0),
                                  Text(location[index],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal)),
                                ],
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Details(
                                          names[index], location[index]);
                                    },
                                  ),
                                );
                              },
                              color: Colors.grey[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                'Show',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}

class notifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Center(
              child: Container(
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('Farmer'),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return farmertab();
                                    },
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.green,
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/appicon.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text('Others'),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return otherstab();
                                    },
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.green,
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/appicon.png'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class farmertab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[300],
        title: new Text('Farmer'),
        centerTitle: true,
      ),
      body: Center(child: new Text('Check your recent funds people made')),
    );
  }
}

class otherstab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[300],
        title: new Text('Others'),
        centerTitle: true,
      ),
      body: Center(child: new Text('Check your recent investments on farmers')),
    );
  }
}
