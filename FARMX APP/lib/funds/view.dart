import 'package:flutter/material.dart';
//import 'package:flutter_auth/workwith/work.dart';

import '../constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast() {
  Fluttertoast.showToast(
      msg: 'Proceeded for payment!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white);
}

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body(n, l);
  String n, l;
  Body(names, location) {
    n = names;
    l = location;
  }
}

class _Body extends State<Body> {
  String n, l;
  _Body(names, location) {
    n = names;
    l = location;
  }

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.green,
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/appicon.png'),
                        ),
                      ),
                      SizedBox(height: kDefaultPaddin / 2),
                      Text('Name : $n'),
                      SizedBox(height: kDefaultPaddin / 2),
                      Text('Location : $l'),
                      SizedBox(height: kDefaultPaddin / 2),
                      Text(
                          """About : This farmer named $n living in a location $l is nearby your place . He grows paddy ..etc and if you want to help him and fund him,click the button below and work with him. """),
                      SizedBox(height: kDefaultPaddin / 2),
                      FlatButton(
                          color: Colors.blue[300],
                          onPressed: () async {
                            showToast();
                          },
                          child: new Text(
                            'Fund now',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
