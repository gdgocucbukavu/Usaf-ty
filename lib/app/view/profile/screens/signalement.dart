import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usaficity/app/shared/shared.dart';
import 'package:usaficity/controller/cubit/mapcubit.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import 'photo_picker_widget.dart';

class SignalPage extends StatelessWidget {
  static const route = '/signaler';
  const SignalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final cubit = ProfilCubit.get(context);
    cubit.imgFile = null;
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
                  "Signalisation".tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(10),
                Icon(AppIcons.signal, size: 25),
                const Gap(50),
              ],
            ),
          ),
          body: Container(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => cubit.showImagePickerOptions(context),
                  child: PhotoPickerWidget(text: "Envoyer une photo"),
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
    final font2 = Theme.of(context).textTheme.titleMedium;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.maxFinite,
      height: 50,
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
              size: 20,
            ),
            const Gap(10),
            Text(
              "Envoyer".tr(),
              style: font2!.copyWith(
                fontWeight: FontWeight.w100,
                color: AppColors.tdWhite,
                fontSize: 12,
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
    final theme = Theme.of(context);
    final font = Theme.of(context).textTheme.labelMedium;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.maxFinite,
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
        style: font!.copyWith(
          fontSize: 11,
          color: theme.primaryColorLight,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: "Signalez quelque chose !".tr(),
          border: InputBorder.none,
          hintStyle: font,
        ),
      ),
    );
  }
}

class LocalisationPicker extends StatelessWidget {
  const LocalisationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final font = Theme.of(context).textTheme.headlineSmall;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                AppIcons.mapPin,
                color: AppColors.tdYellowB,
                size: 20,
              ),
              const Gap(10),
              Text(
                "Localisation :".tr(),
                style: font!.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const Gap(10),
              Text(
                "- - - - - -",
                style: font.copyWith(
                  fontSize: 11,
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
