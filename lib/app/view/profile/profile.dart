import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/cubit.dart';
import 'package:usaficity/controller/state/state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    Icon signal = Icon(
      Icons.fmd_bad,
      size: sizeWidth * 0.04,
      color: Colors.white,
    );

    Icon langue = Icon(
      Icons.language,
      size: sizeWidth * 0.04,
      color: Colors.white,
    );

    Icon aprop = Icon(
      Icons.info_outline,
      size: sizeWidth * 0.04,
      color: Colors.white,
    );

    Icon connecter = Icon(
      Icons.logout,
      size: sizeWidth * 0.04,
      color: Colors.white,
    );

    Icon notif = Icon(
      Icons.notifications,
      size: sizeWidth * 0.04,
      color: Colors.white,
    );

    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Stack(
                children: [
                  Positioned(
                      top: sizeWidth * 0.1,
                      child: Container(
                        width: sizeWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: sizeWidth * 0.25,
                              height: sizeWidth * 0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('${AppImages.logo}'),
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 3,
                                      color: AppColors.tdGrey,
                                      style: BorderStyle.solid)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Bénédict Lubembela",
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(
                              height: 3,
                            ),
                            Text('mhg4@gmail.com',
                                style: Theme.of(context).textTheme.bodyMedium),
                            SizedBox(
                              height: 25,
                            ),
                            Divider(
                              height: 0.6,
                              color: AppColors.tdGrey,
                              indent: sizeWidth * 0.1,
                              endIndent: sizeWidth * 0.1,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: sizeWidth * 0.87,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: sizeWidth * 0.07,
                                        height: sizeWidth * 0.07,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Icon(
                                            Icons.dark_mode,
                                            color: Colors.white,
                                            size: sizeWidth * 0.04,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Mode sombre",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                  Switch(
                                      inactiveTrackColor: Color(0xff3f3f3f),
                                      activeTrackColor: Color(0xff3f3f3f),
                                      activeColor: Colors.white,
                                      hoverColor: Colors.white10,
                                      value: MainCubit.get(context).isDark,
                                      onChanged: (valu) =>
                                          MainCubit.get(context)
                                              .changeThemeMode())
                                ],
                              ),
                            ),
                            SizedBox(height: sizeWidth * 0.02),
                            listPuller(context, sizeWidth, notif,
                                "Notification", Color(0xffeea432)),
                            listPuller(context, sizeWidth, signal, "Signaler",
                                Color(0xff3991F0)),
                            SizedBox(height: sizeWidth * 0.04),
                            listPuller(context, sizeWidth, langue, "Langue",
                                Color(0xffa6a6a6)),
                            listPuller(context, sizeWidth, aprop, "Apropos",
                                Color(0xffe77639)),
                            listPuller(context, sizeWidth, connecter,
                                "Se déconnecter", Color(0xff32cca4)),
                          ],
                        ),
                      ))
                ],
              ));
        });
  }
}

Widget listPuller(context, double sizeW, Icon ico, String texts, Color colur) {
  return Container(
    margin: EdgeInsets.only(bottom: sizeW * 0.04),
    width: sizeW * 0.87,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: sizeW * 0.07,
              height: sizeW * 0.07,
              decoration: BoxDecoration(
                  color: colur, borderRadius: BorderRadius.circular(5)),
              child: Center(child: ico),
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
