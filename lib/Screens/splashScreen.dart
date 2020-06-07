import 'dart:async';

import 'package:fthve2/Screens/loginScreen.dart';
import 'package:fthve2/Screens/register.dart';
import 'package:flutter/material.dart';
import 'package:fthve2/Services/AuthServices.dart';

class splashScreen extends StatefulWidget {
  @override
  static String id = "splashScreen";

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/spashScreen.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => registerScreen()));
  }
}
