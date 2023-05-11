import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'Search_ride.dart';
import 'bookRide.dart';
import 'TrackRide.dart';
import 'Ridedetail.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'homechatscreen.dart';
import 'SplashScreen.dart';
import 'confirmedRide.dart';
import 'dart:async';
import 'bottom_nav.dart';
import 'itinerary.dart';
import 'package:booking_ride/BillSummary.dart';
import 'Profile.dart';

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
  bool _showSplashScreen = true;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _showSplashScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      routes: {
        '/home': (context) => ScaffoldExample(),
        '/book': (context) => itinerary(),
        '/chat': (context) => ChatScreen(),
        '/profile': (context) => Profile(),
      },
      debugShowCheckedModeBanner: true,
      home: _showSplashScreen ? SplashScreen() : ScaffoldExample(),
    );
  }
}

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: HOME(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class HOME extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<HOME> {
  String time = '4.30 PM, Today';
  String name = 'Mr.Arivazhagan';
  String seatsLeft = '1 Seat left';
  String location1 = 'NIT Trichy';
  String location2 = 'Kailash Nagar';
  String rides = '54 rides';
  String kg = '4.50 kg';
  String time1 = '4.30 PM, Today';
  String name1 = 'Mr.Arivazhagan';
  String seatsLeft1 = '1 Seat left';
  String money = '₹ 58 per person';

  String location3 = 'NIT Trichy';
  String loaction4 = 'Barn Hall';

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
    Size size = MediaQuery
        .of(context)
        .size;
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
                              'Barn',
                              'GJCH',
                              'Cafe Coffee Day',
                              '2k Market',
                              'Octagon',
                              'Library',
                              'NITT Hospital',
                              'Mega Mess 1',
                              'Mega Mess 2',
                              'Kailash Mess',
                              'NSO Ground',
                              'ECE Department',
                              'CSE Department',
                              'Production Department',
                              'Chemical Department',
                              'Mechanical Department',
                              'Civil Department',
                              'ICE Department',
                              'EEE Department',
                              'Lassi Shop',
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
                              'Orion',
                              'Ojas',
                              'Bru Stall',
                              'Sports Complex',
                              'Jasper',
                              'Opal A',
                              'Opal B',
                              'Opal C',
                              'Opal D',
                              'Opal E',
                              'Opal F'
                            ],
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                            'Barn',
                            'GJCH',
                            'Cafe Coffee Day',
                            '2k Market',
                            'Octagon',
                            'Library',
                            'NITT Hospital',
                            'Mega Mess 1',
                            'Mega Mess 2',
                            'Kailash Mess',
                            'NSO Ground',
                            'ECE Department',
                            'CSE Department',
                            'Production Department',
                            'Chemical Department',
                            'Mechanical Department',
                            'Civil Department',
                            'ICE Department',
                            'EEE Department',
                            'Lassi Shop',
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
                            'Orion',
                            'Ojas',
                            'Bru Stall',
                            'Sports Complex',
                            'Jasper',
                            'Opal A',
                            'Opal B',
                            'Opal C',
                            'Opal D',
                            'Kailash Nagar',
                            'Balaji Nagar',
                            'Thillai Nagar',
                            'Central Bus Stand',
                            'Chathram Bus Stand',
                            'Thiruverumbur Bus Stand',
                            'Thuvakudi',
                            'Railway station',
                            'airport',
                            'D mart',
                            'srirangam'
                            ],
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                              SizedBox(width: 0),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    // center the text
                                    'Date',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            '${_date.day}-${_date.month}-${_date
                                                .year}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.5),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 32),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    // center the text

                                    'Time',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '${DateFormat('h:mm a').format(
                                                DateTime(2022, 1, 1, _time.hour,
                                                    _time.minute))}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.5),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 11),

                          // Center the button horizontally
                          ElevatedButton(
                            onPressed: () {
                              String from = _pickupController.text;
                              String to = _dropController.text;
                              if (from.isNotEmpty && to.isNotEmpty) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Searchride1(
                                          from: from,
                                          to: to,
                                        ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Enter Location"),
                                      content: Text(
                                          "Please enter both pickup and drop location"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
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
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 450,
                  left: 5,
                  right: 5,
                  bottom: 20,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage('assets/images/vegan.png'),
                            width: 60,
                            height: 80,
                          ),
                          SizedBox(width: 5),
                          Column(
                            children: <Widget>[
                              Transform.translate(
                                offset: Offset(5, 30),
                                child: Text(
                                  rides,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'shared',
                                style: TextStyle(
                                    height: 4,
                                    color: Colors.green,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(width: 70),
                          Image(
                            image: AssetImage('assets/images/co2 (1).png'),
                            width: 60,
                            height: 80,
                          ),
                          Column(
                            children: <Widget>[
                              Transform.translate(
                                offset: Offset(5, 30),
                                child: Text(
                                  kg,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'saved',
                                style: TextStyle(
                                    height: 4,
                                    color: Colors.green,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 440,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
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
          SizedBox(height: 25),
          Transform.translate(
            offset: Offset(0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          time1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Transform.translate(
                              offset: Offset(0, -10),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/auto-clip-mask.png'),
                                width: 100,
                                height: 80,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(-20, -15),
                            child: Text(
                              name1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(5, -45),
                        child: Text(
                          seatsLeft1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 12,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        Border.all(width: 1.5, color: Color(0xFF0954E8)),
                        color: Color(0xFF0954E8),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -45),
                      // shift the Dash widget upward by 10 pixels
                      child: Dash(
                        direction: Axis.vertical,
                        length: 39,
                        dashLength: 2,
                        dashColor: Color(0xFF0954E8),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -45),
                      child: Container(
                        height: 25,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(width: 2, color: Color(0xFF0954E8)),
                          color: Color(0xFF0954E8),
                        ),
                        child: Container(
                          height: 10,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 29),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 45, bottom: 90),
                      child: Container(
                        child: Text(
                          location3,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-32, -55),
                      child: Text(
                        loaction4,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Transform.translate(
              offset: Offset(0, -165),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // added this
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, top: 100),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30, top: 110),
                      // added this
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()),
                                  );
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
          Transform.translate(
            offset: Offset(0, -160),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          time1,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Transform.translate(
                              offset: Offset(0, -10),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/auto-clip-mask.png'),
                                width: 100,
                                height: 80,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(-20, -15),
                            child: Text(
                              name1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(5, -45),
                        child: Text(
                          seatsLeft1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 12,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        Border.all(width: 1.5, color: Color(0xFF0954E8)),
                        color: Color(0xFF0954E8),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -45),
                      // shift the Dash widget upward by 10 pixels
                      child: Dash(
                        direction: Axis.vertical,
                        length: 39,
                        dashLength: 2,
                        dashColor: Color(0xFF0954E8),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -45),
                      child: Container(
                        height: 25,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(width: 2, color: Color(0xFF0954E8)),
                          color: Color(0xFF0954E8),
                        ),
                        child: Container(
                          height: 10,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 29),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 45, bottom: 90),
                      child: Container(
                        child: Text(
                          location3,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-32, -55),
                      child: Text(
                        loaction4,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Transform.translate(
              offset: Offset(0, -325),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // added this
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 50, top: 100),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30, top: 110),
                      // added this
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()),
                                  );
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
                                        builder: (context) => Confirm()),
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
