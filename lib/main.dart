import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:usaficity/app/routes/routes.conf.dart';
import 'package:usaficity/controller/cubit/homecubit.dart';
import 'package:usaficity/controller/cubit/profilcubit.dart';

import 'app/shared/shared.dart';
import 'controller/cubit/cubit.dart';
import 'controller/cubit/mapcubit.dart';
import 'controller/state/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isDark = sharedPreferences.getBool('isDark') ?? false;
  initializeDateFormatting('en_US', null);
  runApp(Usafty(isDark: isDark));
}

class Usafty extends StatelessWidget {
  const Usafty({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()..changeThemeMode(darkMode: isDark),
        ),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => MapCubit()..getCurrentLocation()
            // ..getPolyPoints(),
            ),
        BlocProvider(create: (context) => ProfilCubic()),
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
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Usaf'ty",
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.isDark ? ThemeMode.light : ThemeMode.dark,
            routerConfig: returnRoute(false),
          );
        },
      ),
    );
  }
}
