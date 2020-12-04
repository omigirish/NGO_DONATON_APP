import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mydonationapp/addnew.dart';
// import 'package:mydonationapp/screens/profile.dart';
import 'package:mydonationapp/items_page.dart';
import 'package:mydonationapp/itemspage2.dart';
import 'package:mydonationapp/notificationspage.dart';
import 'package:mydonationapp/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  List<Widget> _children = [
    Addnew(),
    Notifications(),
    Itemspage2(),
    Items(),
    User(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        elevation: 0,
        iconSize: 32,
        items: [
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.plus_square),
            label: "Heart",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.bell_o),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.search),
            label: "Signal",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.signal),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}
