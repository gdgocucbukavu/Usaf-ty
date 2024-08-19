// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/shared/shared.dart';
import '../../app/view/view.dart';
import '../../data/models/feedback.dart';
import '../../data/services/db.dart';
import '../state/state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeThemeMode({bool? darkMode}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (darkMode != null) {
      isDark = darkMode;
    } else {
      isDark = !isDark;
      sharedPreferences.setBool('isDark', isDark);
    }
    emit(ChangeThemeModeState());
  }

  List screens = [
    const HomeScreen(),
    const ScheduleScreen(),
    const MapsScreen(),
    const ProfileScreen(),
  ];

  int i = 0;

  void navigationBar(int index) {
    i = index;
    emit(NavigationBarState());
  }

  dynamic phoneInfo = 'aucune info';

  void getPhoneInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      phoneInfo = androidInfo.model;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      phoneInfo = iosInfo.model;
    }
    emit(GetPhoneInfoState());
  }

  bool feed = false;

  void sendFeedback({context, name, email, content}) async {
    final deviceInfo = DeviceInfoPlugin();
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      phoneInfo = androidInfo.model;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      phoneInfo = iosInfo.model;
    }
    DBServices().addFeedBack(
      FeedBack(name: name, email: email, type: phoneInfo, content: content),
    );
    feed = true;
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackBar(
        context,
        'Merci pour votre feedback, nous en prendront note ...'.tr(),
      ),
    );
    emit(SendFeedBackState());
  }

  dynamic locale = const Locale('fr', 'FR');

  void changeLanguagesToSwahili(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US') ||
        EasyLocalization.of(context)!.locale == const Locale('fr', 'FR')) {
      context.locale = const Locale('sw', 'TZ');
    }
    Navigator.pop(context);
    emit(ChangeLanguagesToSwahili());
  }

  void changeLanguagesToEnglish(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('sw', 'TZ') ||
        EasyLocalization.of(context)!.locale == const Locale('fr', 'FR')) {
      context.locale = const Locale('en', 'US');
    }
    Navigator.pop(context);
    emit(ChangeLanguagesToEnglish());
  }

  void changeLanguagesToFrench(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US') ||
        EasyLocalization.of(context)!.locale == const Locale('sw', 'TZ')) {
      context.locale = const Locale('fr', 'FR');
    }
    Navigator.pop(context);
    emit(ChangeLanguagesToFrench());
  }
}
