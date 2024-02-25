import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import '../../../shared/shared.dart';

class Conseil extends StatefulWidget {
  static const route = '/conseil';
  const Conseil({super.key});

  @override
  State<Conseil> createState() => _ConseilState();
}

class _ConseilState extends State<Conseil> {
  @override
  Widget build(BuildContext context) {
    dynamic sizeWidth = MediaQuery.sizeOf(context).width;
    dynamic user = Provider.of<User?>(context);
    dynamic cubit = ProfilCubit.get(context);
    dynamic formKey = GlobalKey<FormState>();
    dynamic theme = Theme.of(context);
    cubit.imgFile = null;
    dynamic content;
    return BlocConsumer<ProfilCubit, ProfilState>(
      listener: (context, state) {
        if (state is OnEditSubmitedState) {
          cubit.imgFile = null;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (cubit.imgFile != null) {
                      cubit.onEditSubmited(
                        content: content,
                        context: context,
                        file: cubit.imgFile,
                        user: user,
                      );
                      cubit.imgFile = null;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                          context,
                          'Veuillez ajouter une image illustrative ...',
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: theme.primaryColorDark.withOpacity(0.9),
                  ),
                  margin: EdgeInsets.only(right: sizeWidth * 0.05),
                  height: sizeWidth * 0.08,
                  width: sizeWidth * 0.18,
                  child: Text(
                    'Envoyer'.tr(),
                    style: theme.textTheme.bodyMedium.copyWith(
                      fontSize: sizeWidth * 0.02,
                      color: theme.highlightColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: sizeWidth * 0.05),
                            width: sizeWidth / 6.2,
                            height: sizeWidth / 6.2,
                            decoration: BoxDecoration(
                              color: AppColors.tdGrey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AppImages.logo),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Contribuer au bien-être de la ville avec".tr(),
                                style: theme.textTheme.labelMedium.copyWith(
                                  fontSize: sizeWidth * 0.025,
                                ),
                              ),
                              Text(
                                "Usaf'ty",
                                style: theme.textTheme.displaySmall.copyWith(
                                  fontSize: sizeWidth * 0.05,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(sizeWidth * 0.05),
                      Text(
                        "? Avez-vous un conseil à donner, une expérience à partager, une connaissance à transmettre sur la gestion de déchêts ..."
                            .tr(),
                        style: theme.textTheme.bodyMedium.copyWith(
                          fontSize: sizeWidth * 0.025,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "? Sur la notion du Triple-R (Reduire, Reutiliser, Recycler) ..."
                            .tr(),
                        style: theme.textTheme.bodyMedium.copyWith(
                          fontSize: sizeWidth * 0.025,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "? Avez-vous des informations sur les pratiques d'hygiène et d'assainissement ..."
                            .tr(),
                        style: theme.textTheme.bodyMedium.copyWith(
                          fontSize: sizeWidth * 0.025,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "Ne doute pas de \"Changer le monde\" !".tr(),
                        style: theme.textTheme.bodyMedium.copyWith(
                          fontSize: sizeWidth * 0.035,
                          color: AppColors.tdYellowB,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.02),
                      Text(
                        "Commence dès maintenant et envoie ta participation à tous les utilisateurs de cette application et le monde entier !"
                            .tr(),
                        style: theme.textTheme.bodyMedium.copyWith(
                          fontSize: sizeWidth * 0.025,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Gap(sizeWidth * 0.05),
                      Form(
                        key: formKey,
                        child: TextFormField(
                          autocorrect: true,
                          onChanged: (value) {
                            content = value;
                          },
                          onTapOutside: (event) =>
                              FocusScope.of(context).requestFocus(
                            FocusNode(),
                          ),
                          canRequestFocus: true,
                          cursorColor: theme.primaryColorLight,
                          maxLines: null,
                          style: theme.textTheme.bodyMedium.copyWith(
                            fontSize: sizeWidth * 0.03,
                          ),
                          decoration: InputDecoration(
                            focusColor: theme.primaryColorLight,
                            hintText: "Taper vos idées ici ...".tr(),
                            hintStyle: theme.textTheme.labelMedium,
                            errorStyle: theme.textTheme.labelSmall,
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            return (value == null || value.isEmpty)
                                ? 'Veuillez entrer du texte'.tr()
                                : null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(sizeWidth * 0.05),
                  GestureDetector(
                    onTap: () => cubit.showImagePickerOptions(context),
                    child: PhotoPicker(),
                  ),
                  Gap(sizeWidth * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: sizeWidth * 0.4),
                    child: Text(
                      "Il tient à noter qu'en envoyant ceci, nous récupérons vos infos telle que :"
                          .tr(),
                      style: theme.textTheme.bodyMedium.copyWith(
                        fontSize: sizeWidth * 0.02,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: sizeWidth * 0.02,
                      left: sizeWidth * 0.2,
                    ),
                    child: Text(
                      "+ votre nom\n+ votre mail\n+ votre photo".tr(),
                      style: theme.textTheme.bodyMedium.copyWith(
                        fontSize: sizeWidth * 0.02,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: sizeWidth * 0.02,
                      left: sizeWidth * 0.4,
                    ),
                    child: Text(
                      "Pour être utiliser dans l'affichage de votre blog.".tr(),
                      style: theme.textTheme.bodyMedium.copyWith(
                        fontSize: sizeWidth * 0.02,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
          margin: EdgeInsets.only(bottom: sizeWidth * 0.05),
          width: sizeWidth,
          height: sizeWidth * 0.5,
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
                        size: sizeWidth * 0.1,
                        weight: 1,
                      ),
                    ),
                    Gap(sizeWidth * 0.04),
                    Text(
                      "Une image illustrative".tr(),
                      style: font2.copyWith(
                        fontSize: sizeWidth * 0.03,
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
