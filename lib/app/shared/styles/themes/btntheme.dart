import 'package:flutter/material.dart';

import '../colors.dart';

class BtnTheme {
  static ButtonThemeData lightbtnTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.tdYellowB,
      disabledColor: AppColors.tdGrey,
      focusColor: AppColors.tdYellowB,
      highlightColor: AppColors.tdYellow,
      hoverColor: Colors.transparent,
      splashColor: AppColors.tdYellow,
      minWidth: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(
          color: AppColors.tdYellowB,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      height: 50,
      textTheme: ButtonTextTheme.normal,
    );
  }

  static ButtonThemeData darkbtnTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.tdYellowB,
      disabledColor: AppColors.tdGrey,
      focusColor: AppColors.tdYellowB,
      highlightColor: AppColors.tdYellow,
      hoverColor: Colors.transparent,
      splashColor: AppColors.tdYellow,
      minWidth: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: BorderSide(
          color: AppColors.tdYellowB,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      height: 50,
      textTheme: ButtonTextTheme.normal,
    );
  }
}
