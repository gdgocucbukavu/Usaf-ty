import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/shared/shared.dart';

class SystemMsg {
  String title;
  String msg;
  dynamic icon;
  dynamic image;
  dynamic time;
  dynamic color;

  SystemMsg({
    required this.title,
    required this.msg,
    required this.time,
    required this.color,
    this.image,
    this.icon,
  });
}

List sytemMessages = [
  SystemMsg(
    title: 'Mise à jour',
    time: DateFormat.MMMEd().format(DateTime.now()),
    icon: Icons.update,
    color: AppColors.tdYellow,
    msg:
        "Une mise à jour est disponible pour votre version, ne tardez plus à être à jour et ne rien manquer de nouveau pour une meilleure expérience",
  ),
  SystemMsg(
    title: 'Confidentialité & Conditions',
    time: DateFormat.MMMEd().format(DateTime.now()),
    icon: AppIcons.privacy,
    color: AppColors.tdOrange,
    msg:
        "Vous vous demander comment nous gérons vos données, lisez la confidentialité et les conditions de notre application ici",
  ),
  SystemMsg(
    title: 'IA',
    time: DateFormat.MMMEd().format(DateTime.now()),
    image: AppImages.ia2,
    color: AppColors.tdWhite,
    msg:
        "Commencez à participer au bien être de la société en fournissant à l'application des données en image ou en texte sur des déchets à la maison et partout.",
  ),
  SystemMsg(
    title: 'Conseils',
    time: DateFormat.MMMEd().format(DateTime.now()),
    icon: CupertinoIcons.pen,
    color: AppColors.tdGreenO,
    msg:
        "N'hésitez pas de lacher des conseils pour une bonne gérance des déchets, que ça soit pour les agents se chargeant de ce services ou la population qui utilise l'application.",
  ),
];
