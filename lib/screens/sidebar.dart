import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TranquilApp/screens/dashboard_screen.dart'; 
import 'package:TranquilApp/screens/profile_screen.dart'; 
import 'package:TranquilApp/screens/login_screen.dart';
import 'package:TranquilApp/screens/solusi_to-do-list.dart';
import 'package:TranquilApp/screens/keluhan_mental_screen.dart';

class SidebarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sidebarProvider = Provider.of<SidebarProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'),
                ),
                SizedBox(height: 10.0),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          for (int index = 0; index < 5; index++)
            ListTile(
              title: Text(getSidebarItemTitle(index)),
              onTap: () {
                sidebarProvider.selectItem(index);
                Navigator.pushReplacement(context, getRouteForIndex(index));
              },
              selected: sidebarProvider.selectedIndex == index,
            ),
        ],
      ),
    );
  }

  String getSidebarItemTitle(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Profile';
      case 2:
        return 'To-Do List';
      case 3:
        return 'Keluhan Mental';
      case 4:
        return 'Logout';
      default:
        return '';
    }
  }

  MaterialPageRoute getRouteForIndex(int index) {
    switch (index) {
      case 0:
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      case 1:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case 2:
        return MaterialPageRoute(builder: (context) => TodoListScreen());
      case 3:
        return MaterialPageRoute(builder: (context) => KeluhanMentalScreen());
      case 4:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) => DashboardScreen());
    }
  }
}

