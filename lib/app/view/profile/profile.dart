import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/cubit.dart';
import 'package:usaficity/controller/cubit/profilcubit.dart';
import 'package:usaficity/controller/state/profilstate.dart';

import '../../routes/routes.path.dart';
import 'widgets/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic cubit = MainCubit.get(context);
    dynamic theme = Theme.of(context);

    return BlocConsumer<ProfilCubic, ProfilState>(
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
              GestureDetector(
                onTap: () => context.push(RoutePath.notification),
                child: notifIcon(
                  sizeHeight,
                  theme,
                  theme.scaffoldBackgroundColor.withOpacity(0.5),
                ),
              ),
              Gap(sizeWidth * 0.05),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: sizeWidth,
                padding: EdgeInsets.only(
                  top: sizeHeight * 0.02,
                  left: sizeWidth * 0.05,
                  right: sizeWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeadProfile(),
                    ControllerOptionButton(),
                    Divider(
                      height: 0.6,
                      color: AppColors.tdGrey,
                      indent: sizeWidth * 0.1,
                      endIndent: sizeWidth * 0.1,
                    ),
                    Gap(sizeHeight * 0.02),
                    IconButtonFleche(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
