import 'package:flutter/material.dart';
import 'dart:math';
import 'package:usaficity/app/shared/styles/colors.dart';

// ignore: must_be_immutable
class HeaderTextPage extends StatelessWidget {
  HeaderTextPage({super.key});
  Random random = Random();
double textSize=13.0;
  @override
  Widget build(BuildContext context) {
    //LIST TOOLS
    dynamic headertext1 = Text.rich(TextSpan(
        text: "Une ville ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "plus propre ",
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: "pour une santé ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "plus saine",
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ]));

    dynamic headertext2 = Text.rich(TextSpan(
        text: "Gardez la ville ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "propre ",
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: "et la propreté ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "vous gardera",
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ]));
    dynamic headertext3 = Text.rich(TextSpan(
        text: "L'environnement est notre ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "maison commune",
              style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize)),
          TextSpan(
            text: ", prenez en bien ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "soin",
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
        text: "Bien gérer ",
        style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize),
        children: [
          TextSpan(
            text: "les déchets ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize:textSize, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "améliore ",
            style: TextStyle(color: AppColors.tdYellowB, fontSize: textSize),
          ),
          TextSpan(
            text: "l'état du climat.",
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
