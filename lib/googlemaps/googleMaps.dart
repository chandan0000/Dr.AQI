import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}









// // class GoogleMapsScreen extends StatefulWidget {
// //   const GoogleMapsScreen({Key? key}) : super(key: key);

// //   @override
// //   _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
// // }

// // class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
// //   // Set<Marker> _marker={};
// //   // void _onMapCreated(GoogleMapController controller){
// //   //   setState(() {
// //   //     _marker.add(
// //   //       Marker(markerId: MarkerId('id-1'),position: )
// //   //     )
// //   //   });
// //   //
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Center(child: Text('Dr.AQi Maps')),
// //       ),
// //       body: GoogleMap(
// //         initialCameraPosition: CameraPosition(
// //           target: LatLng(22.5448131, 88.34036991),
// //           zoom: 15,
// //         ),
// //       ),
// //     );
// //   }
// // }