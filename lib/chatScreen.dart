import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
];

class ChatMessage{

  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // add this line

  void _sendMessage() {
    String text = _textController.text.trim();
    if (text.isNotEmpty) {
      ChatMessage message = ChatMessage(
        messageContent: text,
        messageType: "sender",
      );
      setState(() {
        messages.add(message);
      });
      _textController.clear();

      // scroll to the bottom of the chat
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0954E8),

          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Person 0",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600,color: Colors.white),),
                        SizedBox(height: 6,),
                        Text("Online",style: TextStyle(color: Colors.white, fontSize: 13),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      body: Stack(
        children: <Widget>[
          ListView.builder(
            controller: _scrollController, // add this line

            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[

                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: _textController, // add this line
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),

                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: _sendMessage,
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),

                ],

              ),
            ),
          ),

        ],
      ),    );
  }
}
