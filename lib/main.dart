import 'package:crypto_app_pi/page/aboutMe.dart';
import 'package:crypto_app_pi/page/constants.dart';
import 'package:crypto_app_pi/page/introduction_screen.dart';
import 'package:crypto_app_pi/page/news_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:crypto_app_pi/page/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          iconTheme: const IconThemeData(color: Colors.white),
          fontFamily: 'poppins',
          textTheme: const TextTheme(
              titleLarge:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
              bodyMedium: TextStyle(color: Colors.black),
              bodySmall: TextStyle(color: Colors.black, fontSize: 14))),
      debugShowCheckedModeBanner: false,
      home: introduction(),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int currentIndex = 0;
  List pages = [
    HomeScreen(),
    newsPage(),
  ];
  void onTap(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: GNav(
        backgroundColor: kbackgroundColor,
        color: Colors.black,
        activeColor: Colors.black,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.currency_bitcoin,
            text: 'Coin',
          ),
          GButton(
            icon: Icons.newspaper,
            text: 'News',
          ),
        ],
        selectedIndex: currentIndex,
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
