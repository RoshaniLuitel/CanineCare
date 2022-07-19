import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int currentIndex = 0;
  final screens = [
    const Center(child: Text('Home',
        style: TextStyle(fontSize: 40))),
    const Center(child: Text('profile',
        style: TextStyle(fontSize: 40))),
    const Center( child:   Text('Feed',
        style: TextStyle(fontSize: 40))
    ),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: const Text('Canine'),
      centerTitle: true,

    ),
    body: screens[currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      iconSize: 30,
      selectedFontSize: 15,
      unselectedFontSize: 10,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.green,),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Colors.green,),

        const BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: 'Feed',
          backgroundColor: Colors.green,
        ),
      ],

    ),
  );
}