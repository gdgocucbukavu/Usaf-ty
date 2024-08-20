import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../controller/cubit/cubit.dart';
import '../../../shared/shared.dart';

SimpleDialog feedBackDialog(
  ThemeData theme,
  String content,
  BuildContext context,
  User user,
) {
  final font = theme.textTheme.labelMedium;
  return SimpleDialog(
    backgroundColor: theme.highlightColor,
    title: Text(
      'Feedback',
      style: TextStyle(
        color: theme.primaryColorDark,
        fontSize: 18,
      ),
    ),
    alignment: Alignment.center,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    children: [
      TextFormField(
        onChanged: (value) {
          content = value;
        },
        maxLines: null,
        cursorColor: theme.primaryColorLight,
        style: font!.copyWith(
          color: theme.primaryColorLight,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: "Faites nous savoir !".tr(),
          hintStyle: font,
          border: InputBorder.none,
        ),
      ),
      const Gap(20),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
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
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 10),
              ),
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              MainCubit().sendFeedback(
                context: context,
                content: content,
                email: user.email,
                name: user.displayName,
              );
              context.pop();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 35,
              child: Text(
                'Envoyer'.tr(),
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: AppColors.tdBlueB,
                ),
              ),
            ),
          ),
        ],
      ),
      const Gap(20),
    ],
  );
}
