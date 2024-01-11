import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard.dart'; // Import the LoginScreen file
import 'package:tranquilapp/screens/login_screen.dart';

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
            child: Text('Sidebar'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              sidebarProvider.selectItem(0);
              Navigator.pop(context);
            },
            selected: sidebarProvider.selectedIndex == 0,
          ),
          ListTile(
            title: Text('Menu 2'),
            onTap: () {
              sidebarProvider.selectItem(1);
              Navigator.pop(context);
            },
            selected: sidebarProvider.selectedIndex == 1,
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Navigate to the login screen and close the sidebar
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false, // Close all previous routes
              );
            },
            selected: sidebarProvider.selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}
