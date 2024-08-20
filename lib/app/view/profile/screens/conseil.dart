import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../controller/cubit/profilcubit.dart';
import '../../../../controller/state/profilstate.dart';
import '../../../shared/shared.dart';
import 'photo_picker_widget.dart';

class Conseil extends StatefulWidget {
  static const route = '/conseil';
  const Conseil({super.key});

  @override
  State<Conseil> createState() => _ConseilState();
}

class _ConseilState extends State<Conseil> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    final user = Provider.of<User?>(context);
    final cubit = ProfilCubit.get(context);
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    cubit.imgFile = null;
    String content = "";
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 35,
                  child: Text(
                    'Envoyer'.tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.highlightColor,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.tdGrey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.logo),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contribuer au bien-être de la ville avec".tr(),
                              style: theme.textTheme.labelMedium!.copyWith(
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              "Usaf'ty",
                              style: theme.textTheme.displaySmall!.copyWith(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text(
                    "? Avez-vous un conseil à donner, une expérience à partager, une connaissance à transmettre sur la gestion de déchêts ..."
                        .tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "? Sur la notion du Triple-R (Reduire, Reutiliser, Recycler) ..."
                        .tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "? Avez-vous des informations sur les pratiques d'hygiène et d'assainissement ..."
                        .tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "Ne doute pas de \"Changer le monde\" !".tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: AppColors.tdYellowB,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
                  Text(
                    "Commence dès maintenant et envoie ta participation à tous les utilisateurs de cette application et le monde entier !"
                        .tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    textAlign: TextAlign.justify,
                  ),
                  const Gap(10),
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
                      style: theme.textTheme.bodyMedium!.copyWith(
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
                child: PhotoPickerWidget(text: "Une image illustrative"),
              ),
              const Gap(10),
              Padding(
                padding: EdgeInsets.only(left: sizeWidth * 0.4),
                child: Text(
                  "Il tient à noter qu'en envoyant ceci, nous récupérons vos infos telle que :"
                      .tr(),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 9,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: sizeWidth * 0.45, top: 8),
                child: Text(
                  "+ votre nom\n+ votre mail\n+ votre photo".tr(),
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 8),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: sizeWidth * 0.4, top: 8),
                child: Text(
                  "Pour être utiliser dans l'affichage de votre blog.".tr(),
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 9),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
