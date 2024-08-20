import 'package:flutter/material.dart';

import '../shared.dart';

Container notifIcon(ThemeData theme, color) {
  return Container(
    alignment: Alignment.center,
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: theme.primaryColorLight,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Icon(
          AppIcons.notification,
          color: theme.primaryColorLight,
          size: 15,
        ),
        // Container(
        //   height: sizeHeight * 0.007,
        //   width: sizeHeight * 0.007,
        //   decoration: BoxDecoration(
        //     color: AppColors.tdRed,
        //     borderRadius: BorderRadius.circular(100),
        //   ),
        // ),
      ],
    ),
  );
}
