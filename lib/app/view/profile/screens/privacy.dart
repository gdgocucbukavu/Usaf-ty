import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:usaficity/app/shared/shared.dart';

class Privacy extends StatelessWidget {
  static const route = '/privacy';
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    final font = Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.tdGrey,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(AppImages.logo)),
                ),
              ),
            ],
          ),
          const Gap(10),
          Text(
            dataTerms.gtitre,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const Gap(10),
          Text(dataTerms.text1, style: font),
          const Gap(10),
          Text(dataTerms.text2, style: font),
          const Gap(10),
          Text(dataTerms.text3, style: font),
          const Gap(10),
          TitleLine(titre: dataTerms.stitre1),
          TextPoint(txt: dataTerms.pts1),
          TextPoint(txt: dataTerms.pts2),
          TextPoint(txt: dataTerms.pts3),
          TextPoint(txt: dataTerms.pts4),
          const Gap(10),
          TitleLine(titre: dataTerms.stitre2),
          Text(dataTerms.text4, style: font),
          const Gap(10),
          TextPoint(txt: dataTerms.pts5),
          TextPoint(txt: dataTerms.pts6),
          TextPoint(txt: dataTerms.pts7),
          TextPoint(txt: dataTerms.pts8),
          TextPoint(txt: dataTerms.pts9),
          const Gap(10),
          TitleLine(titre: dataTerms.stitre3),
          Text(dataTerms.text5, style: font),
          const Gap(10),
          TitleLine(titre: dataTerms.stitre4),
          Text(dataTerms.text6, style: font),
          const Gap(10),
          Footer(),
        ],
      ),
    );
  }
}

class TitleLine extends StatelessWidget {
  final String titre;
  const TitleLine({super.key, required this.titre});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        titre.tr(),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.tdYellowB,
          fontSize: 12,
        ),
      ),
    );
  }
}

class TextPoint extends StatelessWidget {
  final String txt;
  const TextPoint({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 8, top: 6),
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColorLight,
            ),
          ),
          Expanded(
            child: Text(
              txt.tr(),
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}

class Conditions {
  String gtitre;
  String text1;
  String text2;
  String text3;
  String stitre1;
  String pts1;
  String pts2;
  String pts3;
  String pts4;
  String stitre2;
  String text4;
  String pts5;
  String pts6;
  String pts7;
  String pts8;
  String pts9;
  String stitre3;
  String text5;
  String stitre4;
  String text6;
  Conditions(
      {required this.gtitre,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.stitre1,
      required this.pts1,
      required this.pts2,
      required this.pts3,
      required this.pts4,
      required this.stitre2,
      required this.text4,
      required this.pts5,
      required this.pts6,
      required this.pts7,
      required this.pts8,
      required this.pts9,
      required this.stitre3,
      required this.text5,
      required this.stitre4,
      required this.text6});
}

Conditions dataTerms = Conditions(
    gtitre: "Confidentialité et conditions",
    text1:
        "Pour une utilisation de l'application, vous vous devez de connaître certains termes de conditions d'utilisation.",
    text2:
        "Dans le cas où l'application vous demander de vous authentifier avec Google, certains éléments seront récupérés pour une bonne interprétation données.",
    text3:
        "Et aussi, savoir que certaines données ne doivent être partagé pour protéger votre vis privé.",
    stitre1: "Les données que nous traitions lorsque vous utilisez Google :",
    pts1:
        "Lorsque vous créez un compte Google, nous stockons les informations que vous nous fournissez comme votre nom, votre photo, votre adresse e-mail et votre numéro de téléphone.",
    pts2:
        "Lorsque vous utilisez les services Google pour effectuer des choses telles que l'envoi ou le signal d'un dépôt sauvage de dépôt ou partager l'expérience sur le déchets avec les autres.",
    pts3:
        "Lorsque vous recherchez un endroit sur Google Maps ou regardez une, nous traitions des informations sur cette activité - y compris des informations telles que l'adresse IP, les données de cookie, les identifiants de périphérique et la localisation.",
    pts4:
        "Nous traitions également les informations décrites ci-dessus lorsque vous utilisez l'application.",
    stitre2: "Pourquoi nous traitions cette donnée :",
    text4:
        "Nous traitions ces données pour les raisons décrites dans notre politique, y compris pour :",
    pts5:
        "Aider nos services à fournir du contenu plus utile et personnalisé, tels que des résultats de recherche plus pertinents en fonction de vos préférences et de votre histoire d'utilisation;",
    pts6: "Améliorer la qualité de nos services et les développer;",
    pts7:
        "Fournir des annonces personnalisées en fonction de vos paramètres de compte, tant sur les services Google que sur les sites et applications partenaires de Google;",
    pts8: "Améliorer la sécurité en protégeant contre la fraude et l'abus;",
    pts9:
        "Résoudre les problèmes techniques et fournir des services de support technique.",
    stitre3: "Combiner les données depuis différent appareils.",
    text5:
        "Par exemple, en fonction de vos paramètres de compte, nous vous montrons des annonces en fonction des informations sur vos centres d'intérêt, que nous pouvons déduire de votre utilisation de Recherche et de YouTube, et nous utilisons des données issues de milliards de requêtes de recherche pour construire des modèles de correction d'orthographe qui nous servent sur tous nos services.",
    stitre4: "Vous êtes maître de vos données",
    text6:
        "En fonction de vos paramètres d'utilisateur, certaines de ces données peuvent être associées avec votre compte Google et nous traitons ces données comme des informations personnelles. Vous pouvez contrôler comment nous collectons et utilisons ces données en cliquant sur 'Options supplémentaires' ci-dessous. Vous pouvez toujours régler vos paramètres de contrôle ultérieurement ou retirer votre consentement pour l'avenir.");
