

import 'package:canine_care/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:canine_care/screens/login.dart';
import 'package:canine_care/screens/register.dart';
import 'package:canine_care/screens/drawer_screen.dart';
import 'package:canine_care/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   'register': (context) => MyRegister(),
      //   'login': (context) => MyLogin(),
      //   'home_screen':(context)=>HomeScreen(),
      //   'splash':(context)=>SplashScreen(),
      // },
    ),
  );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SplashScreen()
      ),
    );
  }
}

/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),

    },
  ));
}

 */