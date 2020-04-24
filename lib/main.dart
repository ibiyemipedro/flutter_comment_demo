import 'package:flutter/material.dart';
import 'package:schoolable_demo/res/colors.dart';
import 'package:schoolable_demo/ui/demo.dart';

void main() {
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application. This is a test text
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: themeColor,
        fontFamily: 'Montserrat',
      ),
      home: Demo(),
    );
  }
}

