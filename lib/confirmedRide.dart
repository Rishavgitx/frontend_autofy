import 'package:flutter/material.dart';
import 'sureRide.dart';
import 'TrackRide.dart';
import 'bottom_nav.dart';

class Confirm extends StatefulWidget{
  @override
  State<Confirm> createState() => _State();
}


class _State extends State<Confirm> {
  int myIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/logo-blue-axi.png',
              width: 450,
              height: 300,
            ),
          )),
      body: Confirm1(),
      bottomNavigationBar:BottomNav(),
    );
  }
}
class Confirm1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Your ride is confirmed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Align(
              alignment: Alignment.topCenter,
              child: Expanded(
                child: Image.asset(
                  'assets/images/7923562_prev_ui.png',
                  height: 340.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderTrackingPage()),
                    );
                  },
                  child: Text(
                    'Track Ride',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Sure();
                    },),);
                  },
                  child: Text(
                    'Cancel Ride',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0954E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: Size(150, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}