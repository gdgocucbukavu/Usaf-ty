import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/state/profilstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../routes/routes.dart';

//L'entête de la page profile composé des identifiants
class HeadProfile extends StatelessWidget {
  const HeadProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final cubit = ProfilCubit.get(context);
    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: user != null
                  ? BoxDecoration(
                      color: AppColors.tdGrey,
                      image: DecorationImage(
                        image: NetworkImage(user.photoURL!),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.tdGrey,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    )
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.tdGrey,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      image: DecorationImage(
                        image: AssetImage(AppImages.user),
                        fit: BoxFit.cover,
                      ),
                    ),
              child: !cubit.isConnected
                  ? Icon(
                      CupertinoIcons.exclamationmark_circle,
                      size: 20,
                    )
                  : Container(),
            ),
            const Gap(20),
            Text(
              user != null ? user.displayName! : "Nom".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(3),
            Text(
              user != null
                  ? user.email!
                  : "Veuillez vous connecter pour d'autres infos !".tr(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                  ),
            ),
            Gap(20),
            if (user != null)
              Column(
                children: [
                  abonnementStruct(
                    context,
                    "${ProfilCubit.get(context).personnage.imgPhoto}",
                    ProfilCubit.get(context).personnage.agence,
                    ProfilCubit.get(context).personnage.frais,
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

//Abonnement Information
Widget abonnementStruct(
  context,
  String logoImg,
  String agenceName,
  String fret,
) {
  final theme = Theme.of(context);
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: 15),
    width: double.maxFinite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: AssetImage(AppImages.logo),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: AppColors.tdGrey,
              style: BorderStyle.solid,
              width: 1,
            ),
          ),
        ),
        const Gap(15),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$agenceName',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.tdYellowB,
              ),
            ),
            Container(
              height: 1,
              width: 120,
              color: theme.primaryColorDark,
              margin: const EdgeInsets.symmetric(vertical: 3),
            ),
            Text(
              'Abonnement'.tr(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 11,
                  ),
            ),
            Text(
              "$fret",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                  ),
            ),
          ],
        )
      ],
    ),
  );
}

//Pour les trois Button de Contrôle, le privacy, conseil et consigner
class ControllerOptionButton extends StatelessWidget {
  const ControllerOptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return Container(
      width: double.maxFinite,
      child: user != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: boutonC(
                    context,
                    AppIcons.note,
                    "Participation",
                  ),
                  onTap: () => context.push(RoutePath.conseil),
                ),
                GestureDetector(
                  child: boutonC(
                    context,
                    AppIcons.signal,
                    "Signalisation",
                  ),
                  onTap: () => context.push(RoutePath.signaler),
                ),
                GestureDetector(
                  child: boutonC(
                    context,
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

//Adresse de localisation
Widget adresseLocal(context, double sizeHe, List<String> adresse, final th) {
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
        Gap(sizeHe * 0.02),
        Text(
          ' ${adresse[0]} / ${adresse[1]} / ${adresse[2]}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ),
  );
}

//Numéro de téléphone
Widget numberCountry(context, double sizeHe, String tel, final th) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: sizeHe * 0.011),
    width: sizeHe * 0.87,
    child: Text(' $tel', style: Theme.of(context).textTheme.bodyMedium),
  );
}

//
Widget boutonC(BuildContext context, IconData ico, String txt) {
  return Container(
    color: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          ico,
          size: 35,
        ),
        const Gap(10),
        Text(
          "$txt".tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 8),
        ),
      ],
    ),
  );
}

// class TextContainerForm extends StatelessWidget {
//   final String titre;
//   final String text;
//   const TextContainerForm({super.key, required this.titre, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     final sizeHeight = MediaQuery.sizeOf(context).height;
//     final sizeWidth = MediaQuery.sizeOf(context).width;
//     final theme = Theme.of(context);
//     final font = Theme.of(context).textTheme.displaySmall;
//     final font1 = Theme.of(context).textTheme.headlineSmall;

//     return Container(
//       margin: EdgeInsets.only(bottom: sizeHeight * 0.015),
//       width: sizeWidth * 0.90,
//       decoration: BoxDecoration(
//         color: theme.highlightColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Gap(sizeHeight * 0.01),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: sizeWidth * 0.05,
//               vertical: sizeWidth * 0.01,
//             ),
//             child: Text(
//               titre.tr(),
//               style: font!.copyWith(
//                 fontSize: sizeWidth * 0.045,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),
//           Container(
//             width: sizeWidth * 0.90,
//             padding: EdgeInsets.symmetric(
//               horizontal: sizeWidth * 0.05,
//               vertical: sizeWidth * 0.02,
//             ),
//             child: Text(
//               text.tr(),
//               style: font1!.copyWith(
//                 fontSize: sizeWidth * 0.035,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),
//           Gap(sizeHeight * 0.015)
//         ],
//       ),
//     );
//   }
// }
