import 'package:flutter/cupertino.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:usaficity/app/routes/routes.dart';
import 'package:usaficity/app/shared/shared.dart';

class Msg {
  String? name;
  String? msg;
  dynamic image;
  dynamic icon;
  dynamic color;
  dynamic path;
  dynamic parametre;
  bool isString = false;
  bool haveIcon = false;
  DateTime date;

  Msg({
    required this.name,
    required this.msg,
    required this.date,
    required this.haveIcon,
    required this.isString,
    this.path,
    this.parametre,
    this.image,
    this.icon,
    this.color,
  });
}

List msgs = [
  Msg(
    name: 'IITA/RUNRES',
    isString: true,
    haveIcon: false,
    date: DateTime.now(),
    image:
        'https://storage.googleapis.com/images.businesspagescongo.com/15b9c12b-bae1-4b8d-b13c-8c0b4d00f218.png',
    msg:
        "Un programme appuyé par IITA/RUNRES et exécuté par l'asbl les BONS SAMARITAINS vous permet de pouvoir gérer vos déchêts d'une manière responsable et toujours garder la parcelle propre.",
  ),
  Msg(
    name: 'Station',
    isString: false,
    haveIcon: true,
    icon: Clarity.map_marker_outline_badged,
    color: AppColors.tdYellow,
    msg:
        "Cher client, nous tenons à vous signaler que notre Station de la Place du 24 est déplacé pour des raisons publiques vers l'entrée du port Emmanuel non loin de l'hôtel X",
    date: DateTime.now(),
  ),
  Msg(
    name: 'Tri des déchêts',
    isString: false,
    haveIcon: false,
    icon: AppImages.gaspillage,
    msg:
        "Selon les normes du triage des déchêts au niveau universel, il nous est disposé 6 poubelles de différentes couleurs ...",
    date: DateTime.now(),
  ),
  Msg(
    name: "Véhicule en approches",
    isString: false,
    haveIcon: true,
    date: DateTime.now(),
    icon: Clarity.car_line,
    color: AppColors.tdGreenO,
    path: RoutePath.mainview,
    parametre: 3,
    msg:
        "L'agence est à 1km de chez vous, veuillez vous tenir prêt en arrangeant vos déchêts à telle sorte qu'il soit prêt à être embarquer !",
  ),
  Msg(
    name: 'Conseil IA',
    isString: false,
    haveIcon: false,
    icon: AppImages.ia1,
    msg:
        "La gestion des déchêts nous aide nos seulement à bien structurer nos odrures mais aussi à diminuer la pollution de l'air et permettre aux agents d'avoir une vision claire sur ce fait et tel type serait dans tel endroit !",
    date: DateTime.now(),
  ),
  Msg(
    name: "Changement d'Horaire",
    isString: false,
    haveIcon: true,
    date: DateTime.now(),
    icon: Clarity.calendar_outline_badged,
    color: AppColors.tdOrange,
    msg:
        "Ring! Ring! Ring!\nSalut, nous vous espérons bien portant, juste pour vous faire signe que suite aux soucis météorologiques, nous ne serons pas dans le quartier X et nous vous demandons de préserver vos déchêts dans des endroits bien sécurisés et bien entretenus en attendant notre passage prévu pour la date du 25 Janvier.\nMerci !",
  ),
  Msg(
    name: 'BONS SAMARITAINS asbl',
    isString: true,
    haveIcon: false,
    image:
        'https://scontent.fgom1-1.fna.fbcdn.net/v/t39.30808-6/311027742_403013302025597_7171254912802096035_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeFHNd-Xr2lo6muA40OJ603_-xMcSoGp3C37ExxKgancLfSJ0ngu2lGnIAqNpDN8EkjbRi27rx3NUggQf3LgUNur&_nc_ohc=U8gBVQZOpZAAX9NV6an&_nc_zt=23&_nc_ht=scontent.fgom1-1.fna&oh=00_AfAZjINvP5pcEloAXSS4juyd02tY0htbWqRD8R3vpiXFdw&oe=65B8E03E',
    msg:
        "Il est à nous de pouvoir lutter pour garder notre entourage toujours propre et sain, cela garantit à nos générations futures une vie paisible et lutte contre le changement climatique !",
    date: DateTime.now(),
  ),
  Msg(
    name: "Incident",
    isString: false,
    haveIcon: true,
    date: DateTime.now(),
    icon: CupertinoIcons.exclamationmark_triangle,
    color: AppColors.tdRed,
    msg:
        "Alert ! Suite à vos données et ceux des personnes de votre région. Nous vous demandons de ne pas mettre les déchêts plastiques parmi ceux organiques par peur d'avoir des maladies ...",
  ),
];
