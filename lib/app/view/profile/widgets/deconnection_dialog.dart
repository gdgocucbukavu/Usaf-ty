import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../data/services/db.dart';
import '../../../shared/shared.dart';

Widget deconnectionDialog(
  ThemeData theme,
  BuildContext context,
  ProfilCubit cubit,
  User user,
) {
  return SimpleDialog(
    alignment: Alignment.center,
    backgroundColor: theme.scaffoldBackgroundColor,
    children: [
      Icon(
        AppIcons.warn,
        color: AppColors.tdRed,
        size: 50,
      ),
      const Gap(10),
      Text(
        "Veux-tu te déconnecter ?".tr(),
        style: theme.textTheme.bodySmall!.copyWith(
          letterSpacing: 2.0,
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
      ),
      const Gap(15),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 35,
              child: Text(
                'Annuler'.tr(),
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          Gap(20),
          GestureDetector(
            onTap: () {
              cubit.seDeconnecter();
              DBServices().rmvUserLocation(user.email);
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.tdRed,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 35,
              child: Text(
                'Confirmer'.tr(),
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: AppColors.tdBlueB,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      const Gap(10),
    ],
  );
}
