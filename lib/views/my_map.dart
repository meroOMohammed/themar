import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapView extends StatefulWidget {
  const MyMapView({super.key});

  @override
  State<MyMapView> createState() => _MyMapViewState();
}

class _MyMapViewState extends State<MyMapView> {
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    markers.add(Marker(
        markerId: MarkerId("1"), position: LatLng(29.978686315719376, 31.11663394951083)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          markers: markers,
          onTap: (location) {
            markers.add(Marker(
                markerId: MarkerId("1"),
                position: location));
            setState(() {

            });
          },
          initialCameraPosition:
              CameraPosition(target: LatLng(29.978686315719376, 31.11663394951083), zoom: 13)),
    );
  }
}



