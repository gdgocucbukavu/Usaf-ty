import 'package:flutter/material.dart';
import 'dart:math';
import 'package:usaficity/app/shared/styles/colors.dart';

class HeaderTextPage extends StatelessWidget {
  HeaderTextPage({super.key});
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    //LIST TOOLS
    dynamic headertext1 = Text.rich(TextSpan(
        text: "Une ville ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "plus propre ",
              style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0)),
          TextSpan(
            text: "pour une santé ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "plus saine",
              style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ]));

    dynamic headertext2 = Text.rich(TextSpan(
        text: "Gardez la ville ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "propre ",
              style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0)),
          TextSpan(
            text: "et la propreté ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "vous gardera",
              style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ]));
    dynamic headertext3 = Text.rich(TextSpan(
        text: "L'environnement est notre ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "maison commune",
              style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0)),
          TextSpan(
            text: ", prenez en bien ",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: "soin",
              style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0)),
          TextSpan(
            text: ".",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ]));

    dynamic headertext4 = Text.rich(TextSpan(
        text: "Bien gérer ",
        style: TextStyle(color: AppColors.tdGrey, fontSize: 18.0),
        children: [
          TextSpan(
              text: "les déchets ",
              style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),),
          TextSpan(
            text: "améliore ",
            style:TextStyle(color: AppColors.tdGrey, fontSize: 18.0),
          ),
          TextSpan(
            text: "l'état du climat.",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ]));

    //LIST BUILD
    dynamic HeaderTextList = [
      headertext1,
      headertext2,
      headertext3,
      headertext4,
    ];
    int randomnumber = random.nextInt(HeaderTextList.length);

    return HeaderTextList[randomnumber];
  }
}
