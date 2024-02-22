import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/mapcubit.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';

class SignalPage extends StatelessWidget {
  static const route = '/signaler';
  const SignalPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic user = Provider.of<User?>(context);
    dynamic cubit = ProfilCubit.get(context);
    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Signalisation",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Gap(sizeWidth * 0.03),
                Icon(
                  AppIcons.signal,
                  size: sizeWidth * 0.07,
                ),
                Gap(sizeWidth * 0.09)
              ],
            ),
          ),
          body: Container(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => cubit.showImagePickerOptions(context),
                  child: PhotoPicker(),
                ),
                LocalisationPicker(),
                FiliedTextSignaler(),
                GestureDetector(
                  onTap: () {
                    if (cubit.imgFile != null) {
                      ProfilCubit.get(context).onSignalisationSubmited(
                        content: cubit.content,
                        context: context,
                        file: cubit.imgFile,
                        lat: MapCubit.get(context).currentLocation!.latitude,
                        lng: MapCubit.get(context).currentLocation!.longitude,
                        user: user,
                      );
                      cubit.imgFile = null;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          context,
                          'Veuillez ajouter une image ...',
                        ),
                      );
                    }
                  },
                  child: SendButton(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font2 = Theme.of(context).textTheme.titleMedium;
    return Container(
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
              "Envoyez",
              style: font2.copyWith(
                fontSize: sizeWidth * 0.03,
                fontWeight: FontWeight.w100,
                color: AppColors.tdWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FiliedTextSignaler extends StatelessWidget {
  const FiliedTextSignaler({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font1 = Theme.of(context).textTheme.labelMedium;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: sizeWidth * 0.05,
        vertical: sizeWidth * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sizeWidth * 0.05,
        vertical: sizeWidth * 0.01,
      ),
      width: sizeWidth * 0.90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.highlightColor,
      ),
      child: TextFormField(
        onChanged: (value) {
          ProfilCubit.get(context).content = value;
        },
        onTapOutside: (event) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        cursorColor: theme.primaryColorLight,
        maxLines: null,
        style: font1.copyWith(
          fontSize: sizeWidth * 0.03,
          color: theme.primaryColorLight,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: "Signalez quelque chose !",
          hintStyle: font1,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class LocalisationPicker extends StatelessWidget {
  const LocalisationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font1 = Theme.of(context).textTheme.headlineSmall;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
      width: sizeWidth * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                AppIcons.mapPin,
                color: AppColors.tdYellowB,
              ),
              Gap(sizeWidth * 0.04),
              Text(
                "Location :",
                style: font1.copyWith(
                  fontSize: sizeWidth * 0.03,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Gap(sizeWidth * 0.04),
              Text(
                "Fizi/Bukavu",
                style: font1.copyWith(
                  fontSize: sizeWidth * 0.03,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic theme = Theme.of(context);
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic font2 = Theme.of(context).textTheme.bodyMedium;
    dynamic cubit = ProfilCubit.get(context);
    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(sizeWidth * 0.05),
          width: sizeWidth * 0.90,
          height: sizeWidth * 0.60,
          decoration: cubit.imgFile == null
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.highlightColor,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.highlightColor,
                  image: DecorationImage(
                    image: FileImage(cubit.imgFile),
                    fit: BoxFit.cover,
                  ),
                ),
          child: (cubit.imgFile == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        AppIcons.photoCapture,
                        color: AppColors.tdGrey,
                        size: sizeWidth * 0.2,
                        weight: 1,
                      ),
                    ),
                    Gap(sizeWidth * 0.04),
                    Text(
                      "Envoyer une photo",
                      style: font2.copyWith(
                        fontSize: sizeWidth * 0.038,
                        fontWeight: FontWeight.normal,
                        color: AppColors.tdGrey,
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      },
    );
  }
}
