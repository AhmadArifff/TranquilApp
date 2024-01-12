import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranquilapp/screens/login_screen.dart';
import 'package:tranquilapp/screens/sidebar.dart';
// import 'package:tranquilapp/screens/test_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SidebarProvider()),
        // Add more providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: LoginScreen(),
      // home: DashboardScreen(),
    );
  }
}
