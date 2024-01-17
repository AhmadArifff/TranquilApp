import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TranquilApp/screens/login_screen.dart';
import 'package:TranquilApp/screens/sidebar_screen.dart';
import 'package:TranquilApp/screens/chat_screen.dart';
import 'package:TranquilApp/screens/chatlist_screen.dart';
import 'package:TranquilApp/screens/consultation_screen.dart';
// import 'package:TranquilApp/screens/test_screen.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      home: LoginScreen(),
      // home: ChatListScreen(),
    );
  }
}
