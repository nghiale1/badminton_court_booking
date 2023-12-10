import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:badminton_court_booking/common/common.dart';

class Message {
  final String text;
  final bool isSent;
  final DateTime time;

  Message({required this.text, required this.isSent, required this.time});
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [
    Message(
      text: "Hello!",
      isSent: true,
      time: DateTime.now().subtract(Duration(hours: 1)),
    ),
    Message(
      text: "Hi there!",
      isSent: false,
      time: DateTime.now().subtract(Duration(minutes: 45)),
    ),
    Message(
      text: "How are you?",
      isSent: true,
      time: DateTime.now().subtract(Duration(minutes: 40)),
    ),
    Message(
      text: "I'm good, thanks!",
      isSent: false,
      time: DateTime.now().subtract(Duration(minutes: 35)),
    ),
  ];

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.kPrimaryColor,
        title: Text('Messenger Chat'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isSent = message.isSent;

                  return Row(
                    mainAxisAlignment:
                    isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isSent ? ColorPalette.kPrimaryColor : Colors.grey[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(color: isSent ? Colors.white : Colors.black),
                        ),
                      ),
                      Text(
                        DateFormat.Hm().format(message.time),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(height: 1),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration.collapsed(hintText: 'Type a message'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      final text = _textEditingController.text.trim();
                      if (text.isNotEmpty) {
                        setState(() {
                          messages.add(Message(text: text, isSent: true, time: DateTime.now()));
                          _textEditingController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}