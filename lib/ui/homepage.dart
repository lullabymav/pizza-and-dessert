import 'package:final_project_tpm_pizza/ui/logout_page.dart';
import 'package:final_project_tpm_pizza/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box? box1;
  int _selectedIndex = 0;

  @override
  void initState(){
    super.initState();
    openBox();
  }

  void openBox()async{
    box1 = await Hive.openBox('logindata');
    setState(() {

    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    Menu(),
    Profile(),
    LogoutPage()
    // Message(),
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
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.message),
              //     label: 'Message'
              // ),
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

