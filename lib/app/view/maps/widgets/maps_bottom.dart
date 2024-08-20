import 'package:easy_localization/easy_localization.dart';
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
    final theme = Theme.of(context);
    final cubit = MapCubit.get(context);

    final disFormat = cubit.distanceRestant / 1000;
    String distance = disFormat.toStringAsFixed(1);

    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DraggableScrollableSheet(
          initialChildSize: 0.25,
          minChildSize: 0.25,
          maxChildSize: 0.39,
          snap: true,
          builder: (context, scrollController) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 95),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: theme.primaryColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 80,
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Gap(10),
                          Icon(AppIcons.car),
                          Text('  ...  '),
                          Text(
                            '$distance km ',
                            style: theme.textTheme.titleMedium!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "restant".tr(),
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  stationView(
                    theme,
                    AppColors.tdGreenO,
                    '1ère Station'.tr(),
                    'Av. Fizi/Q. Ndendere/C. Ibanda',
                  ),
                  stationView(
                    theme,
                    AppColors.tdYellowB,
                    '2ème Station'.tr(),
                    'Parking du Gouverneur',
                  ),
                  stationView(
                    theme,
                    AppColors.tdRed,
                    '3ème Station'.tr(),
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
