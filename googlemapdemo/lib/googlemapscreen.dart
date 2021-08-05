import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({Key key}) : super(key: key);

  @override
  _GoogleMapDemoState createState() => _GoogleMapDemoState();

}

class _GoogleMapDemoState extends State<GoogleMapDemo> {


  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  _onMapCreated(GoogleMapController controller) {

    setState(() {

      _markers.add(Marker(markerId: MarkerId('id-1'),
          position:LatLng(37.42796133580664, -122.085749655962),
          infoWindow: InfoWindow(title: "Home",
          snippet: "Favourite Place")));

    });

    //controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(

        title : Text("google Map"),

      ),

        body :GoogleMap(
     mapType: MapType.normal,
     markers: _markers,
     initialCameraPosition: _kGooglePlex,
    onMapCreated: _onMapCreated,
    ));
  }
}
