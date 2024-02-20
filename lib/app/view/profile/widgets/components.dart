import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/profile/widgets/language.dart';
import 'package:usaficity/controller/state/profilstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../routes/routes.dart';

//L'entête de la page profile composé des identifaints
class HeadProfile extends StatelessWidget {
  const HeadProfile({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic user = Provider.of<User?>(context);
    dynamic theme = Theme.of(context);

    return BlocConsumer<ProfilCubic, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: sizeWidth * 0.24,
              height: sizeWidth * 0.24,
              decoration: user != null
                  ? BoxDecoration(
                      color: AppColors.tdGrey,
                      image: DecorationImage(
                        image: NetworkImage(user.photoURL),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: AppColors.tdGrey,
                        style: BorderStyle.solid,
                      ),
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: AppColors.tdGrey,
                        style: BorderStyle.solid,
                      ),
                    ),
            ),
            Gap(15),
            Text(user != null ? user.displayName : "Aucun nom",
                style: Theme.of(context).textTheme.titleMedium),
            Gap(3),
            Text(
              user != null
                  ? user.email
                  : "Veuillez vous connecter pour d'autres infos !",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Gap(20),
            Container(
              child: user != null
                  ? Column(
                      children: [
                        numberCountry(
                          context,
                          sizeWidth,
                          ProfilCubic.get(context).personnage.numero,
                          theme,
                        ),
                        adresseLocal(
                          context,
                          sizeWidth,
                          ProfilCubic.get(context).personnage.location,
                          theme,
                        ),
                        abonnementStruct(
                          context,
                          sizeWidth,
                          "${ProfilCubic.get(context).personnage.imgPhoto}",
                          ProfilCubic.get(context).personnage.agence,
                          ProfilCubic.get(context).personnage.frais,
                        ),
                      ],
                    )
                  : Container(),
            ),
          ],
        );
      },
    );
  }
}

//Pour les trois Button de Contrôle, le privacy, conseil et consigner
class ControllerOptionButton extends StatelessWidget {
  const ControllerOptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic user = Provider.of<User?>(context);

    return Container(
      margin: EdgeInsets.only(bottom: sizeWidth * 0.04),
      width: sizeWidth * 0.87,
      child: user != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // GestureDetector(
                //   child: boutonC(
                //       context, sizeWidth, sizeWidth, AppIcons.note, "Conseil"),
                //   onTap: () => context.push(RoutePath.conseil),
                // ),
                GestureDetector(
                  child: boutonC(
                    context,
                    sizeWidth,
                    AppIcons.signal,
                    "Signalisation",
                  ),
                  onTap: () => context.push(RoutePath.signaler),
                ),
                GestureDetector(
                  child: boutonC(
                    context,
                    sizeWidth,
                    AppIcons.privacy,
                    "Confidentialité",
                  ),
                  onTap: () => context.push(RoutePath.privacy),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: boutonC(
                    context,
                    sizeWidth,
                    AppIcons.privacy,
                    "Confidentialité",
                  ),
                  onTap: () => context.push(RoutePath.privacy),
                )
              ],
            ),
    );
  }
}

