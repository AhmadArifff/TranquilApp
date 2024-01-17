import 'package:flutter/material.dart';
import 'package:TranquilApp/screens/sidebar_screen.dart';
import 'package:TranquilApp/screens/dashboard_screen.dart';
import 'package:TranquilApp/screens/consultation_screen.dart';

class MenuBottomNavigator extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  MenuBottomNavigator({
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: 'Consultation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        onTabTapped(index);
        if (index == 0) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        } else if (index == 1) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConsultationScreen()));
        } else if (index == 2) {
          // Ganti dengan navigasi ke SidebarScreen jika ada
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SidebarScreen()));
        }
      },
    );
  }
}
