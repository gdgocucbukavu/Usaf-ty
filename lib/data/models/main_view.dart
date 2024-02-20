import 'package:usaficity/app/shared/shared.dart';

class MainView {
  String title;
  String content;
  dynamic img;

  MainView({
    required this.title,
    required this.content,
    required this.img,
  });
}

List mainview = [
  MainView(
    title: 'Proprété',
    content:
        'Apprenez à garder propre notre environnement en suivant des conseils des experts ...',
    img: AppImages.cleancity,
  ),
  MainView(
    title: 'Communication',
    content:
        'Rester en contact permanent avec les agences chargées de recyclage de déchêts en ville ...',
    img: AppImages.home2,
  ),
  MainView(
    title: 'Gérance',
    content:
        "Connaître les différentes bonnes manières de traitement des ordures ...",
    img: AppImages.home1,
  ),
  MainView(
    title: 'Non-pollution',
    content:
        "Soyons gardiens de l'environnement et luttons contre la pollution climatique ...",
    img: AppImages.home3,
  ),
  MainView(
    title: 'Tri',
    content:
        'Apprendre les normes de tri de déchêts pour une bonne gestion de ceux-ci ...',
    img: AppImages.tri,
  ),
];
