import 'package:flutter/material.dart';
import 'package:scholarship/src/features/performance/performance.dart';
import 'package:scholarship/src/features/preferences/preferences.dart';
import 'package:scholarship/src/features/ranking/ranking.dart';
import 'package:scholarship/src/features/scholars/scholars.dart';

class Manage extends StatefulWidget {
  const Manage({Key? key}) : super(key: key);

  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Performance(),
    Ranking(),
    Scholars(),
    Preferences(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Theme.of(context).accentColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined),
              label: 'Performance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Scholars',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Preferences',
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
