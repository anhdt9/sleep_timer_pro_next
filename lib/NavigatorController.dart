import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorController {
  static void push(BuildContext context, Widget toSreen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => toSreen));
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
