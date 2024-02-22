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
        'Merci pour votre feedback, nous en prendront note ...',
      ),
    );
    emit(SendFeedBackState());
  }
}
