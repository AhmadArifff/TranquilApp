import 'package:flutter/material.dart';
import 'package:TranquilApp/screens/chat_screen.dart';
import 'package:TranquilApp/screens/chatlist_screen.dart';

class ConsultationScreen extends StatelessWidget {
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
      backgroundColor: const Color(0xFFC6F5EB),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 90.0, 10.0, 10.0), // Sesuaikan nilai padding sesuai kebutuhan
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
                          translation: Offset(0.0, -0.5), // Sesuaikan nilai offset sesuai kebutuhan
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.black, // Ganti warna ikon sesuai kebutuhan
                            size: 20,
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
}
