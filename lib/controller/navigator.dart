import 'package:flutter/material.dart';

class NavigatorController {
  late BuildContext context;

  NavigatorController(this.context);

  void navigatorAdd(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => page)),
    );
  }
}
