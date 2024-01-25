import 'package:go_router/go_router.dart';
import 'package:usaficity/app/view/main.view.dart';

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
    ],
  );
  return route;
}
