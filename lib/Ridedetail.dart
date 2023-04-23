import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bookRide.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'bottom_nav.dart';

class RideDetailsScreen extends StatefulWidget {
  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreen();
}

class _RideDetailsScreen extends State<RideDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Ride details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RideDetailsScreen1(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class RideDetailsScreen1 extends StatelessWidget {
  String time_location1 = '4:30 PM,NIT TRICHY';
  String time_location2 = '4:40 PM,Kailash Nagar';
  String name = 'Mr.Arivazhagan';
  String money = '₹ 58 per person';
  String seatsLeft = '1 Seat left';
  String passenger1 = 'Peson1';
  String passenger2 = 'Juliana';
  String rating='4.8(10)';
  String auto_plate='TN45BE1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.3, // 40% of screen height
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.422, -122.084),
                zoom: 15,
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 360,
            height: 100,
            child: Card(
              elevation: 8,
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(20, -5),
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
                            border:
                                Border.all(width: 2, color: Color(0xFF0954E8)),
                            color: Color(0xFF0954E8),
                          ),
                          child: Container(
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
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
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Driver',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 360,
            height: 100,
            child: Stack(
              children: [
                Card(
                  elevation: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(-70, 10),
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(-15, -5),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/auto-clip-mask.png'),
                              width: 100,
                              height: 75,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(-35, -5),
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
                  bottom: 20,
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
                  bottom: 55,
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
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Passenger',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 360,
            height: 108,
            child: Card(
              elevation: 8,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(20, 00),
                        child: Image(
                          image: AssetImage('assets/images/Untitled-2.png'),
                          width: 66,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-10, 5),
                        child: Text(
                          passenger1,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(width: 130),
                      Text(
                        rating,
                        style: TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0, -5),
                        child: Image(
                          image: AssetImage('assets/images/Untitled-1 (1).png'),
                          width: 66,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-10, -5),
                        child: Text(
                          passenger2,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(width: 130),
                      Text(
                        rating,
                        style: TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Booked()),
              );
            },
            child: Text(
              'Schedule',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 20),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                10,
              )),

              primary: Colors.amber, // set the background color of the button
            ),
          ),
        ],
      ),
    );
  }
}
