import 'package:flutter/material.dart';

import 'screen/home/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.green,
      ),
      title: "Sleep Timer Pro Next",
      home: HomeScreen(),
    );
  }
}
