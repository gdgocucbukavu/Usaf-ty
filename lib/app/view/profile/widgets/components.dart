import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:usaficity/app/view/profile/widgets/language.dart';
import 'package:usaficity/controller/state/profilstate.dart';

import '../../../../controller/cubit/cubit.dart';
import '../../../../controller/cubit/profilcubit.dart';
import '../../../routes/routes.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/icons.dart';

//Le bouton de notifiaction

class NotificationBottom extends StatelessWidget {
  const NotificationBottom({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeHeight = MediaQuery.sizeOf(context).width;
    dynamic theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.push(RoutePath.notification),
      child: Container(
          alignment: Alignment.center,
          height: sizeHeight * 0.1,
          width: sizeHeight * 0.1,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.primaryColorLight,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Stack(alignment: Alignment.topRight, children: [
            Icon(
              AppIcons.notification,
              size: sizeHeight * 0.04,
              color: theme.primaryColorLight,
            ),
            Container(
              height: sizeHeight * 0.014,
              width: sizeHeight * 0.014,
              decoration: BoxDecoration(
                color: AppColors.tdRed,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ])),
    );
  }
}

//L'entête de la page profile composé des identifaints
class HeadProfile extends StatelessWidget {
  const HeadProfile({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic theme = Theme.of(context);
    return BlocConsumer<ProfilCubic, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: sizeWidth * 0.24,
              height: sizeWidth * 0.24,
              decoration: ProfilCubic.get(context).isConnect
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "${ProfilCubic.get(context).personnage.photoP}"),
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3,
                          color: AppColors.tdGrey,
                          style: BorderStyle.solid))
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3,
                          color: AppColors.tdGrey,
                          style: BorderStyle.solid)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                ProfilCubic.get(context).isConnect
                    ? ProfilCubic.get(context).personnage.name
                    : "Not name found",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 3,
            ),
            Text(
                ProfilCubic.get(context).isConnect
                    ? ProfilCubic.get(context).personnage.mail
                    : "######",
                style: Theme.of(context).textTheme.bodySmall),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ProfilCubic.get(context).isConnect
                  ? Column(
                      children: [
                        numberCountry(context, sizeWidth,
                            ProfilCubic.get(context).personnage.numero, theme),
                        adresseLocal(
                            context,
                            sizeWidth,
                            ProfilCubic.get(context).personnage.location,
                            theme),
                        abonnementStruct(
                            context,
                            sizeWidth,
                            "${ProfilCubic.get(context).personnage.imgPhoto}",
                            ProfilCubic.get(context).personnage.agence,
                            ProfilCubic.get(context).personnage.frais),
                      ],
                    )
                  : Column(),
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

    return Container(
      margin: EdgeInsets.only(bottom: sizeWidth * 0.04),
      width: sizeWidth * 0.87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: boutonC(
                context, sizeWidth, sizeWidth, AppIcons.note, "Conseil"),
            onTap: () => context.push(RoutePath.conseil),
          ),
          GestureDetector(
            child: boutonC(
                context, sizeWidth, sizeWidth, AppIcons.signal, "Signaler"),
            onTap: () => context.push(RoutePath.signaler),
          ),
          GestureDetector(
            child: boutonC(
                context, sizeWidth, sizeWidth, AppIcons.privacy, "Privacy"),
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
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).height;
    dynamic theme = Theme.of(context);
    return BlocConsumer<ProfilCubic, ProfilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: sizeWidth * 0.87,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: sizeWidth * 0.08,
                          height: sizeWidth * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Center(
                              child: Icon(
                            AppIcons.darkMode,
                            color: Colors.white,
                            size: sizeWidth * 0.04,
                          )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text("Mode sombre",
                                style: Theme.of(context).textTheme.bodyMedium)),
                      ],
                    ),
                    Switch(
                        inactiveTrackColor: AppColors.tdWhite,
                        activeTrackColor: Color(0xff3f3f3f),
                        activeColor: Colors.white,
                        hoverColor: Colors.white10,
                        value: MainCubit.get(context).isDark,
                        onChanged: (valu) {
                          MainCubit.get(context).changeThemeMode();
                        })
                  ],
                ),
              ),
              SizedBox(height: sizeWidth * 0.02),
              SizedBox(height: sizeWidth * 0.02),
              GestureDetector(
                child: listPuller(context, sizeWidth, AppIcons.langue, "Langue",
                    AppColors.tdBlueC),
                onTap: () =>
                    bottomSheetLangage(context, sizeHeight, sizeWidth, theme),
              ),
              GestureDetector(
                child: listPuller(context, sizeWidth, AppIcons.about, "Apropos",
                    AppColors.tGYellowC),
                onTap: () => context.push(RoutePath.about),
              ),
              GestureDetector(
                child: ProfilCubic.get(context).isConnect
                    ? listPuller(context, sizeWidth, AppIcons.logout,
                        "Se déconnecter", AppColors.tdRedC)
                    : listPuller(context, sizeWidth, AppIcons.login,
                        "Se Connecter", AppColors.tGreenC),
                onTap: () => ProfilCubic.get(context).seConnecter(),
              ),
            ],
          );
        });
  }
}

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
    margin: EdgeInsets.only(bottom: sizeHe * 0.011),
    width: sizeHe * 0.87,
    child: Row(
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
