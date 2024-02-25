import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import '../../../../data/services/db.dart';
import '../../../routes/routes.dart';
import '../../../shared/shared.dart';
import 'language.dart';

class IconButtonWithArrow extends StatelessWidget {
  const IconButtonWithArrow({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic user = Provider.of<User?>(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic cubit = ProfilCubit.get(context);
    dynamic theme = Theme.of(context);
    return BlocConsumer<ProfilCubit, ProfilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: sizeWidth * 0.02),
              GestureDetector(
                child: listPuller(
                  context,
                  sizeWidth,
                  AppIcons.langue,
                  "Langue",
                  AppColors.tdBlue,
                ),
                onTap: () => bottomSheetLangage(
                  context,
                  sizeWidth,
                  theme,
                ),
              ),
              GestureDetector(
                child: listPuller(
                  context,
                  sizeWidth,
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
                      builder: (context) => AlertDialog(
                        alignment: Alignment.center,
                        backgroundColor: theme.scaffoldBackgroundColor,
                        content: SizedBox(
                          width: sizeWidth * 0.5,
                          height: sizeWidth * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                AppIcons.warn,
                                color: AppColors.tdRed,
                                size: sizeWidth * 0.1,
                              ),
                              const Gap(10),
                              Text(
                                "Veux-tu te déconnecter ?".tr(),
                                style: theme.textTheme.bodySmall.copyWith(
                                  letterSpacing: 2.0,
                                  fontSize: sizeWidth * 0.05,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.all(sizeWidth * 0.02),
                                      child: Text(
                                        'Annuler'.tr(),
                                        style:
                                            theme.textTheme.bodySmall.copyWith(
                                          fontSize: sizeWidth * 0.03,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(20),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      cubit.seDeconnecter();
                                      DBServices().rmvUserLocation(user.email);
                                      context.pop();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.tdRed,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: sizeWidth * 0.02,
                                        horizontal: sizeWidth * 0.04,
                                      ),
                                      child: Text(
                                        'Confirmer'.tr(),
                                        style:
                                            theme.textTheme.bodySmall.copyWith(
                                          fontSize: sizeWidth * 0.03,
                                          color: AppColors.tdBlueB,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: user != null
                    ? listPuller(
                        context,
                        sizeWidth,
                        AppIcons.logout,
                        "Se Déconnecter",
                        AppColors.tdRed,
                      )
                    : listPuller(
                        context,
                        sizeWidth,
                        AppIcons.login,
                        "Se Connecter",
                        AppColors.tdGreenO,
                      ),
              ),
            ],
          );
        });
  }
}

//Bouton texte à droite flêche
Widget listPuller(
  context,
  double sizeW,
  dynamic icon,
  String text,
  Color color,
) {
  return Container(
    margin: EdgeInsets.only(bottom: sizeW * 0.04),
    color: Colors.transparent,
    width: sizeW,
    height: sizeW * 0.1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: sizeW * 0.08,
              height: sizeW * 0.08,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  icon,
                  size: sizeW * 0.04,
                  color: AppColors.tdWhite,
                ),
              ),
            ),
            Gap(sizeW * 0.05),
            Text(
              text.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Icon(
          Icons.navigate_next,
          size: sizeW * 0.06,
        )
      ],
    ),
  );
}
