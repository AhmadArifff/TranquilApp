import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranquilapp/screens/login_screen.dart';
import './screens/sidebar.dart';

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
    );
  }
}
