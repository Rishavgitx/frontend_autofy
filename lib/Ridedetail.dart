import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bookRide.dart';
class RideDetailsScreen extends StatefulWidget {
  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreen();
}


class _RideDetailsScreen extends State<RideDetailsScreen> {
  int myIndex=0;
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
class RideDetailsScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3, // 40% of screen height
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.422, -122.084),
                zoom: 15,
              ),
            ),
          ),
          SizedBox(height:15 ),
          SizedBox(
            width: 360,
            height: 100,
            child: Card(
              elevation: 8,
              child: Text(
                'Nit Trichy\nAilash Nagar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Driver',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold
          ),),
          SizedBox(
            width: 360,
            height: 100,
            child: Card(
              elevation: 8,
              child: Text(
                'Mr Arivazhaghan',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 10),

          Text('Passenger',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold
          ),),          SizedBox(
            width: 360,
            height: 100,
            child: Card(
              elevation: 8,
              child: Text(
                'Pranesh\nJuliana',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height:10),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Booked()),
            );
          }, child: Text('Schedule'),
          ),

        ],
      ),
    );
  }
}
