import 'package:flutter/material.dart';
import 'package:TranquilApp/screens/chat_screen.dart';
import 'package:TranquilApp/screens/chatlist_screen.dart';
import 'package:intl/intl.dart';
import 'package:TranquilApp/screens/bottom_navigator.dart';
import 'package:TranquilApp/screens/sidebar_screen.dart';
import 'package:TranquilApp/screens/dashboard_screen.dart';

class ConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFC6F5EB),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Consultation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      // drawer: SidebarScreen(),
      backgroundColor: const Color(0xFFC6F5EB),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 90.0, 10.0, 10.0),
            child: Row(
              children: [
                Text(
                  'List',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatListScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ChatContactCard(
            name: 'Anette Black ',
            image: 'lib/assets/Avatar/annetteblack.png',
            lastMessage: 'Online',
            isOnline: true,
            unreadMessages: 3,
          ),
          ChatContactCard(
            name: 'Cameron Williamson ',
            image: 'lib/assets/Avatar/CameronWilliamson.png',
            lastMessage: 'Offline',
            isOnline: false,
            unreadMessages: 5,
          ),
          ChatContactCard(
            name: 'Floyd Miles ',
            image: 'lib/assets/Avatar/FloydMiles.png',
            lastMessage: 'Online',
            isOnline: true,
            unreadMessages: 10,
          ),
          ChatContactCard(
            name: 'Anette Black ',
            image: 'lib/assets/Avatar/JacobJones.png',
            lastMessage: 'Online',
            isOnline: true,
            unreadMessages: 3,
          ),
          ChatContactCard(
            name: 'Cameron Williamson ',
            image: 'lib/assets/Avatar/BessieCooper.png',
            lastMessage: 'Offline',
            isOnline: false,
            unreadMessages: 5,
          ),
          ChatContactCard(
            name: 'Floyd Miles ',
            image: 'lib/assets/Avatar/KristinWatson.png',
            lastMessage: 'Online',
            isOnline: true,
            unreadMessages: 10,
          ),
        ],
      ),
      bottomNavigationBar: MenuBottomNavigator(
        selectedIndex: 1, // Set the default tab to "Consultation"
        onTabTapped: (index) {
          // Handle tab tap if needed
          if (index == 0) {
            // Handle the "Home" tab tap
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          } else if (index == 1) {
            // Handle the "Consultation" tab tap
            // You are already on the ConsultationScreen, no need to navigate again
          } else if (index == 2) {
            // Handle the "Menu" tab tap
            // Ganti dengan navigasi ke SidebarScreen jika ada
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SidebarScreen()));
          }
        },
      ),
    );
  }
}

class ChatContactCard extends StatelessWidget {
  final String name;
  final String image;
  final String lastMessage;
  final bool isOnline;
  final int unreadMessages;

  ChatContactCard({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.isOnline,
    this.unreadMessages = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(image),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(name),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isOnline ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(lastMessage),
            if (unreadMessages > 0)
              Container(
                padding: EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (unreadMessages > 0)
                      Align(
                        alignment: Alignment.center,
                        child: FractionalTranslation(
                          translation: Offset(0.0, -0.5),
                          child: IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () {
                              _showSchedulingPopup(context, name, image);
                            },
                          ),
                        ),
                      )
                    else
                      Container(),
                  ],
                ),
              ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(contactName: name),
            ),
          );
        },
      ),
    );
  }

  DateTime? _selectedDate;

  void _showSchedulingPopup(BuildContext context, String name, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(image),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _selectedDate != null
                                    ? Colors.green
                                    : Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.calendar_today,
                              color: _selectedDate != null
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            SizedBox(width: 4),
                            Text(
                              _selectedDate != null
                                  ? 'Scheduling'
                                  : 'Not Scheduling',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: _selectedDate != null
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text(_selectedDate != null
                        ? 'Date: ${DateFormat('MM/dd/yyyy').format(_selectedDate!)}'
                        : 'Select Date'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      print('Selected date: ${picked.toString()}');
      _selectedDate = picked;
      Navigator.pop(context);
      _showSchedulingPopup(context, name, image);
    }
  }
}
