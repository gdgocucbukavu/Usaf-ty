import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/maps_bottom.dart';
import 'widgets/maps_view.dart';
import 'widgets/search_view.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController googleMapsController;

  static CameraPosition initialPosition = CameraPosition(
    target: LatLng(-23.5557714, -46.6395571),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void onMapCreated(GoogleMapController controller) {
    googleMapsController = controller;
  }

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: sizeHeight,
        width: sizeWidth,
        child: Stack(
          children: [
            // MapsView(),
            GoogleMap(
              mapType: MapType.hybrid,
              onMapCreated: onMapCreated,
              initialCameraPosition: initialPosition,
            ),
            Positioned(
              bottom: 0,
              child: SearchView(),
            ),
            Positioned(
              bottom: 0,
              child: BottomView(),
            ),
          ],
        ),
      ),
    );
  }
}
