import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/Screens/after_login/after_login1.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/services/auth.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _SignInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO FARMX",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            new Image.asset("assets/images/farmx.jpg",
                width: 250.0, height: 250.0, fit: BoxFit.cover),
            /*Image(
              image: AssetImage("assets/images/farmx.jpg"),
              height: 200,
              width: 200,
            ),*/
            /*SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),*/
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "GO ANONYMOUS",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                _SignInAnonymously();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Page1();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
