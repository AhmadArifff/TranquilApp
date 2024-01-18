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
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/dashboard', // Assuming '/dashboard' is the route for DashboardScreen
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/consultation', // Assuming '/consultation' is the route for ConsultationScreen
            (route) => false,
          );
        } else if (index == 2) {
          // Ganti dengan navigasi ke SidebarScreen jika ada
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/sidebar', // Assuming '/sidebar' is the route for SidebarScreen
            (route) => false,
          );
        }
      },
    );
  }
}
