import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bottom_nav.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  int myIndex=0;

  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng nitTrichyLocation = LatLng(10.7640, 78.8155);
  static const LatLng destination = LatLng(10.7870, 79.1378);

  List<LatLng> polylineCordinates = [
    nitTrichyLocation,
    destination,
  ];

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Track Ride",
            style:
            TextStyle(color: Colors.black, fontSize: 20,
            fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.black)),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition:
            CameraPosition(target: nitTrichyLocation, zoom: 8.5),
            polylines: {
              Polyline(
                polylineId: PolylineId("route"),
                points: polylineCordinates,
                color: Colors.blue,
                width: 5,
              ),
            },
            markers: {
              const Marker(
                markerId: MarkerId("source"),
                position: nitTrichyLocation,
              ),
              const Marker(
                markerId: MarkerId("destination"),
                position: destination,
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ],
      ),
      bottomNavigationBar:BottomNav(),
    );
  }
}
