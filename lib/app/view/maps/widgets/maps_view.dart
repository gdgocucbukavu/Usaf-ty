import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controller/cubit/mapcubit.dart';
import '../../../../controller/state/mapstate.dart';

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
  @override
  Widget build(BuildContext context) {
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
              onMapCreated: cubit.onMapCreated,
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
