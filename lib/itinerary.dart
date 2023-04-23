import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'bottom_nav.dart';

class itinerary extends StatefulWidget {
  @override
  State<itinerary> createState() => _itinerary();
}

class _itinerary extends State<itinerary> {
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
      body: iternary1(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class iternary1 extends StatelessWidget {
  String time_location1 = '4:30 PM,NIT TRICHY';
  String time_location2 = '4:40 PM,Kailash Nagar';
  String name = 'Mr.Arivazhagan';
  String seatsLeft = '1 Seat left';
  String money = '₹ 58 per person';
  String rating = '4.8(10)';
  String auto_plate = 'TN45BE1234';
  String date_day1='20 Apr';
  String date_day2='21 Apr';
  String Passenger2 = 'Passenger 2';
  String Passenger1 = 'Passenger 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20, right: 200),
            child: Center(
              child: Text(
                'My Rides',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            width: 370.0,
            height: 293.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0), // Add margin here
            child: Card(
              elevation: 12,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Itinerary',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(width: 190),
                              Text(
                                date_day1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(10, 0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    height: 12,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1.5, color: Color(0xFF0954E8)),
                                      color: Color(0xFF0954E8),
                                    ),
                                  ),
                                  Dash(
                                    direction: Axis.vertical,
                                    length: 38, // set the length to 5
                                    dashLength: 2, // set the dash length to 2
                                    dashColor: Color(0xFF0954E8),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Color(0xFF0954E8)),
                                      color: Color(0xFF0954E8),
                                    ),
                                    child: Container(
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Text(
                                        time_location1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 35),
                                      Text(
                                        time_location2,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        money,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(bottom: 20, right: 260),
                          child: Center(
                            child: Text(
                              'Driver',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-70, -10),
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 12.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(-35, -35),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/auto-clip-mask.png'),
                                width: 100,
                                height: 75,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-55, -35),
                              child: Text(
                                seatsLeft,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    right: 25,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          auto_plate,
                          style: TextStyle(
                              fontSize: 8.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 75,
                    right: 27,
                    child: Row(
                      children: <Widget>[
                        Text(
                          rating,
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 127,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Call Driver',
                        style: TextStyle(
                            color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 10),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          10,
                        )),

                        primary: Colors
                            .amber, // set the background color of the button
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 370.0,
            height: 293.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0), // Add margin here
            child: Card(
              elevation: 12,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0, 0),
                          child: Row(
                            children: [
                              Text(
                                'Itinerary',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(width: 190),
                              Text(
                                date_day2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(10, 0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    height: 12,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1.5, color: Color(0xFF0954E8)),
                                      color: Color(0xFF0954E8),
                                    ),
                                  ),
                                  Dash(
                                    direction: Axis.vertical,
                                    length: 38, // set the length to 5
                                    dashLength: 2, // set the dash length to 2
                                    dashColor: Color(0xFF0954E8),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Color(0xFF0954E8)),
                                      color: Color(0xFF0954E8),
                                    ),
                                    child: Container(
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Text(
                                        time_location1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 35),
                                      Text(
                                        time_location2,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        money,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(bottom: 20, right: 260),
                          child: Center(
                            child: Text(
                              'Driver',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-70, -10),
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 12.5, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Transform.translate(
                              offset: Offset(-35, -35),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/auto-clip-mask.png'),
                                width: 100,
                                height: 75,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-55, -35),
                              child: Text(
                                seatsLeft,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    right: 25,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          auto_plate,
                          style: TextStyle(
                              fontSize: 8.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 75,
                    right: 27,
                    child: Row(
                      children: <Widget>[
                        Text(
                          rating,
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 127,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Call Driver',
                        style: TextStyle(
                            color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 10),

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            )),

                        primary: Colors
                            .amber, // set the background color of the button
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
