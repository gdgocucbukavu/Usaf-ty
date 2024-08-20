import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/cubit.dart';

import '../../../../controller/state/state.dart';
import 'feedback_dialog.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final theme = Theme.of(context);

    String content = "";
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  if (user == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(
                        context,
                        'Veuillez vous connecter pour un feedback ...'.tr(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          feedBackDialog(theme, content, context, user),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.feedback_outlined,
                        color: Theme.of(context).primaryColorDark,
                        size: 16,
                      ),
                      const Gap(8),
                      Text(
                        'feedback',
                        style: GoogleFonts.poiretOne(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 15,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.tdGrey,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(AppImages.logo)),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    "Usaf'ty",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Gap(20),
                  Text(
                    "'Usaf'ty' est une solution réalisée par la Communinauté GDSC - Google Developer Student Club - de l'Université Catholique de Bukavu pour la ville de Bukavu et ses environs, solution ayant pour but de mettre en contact direct les agences chargées de gestion des ordures en ville et la population."
                        .tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "Cette Solution a été conçu à l'occasion de la Solution Challenge organisée chaque année par Google. Les solutions de ce challenge visent de donner solution aux problèmes locaux d'un milieu à un autre tout en se référant aux ODD - Objectifs de Développement Durable - des Nations Unies."
                        .tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "D'où nous avons ciblé ce souci qui est aussi extrême que mortel pour notre ville et sa population, en prennant en compte les ODD N°3, N°11 et N°12, nous nous sommes donnés les missions suivantes : "
                        .tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  TextPoint(
                    txt:
                        "de pouvoir donner accès à la communication entre les agences de collecte des déchêts en ville et la population ;",
                  ),
                  TextPoint(
                    txt:
                        "de sensibiliser la population sur l'impact négatif des déchêts (les maladies qui en découlent, la pollution de climat, ...) ;",
                  ),
                  TextPoint(
                    txt:
                        "de donner les normes et les bonnes manières de la gestion (du tri) des ordures en but d'aider déjà ces agences avant qu'elle ne passe collecter celles-ci ;",
                  ),
                  TextPoint(
                    txt:
                        "de donner certaines bonnes pratiques de rendre certains déchêts utils pour une réutilisation responsable ;",
                  ),
                  Text(
                    "Ainsi, pour atteindre ces objectifs, nous demandons à tous de mettre nos mains dans la patte, comme on dit chez nous : \"Kidole kimoja hakiui mbu\" - Un seul doigt ne tue pas un moustique - "
                        .tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "Soyons tous acteurs pour le bien de notre ville, notre planète !"
                        .tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.tdYellowB),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Footer(),
            ],
          ),
        );
      },
    );
  }
}

class TextPoint extends StatelessWidget {
  final String txt;
  const TextPoint({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final font = Theme.of(context).textTheme.bodySmall;
    final theme = Theme.of(context).primaryColorLight;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 8, top: 6),
            width: 5,
            height: 5,
            decoration: BoxDecoration(shape: BoxShape.circle, color: theme),
          ),
          Expanded(
            child: Text(txt.tr(), style: font),
          ),
        ],
      ),
    );
  }
}
