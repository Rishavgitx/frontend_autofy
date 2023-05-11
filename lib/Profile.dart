import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'itinerary.dart';
import 'package:booking_ride/Policy_Page.dart';


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _Profile();
}
class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 146,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(bottom: 0.0, right: 50),
          child: FlexibleSpaceBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/Untitled-1 (1).png'),
                      width: 500,
                      height: 85,
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(100, 0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '4.8',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.5, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Profile1(),
      bottomNavigationBar: BottomNav(),
    );
  }
}



class Profile1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 300,
                    width: 325,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFF0954E8),
                            ),
                            label: Text('Personal Data',style: TextStyle(color: Colors.black),),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return itinerary();
                              },),);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                            icon: Icon(
                              Icons.directions_car_filled_outlined,
                              color: Color(0xFF0954E8),
                            ),
                            label: Text('My Rides',style: TextStyle(color: Colors.black),),
                          ),
                        ),



                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Policy_Page();
                              },),);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                            icon: Icon(
                              Icons.privacy_tip_outlined,
                              color: Color(0xFF0954E8),
                            ),
                            label: Text('Privacy',style: TextStyle(color: Colors.black),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
