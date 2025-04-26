import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}


class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe; // true = User, false = Ali

  ChatBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
            bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}


class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi there!', 'isMe': false},
    {'text': 'Hey Ali, how are you?', 'isMe': true},
    {'text': 'I am good! What about you?', 'isMe': false},
    {'text': 'Doing great, just working on a Flutter project.', 'isMe': true},
    {'text': 'That sounds cool!', 'isMe': false},
    {'text': 'Yeah, learning Flutter is fun!', 'isMe': true},
    {'text': 'Indeed! Let me know if you need any help.', 'isMe': false},
    {'text': 'Sure, thanks Ali!', 'isMe': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Ali'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ChatBubble(
              message: message['text'],
              isMe: message['isMe'],
            );
          },
        ),
      ),
    );
  }
}
