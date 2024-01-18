import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:TranquilApp/screens/splash_screen.dart';
import 'package:TranquilApp/screens/sidebar_screen.dart';
import 'package:TranquilApp/screens/dashboard_screen.dart';
import 'package:TranquilApp/screens/consultation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/consultation', page: () => ConsultationScreen()),
        GetPage(name: '/sidebar', page: () => SidebarScreen()),
      ],
    );
  }
}
