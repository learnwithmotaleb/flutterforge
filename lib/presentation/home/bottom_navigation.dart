import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterforge/presentation/home/home_screen.dart';

import '../account/account_screen.dart';
import '../community/coummunity_screen.dart';
import '../fovorite/favorite_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // Show bars again
    super.dispose();
  }



  final List<Widget> _pages = [
    const HomeScreen(),
    CommunityScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white, // Set background color
        elevation: 12, // Add shadow
        type: BottomNavigationBarType.fixed, // Prevent shifting animation
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blueAccent, // Selected icon and text color
        unselectedItemColor: Colors.grey, // Unselected icon and text color
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
        ),
        selectedIconTheme: IconThemeData(size: 28), // Slightly larger selected icons
        unselectedIconTheme: IconThemeData(size: 24),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),

    );
  }
}
