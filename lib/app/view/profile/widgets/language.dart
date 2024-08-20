import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../controller/cubit/cubit.dart';
import '../../../../controller/state/state.dart';
import '../../../shared/shared.dart';

void bottomSheetLangage(
  BuildContext context,
  ThemeData theme,
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
          final cubit = MainCubit.get(context);
          return Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                const Gap(20),
                Text(
                  "Langue".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 25),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () => cubit.changeLanguagesToFrench(context),
                  child: lineLanguage(
                    context,
                    AppIcons.franais,
                    "Français (France)",
                    frBool,
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () => cubit.changeLanguagesToEnglish(context),
                  child: lineLanguage(
                    context,
                    AppIcons.english,
                    "Anglais (USA)",
                    enBool,
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () => cubit.changeLanguagesToSwahili(context),
                  child: lineLanguage(
                    context,
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
  BuildContext context,
  String icon,
  String langue,
  dynamic selected,
) {
  return Container(
    color: Colors.transparent,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Flag(
              icon,
              size: 20,
            ),
            const Gap(10),
            Text(
              langue.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 11),
            ),
          ],
        ),
        selected
            ? Icon(
                AppIcons.validate,
                size: 20,
                color: AppColors.tdGreenO,
              )
            : SizedBox(),
      ],
    ),
  );
}
