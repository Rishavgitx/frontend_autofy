import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ChatScreen1 extends StatefulWidget {
  const ChatScreen1({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen1> {
  List<Message> _messages = [
    Message(
      text: "Hello there",
      sender: "M",
      time: DateTime.now(),
    ),
    Message(
      text: "Hi, how are you?",
      sender: "B",
      time: DateTime.now(),
    ),
    Message(
      text: "I'm good, thanks",
      sender: "M",
      time: DateTime.now(),
    ),
    Message(
      text: "What have you been up to?",
      sender: "M",
      time: DateTime.now(),
    ),
    Message(
      text: "Not much, just working on some projects",
      sender: "B",
      time: DateTime.now(),
    ),
    Message(
      text: "That's cool! What kind of projects?",
      sender: "M",
      time: DateTime.now(),
    ),
  ];

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 10,
        toolbarHeight: 100, // increase the toolbar height

        backgroundColor: Color(0xFF0954E8),
        flexibleSpace: Padding(
          padding: EdgeInsets.only(bottom: 0.0,left: 0), // adjust the value as needed
          child: FlexibleSpaceBar(
            title: Text('Person'),
            background: Image.asset(
              'assets/images/Untitled-1 (1).png',
            ),
          ),
        ),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = _messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    final timeFormat = DateFormat('h:mm a'); // format the time to display only hours, minutes, and am/pm

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
        message.sender == "M" ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (message.sender == "B") // add image for user B
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/Untitled-2.png"),

              ),
            ),
          Container(
            decoration: BoxDecoration(
              color: message.sender == "A"
                  ? Colors.grey[500]
                  : Colors.blue[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.sender,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      timeFormat.format(message.time), // format the time here
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Text(
                  message.text,
                  style: TextStyle(
                    color: message.sender == "A" ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),

          if (message.sender == "A") // add image for user A
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/user_a.png"),
              ),
            ),
        ],
      ),
    );
  }


  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) {
      return;
    }
    setState(() {
      _messages.insert(
        0,
        Message(text: text, sender: "A", time: DateTime.now()),
      );
    });
    _textController.clear();
  }

}

class Message {
  final String text;
  final String sender;
  final DateTime time;

  Message({required this.text, required this.sender, required this.time});
}
