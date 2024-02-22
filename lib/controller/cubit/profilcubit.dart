import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/controller/state/profilstate.dart';
import 'package:usaficity/data/models/location.dart';
import 'package:usaficity/data/models/signalisation.dart';

import '../../app/shared/shared.dart';
import '../../data/services/db.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(InitialState());

  static ProfilCubit get(context) {
    return BlocProvider.of(context);
  }

  dynamic useR;

  ProfilPage personnage = ProfilPage(
    name: "Bénédict Lubembela",
    mail: "mhg4@gmail.com",
    location: ["Fizi", "Ndendere", "n°54"],
    numero: "+243 894 097 071",
    agence: "Usaf'ty",
    frais: "50 000 CDF/mois",
    imgPhoto: AppImages.ia1,
    photoP: AppImages.logo,
  );

  void seConnecter() {
    DBServices().signInWithGoogle();
    emit(SeConnecterState());
  }

  void seDeconnecter() {
    DBServices().signOut();
    emit(SeDeconnecterState());
  }

  bool c1 = true;
  bool c2 = false;
  bool c3 = false;

  void selectLanguage(int du) {
    if (du == 0) {
      c1 = true;
      c2 = false;
      c3 = false;
    }
    if (du == 1) {
      c1 = false;
      c2 = true;
      c3 = false;
    }
    if (du == 2) {
      c1 = false;
      c2 = false;
      c3 = true;
    }

    emit(SelectLanguageState());
  }

  dynamic imgFile;

  showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) => SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.15,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => pickImgFromGallery(context),
              hoverColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.galleryPhoto,
                    size: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  Gap(MediaQuery.sizeOf(context).width * 0.025),
                  Text(
                    'Gallerie',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).width * 0.03,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => pickImgFromCamera(context),
              hoverColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.photoCapture,
                    size: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  Gap(MediaQuery.sizeOf(context).width * 0.025),
                  Text(
                    'Camera',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).width * 0.03,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    emit(ShowImagePickerOptionsState());
  }

  pickImgFromGallery(BuildContext context) async {
    XFile? returnImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImg == null) {
      Navigator.pop(context);
    } else {
      imgFile = File(returnImg.path);
      Navigator.pop(context);
    }
    emit(PickImgFromGalleryState());
  }

  pickImgFromCamera(BuildContext context) async {
    XFile? returnImg =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImg == null) {
      Navigator.pop(context);
    } else {
      imgFile = File(returnImg.path);
      Navigator.pop(context);
    }
    emit(PickImgFromCameraState());
  }

  dynamic content;

  onSignalisationSubmited({
    dynamic file,
    context,
    content,
    user,
    lat,
    lng,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackBar(
        context,
        'Merci pour votre signal ...',
      ),
    );
    Navigator.pop(context);
    String imgurl = await DBServices().uploadSignalisationFile(file);
    DBServices().addSignalisation(
      SignalModel(
        name: user!.displayName,
        email: user!.email,
        content: content,
        img: imgurl,
        location: Location(
          lat: lat,
          lng: lng,
        ),
      ),
    );
    emit(OnSignalisationSubmitedState());
  }
}

class ProfilPage {
  String name;
  String mail;

  List<String> location;
  String numero;
  String agence;
  String frais;
  String photoP;
  String imgPhoto;
  ProfilPage({
    required this.name,
    required this.mail,
    required this.location,
    required this.numero,
    required this.agence,
    required this.frais,
    required this.photoP,
    required this.imgPhoto,
  });
}
