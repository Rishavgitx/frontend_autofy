import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Color(0xFF0954E8),
        child: Center(
          child: Image(
            image: AssetImage('assets/images/logo-white-axi.png'),

          ),

        ),
      ),
    );
  }
}
