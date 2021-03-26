import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/features/features.dart';
import 'package:flutter_auth/Screens/shop/cartpressed.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/constants.dart';

import 'package:flutter_auth/screens/shop/home/components/body.dart';

class ShopHomeScreen extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return cartbuttonpressed();
                },
              ),
            );
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
