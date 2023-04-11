import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class Sure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: null,
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: size.height * 0.4,
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
                    top: size.height * 0.24,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Are you sure you\nwant to cancel the ride?",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.228,
            ),
            Container(
              height: size.height * 0.4 - 27,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: size.height * 0.48,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Main();
                        },
                      ),
                    );
                  },
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF0954E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
