import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'confirmedRide.dart';
import 'Ridedetail.dart';
class Booked extends StatefulWidget {
  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  int myIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Main(),
              ),
            );
          },
        ),
      ),
      body: YourContentWidget(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor:  Color(0xFF0954E8),
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            myIndex=index;

          });
        },
        currentIndex:myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair_rounded,color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment,color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_rounded,color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_rounded,color: Colors.white),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

class YourContentWidget extends StatelessWidget {
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
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '4:30 Today',
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
                      '4:30 PM,Nit Trichy',
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
                      '4:30 PM,Kailash Nagar',
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
                        'Mr.Arivazhagan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 130),
                      Text(
                        '4.8(10)',
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
                        'Rs 58',
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
                  MaterialPageRoute(builder: (context) => Confirm()),
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
