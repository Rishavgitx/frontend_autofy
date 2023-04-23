import 'package:flutter/material.dart';
import 'homechatscreen.dart';
import 'main.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List<Widget> _screens = [ScaffoldExample(), ChatScreen(),];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch(index) {
      case 0:
        Navigator.pushNamed(context, '/home',);
        break;
      case 1:
        Navigator.pushNamed(context, '/book');
        break;
      case 2:
        Navigator.pushNamed(context, '/chat');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF0954E8),
      type: BottomNavigationBarType.fixed,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined,color: Colors.white,),
          label: '',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_repair_rounded
            ,color: Colors.white,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment_outlined
            ,color: Colors.white,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined
            ,color: Colors.white,),
          label: '',
        ),

      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
