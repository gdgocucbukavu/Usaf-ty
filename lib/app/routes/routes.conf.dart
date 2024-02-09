import 'package:go_router/go_router.dart';
import 'package:usaficity/app/view/main.view.dart';
import 'package:usaficity/app/view/profile/screens/conseil.dart';
import 'package:usaficity/app/view/profile/screens/privacy.dart';
import 'package:usaficity/app/view/profile/screens/signalement.dart';
import 'package:usaficity/app/view/profile/widgets/about.dart';

import '../view/view.dart';
import 'routes.path.dart';
import 'routes.name.dart';

returnRoute(bool isConnected) {
  GoRouter route = GoRouter(
    initialLocation: RoutePath.mainview,
    routes: [
      GoRoute(
        name: RouteName.auth,
        path: RoutePath.auth,
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        name: RouteName.mainView,
        path: RoutePath.mainview,
        builder: (context, state) => MainView(),
      ),
      GoRoute(
        name: RouteName.notification,
        path: RoutePath.notification,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        name: RouteName.about,
        path: RoutePath.about,
        builder: (context, state) => AboutPage(),
      ),
      GoRoute(
        name: RouteName.conseil,
        path: RoutePath.conseil,
        builder: (context, state) => Conseil(),
      ),
      GoRoute(
        name: RouteName.privacy,
        path: RoutePath.privacy,
        builder: (context, state) => Privacy(),
      ),
      GoRoute(
        name: RouteName.signaler,
        path: RoutePath.signaler,
        builder: (context, state) => SignalPage(),
      ),
      GoRoute(
        name: RouteName.schedule,
        path: RoutePath.schedule,
        builder: (context, state) => ScheduleScreen(),
      ),
    ],
  );
  return route;
}
