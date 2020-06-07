import 'package:flutter/material.dart';
import 'package:fthve2/Screens/homeScreen.dart';
import 'package:fthve2/Screens/societyScreen.dart';
import 'Screens/splashScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/register.dart';
import 'Screens/mapScreen.dart';

void main() {
  runApp(fthve2());
}

class fthve2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen.id,
      routes: {
        splashScreen.id: (context) => splashScreen(),
        loginScreen.id: (context) => loginScreen(),
        registerScreen.id: (context) => registerScreen(),
        mapScreen.id: (context) => mapScreen(),
        societyScreen.id: (context) => societyScreen(),
        homeScreen.id:(context) => homeScreen(),
      },
    );
  }
}
