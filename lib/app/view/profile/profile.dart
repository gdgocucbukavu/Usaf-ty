import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:usaficity/controller/cubit/profilcubit.dart';
import 'package:usaficity/controller/state/profilstate.dart';

import '../../routes/routes.path.dart';
import 'widgets/components.dart';
import 'widgets/menu_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit1 = ProfilCubit.get(context);
    final cubit = MainCubit.get(context);
    final theme = Theme.of(context);

    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      const Gap(15),
                      GestureDetector(
                        onTap: () => context.push(RoutePath.notification),
                        child: notifIcon(
                          theme,
                          theme.scaffoldBackgroundColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  HeadProfile(),
                  const Gap(15),
                  ControllerOptionButton(),
                  const Gap(15),
                  IconButtonWithArrow(),
                  const Gap(15),
                  cubit1.isConnecting
                      ? Column(
                          children: [
                            CircularProgressIndicator(
                              color: theme.primaryColorLight,
                              strokeWidth: 2,
                            ),
                            const Gap(10),
                            Text(
                              'Connexion ...'.tr(),
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
