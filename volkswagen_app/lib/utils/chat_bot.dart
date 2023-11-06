import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  initvar() async {
    ChatMessage botMessage = new ChatMessage(
      messageContent: 'Hello!',
      isUserMessage: false,
      messageTime: DateTime.now().toIso8601String(),
    );
    ChatMessage botMessage1 = new ChatMessage(
      messageContent: 'I’m Voldie, what can i help you with?',
      isUserMessage: false,
      messageTime: DateTime.now().toIso8601String(),
    );
    setState(() {
      _messages.add(botMessage);
      _messages.add(botMessage1);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initvar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Voldie')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index].isUserMessage
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.centerRight,
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          _messages[index].messageContent,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          _messages[index].messageContent,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      messageContent: text,
      isUserMessage: true,
      messageTime: DateTime.now().toIso8601String(),
    );
    setState(() {
      _messages.insert(0, message);
    });
    try {
      var res = await http.post(
          Uri.parse('https://edumate-production-cdd9.up.railway.app/ask'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"text": text}));
      print(res.body);
      ChatMessage botMessage1 = new ChatMessage(
        messageContent: jsonDecode(res.body)['response'],
        isUserMessage: false,
        messageTime: DateTime.now().toIso8601String(),
      );
      setState(() {
        _messages.insert(0, botMessage1);
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      _messages.add(message);
    });
    // You would typically use a function like this to send the message to the chatbot
    // and receive a response
    // For now, we'll just add a dummy bot response for demonstration purposes
  }
}