//Le bouton des paramètres avec des icones
class IconButtonFleche extends StatelessWidget {
  const IconButtonFleche({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic user = Provider.of<User?>(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic cubit = ProfilCubic.get(context);
    dynamic theme = Theme.of(context);
    return BlocConsumer<ProfilCubic, ProfilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: sizeWidth * 0.02),
              GestureDetector(
                child: listPuller(
                  context,
                  sizeWidth,
                  AppIcons.langue,
                  "Langue",
                  AppColors.tdBlueC,
                ),
                onTap: () => bottomSheetLangage(
                  context,
                  sizeHeight,
                  sizeWidth,
                  theme,
                ),
              ),
              GestureDetector(
                child: listPuller(
                  context,
                  sizeWidth,
                  AppIcons.about,
                  "Apropos",
                  AppColors.tdYellow,
                ),
                onTap: () => context.push(RoutePath.about),
              ),
              GestureDetector(
                onTap: () {
                  user == null
                      ? cubit.seConnecter()
                      : showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            backgroundColor: theme.scaffoldBackgroundColor,
                            content: SizedBox(
                              width: sizeWidth * 0.5,
                              height: sizeWidth * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    AppIcons.warn,
                                    color: AppColors.tdRed,
                                    size: sizeWidth * 0.1,
                                  ),
                                  const Gap(10),
                                  Text(
                                    "Veux-tu te déconnecter ?",
                                    style: theme.textTheme.bodySmall.copyWith(
                                      letterSpacing: 2.0,
                                      fontSize: sizeWidth * 0.05,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Gap(10),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          padding:
                                              EdgeInsets.all(sizeWidth * 0.02),
                                          child: Text(
                                            'Annuler',
                                            style: theme.textTheme.bodySmall
                                                .copyWith(
                                              fontSize: sizeWidth * 0.03,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Gap(20),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          cubit.seDeconnecter();
                                          context.pop();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.tdRed,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          padding:
                                              EdgeInsets.all(sizeWidth * 0.02),
                                          child: Text(
                                            'Déconnecter',
                                            style: theme.textTheme.bodySmall
                                                .copyWith(
                                              fontSize: sizeWidth * 0.03,
                                              color: AppColors.tdBlueB,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                },
                child: user != null
                    ? listPuller(
                        context,
                        sizeWidth,
                        AppIcons.logout,
                        "Se déconnecter",
                        AppColors.tdRed,
                      )
                    : listPuller(
                        context,
                        sizeWidth,
                        AppIcons.login,
                        "Se Connecter",
                        AppColors.tdGreenO,
                      ),
              ),
            ],
          );
        });
  }
}

//Bouton texte à droite flêche
Widget listPuller(
  context,
  double sizeW,
  dynamic icon,
  String text,
  Color color,
) {
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
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  icon,
                  size: sizeW * 0.04,
                  color: AppColors.tdWhite,
                ),
              ),
            ),
            Gap(20),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
        Text(
          ' ${adresse[0]} / ${adresse[1]} / ${adresse[2]}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
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
    child: Text(' $tel', style: Theme.of(context).textTheme.bodyMedium),
  );
}

//Abonnement Information
Widget abonnementStruct(
  context,
  double sizew,
  String logoImg,
  String agenceName,
  String fret,
) {
  dynamic theme = Theme.of(context);
  return Container(
    margin: EdgeInsets.only(bottom: sizew * 0.04),
    width: sizew * 0.87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: sizew * 0.15,
          height: sizew * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage(
                AppImages.logol,
              ),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 1,
              color: AppColors.tdGrey,
              style: BorderStyle.solid,
            ),
          ),
        ),
        SizedBox(
          width: sizew * 0.05,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$agenceName',
              style: theme.textTheme.bodyMedium.copyWith(
                color: AppColors.tdYellowB,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: sizew * 0.005,
                top: sizew * 0.005,
              ),
              width: sizew * 0.3,
              height: sizew * 0.001,
              color: AppColors.tdGrey,
            ),
            Text(
              'Abonnement',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "$fret",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    ),
  );
}

//
Widget boutonC(context, double sizew, dynamic ico, String txt) {
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
          size: sizew * 0.1,
        ),
        Gap(sizew * 0.02),
        Text("$txt", style: Theme.of(context).textTheme.bodySmall),
      ],
    ),
  );
}

class TextContainerForm extends StatelessWidget {
  final String titre;
  final String text;
  const TextContainerForm({super.key, required this.titre, required this.text});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic theme = Theme.of(context);
    dynamic font = Theme.of(context).textTheme.displaySmall;
    dynamic font1 = Theme.of(context).textTheme.headlineSmall;

    return Container(
      margin: EdgeInsets.only(bottom: sizeHeight * 0.015),
      width: sizeWidth * 0.90,
      decoration: BoxDecoration(
        color: theme.highlightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(sizeHeight * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeWidth * 0.05, vertical: sizeWidth * 0.01),
            child: Text(
              titre,
              style: font.copyWith(
                  fontSize: sizeWidth * 0.045, fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            width: sizeWidth * 0.90,
            padding: EdgeInsets.symmetric(
                horizontal: sizeWidth * 0.05, vertical: sizeWidth * 0.02),
            child: Text(
              text,
              style: font1.copyWith(
                fontSize: sizeWidth * 0.035,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Gap(sizeHeight * 0.015)
        ],
      ),
    );
  }
}
