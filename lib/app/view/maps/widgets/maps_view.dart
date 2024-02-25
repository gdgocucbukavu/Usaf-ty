import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:usaficity/app/shared/shared.dart';

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
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic user = Provider.of<User?>(context);
    dynamic cubit = MapCubit.get(context);
    dynamic theme = Theme.of(context);
    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {},
      builder: (context, state) => cubit.currentLocation == null
          ? Container(
              color: theme.highlightColor,
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
                  Text(
                    'Localisation ...'.tr(),
                    style: TextStyle(
                      fontSize: sizeWidth * 0.02,
                    ),
                  ),
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
                target: LatLng(-2.5004023743252253, 28.85180266668908),
                zoom: 14.0,
              ),
              onTap: (latLng) => cubit.addMarker(latLng),
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: cubit.polylineCoordinates,
                  color: AppColors.tdGreenO,
                  width: 3,
                ),
              },
              markers: cubit.markers.toSet(),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              tiltGesturesEnabled: false,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              mapToolbarEnabled: false,
            ),
    );
  }
}
