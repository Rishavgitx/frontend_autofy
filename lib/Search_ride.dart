import 'package:flutter/material.dart';
import 'sureRide.dart';
import 'confirmedRide.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'main.dart';
import 'bottom_nav.dart';
import 'Ridedetail.dart';

class Searchride extends StatefulWidget {
  @override
  State<Searchride> createState() => _Searchride();
}

class _Searchride extends State<Searchride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Searchride1(
          from: 'Enter pickup location', to: 'Enter drop location '),
    );
  }
}

class Searchride1 extends StatelessWidget {
  final String from;
  final String to;

  Searchride1({required this.from, required this.to});

  String time = '4.30 PM, Today';
  String name = 'Mr.Arivazhagan';
  String seatsLeft = '1 Seat left';
  String money = '₹ 58 per person';
  String location1 = 'NIT Trichy';
  String location2 = 'Kailash Nagar';
  String rides_available = '3 rides available ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      "Search Rides",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 48.0),
                  ],
                ),
              ),
              // add your search UI components here

              // Add the card view here

              Card(
                elevation: 4,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          ' ${from}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Image(
                        image: AssetImage('assets/images/bluearrow.png'),
                        width: 50,
                        height: 10,
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          ' ${to}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 300.0),
                    child: Text('Date:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 300.0),
                    child: Text('Time:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),

              SizedBox(height: 16.0),
              // add some space between the card and the text

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Your Search Results:',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0),

              Padding(
                padding: EdgeInsets.only(right: 270.0),
                // adjust the value to suit your needs
                child: Text(
                  rides_available,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 400,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 4,
                            margin: EdgeInsets.all(5.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          time,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            // add top padding to the text
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Transform.translate(
                                            offset: Offset(-50, -20),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/auto-clip-mask.png'),
                                              width: 100,
                                              height: 60,
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(-70, -25),
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Transform.translate(
                                        offset: Offset(30, -48),
                                        child: Text(
                                          seatsLeft,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(-5, -40),
                                        child: Text(
                                          money,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: Offset(-40, -20),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 16),
                                          height: 25,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1.5,
                                                color: Color(0xFF0954E8)),
                                            color: Color(0xFF0954E8),
                                          ),
                                        ),
                                        Dash(
                                          direction: Axis.vertical,
                                          length: 45,
                                          // set the length to 5
                                          dashLength: 2,
                                          // set the dash length to 2
                                          dashColor: Color(0xFF0954E8),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2,
                                                color: Color(0xFF0954E8)),
                                            color: Color(0xFF0954E8),
                                          ),
                                          child: Container(
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130, // adjust the width as needed
                                    child: Column(
                                      children: <Widget>[
                                        Transform.translate(
                                          offset: Offset(-5, 0),
                                          child: Text(
                                            '${from}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(height: 43),
                                        Transform.translate(
                                          offset: Offset(-1, -10),
                                          child: Text(
                                            '${to}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 6.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RideDetailsScreen()),
                                );
                              },
                              child: Text('Call Driver'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0954E8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                textStyle: TextStyle(fontSize: 14),
                                minimumSize: Size(60, 0),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                      width: 400,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 4,
                            margin: EdgeInsets.all(5.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          time,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            // add top padding to the text
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Transform.translate(
                                            offset: Offset(-50, -20),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/auto-clip-mask.png'),
                                              width: 100,
                                              height: 60,
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(-70, -25),
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Transform.translate(
                                        offset: Offset(30, -48),
                                        child: Text(
                                          seatsLeft,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(-5, -40),
                                        child: Text(
                                          money,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: Offset(-40, -20),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 16),
                                          height: 25,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1.5,
                                                color: Color(0xFF0954E8)),
                                            color: Color(0xFF0954E8),
                                          ),
                                        ),
                                        Dash(
                                          direction: Axis.vertical,
                                          length: 45,
                                          // set the length to 5
                                          dashLength: 2,
                                          // set the dash length to 2
                                          dashColor: Color(0xFF0954E8),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2,
                                                color: Color(0xFF0954E8)),
                                            color: Color(0xFF0954E8),
                                          ),
                                          child: Container(
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130, // adjust the width as needed
                                    child: Column(
                                      children: <Widget>[
                                        Transform.translate(
                                          offset: Offset(-5, 0),
                                          child: Text(
                                            '${from}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(height: 43),
                                        Transform.translate(
                                          offset: Offset(-1, -10),
                                          child: Text(
                                            '${to}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 6.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RideDetailsScreen()),
                                );
                              },
                              child: Text('Call Driver'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0954E8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                textStyle: TextStyle(fontSize: 14),
                                minimumSize: Size(60, 0),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                      width: 400,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 4,
                            margin: EdgeInsets.all(5.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          time,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                            // add top padding to the text
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Transform.translate(
                                            offset: Offset(-50, -20),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/auto-clip-mask.png'),
                                              width: 100,
                                              height: 60,
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(-70, -25),
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Transform.translate(
                                        offset: Offset(30, -48),
                                        child: Text(
                                          seatsLeft,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      Transform.translate(
                                        offset: Offset(-5, -40),
                                        child: Text(
                                          money,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.translate(
                                    offset: Offset(-40, -20),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 16),
                                          height: 25,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1.5,
                                                color: Color(0xFF0954E8)),
                                            color: Color(0xFF0954E8),
                                          ),
                                        ),
                                        Dash(
                                          direction: Axis.vertical,
                                          length: 45,
                                          // set the length to 5
                                          dashLength: 2,
                                          // set the dash length to 2
                                          dashColor: Color(0xFF0954E8),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2,
                                                color: Color(0xFF0954E8)),
                                            color: Color(0xFF0954E8),
                                          ),
                                          child: Container(
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130, // adjust the width as needed
                                    child: Column(
                                      children: <Widget>[
                                        Transform.translate(
                                          offset: Offset(-5, 0),
                                          child: Text(
                                            '${from}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(height: 43),
                                        Transform.translate(
                                          offset: Offset(-1, -10),
                                          child: Text(
                                            '${to}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 6.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RideDetailsScreen()),
                                );
                              },
                              child: Text('Call Driver'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0954E8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                textStyle: TextStyle(fontSize: 14),
                                minimumSize: Size(60, 0),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
