import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/routes.dart';
import 'app/shared/shared.dart';
import 'controller/state/mapstate.dart';
import 'controller/state/state.dart';
import 'controller/cubit/cubit.dart';
import 'package:provider/provider.dart';
import 'controller/cubit/mapcubit.dart';
import 'controller/cubit/homecubit.dart';
import 'controller/cubit/profilcubit.dart';
import 'data/services/db.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isDark = sharedPreferences.getBool('isDark') ?? false;
  initializeDateFormatting('en_US', null);
  runApp(MultiProvider(providers: [
    StreamProvider.value(value: DBServices().user, initialData: null),
  ], child: Usafty(isDark: isDark)));
}

class Usafty extends StatelessWidget {
  const Usafty({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()
            ..changeThemeMode(darkMode: isDark)
            ..getPhoneInfo(),
        ),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => MapCubit()..getCurrentLocation()),
        BlocProvider(create: (context) => ProfilCubit()),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          dynamic cubit = MainCubit.get(context);
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  cubit.isDark ? Brightness.dark : Brightness.light,
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness:
                  cubit.isDark ? Brightness.dark : Brightness.light,
              systemNavigationBarColor:
                  cubit.isDark ? AppColors.tdWhiteO : AppColors.tdBlackO,
            ),
          );
          return BlocConsumer<MapCubit, MapState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: "Usaf'ty",
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: cubit.isDark ? ThemeMode.light : ThemeMode.dark,
                routerConfig: router,
              );
            },
          );
        },
      ),
    );
  }
}
