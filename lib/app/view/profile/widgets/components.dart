import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icons.dart';

//Bouton texte à droite flêche
Widget listPuller(
    context, double sizeW, dynamic ico, String texts, Color colur) {
  return Container(
    margin: EdgeInsets.only(bottom: sizeW * 0.04),
    width: sizeW * 0.87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: sizeW * 0.08,
              height: sizeW * 0.08,
              decoration: BoxDecoration(color: colur, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                ico,
                size: sizeW * 0.04,
                color: Colors.white,
              )),
            ),
            SizedBox(
              width: 10,
            ),
            Text(texts, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Icon(
          Icons.navigate_next,
          size: sizeW * 0.06,
          color: AppColors.tdGrey,
        )
      ],
    ),
  );
}

//Adresse de localisation
Widget adresseLocal(context, double sizeHe, List<String> adresse, dynamic th) {
  return Container(
    margin: EdgeInsets.only(bottom: sizeHe * 0.04),
    width: sizeHe * 0.87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          AppIcons.mapPin,
          color: th.primaryColorLight,
        ),
        SizedBox(
          width: sizeHe * 0.02,
        ),
        Text(' ${adresse[0]} / ${adresse[1]} / ${adresse[2]}',
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}

//Numéro de téléphone
Widget numberCountry(context, double sizeHe, String tel, dynamic th) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: sizeHe * 0.011),
    width: sizeHe * 0.87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flag(
          AppIcons.rdcFlag,
          size: sizeHe * 0.06,
        )
        //color: th.primaryColorLight,
        ,
        SizedBox(
          width: sizeHe * 0.01,
        ),
        Icon(
          AppIcons.arrowDown,
          color: th.primaryColorLight,
        ),
        SizedBox(
          width: sizeHe * 0.02,
        ),
        Text(' $tel', style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}

//Abonnement Information
Widget abonnementStruct(
    context, double sizew, String logoImg, String agenceName, String fret) {
  dynamic theme = Theme.of(context);
  return Container(
    margin: EdgeInsets.only(bottom: sizew * 0.04),
    width: sizew * 0.87,
    child: Row(
      children: [
        Container(
          width: sizew * 0.15,
          height: sizew * 0.15,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('$logoImg'),
              ),
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1, color: AppColors.tdGrey, style: BorderStyle.solid)),
        ),
        SizedBox(
          width: sizew * 0.05,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$agenceName',
                style: theme.textTheme.bodyMedium
                    .copyWith(color: AppColors.tdYellowB)),
            Container(
              margin: EdgeInsets.only(
                bottom: sizew * 0.005,
                top: sizew * 0.005,
              ),
              width: sizew * 0.3,
              height: sizew * 0.001,
              color: AppColors.tdGrey,
            ),
            Text('Abonnement', style: Theme.of(context).textTheme.bodySmall),
            Text("$fret", style: Theme.of(context).textTheme.bodySmall),
          ],
        )
      ],
    ),
  );
}

//
Widget boutonC(context, double sizeh, double sizew, dynamic ico, String txt) {
  return Container(
    margin: EdgeInsets.only(right: sizew * 0.02),
    width: sizew * 0.27,
    height: sizew * 0.20,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          ico,
          size: sizew * 0.10,
        ),
        SizedBox(
          height: sizew * 0.02,
        ),
        Text("$txt", style: Theme.of(context).textTheme.bodySmall),
      ],
    ),
  );
}
