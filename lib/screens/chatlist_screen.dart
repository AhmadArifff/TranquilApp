import 'package:flutter/material.dart';
import 'package:TranquilApp/screens/chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Tambahkan logika untuk kembali
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFC6F5EB),
      body: ListView(
        children: [
          ChatContactCard(
            name: 'Anette Black ',
            image: 'lib/assets/Avatar/annetteblack.png',
            lastMessage: 'Hi, how are you?',
            isOnline: true,
            unreadMessages: 3,
          ),
          ChatContactCard(
            name: 'John Doe ',
            image: 'lib/assets/Avatar/johndoe.png',
            lastMessage: 'Hello!',
            isOnline: false,
            unreadMessages: 5,
          ),
          ChatContactCard(
            name: 'Jane Smith ',
            image: 'lib/assets/Avatar/janesmith.png',
            lastMessage: 'What are you doing?',
            isOnline: true,
            unreadMessages: 10,
          ),
        ],
      ),
    );
  }
}

class ChatContactCard extends StatelessWidget {
  final String name;
  final String image;
  final String lastMessage;
  final bool isOnline;
  final int unreadMessages; // Tambahkan property untuk jumlah pesan yang belum dibalas

  ChatContactCard({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.isOnline,
    this.unreadMessages = 0, // Defaultnya tidak ada pesan yang belum dibalas
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
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$unreadMessages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
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
}


