import 'package:chemicalelements/helpers/color_helper.dart';
import 'package:chemicalelements/view/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: ColorHelper.secondaryColor,
    ),
    debugShowCheckedModeBanner: false,
    home: Home(),
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: child,
      );
    },
  ));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
