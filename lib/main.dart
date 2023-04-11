import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'Search_ride.dart';
import 'bookRide.dart';
import 'TrackRide.dart';
import 'Ridedetail.dart';
import 'package:intl/intl.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second': (context) => Booked(),
      },
      title: 'My App',
      home: Scaffold(
        appBar: null,
        body: Body(),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: Color(0xFF0954E8),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair_rounded, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded, color: Colors.white),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _pickupController = TextEditingController();
  final _dropController = TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: now,
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay now = TimeOfDay.fromDateTime(DateTime.now());
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      final DateTime currentTime = DateTime.now();
      final DateTime selectedTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        picked.hour,
        picked.minute,
      );
      if (selectedTime.isAfter(currentTime)) {
        setState(() {
          _time = picked;
        });
      } else {
        // Show an error message or handle the invalid selection in some other way.
      }
    }
  }



  @override
  void dispose() {
    _pickupController.dispose();
    _dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.7,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.4 - 27,
                  decoration: BoxDecoration(
                    color: Color(0xFF0954E8),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                ),
                Positioned(
                  top: 13,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'Where do you want to go?', //UPPER TEXT
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.13,
                  left: 5,
                  right: 5,
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'From:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          AutoCompleteTextField(
                            key:
                                GlobalKey<AutoCompleteTextFieldState<String>>(),
                            controller: _pickupController,
                            clearOnSubmit: false,
                            suggestions: [
                              'Nit Trichy Main Gate',
                              'Zircon A',
                              'Zircon B',
                              'Zircon C',
                              'Coral',
                              'Aquamarine A',
                              'Aquamarine B',
                              'Agate',
                              'Garnet A',
                              'Garnet B',
                              'Garnet C',
                              'Beryl',
                              'Amber A',
                              'Amber B',
                              'Ruby',
                              'Emerald',
                              'Pearl',
                              'Sapphire',
                              'Topaz',
                              'Lapis',
                              'Diamond',
                              'Jade',
                              'Jasper',
                              'Opal A',
                              'Opal B',
                              'Opal C',
                              'Opal D',
                              'Opal E',
                              'Opal F'
                            ],
                            decoration: InputDecoration(
                              hintText: 'Enter pickup location',
                              prefixIcon: Icon(Icons.location_on_outlined,
                                  color: Color(0xFF0954E8)),
                              border: OutlineInputBorder(),
                            ),
                            itemFilter: (item, query) {
                              if (item is String && query is String) {
                                return item
                                    .toLowerCase()
                                    .startsWith(query.toLowerCase());
                              }
                              return false;
                            },
                            itemSorter: (a, b) {
                              if (a is String && b is String) {
                                return a.compareTo(b);
                              }
                              return 0;
                            },
                            itemSubmitted: (item) {
                              if (item is String) {
                                _pickupController.text = item;
                              }
                            },
                            itemBuilder: (context, item) {
                              if (item is String) {
                                return Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        item,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                          SizedBox(height: 10),
                          Text(
                            'To',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          AutoCompleteTextField(
                            key:
                                GlobalKey<AutoCompleteTextFieldState<String>>(),
                            controller: _dropController,
                            clearOnSubmit: false,
                            suggestions: [
                              'Nit Trichy Main Gate',
                              'Kailash Nagar',
                              'Balaji Nagar',
                              'Thillai Nagar',
                              'Central Bus Stand',
                              'Chathram Bus Stand',
                              'Thiruverumbur Bus Stand',
                              'Thuvakudi',
                              'Railway station',
                              'airport',
                              'srirangam'
                            ],
                            decoration: InputDecoration(
                              hintText: 'Enter drop location',
                              prefixIcon: Icon(Icons.location_on_outlined,
                                  color: Color(0xFF0954E8)),
                              border: OutlineInputBorder(),
                            ),
                            itemFilter: (item, query) {
                              if (item is String && query is String) {
                                return item
                                    .toLowerCase()
                                    .startsWith(query.toLowerCase());
                              }
                              return false;
                            },
                            itemSorter: (a, b) {
                              if (a is String && b is String) {
                                return a.compareTo(b);
                              }
                              return 0;
                            },
                            itemSubmitted: (item) {
                              if (item is String) {
                                _dropController.text = item;
                              }
                            },
                            itemBuilder: (context, item) {
                              if (item is String) {
                                return Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        item,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Date and Time:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 3),
                              Expanded(
                                child: ListTile(
                                  title: Text('Date',style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Text('${_date.day}-${_date.month}-${_date.year}',style: TextStyle(fontWeight: FontWeight.w700),),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 2),
                              Expanded(
                                child: ListTile(
                                  title: Text('Time',style: TextStyle(fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      '${DateFormat('h:mm a').format(DateTime(2022, 1, 1, _time.hour, _time.minute))}',style: TextStyle(
                                    fontWeight: FontWeight.w700
                                  ),),
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 11),
                          Positioned(
                            bottom: 19,
                            left: size.width / 2 - 75,
                            // Center the button horizontally
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Searchride1(
                                          from: _pickupController.text,
                                          to: _dropController.text,)),
                                );
                              },
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                minimumSize: Size(500, 54),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 460,
                  left: 3,
                  right: 3,
                  bottom: 95,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/images/vegan.png'),
                            width: 60,
                            height: 80,
                          ),
                          SizedBox(width: 160),
                          // Add some spacing between the images
                          Image(
                            image: AssetImage('assets/images/co2 (1).png'),
                            width: 60,
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 530,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'Nearby rides',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -20),
            // adjust the Y-axis offset as per your requirement
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '4.30 PM, Today\nMr. Arivazhagan\n1 seat left',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'NIT Trichy\nCentral Bus Stand',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
              offset: Offset(0, -20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // added this
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Rs 58 per person',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30), // added this
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Call Driver',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.zero,
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.zero,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  textStyle: TextStyle(fontSize: 14),
                                  minimumSize: Size(60, 0),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RideDetailsScreen()),
                                  );                                },
                                child: Text(
                                  'Book ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0954E8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  textStyle: TextStyle(fontSize: 14),
                                  minimumSize: Size(60, 0),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ])),
          Transform.translate(
            offset: Offset(0, -20),
            // adjust the Y-axis offset as per your requirement
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '5.30 PM, Today\nMr. Arivazhagan\n1 seat left',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Opal\nBarn Hall',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
              offset: Offset(0, -20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // added this
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Rs 20 per person',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30), // added this
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {

                                },
                                child: Text(
                                  'Call Driver',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.zero,
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.zero,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  textStyle: TextStyle(fontSize: 14),
                                  minimumSize: Size(60, 0),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RideDetailsScreen()),
                                  );
                                },
                                child: Text(
                                  'Book ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF0954E8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  textStyle: TextStyle(fontSize: 14),
                                  minimumSize: Size(60, 0),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ])),
        ],
      ),
    );
  }
}
