

import 'package:flutter/material.dart';
import 'package:canine_care/screens/login.dart';
import 'package:canine_care/screens/register.dart';
import 'package:canine_care/screens/drawer_screen.dart';
import 'package:canine_care/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyLogin(),
      theme: ThemeData(fontFamily: 'Circular'),
      debugShowCheckedModeBanner: false,
      routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        'home_screen':(context)=>HomeScreen(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
            //LoginPage(),

          ],

        ),
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