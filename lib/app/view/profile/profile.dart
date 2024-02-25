import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usaficity/controller/cubit/cubit.dart';
import 'package:usaficity/controller/cubit/profilcubit.dart';
import 'package:usaficity/controller/state/profilstate.dart';

import '../../routes/routes.path.dart';
import 'widgets/components.dart';
import 'widgets/menu_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic user = Provider.of<User?>(context);
    dynamic cubit1 = ProfilCubit.get(context);
    dynamic cubit = MainCubit.get(context);
    dynamic theme = Theme.of(context);

    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: sizeWidth,
            padding: EdgeInsets.only(
              top: sizeWidth * 0.12,
              left: sizeWidth * 0.05,
              right: sizeWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                  ],
                ),
                Gap(sizeWidth * 0.1),
                HeadProfile(),
                Gap(sizeWidth * 0.05),
                ControllerOptionButton(),
                Gap(sizeWidth * 0.05),
                IconButtonWithArrow(),
                Gap(sizeWidth * 0.1),
                cubit1.isConnecting && user == null
                    ? Column(
                        children: [
                          CircularProgressIndicator(
                            color: theme.primaryColorLight,
                            strokeWidth: 2,
                          ),
                          Gap(sizeWidth * 0.02),
                          Text(
                            'Connexion ...'.tr(),
                            style: TextStyle(
                              fontSize: sizeWidth * 0.02,
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
