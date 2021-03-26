import 'package:flutter/material.dart';

class Buynow extends StatelessWidget {
  //get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Buy Now'),
        centerTitle: true,
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
                  'Here are your items seleted , chick the button to proceed')),
          Center(
              child: FlatButton(
            onPressed: null,
            child: new Text('PROCEED'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            textColor: Colors.black,
            color: Colors.purple[200],
          )),
        ],
      ),
    );
  }
}
