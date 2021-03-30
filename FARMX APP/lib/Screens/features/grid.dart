import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/crop_prediciton/prediction.dart';
import 'package:flutter_auth/Screens/crop_recommendation/recommendation.dart';
import 'package:flutter_auth/Screens/fertiliser/fertiliser.dart';

import 'package:flutter_auth/Screens/leafdisease/leaf1.dart';

import 'package:flutter_auth/Screens/shop/shop.dart';
import 'package:flutter_auth/cost_predict/cost.dart';
import 'package:flutter_auth/funds/funds.dart';
import 'package:flutter_auth/workwith/work.dart';

class Gridviewfeature extends StatefulWidget {
  @override
  _GridviewState createState() => _GridviewState();
}

class _GridviewState extends State<Gridviewfeature> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.shopping_bag_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ShopHomeScreen();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.orangeAccent[200],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Shop',
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.orangeAccent[200]),
                  ),
                ],
              ),
            ),
          ), //container1
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.cloud_circle_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return recommendation();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.lightBlueAccent,
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Crop Recommendation',
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ), //container2
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.grass_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return prediction();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.lightGreenAccent[400],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'General Crop Information',
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.lightGreenAccent),
                  ),
                ],
              ),
            ),
          ), //container3
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.search_off_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Leafdisease1();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.green[600],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Leaf Disease',
                    style: TextStyle(fontSize: 20.0, color: Colors.green[600]),
                  ),
                ],
              ),
            ),
          ), //container4
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.work),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return workwith();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.purple[400],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Work With',
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.purpleAccent[400]),
                  ),
                ],
              ),
            ),
          ), //container5
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.preview_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return costprediction();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.pinkAccent[400],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Cost Predict',
                    style: TextStyle(
                        fontSize: 20.0, color: Colors.pinkAccent[400]),
                  ),
                ],
              ),
            ),
          ), //container6
          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.money_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return invest();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.grey[600],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Funds',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),

          new Container(
            child: new Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              shadowColor: Colors.blueGrey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.filter_alt),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return fertiliser_predict();
                          },
                        ),
                      );
                    },
                    iconSize: 50.0,
                    color: Colors.green[600],
                    alignment: Alignment.center,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    'Fertilizer',
                    style: TextStyle(fontSize: 20.0, color: Colors.green[600]),
                  ),
                ],
              ),
            ),
          ),
          //container8
        ],
      ),
    );
  }
}
