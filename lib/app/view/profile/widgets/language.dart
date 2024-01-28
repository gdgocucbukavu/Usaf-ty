import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icons.dart';

void bottomSheetLangage(context, double sizeHeight, double sizeWidth, theme) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<ProfilCubic, ProfilState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                height: sizeHeight * 0.8,
                width: sizeWidth,
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeHeight * 0.05,
                    ),
                    Text(
                      "Langue",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(
                      height: sizeHeight * 0.15,
                    ),
                    GestureDetector(
                      child: ProfilCubic.get(context).c1
                          ? lineLanguage(context, sizeWidth, AppIcons.franais,
                              "Français (Paris)", true)
                          : lineLanguage(context, sizeWidth, AppIcons.franais,
                              "Français (Paris)", false),
                      onTap: () => ProfilCubic.get(context).selectLanguage(0),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.02,
                    ),
                    GestureDetector(
                      child: ProfilCubic.get(context).c2
                          ? lineLanguage(context, sizeWidth, AppIcons.english,
                              "Anglais (USA)", true)
                          : lineLanguage(context, sizeWidth, AppIcons.english,
                              "Anglais (USA)", false),
                      onTap: () => ProfilCubic.get(context).selectLanguage(1),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.02,
                    ),
                    GestureDetector(
                      child: lineLanguage(context, sizeWidth, AppIcons.swahili,
                          "Swahili (Tanzani)", ProfilCubic.get(context).c3),
                      onTap: () => ProfilCubic.get(context).selectLanguage(2),
                    ),
                  ],
                ),
              );
            });
      });
}

Widget lineLanguage(
    context, double sizeW, dynamic ico, String langue, bool valid) {
  return Container(
    margin: EdgeInsets.only(bottom: sizeW * 0.04),
    width: sizeW * 0.87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Flag(
              ico,
              size: sizeW * 0.04,
            ),
            SizedBox(
              width: 10,
            ),
            Text(langue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: sizeW * 0.02),
          child: valid
              ? Icon(
                  AppIcons.validate,
                  size: sizeW * 0.06,
                  color: AppColors.tGreenC,
                )
              : SizedBox(),
        ),
      ],
    ),
  );
}
