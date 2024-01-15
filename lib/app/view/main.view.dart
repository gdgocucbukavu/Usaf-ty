import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/cubit/cubit.dart';
import '../../controller/state/state.dart';
import '../shared/shared.dart';

class MainView extends StatelessWidget {
  static dynamic route = '/';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic cubit = MainCubit.get(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                    color: AppColors.tdBlack.withOpacity(0.5),
                  ),
                  width: sizeWidth,
                  height: sizeHeight * 0.08,
                  margin: EdgeInsets.only(top: sizeWidth * 0.02),
                  child: Container(),
                ),
              ),
              Positioned(
                top: sizeHeight * 0.88,
                left: sizeWidth * 0.05,
                right: sizeWidth * 0.05,
                bottom: sizeHeight * 0.02,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    elevation: 0,
                    indicatorColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    labelTextStyle: MaterialStatePropertyAll(
                      GoogleFonts.poppins(
                        color: AppColors.tdYellowB,
                        fontSize: sizeHeight * 0.01,
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
                          color: AppColors.tdGrey,
                          size: sizeWidth / 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.homeB,
                          color: theme.primaryColor,
                          size: sizeWidth / 15,
                        ),
                        label: 'Accueil',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.calendar,
                          color: AppColors.tdGrey,
                          size: sizeWidth / 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.calendarB,
                          color: theme.primaryColor,
                          size: sizeWidth / 16,
                        ),
                        label: 'Horaire',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.maps,
                          color: AppColors.tdGrey,
                          size: sizeWidth / 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.mapsB,
                          color: theme.primaryColor,
                          size: sizeWidth / 15,
                        ),
                        label: 'Maps',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.account,
                          color: AppColors.tdGrey,
                          size: sizeWidth / 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.accountB,
                          color: theme.primaryColor,
                          size: sizeWidth / 15,
                        ),
                        label: 'Profil',
                        tooltip: '',
                      ),
                      NavigationDestination(
                        icon: Icon(
                          AppIcons.view,
                          color: AppColors.tdGrey,
                          size: sizeWidth / 20,
                        ),
                        selectedIcon: Icon(
                          AppIcons.viewB,
                          color: theme.primaryColor,
                          size: sizeWidth / 15,
                        ),
                        label: 'OverView',
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

class OverView extends StatelessWidget {
  static dynamic route = '/overview';
  const OverView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic cubit = MainCubit.get(context);
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () => cubit.changeThemeMode(),
                child: Icon(
                  cubit.isDark ? AppIcons.lightMode : AppIcons.darkMode,
                ),
              ),
              Gap(sizeWidth * 0.05),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Text("Usaf'ty", style: theme.textTheme.displayLarge),
              Text('Hello', style: theme.textTheme.titleLarge),
              Text('Salut', style: theme.textTheme.headlineLarge),
              Text('Kevin', style: theme.textTheme.headlineMedium),
              Text('Bénédicte',
                  style: Theme.of(context).textTheme.headlineSmall),
              Text('Georges', style: Theme.of(context).textTheme.titleSmall),
              Text('Byona', style: Theme.of(context).textTheme.displayMedium),
              Text('Lumbex', style: Theme.of(context).textTheme.displaySmall),
              Text('Kish', style: Theme.of(context).textTheme.titleMedium),
              Text('Losingson', style: Theme.of(context).textTheme.bodyMedium),
              Text("Usaf'ty", style: Theme.of(context).textTheme.bodySmall),
              Text("azertyuiolkjhgfdswxcvbn,",
                  style: Theme.of(context).textTheme.labelMedium),
              Text("error error error error error error",
                  style: Theme.of(context).textTheme.labelSmall),
              Text('${cubit.counter}',
                  style: Theme.of(context).textTheme.displayMedium),
              AppImages.agents,
              AppImages.agentsv,
              AppImages.bluepoub,
              AppImages.cleancity,
              AppImages.cleancityv,
              AppImages.greenpoub,
              AppImages.redpoub,
              AppImages.tri,
              AppImages.triv,
              AppImages.yellowpoub,
              AppImages.logo,
              AppImages.logol,
              AppImages.launcherIcon,
              Container(height: 50, color: AppColors.tdBlack),
              Container(height: 50, color: AppColors.tdBlackO),
              Container(height: 50, color: AppColors.tdWhite),
              Container(height: 50, color: AppColors.tdWhiteO),
              Container(height: 50, color: AppColors.tdBlue),
              Container(height: 50, color: AppColors.tdBlueB),
              Container(height: 50, color: AppColors.tdGreenO),
              Container(height: 50, color: AppColors.tdGrey),
              Container(height: 50, color: AppColors.tdOrange),
              Container(height: 50, color: AppColors.tdRed),
              Container(height: 50, color: AppColors.tdYellow),
              Container(height: 50, color: AppColors.tdYellowB),
            ],
          ),
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: sizeHeight * 0.1),
            child: FloatingActionButton(
              onPressed: () => cubit.incrementCounter(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
