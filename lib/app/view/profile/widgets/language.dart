import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../controller/cubit/cubit.dart';
import '../../../../controller/state/state.dart';
import '../../../shared/shared.dart';

void bottomSheetLangage(
  context,
  double sizeWidth,
  theme,
) {
  dynamic swBool;
  dynamic frBool;
  dynamic enBool;
  if (EasyLocalization.of(context)!.locale == const Locale('en', 'US')) {
    enBool = true;
    frBool = false;
    swBool = false;
  } else if (EasyLocalization.of(context)!.locale == const Locale('fr', 'FR')) {
    frBool = true;
    enBool = false;
    swBool = false;
  } else if (EasyLocalization.of(context)!.locale == const Locale('sw', 'TZ')) {
    swBool = true;
    frBool = false;
    enBool = false;
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          dynamic cubit = MainCubit.get(context);
          return Container(
            height: sizeWidth * 0.7,
            width: sizeWidth,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Gap(sizeWidth * 0.08),
                Text(
                  "Langue".tr(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Gap(sizeWidth * 0.08),
                GestureDetector(
                  onTap: () => cubit.changeLanguagesToFrench(context),
                  child: lineLanguage(
                    context,
                    sizeWidth,
                    AppIcons.franais,
                    "Français (France)",
                    frBool,
                  ),
                ),
                Gap(sizeWidth * 0.02),
                GestureDetector(
                  onTap: () => cubit.changeLanguagesToEnglish(context),
                  child: lineLanguage(
                    context,
                    sizeWidth,
                    AppIcons.english,
                    "Anglais (USA)",
                    enBool,
                  ),
                ),
                Gap(sizeWidth * 0.02),
                GestureDetector(
                  onTap: () => cubit.changeLanguagesToSwahili(context),
                  child: lineLanguage(
                    context,
                    sizeWidth,
                    AppIcons.swahili,
                    "Swahili (Tanzanie)",
                    swBool,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget lineLanguage(
  context,
  double sizeW,
  dynamic icon,
  String langue,
  dynamic selected,
) {
  return Container(
    margin: EdgeInsets.only(bottom: sizeW * 0.04),
    color: Colors.transparent,
    width: sizeW * 0.8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Flag(
              icon,
              size: sizeW * 0.04,
            ),
            Gap(sizeW * 0.05),
            Text(
              langue.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: sizeW * 0.02),
          child: selected
              ? Icon(
                  AppIcons.validate,
                  size: sizeW * 0.06,
                  color: AppColors.tdGreenO,
                )
              : SizedBox(),
        ),
      ],
    ),
  );
}
