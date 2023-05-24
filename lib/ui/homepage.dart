import 'package:final_project_tpm_pizza/ui/logout_page.dart';
import 'package:final_project_tpm_pizza/ui/profile.dart';
import 'package:flutter/material.dart';

import 'menu.dart';
import 'message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Menu(),
    Profile(),
    Message(),
    LogoutPage()
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
          appBar: AppBar(
            title: Text('Pizza & Dessert'),
            backgroundColor: Colors.orange[700],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Profile'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.logout),
                  label: 'Logout'
              ),
            ],
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.orange[700],
              onTap: _onItemTapped
          ),
        )
    );
  }
}

