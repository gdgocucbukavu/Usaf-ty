import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usaficity/app/view/main.view.dart';

import '../../app/view/view.dart';
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

  dynamic counter = 0;

  void incrementCounter() {
    counter++;
    emit(CounterState());
  }

  List screens = [
    const HomeScreen(),
    const ScheduleScreen(),
    const MapsScreen(),
    const ProfileScreen(),
    const OverView(),
  ];

  int i = 0;

  void navigationBar(int index) {
    i = index;
    emit(NavigationBarState());
  }
}
