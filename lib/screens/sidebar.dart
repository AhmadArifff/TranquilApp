import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranquilapp/screens/dashboard_screen.dart'; 
import 'package:tranquilapp/screens/profile_screen.dart'; 
import 'package:tranquilapp/screens/login_screen.dart';
import 'package:tranquilapp/screens/solusi_to-do-list.dart';

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
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              sidebarProvider.selectItem(0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
            selected: sidebarProvider.selectedIndex == 0,
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              sidebarProvider.selectItem(1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            selected: sidebarProvider.selectedIndex == 1,
          ),
          ListTile(
            title: Text('To-Do List'),
            onTap: () {
              sidebarProvider.selectItem(2);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TodoListScreen()),
              );
            },
            selected: sidebarProvider.selectedIndex == 2,
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            selected: sidebarProvider.selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}
