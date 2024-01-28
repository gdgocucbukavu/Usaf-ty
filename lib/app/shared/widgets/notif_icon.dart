import 'package:flutter/material.dart';

import '../shared.dart';

Container notifIcon(sizeHeight, theme, color) {
  return Container(
    alignment: Alignment.center,
    height: sizeHeight * 0.05,
    width: sizeHeight * 0.05,
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
          size: sizeHeight * 0.02,
          color: theme.primaryColorLight,
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
