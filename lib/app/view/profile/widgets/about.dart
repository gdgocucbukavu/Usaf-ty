import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/cubit.dart';

import '../../../../controller/state/state.dart';

class AboutPage extends StatelessWidget {
  static const route = '/about';
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic user = Provider.of<User?>(context);
    dynamic theme = Theme.of(context);
    dynamic font = theme.textTheme.labelMedium;
    dynamic content;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
                child: InkWell(
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
                        builder: (context) => SimpleDialog(
                          backgroundColor: theme.highlightColor,
                          title: Text('Feedback'),
                          titleTextStyle: TextStyle(
                            color: theme.primaryColorDark,
                            fontSize: sizeWidth * 0.05,
                          ),
                          alignment: Alignment.center,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: sizeWidth * 0.05,
                          ),
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                content = value;
                              },
                              maxLines: null,
                              cursorColor: theme.primaryColorLight,
                              style: font.copyWith(
                                fontSize: sizeWidth * 0.03,
                                color: theme.primaryColorLight,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                hintText: "Faites nous savoir !".tr(),
                                hintStyle: font,
                                border: InputBorder.none,
                              ),
                            ),
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: sizeWidth * 0.02,
                                      horizontal: sizeWidth * 0.03,
                                    ),
                                    child: Text(
                                      'Annuler'.tr(),
                                      style: theme.textTheme.bodySmall.copyWith(
                                        fontSize: sizeWidth * 0.025,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    MainCubit().sendFeedback(
                                      context: context,
                                      content: content,
                                      email: user.email,
                                      name: user.displayName,
                                    );
                                    context.pop();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: sizeWidth * 0.02,
                                      horizontal: sizeWidth * 0.03,
                                    ),
                                    child: Text(
                                      'Envoyer'.tr(),
                                      style: theme.textTheme.bodySmall.copyWith(
                                        fontSize: sizeWidth * 0.025,
                                        color: AppColors.tdBlueB,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gap(sizeWidth * 0.05),
                          ],
                        ),
                      );
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.feedback_outlined,
                        size: sizeWidth * 0.045,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        'feedback',
                        style: GoogleFonts.poiretOne(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: sizeWidth / 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: sizeWidth / 6.2,
                        height: sizeWidth / 6.2,
                        margin: EdgeInsets.only(
                          top: sizeWidth * 0.02,
                          bottom: sizeWidth * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.tdGrey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.logo),
                          ),
                        ),
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "Usaf'ty",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Gap(sizeWidth * 0.05),
                      Text(
                        "'Usaf'ty' est une solution réalisée par la Communinauté GDSC - Google Developer Student Club - de l'Université Catholique de Bukavu pour la ville de Bukavu et ses environs, solution ayant pour but de mettre en contact direct les agences chargées de gestion des ordures en ville et la population."
                            .tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "Cette Solution a été conçu à l'occasion de la Solution Challenge organisée chaque année par Google. Les solutions de ce challenge visent de donner solution aux problèmes locaux d'un milieu à un autre tout en se référant aux ODD - Objectifs de Développement Durable - des Nations Unies."
                            .tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "D'où nous avons ciblé ce souci qui est aussi extrême que mortel pour notre ville et sa population, en prennant en compte les ODD N°3, N°11 et N°12, nous nous sommes donnés les missions suivantes : "
                            .tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
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
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w300),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "Soyons tous acteurs pour le bien de notre ville, notre planète !"
                            .tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.tdYellowB),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  Footer(),
                ],
              ),
            ),
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
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font = Theme.of(context).textTheme.bodySmall;
    dynamic theme = Theme.of(context).primaryColorLight;

    return Container(
      width: sizeWidth - sizeWidth * 0.1,
      padding: EdgeInsets.only(bottom: sizeWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: sizeWidth * 0.07, right: 7, top: 5),
            width: 5,
            height: 5,
            decoration: BoxDecoration(shape: BoxShape.circle, color: theme),
          ),
          Container(
            padding: EdgeInsets.only(bottom: sizeWidth * 0.01),
            width: sizeWidth - sizeWidth * 0.1 - sizeWidth * 0.1,
            child: Text(txt.tr(), style: font),
          )
        ],
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font2 = Theme.of(context).textTheme.titleMedium;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeWidth * 0.05,
          vertical: sizeWidth * 0.02,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sizeWidth * 0.05,
          vertical: sizeWidth * 0.01,
        ),
        width: sizeWidth,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.tdYellowB,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                AppIcons.send,
                color: AppColors.tdWhite,
                size: sizeWidth * 0.05,
              ),
              Gap(sizeWidth * 0.04),
              Text(
                "Envoyer".tr(),
                style: font2.copyWith(
                  fontSize: sizeWidth * 0.03,
                  fontWeight: FontWeight.w100,
                  color: AppColors.tdWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
