import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:usaficity/app/shared/shared.dart';

import '../../../../controller/cubit/mapcubit.dart';
import '../../../../controller/state/mapstate.dart';
import 'station_view.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  Completer<GoogleMapController> mapController = Completer();

  @override
  void dispose() {
    mapController = Completer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic cubit = MapCubit.get(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;

    dynamic disFormat = cubit.distanceRestant / 1000;
    String distance = disFormat.toStringAsFixed(1);

    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: 0.2,
          maxChildSize: 0.38,
          builder: (context, scrollController) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.only(
                left: sizeHeight * 0.03,
                right: sizeHeight * 0.03,
                bottom: sizeHeight * 0.1,
              ),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: sizeWidth,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(sizeHeight * 0.02),
                    decoration: BoxDecoration(
                      color: theme.primaryColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: sizeWidth * 0.25,
                    height: sizeHeight * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(AppIcons.car),
                          Text('  ...  '),
                          Text(
                            '$distance km ',
                            style: theme.textTheme.titleMedium,
                          ),
                          Text("restant", style: theme.textTheme.bodySmall),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => CameraPosition(
                          target: LatLng(
                            cubit.currentLocation!.latitude,
                            cubit.currentLocation!.longitude,
                          ),
                          zoom: 17.0,
                        ),
                        child: Icon(AppIcons.scope),
                      ),
                    ],
                  ),
                  stationView(
                    sizeHeight,
                    sizeWidth,
                    theme,
                    AppColors.tdGreenO,
                    '1ère Station',
                    'Av. Fizi/Q. Ndendere/C. Ibanda',
                  ),
                  stationView(
                    sizeHeight,
                    sizeWidth,
                    theme,
                    AppColors.tdYellowB,
                    '2ème Station',
                    'Parking du Gouverneur',
                  ),
                  stationView(
                    sizeHeight,
                    sizeWidth,
                    theme,
                    AppColors.tdRed,
                    '3ème Station',
                    'Bureau SNEL/AV. Gouverneur',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
