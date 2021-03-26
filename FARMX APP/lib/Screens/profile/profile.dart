//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/landingpage.dart';
import 'package:flutter_auth/services/auth.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  //final VoidCallback onSignOut;

  Future<void> _SignOut() async {
    try {
      await auth.signOut();
      //onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          FlatButton(
              onPressed: () {
                _SignOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LandingPage(
                        auth: Auth(),
                      );
                    },
                  ),
                );
              },
              child: Text(
                'LogOut',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
