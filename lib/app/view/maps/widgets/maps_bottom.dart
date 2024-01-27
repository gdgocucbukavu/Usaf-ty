import 'package:flutter/material.dart';
import 'package:usaficity/app/shared/shared.dart';

import 'raliment_view.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.only(
        top: sizeHeight * 0.03,
        left: sizeHeight * 0.03,
        right: sizeHeight * 0.03,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      height: sizeHeight * 0.4,
      width: sizeWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(AppIcons.card),
                  Text('  ...  '),
                  Text(
                    '23 km ',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    "restant pour t'atteindre",
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              Icon(AppIcons.scope),
            ],
          ),
          ralimentView(
            sizeHeight,
            sizeWidth,
            theme,
            AppColors.tdGreenO,
            '1ère Station',
            'Av. Fizi/Q. Ndendere/C. Ibanda',
          ),
          ralimentView(
            sizeHeight,
            sizeWidth,
            theme,
            AppColors.tdYellowB,
            '2ème Station',
            'Parking du Gouverneur',
          ),
          ralimentView(
            sizeHeight,
            sizeWidth,
            theme,
            AppColors.tdRed,
            '3ème Station',
            'Bureau SNEL/AV. Gouverneur',
          ),
        ],
      ),
    );
  }
}
