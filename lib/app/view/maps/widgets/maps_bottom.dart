import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic cubit = MapCubit.get(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;

    dynamic disFormat = cubit.distanceRestant / 1000;
    String distance = disFormat.toStringAsFixed(1);

    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.22,
          minChildSize: 0.22,
          maxChildSize: 0.38,
          snap: true,
          builder: (context, scrollController) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.only(
                left: sizeWidth * 0.05,
                right: sizeWidth * 0.05,
                bottom: sizeWidth * 0.2,
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
                    margin: EdgeInsets.all(sizeWidth * 0.03),
                    decoration: BoxDecoration(
                      color: theme.primaryColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: sizeWidth * 0.25,
                    height: sizeWidth * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Gap(sizeWidth * 0.04),
                          Icon(AppIcons.car),
                          Text('  ...  '),
                          Text(
                            '$distance km ',
                            style: theme.textTheme.titleMedium,
                          ),
                          Text("restant", style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  stationView(
                    sizeWidth,
                    theme,
                    AppColors.tdGreenO,
                    '1ère Station',
                    'Av. Fizi/Q. Ndendere/C. Ibanda',
                  ),
                  stationView(
                    sizeWidth,
                    theme,
                    AppColors.tdYellowB,
                    '2ème Station',
                    'Parking du Gouverneur',
                  ),
                  stationView(
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
