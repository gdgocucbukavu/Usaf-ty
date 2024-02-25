import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:usaficity/app/shared/styles/colors.dart';

// ignore: must_be_immutable
class HeaderTextPage extends StatelessWidget {
  HeaderTextPage({super.key});
  Random random = Random();
  double textSize = 13.0;
  @override
  Widget build(BuildContext context) {
    //LIST TOOLS
    dynamic headertext1 = Text.rich(TextSpan(
        text: "Une ville ".tr(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "plus propre ".tr(),
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: "pour une santé ".tr(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "plus saine".tr(),
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ]));

    dynamic headertext2 = Text.rich(
      TextSpan(
        text: "Gardez la ville ".tr(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "propre ".tr(),
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: "et la propreté ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "vous gardera".tr(),
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
    dynamic headertext3 = Text.rich(TextSpan(
        text: "L'environnement est notre ".tr(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "maison commune".tr(),
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ", prenez en bien ".tr(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "soin".tr(),
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ]));

    dynamic headertext4 = Text.rich(TextSpan(
        text: "Bien gérer ".tr(),
        style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize),
        children: [
          TextSpan(
            text: "les déchets ".tr(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "améliore ".tr(),
            style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize),
          ),
          TextSpan(
            text: "l'état du climat.".tr(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ]));

    //LIST BUILD
    dynamic headerTextList = [
      headertext1,
      headertext2,
      headertext3,
      headertext4,
    ];
    int randomnumber = random.nextInt(headerTextList.length);

    return headerTextList[randomnumber];
  }
}
