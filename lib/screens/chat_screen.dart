import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  final String contactName;
  ChatScreen({required this.contactName});
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);// Tambahkan logika untuk kembali
          },
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('lib/assets/Avatar/annetteblack.png'),
              ),
              SizedBox(width: 10),
              Text(
                widget.contactName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: message.isMe ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.text.isNotEmpty)
            Text(
              message.text,
              style: TextStyle(fontSize: 16),
            ),
          if (message.voiceNoteUrl.isNotEmpty)
            InkWell(
              onTap: () {
                // Add logic to play voice note
              },
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey[300],
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.play_arrow),
                    SizedBox(width: 5),
                    Text('Voice Note'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              _handleVoiceNote();
            },
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      Message message = Message(text: text, isMe: true);
      _addMessage(message);
      _textController.clear();
    }
  }

  void _handleVoiceNote() {
    // Add logic to record and send voice note
    // For simplicity, we'll just simulate sending a voice note URL
    String voiceNoteUrl = 'https://example.com/voice_note.mp3';
    Message message = Message(voiceNoteUrl: voiceNoteUrl, isMe: true);
    _addMessage(message);
  }

  void _addMessage(Message message) {
    setState(() {
      _messages.add(message);
    });

    // Simulate reply after a delay
    if (!message.isMe) {
      Future.delayed(Duration(seconds: 1), () {
        Message reply = Message(text: 'Hi, this is a reply!', isMe: false);
        _addMessage(reply);
      });
    }
  }
}

class Message {
  final String text;
  final String voiceNoteUrl;
  final bool isMe;

  Message({this.text = '', this.voiceNoteUrl = '', required this.isMe});
}
