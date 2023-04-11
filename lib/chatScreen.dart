import 'package:flutter/material.dart';

class ChatScreen1 extends StatefulWidget {
  const ChatScreen1({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen1> {
  List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          elevation: 10,
          backgroundColor: Color(0xFF0954E8),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(bottom: 5.0,right: 5), // adjust the value as needed
            child: FlexibleSpaceBar(
              title: Text('Person'),
              background: Image.asset(
                'assets/images/Untitled-1 (1).png',
              ),
            ),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (BuildContext context, int index) {
          return _messages[index].startsWith('You: ')
              ? _buildSentMessage(_messages[index])
              : _buildReceivedMessage(_messages[index]);
        },
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () {
                // TODO: Implement photo upload
              },
            ),
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _sendMessage(_textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String message) {
    setState(() {
      _messages.add('You: ' + message);
    });
    _textController.clear();
  }

  Widget _buildSentMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text('A'),
            backgroundColor: Colors.blue,
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
