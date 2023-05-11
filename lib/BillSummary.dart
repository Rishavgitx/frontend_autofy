import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bottom_nav.dart';
import 'main.dart';
import 'Ridedetail.dart';
import 'confirmedRide.dart';
import 'bookRide.dart';
import 'package:flutter_dash/flutter_dash.dart';

class Bill extends StatefulWidget {
  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
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
      body: BillWidget(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class BillWidget extends StatelessWidget {
  String Passenger1 = 'Passenger 1';
  String money = '₹ 58';
  String Passenger2 = 'Passenger 2';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 70, right: 150),
          child: Center(
            child: Text(
              'Bill Summary',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 50.0), // Add some space here
        Container(
          width: 330.0,
          height: 200.0,
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
                        offset: Offset(-70, 0),
                        child: Text(
                          'Total Charges',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 8),
                      Transform.translate(
                        offset: Offset(10, 20),
                        child: Row(children: <Widget>[
                          Text(
                            Passenger1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(width: 17),
                          Dash(
                            direction: Axis.horizontal,
                            length: 110,
                            dashLength: 15,
                            dashColor: Colors.black,
                          ),
                          SizedBox(width: 12),
                          Text(
                            money,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(right: 78.0),
                        child: Text(
                          'Initial Charges(One-fourth)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(10, 20),
                        child: Row(children: <Widget>[
                          Text(
                            Passenger2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(width: 17),
                          Dash(
                            direction: Axis.horizontal,
                            length: 110,
                            dashLength: 15,
                            dashColor: Colors.black,
                          ),
                          SizedBox(width: 12),
                          Text(
                            money,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Pay initial charges to confirm the ride',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),

        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Booked()),
                );
              },
              child: Text('Back'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  10,
                )),
                primary:
                    Color(0xFF0954E8), // set the background color of the button
              ),
            ),
            SizedBox(width: 0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Confirm()),
                );
              },
              child: Text(
                'Pay Now',
                style: TextStyle(color: Colors.black),
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
        )
      ],
    );
  }
}
