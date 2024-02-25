import 'package:castify/constants/constants.dart';
import 'package:castify/ui/home_screen.dart';
import 'package:castify/ui/live_screen.dart';
import 'package:castify/ui/playlist_screen.dart';
import 'package:castify/ui/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: MyColor.greyColor,
        selectedItemColor: MyColor.orangeColor,
        selectedLabelStyle: TextStyle(fontSize: 12, fontFamily: "SM"),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("images/icon_profile.png"), label: "پروفایل"),
          BottomNavigationBarItem(
              icon: Image.asset("images/icon_headphone.png"),
              label: "لیست پخش"),
          BottomNavigationBarItem(
            icon: Image.asset("images/icon_airdrop.png"),
            label: "زنده",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "images/icon_home.png",
              height: 20,
              width: 20,
            ),
            label: "خانه",
            activeIcon: Image.asset("images/icon_active_home.png"),
          ),
        ],
      ),
      body: IndexedStack(
        children: [
          ProfileScreen(),
          PlayListScreen(),
          LiveScreen(),
          HomeScreen(),
        ],
        index: _selectedIndex,
      ),
    );
  }
}
