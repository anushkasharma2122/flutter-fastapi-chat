import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatScreen extends StatefulWidget {
  final String username;
  const ChatScreen({required this.username, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late WebSocketChannel channel;
  final _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  @override
  void initState() {
    super.initState();
    channel = WebSocketChannel.connect(
      Uri.parse("ws://192.168.31.176:8080/ws"),
    );
    //listening to changes in the connection
    channel.stream.listen((data) {
      final parts = data.split(":");
      if (parts.length >= 2) {
        final sender = parts[0].trim();
        final msg = parts.sublist(1).join(":").trim();

        final now = DateTime.now();
        final formattedTime =
            "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

        setState(() {
          _messages.add({
            'sender': sender,
            'message': msg,
            'time': formattedTime, // 👈 add time
          });
        });
        print("Message from socket: " + _messages.toString());
      }
    });
  }

  void _sendMessage() {
    final message = _controller.text;
    if (message.isNotEmpty) {
      final fullMessage = "${widget.username}: $message";
      print("Message: " + fullMessage);
      channel.sink.add(fullMessage);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    channel.sink.close(status.normalClosure);
    _controller.dispose();
  }

  Widget _buildMessage(String sender, String msg,String time) {
    final isMe = sender == widget.username;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.start: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[200] : Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  if (!isMe)
                    Text(
                      sender,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  Text(msg, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 11, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat as " + widget.username)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var meesage = _messages[index];
                return _buildMessage(
                    meesage['sender']!,
                    meesage['message']!,
                  meesage['time']!,
                );
              },
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter Message...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onSubmitted: (_) => _sendMessage(),
          ),
        ],
      ),
    );
  }
}
