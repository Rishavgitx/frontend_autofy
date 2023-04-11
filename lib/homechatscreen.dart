import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:booking_ride/ChatSccreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MaterialApp(
    home: ChatScreen(),
  ));
}

class ChatItem {
  String name;
  String message;
  String image;
  String time;
  bool isUnseen;
  bool isSeen;

  ChatItem({required this.name, required this.message, required this.image, required this.time, this.isUnseen = true, this.isSeen = false});
}

List<ChatItem> chatList = [
  ChatItem(name: 'Pranesh 0', message: 'Thanks', image: 'assets/images/Untitled-1 (1).png', time: '10:00 AM', isUnseen: true),
  ChatItem(name: 'Pranesh 1', message: 'Thanks', image: 'assets/images/Untitled-1 (1).png', time: '10:15 AM', isUnseen: false, isSeen: true),
  ChatItem(name: 'Pranesh 2', message: 'Thanks!', image: 'assets/images/Untitled-1 (1).png', time: '11:00 AM', isUnseen: true),
];

class ChatScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Color(0xFF0954E8),
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          title: Text(
            'Inbox',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),

                ),
              ),
            ),
          ),

        ),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          ChatItem chatItem = chatList[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatScreen1();
                      },
                    ),
                  );            print('Button pressed for ${chatItem.name}');
                },
                child:  Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                  child: ListTile(
                    title: Text(
                      chatItem.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chatItem.message,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          chatItem.time,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            if (chatItem.isUnseen)
                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(right: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            if (chatItem.isSeen)
                              Icon(
                                Icons.done_all,
                                color: Colors.blue,
                                size: 20,
                              ),
                          ],
                        ),
                      ],
                    ),
                    leading: ClipOval(
                      child: Image.asset(
                        chatItem.image,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 20.0,
                endIndent: 20.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
