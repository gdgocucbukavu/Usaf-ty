import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cubit/cubit.dart';
import '../../controller/state/state.dart';
import '../shared/shared.dart';

class MainView extends StatelessWidget {
  static dynamic route = '/main';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic cubit = MainCubit.get(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              cubit.screens[cubit.i],
              Positioned(
                left: sizeWidth * 0.02,
                right: sizeWidth * 0.02,
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
                  height: sizeWidth * 0.17,
                  margin: EdgeInsets.only(top: 2),
                  child: Container(),
                ),
              ),
              Positioned(
                left: sizeWidth * 0.05,
                right: sizeWidth * 0.05,
                bottom: 0,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    elevation: 0,
                    indicatorColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    labelTextStyle: MaterialStatePropertyAll(
                      GoogleFonts.poppins(
                        color: AppColors.tdYellowB,
                        fontSize: sizeWidth * 0.015,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5,
                      ),
                    ),
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    labelBehavior:
                        NavigationDestinationLabelBehavior.onlyShowSelected,
                  ),
                  child: NavigationBar(
                    backgroundColor: Colors.transparent,
                    animationDuration: const Duration(microseconds: 500),
                    onDestinationSelected: (value) =>
                        cubit.navigationBar(value),
                    selectedIndex: cubit.i,
                    destinations: [
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.home,
                          color: theme.primaryColorLight,
                          size: sizeWidth * 0.05,
                        ),
                        selectedIcon: Icon(
                          AppIcons.homeB,
                          color: theme.primaryColor,
                          size: sizeWidth * 0.07,
                        ),
                        label: 'Accueil',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.calendar,
                          color: theme.primaryColorLight,
                          size: sizeWidth * 0.05,
                        ),
                        selectedIcon: Icon(
                          AppIcons.calendarB,
                          color: theme.primaryColor,
                          size: sizeWidth * 0.07,
                        ),
                        label: 'Horaire',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.maps,
                          color: theme.primaryColorLight,
                          size: sizeWidth * 0.05,
                        ),
                        selectedIcon: Icon(
                          AppIcons.mapsB,
                          color: theme.primaryColor,
                          size: sizeWidth * 0.07,
                        ),
                        label: 'Maps',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.account,
                          color: theme.primaryColorLight,
                          size: sizeWidth * 0.05,
                        ),
                        selectedIcon: Icon(
                          AppIcons.accountB,
                          color: theme.primaryColor,
                          size: sizeWidth * 0.07,
                        ),
                        label: 'Profile',
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
