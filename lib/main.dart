import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hu_guide/Screens/Main%20Screens/ActivitiesScreen.dart';
import 'package:hu_guide/Screens/Main%20Screens/CampusScreen.dart'; // Corrected import path
import 'package:hu_guide/Screens/Main Screens/MoreScreen.dart';
import 'package:hu_guide/Screens/Main%20Screens/ChatBot.dart';
import 'package:hu_guide/Screens/Main Screens/SettingsScreen.dart';
import 'Screens/Main Screens/HomeScreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HU GUIDE',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CampusScreen(),
    const ActivitiesScreen(),
    const MoreScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int tappedIndex) {
          setState(() {
            index = tappedIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[600],
        unselectedLabelStyle: TextStyle(
          color: Colors.grey[600],
        ), // This has no effect on fixed navbar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.building_2_fill),
            label: "Campus",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bolt_horizontal_circle_fill),
            label: "Activities",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ellipsis),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          ),
        ],
      ),
      body: screens[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(CupertinoIcons.bubble_left, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AiAssistantWebView()),
          );
        },
      ),
    );
  }
}
