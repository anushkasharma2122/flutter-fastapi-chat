import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chatScreen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:  TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Enter your Name...',
                ), // Use onSubmitted callback to handle when the user submits the text
                onSubmitted: _proceedToChat,
              ),
            ), // Placeholder for chat messages
          ),
        ],
      ),
    );
  }
  // Define the _proceedToChat method to handle navigation
  void _proceedToChat(String value){ // Accept a String argument
    final name = _messageController.text;
    if(name.isNotEmpty){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen(username: name)),
      );
    }
    else{
      print('Enter Your Name To proceedd');
    }

  }
}