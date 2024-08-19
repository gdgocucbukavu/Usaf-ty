import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';
import 'txttheme.dart';
import 'btntheme.dart';

class AppTheme {
  static dynamic lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.tdWhite,
      onPrimary: AppColors.tdWhiteO,
      secondary: AppColors.tdBlueB,
      onSecondary: AppColors.tdBlue,
      error: AppColors.tdRed,
      onError: AppColors.tdRed.withOpacity(0.7),
      surface: AppColors.tdWhite,
      onSurface: AppColors.tdWhiteO,
    ),
    primaryColor: AppColors.tdYellowB,
    primaryColorDark: AppColors.tdBlackO,
    primaryColorLight: AppColors.tdBlack,
    scaffoldBackgroundColor: AppColors.tdWhiteO,
    highlightColor: AppColors.tdWhite,
    unselectedWidgetColor: AppColors.tdGrey,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: AppColors.tdBlack),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      foregroundColor: AppColors.tdBlack,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.tdWhiteO,
      ),
    ),
    textTheme: TxtTheme.lighttxtTheme,
    buttonTheme: BtnTheme.lightbtnTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.tdYellowB,
      enableFeedback: false,
      focusColor: AppColors.tdYellowB.withOpacity(0.8),
      foregroundColor: AppColors.tdBlack,
      hoverColor: AppColors.tdYellow,
      splashColor: AppColors.tdYellow,
    ),
  );

  static dynamic darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.tdBlack,
      onPrimary: AppColors.tdBlackO,
      secondary: AppColors.tdBlueB,
      onSecondary: AppColors.tdBlue,
      error: AppColors.tdRed,
      onError: AppColors.tdRed.withOpacity(0.7),
      surface: AppColors.tdBlack,
      onSurface: AppColors.tdBlackO,
    ),
    primaryColor: AppColors.tdYellowB,
    primaryColorDark: AppColors.tdWhiteO,
    primaryColorLight: AppColors.tdWhite,
    scaffoldBackgroundColor: AppColors.tdBlackO,
    highlightColor: AppColors.tdBlack,
    unselectedWidgetColor: AppColors.tdGrey,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: AppColors.tdWhite),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      foregroundColor: AppColors.tdWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.tdBlackO,
      ),
    ),
    textTheme: TxtTheme.darktxtTheme,
    buttonTheme: BtnTheme.darkbtnTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.tdYellowB,
      enableFeedback: false,
      focusColor: AppColors.tdYellowB.withOpacity(0.8),
      foregroundColor: AppColors.tdBlack,
      hoverColor: AppColors.tdYellow,
      splashColor: AppColors.tdYellow,
    ),
  );
}
