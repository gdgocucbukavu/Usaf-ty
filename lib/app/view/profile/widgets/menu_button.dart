import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import '../../../routes/routes.dart';
import '../../../shared/shared.dart';
import 'deconnection_dialog.dart';
import 'language.dart';

class IconButtonWithArrow extends StatelessWidget {
  const IconButtonWithArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final cubit = ProfilCubit.get(context);
    final theme = Theme.of(context);
    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              GestureDetector(
                child: listPuller(
                  context,
                  AppIcons.langue,
                  "Langue",
                  AppColors.tdBlue,
                ),
                onTap: () => bottomSheetLangage(context, theme),
              ),
              GestureDetector(
                child: listPuller(
                  context,
                  AppIcons.about,
                  "Apropos",
                  AppColors.tdYellow,
                ),
                onTap: () => context.push(RoutePath.about),
              ),
              GestureDetector(
                onTap: () {
                  if (user == null) {
                    cubit.seConnecter(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return deconnectionDialog(
                          theme,
                          context,
                          cubit,
                          user,
                        );
                      },
                    );
                  }
                },
                child: user != null
                    ? listPuller(
                        context,
                        AppIcons.logout,
                        "Se Déconnecter",
                        AppColors.tdRed,
                      )
                    : listPuller(
                        context,
                        AppIcons.login,
                        "Se Connecter",
                        AppColors.tdGreenO,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//Bouton texte à droite flêche
Widget listPuller(
  BuildContext context,
  IconData icon,
  String text,
  Color color,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    color: Colors.transparent,
    width: double.maxFinite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  icon,
                  color: AppColors.tdWhite,
                  size: 15,
                ),
              ),
            ),
            const Gap(15),
            Text(
              text.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12),
            ),
          ],
        ),
        Icon(
          Icons.navigate_next,
          size: 20,
        )
      ],
    ),
  );
}
