import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:usaficity/app/routes/routes.path.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/app/view/profile/widgets/language.dart';
import 'package:usaficity/controller/cubit/cubit.dart';
import 'package:usaficity/controller/cubit/profilcubit.dart';
import 'package:usaficity/controller/state/profilstate.dart';

import 'widgets/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic sizeHeight = MediaQuery.sizeOf(context).width;
    dynamic theme = Theme.of(context);

    return BlocConsumer<ProfilCubic, ProfilState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                body: Stack(
              children: [
                Positioned(
                    top: sizeWidth * 0,
                    right: sizeWidth * 0.05,
                    child: GestureDetector(
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
                          child:
                              Stack(alignment: Alignment.topRight, children: [
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
                    )),
                Positioned(
                    top: sizeWidth * 0.05,
                    child: Container(
                      width: sizeWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                      numberCountry(
                                          context,
                                          sizeWidth,
                                          ProfilCubic.get(context)
                                              .personnage
                                              .numero,
                                          theme),
                                      adresseLocal(
                                          context,
                                          sizeWidth,
                                          ProfilCubic.get(context)
                                              .personnage
                                              .location,
                                          theme),
                                      abonnementStruct(
                                          context,
                                          sizeWidth,
                                          "${ProfilCubic.get(context).personnage.imgPhoto}",
                                          ProfilCubic.get(context)
                                              .personnage
                                              .agence,
                                          ProfilCubic.get(context)
                                              .personnage
                                              .frais),
                                    ],
                                  )
                                : Column(),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: sizeWidth * 0.04),
                            width: sizeWidth * 0.87,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: boutonC(context, sizeWidth, sizeWidth,
                                      AppIcons.note, "Conseil"),
                                  onTap: () => context.push(RoutePath.conseil),
                                ),
                                GestureDetector(
                                  child: boutonC(context, sizeWidth, sizeWidth,
                                      AppIcons.signal, "Signaler"),
                                  onTap: () => context.push(RoutePath.signaler),
                                ),
                                GestureDetector(
                                  child: boutonC(context, sizeWidth, sizeWidth,
                                      AppIcons.privacy, "Privacy"),
                                  onTap: () => context.push(RoutePath.privacy),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.6,
                            color: AppColors.tdGrey,
                            indent: sizeWidth * 0.1,
                            endIndent: sizeWidth * 0.1,
                          ),
                          SizedBox(
                            height: 18,
                          ),
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
                                          color: Colors.black,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: MainCubit.get(context).isDark
                                              ? Icon(
                                                  AppIcons.darkMode,
                                                  color: Colors.white,
                                                  size: sizeWidth * 0.04,
                                                )
                                              : Icon(
                                                  AppIcons.lightMode,
                                                  color: Colors.white,
                                                  size: sizeWidth * 0.04,
                                                )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: MainCubit.get(context).isDark
                                          ? Text("Mode sombre",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium)
                                          : Text("Mode lumineux",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                    ),
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
                            child: listPuller(context, sizeWidth,
                                AppIcons.langue, "Langue", AppColors.tdBlueC),
                            onTap: () => bottomSheetLangage(
                                context, sizeHeight, sizeWidth, theme),
                          ),
                          GestureDetector(
                            child: listPuller(context, sizeWidth,
                                AppIcons.about, "Apropos", AppColors.tGYellowC),
                            onTap: () => context.push(RoutePath.about),
                          ),
                          GestureDetector(
                            child: ProfilCubic.get(context).isConnect
                                ? listPuller(
                                    context,
                                    sizeWidth,
                                    AppIcons.logout,
                                    "Se déconnecter",
                                    AppColors.tdRedC)
                                : listPuller(context, sizeWidth, AppIcons.login,
                                    "Se Connecter", AppColors.tGreenC),
                            onTap: () => ProfilCubic.get(context).seConnecter(),
                          ),
                        ],
                      ),
                    ))
              ],
            )),
          );
        });
  }
}
