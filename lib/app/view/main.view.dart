import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../controller/cubit/cubit.dart';
import '../../controller/state/state.dart';
import '../shared/shared.dart';

class MainView extends StatelessWidget {
  static const route = '/main';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = MainCubit.get(context);
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              cubit.screens[cubit.i],
              Positioned(
                left: 10,
                right: 10,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: theme.primaryColorLight,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: theme.highlightColor.withOpacity(0.9),
                  ),
                  width: sizeWidth,
                  height: 70,
                  margin: EdgeInsets.only(top: 2),
                  child: Container(),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: -5,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    elevation: 0,
                    indicatorColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    labelTextStyle: WidgetStatePropertyAll(
                      GoogleFonts.poppins(
                        color: AppColors.tdYellowB,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5,
                        fontSize: 7,
                      ),
                    ),
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    labelBehavior:
                        NavigationDestinationLabelBehavior.onlyShowSelected,
                  ),
                  child: NavigationBar(
                    backgroundColor: Colors.transparent,
                    animationDuration: const Duration(microseconds: 500),
                    onDestinationSelected: (value) {
                      cubit.navigationBar(value);
                    },
                    selectedIndex: cubit.i,
                    destinations: [
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.home,
                          color: theme.primaryColorLight,
                          size: 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.homeB,
                          color: theme.primaryColor,
                          size: 30,
                        ),
                        label: 'Accueil'.tr(),
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.calendar,
                          color: theme.primaryColorLight,
                          size: 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.calendarB,
                          color: theme.primaryColor,
                          size: 30,
                        ),
                        label: 'Horaire'.tr(),
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.maps,
                          color: theme.primaryColorLight,
                          size: 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.mapsB,
                          color: theme.primaryColor,
                          size: 30,
                        ),
                        label: 'Map'.tr(),
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.account,
                          color: theme.primaryColorLight,
                          size: 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.accountB,
                          color: theme.primaryColor,
                          size: 30,
                        ),
                        label: 'Profil'.tr(),
                        tooltip: '',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
