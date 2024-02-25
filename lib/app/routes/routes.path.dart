import 'package:usaficity/app/view/main.view.dart';
import 'package:usaficity/app/view/profile/screens/conseil.dart';
import 'package:usaficity/app/view/profile/screens/privacy.dart';
import 'package:usaficity/app/view/profile/screens/signalement.dart';
import 'package:usaficity/app/view/profile/widgets/about.dart';

import '../view/view.dart';

class RoutePath {
  static dynamic mainview = MainView.route;
  static dynamic notification = NotificationScreen.route;
  static dynamic about = AboutPage.route;
  static dynamic conseil = Conseil.route;
  static dynamic privacy = Privacy.route;
  static dynamic signaler = SignalPage.route;
  static dynamic schedule = ScheduleScreen.route;
}
