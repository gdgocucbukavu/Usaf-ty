import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../app/shared/shared.dart';
import '../state/mapstate.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(InitialState());

  static MapCubit get(context) => BlocProvider.of(context);

  Completer<GoogleMapController> mapController = Completer();

  void onMapCreated(GoogleMapController controller) async {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
    }
  }

  static dynamic destination = LatLng(-2.4992107119225553, 28.868730999629342);
  static dynamic source = LatLng(-2.504368100365365, 28.865738715637093);

  bool? serviceEnabled;
  Position? currentLocation;
  LocationPermission? permissionGranted;

  dynamic distanceRestant = Geolocator.distanceBetween(
    -2.4034369199135437,
    28.839082703376597,
    -2.4992107119225553,
    28.868730999629342,
  );

  getCurrentLocation() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == true) {}

    permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
      if (permissionGranted == LocationPermission.whileInUse) {}
    }

    currentLocation = await Geolocator.getCurrentPosition();

    emit(GetCurrentLocationState());
  }

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
      wayPoints: [PolylineWayPoint(location: "Bukavu, DRC")],
    );

    if (polylineResult.points.isNotEmpty) {
      polylineResult.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    emit(GetPolyPointState());
  }

  List<Marker> markers = [
    Marker(
      markerId: MarkerId('source'),
      infoWindow: InfoWindow(
        title: "1ère Station",
        snippet: 'Parking du Gouverneur',
      ),
      position: source,
    ),
    Marker(
      markerId: MarkerId('destination'),
      infoWindow: InfoWindow(
        title: "Base",
        snippet: "Base de l'Agence IITA/RUNRES",
      ),
      position: destination,
    ),
  ];

  void addMarker(dynamic latLng) {
    markers.add(
      Marker(
        markerId: MarkerId('${latLng.latitude}'),
        position: LatLng(latLng.latitude, latLng.longitude),
      ),
    );
    emit(AddMarkerState());
  }
}
