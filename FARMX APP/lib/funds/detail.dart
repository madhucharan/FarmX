//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/funds/view.dart';
import 'package:flutter_auth/workwith/work.dart';

class Details extends StatelessWidget {
  //final Namefarmer name;

  String n, l;
  Details(names, location) {
    n = names;
    l = location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.purpleAccent[300],
      appBar: buildAppBar(context),
      body: Body(n, l),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[400],
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
