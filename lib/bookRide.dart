import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'confirmedRide.dart';
import 'Ridedetail.dart';
import 'bottom_nav.dart';
import 'package:booking_ride/BillSummary.dart';

class Booked extends StatefulWidget {
  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {

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
            child:
            Image.asset(
              'assets/images/logo-blue-axi.png',
              width: 450,
              height:300,
            ),
          )
      ),

      body: YourContentWidget(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class YourContentWidget extends StatelessWidget {
  String money = '₹ 58';
  String DriverName= 'Mr.Arivazhagan';
  String Rating = '4.8(10)';
  String perPerson ='₹ 58 per person';
  String time1 = '4.30,Today';
  String time_location1 = '4.30 PM, Nit Trichy';
  String time_location2 = '4.30 PM, Kailash Nagar';



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Center(
            child: Text(
              'Are you sure you want\nto book this ride?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        SizedBox(height: 50.0), // Add some space here
        Container(
          width: 350.0,
          height: 310.0,
          margin: EdgeInsets.symmetric(horizontal: 16.0), // Add margin here
          child: Card(
            elevation: 10,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        time1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 30.0),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          time_location1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          time_location2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.black,
                        thickness: 1.2,
                      ),
                      Row(
                        children: [
                          Text(
                           DriverName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 130),
                          Text(
                            Rating,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(
                        color: Colors.black,
                        thickness: 1.2,
                      ),
                      Row(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 210),
                          Text(
                            money,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Add a horizontal line below the text
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  right: 20,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Text(
                       perPerson,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

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
                  MaterialPageRoute(builder: (context) => RideDetailsScreen()),
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
                  MaterialPageRoute(builder: (context) => Bill()),
                );
              },
              child: Text(
                'Schedule',
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
