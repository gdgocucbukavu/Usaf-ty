import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/shared/shared.dart';

class SystemMsg {
  String title;
  String msg;
  dynamic icon;
  dynamic time;
  dynamic color;

  SystemMsg({
    required this.title,
    required this.msg,
    required this.icon,
    required this.time,
    required this.color,
  });
}

List sytemMessages = [
  SystemMsg(
    title: 'Confidentialité & Conditions',
    time: DateFormat.MMMEd().format(DateTime.now()),
    icon: Icons.privacy_tip_outlined,
    color: AppColors.tdBlue,
    msg: "Vos feedback nous aiderons à mieux gérer nos contacts ...",
  ),
  SystemMsg(
    title: 'Mise à jour',
    time: DateFormat.MMMEd().format(DateTime.now()),
    icon: Icons.update,
    color: AppColors.tdYellow,
    msg:
        "Une mise à jour est disponible pour votre version, ne tardez plus ...",
  ),
  SystemMsg(
    title: 'Collections',
    time: DateFormat.MMMEd().format(DateTime.now()),
    icon: CupertinoIcons.bookmark,
    color: AppColors.tdGreenO,
    msg:
        "Commencez une collection maintenant, et obtenez une meilleure expérience ...",
  ),
];
