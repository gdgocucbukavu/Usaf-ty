import 'dart:async';

import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controller/cubit/mapcubit.dart';
import '../../../../controller/state/mapstate.dart';
import '../../../../data/models/location.dart';
import '../../../../data/services/db.dart';

class MapsView extends StatefulWidget {
  final dynamic onMapCreated;
  final dynamic initialPosition;

  MapsView({
    super.key,
    this.onMapCreated,
    this.initialPosition,
  });

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    dynamic user = Provider.of<User?>(context);
    dynamic cubit = MapCubit.get(context);
    dynamic theme = Theme.of(context);
    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {},
      builder: (context, state) => cubit.currentLocation == null
          ? SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: theme.primaryColorLight,
                    strokeWidth: 2,
                  ),
                  Gap(10),
                  Text('Localisation ...'),
                ],
              ),
            )
          : GoogleMap(
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                if (!mapController.isCompleted) {
                  mapController.complete(controller);
                }
                if (MapCubit().currentLocation != null && user != null) {
                  DBServices().addUserLocation(
                    UserLoc(
                      name: user.displayName,
                      email: user.email,
                      location: Location(
                        lat: MapCubit().currentLocation!.latitude,
                        lng: MapCubit().currentLocation!.longitude,
                      ),
                    ),
                  );
                }
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  cubit.currentLocation!.latitude,
                  cubit.currentLocation!.longitude,
                ),
                zoom: 16.0,
              ),
              onTap: (latLng) => cubit.addMarker(latLng),
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: cubit.polylineCoordinates,
                ),
              },
              markers: cubit.markers.toSet(),
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
            ),
    );
  }
}
