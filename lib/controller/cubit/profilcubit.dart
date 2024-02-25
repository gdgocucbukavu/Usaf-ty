import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usaficity/controller/state/profilstate.dart';
import 'package:usaficity/data/models/blog.dart';
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

  bool isConnecting = false;

  bool isConnected = true;

  checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].address.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    emit(CheckConnectionState());
  }

  ProfilPage personnage = ProfilPage(
    name: "Bénédict Lubembela",
    mail: "mhg4@gmail.com",
    location: ["Fizi", "Ndendere", "n°54"],
    numero: "+243 894 097 071",
    agence: "Usaf'ty",
    frais: "50 000 CDF/mois",
    imgPhoto: AppImages.ia,
    photoP: AppImages.logo,
  );

  Future seConnecter(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].address.isNotEmpty) {
        DBServices().signInWithGoogle();
        isConnecting = true;
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          context,
          "Il semble que vous n'avez pas de connexion ...",
        ),
      );
    }
    emit(SeConnecterState());
  }

  void seDeconnecter() {
    DBServices().signOut();
    isConnecting = false;
    emit(SeDeconnecterState());
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
                    'Gallerie'.tr(),
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
                    'Camera'.tr(),
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
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].address.isNotEmpty) {
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
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          context,
          "Veuillez vérifier votre connexion internet ...",
        ),
      );
    }

    emit(OnSignalisationSubmitedState());
  }

  onEditSubmited({
    dynamic file,
    context,
    content,
    user,
  }) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].address.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            'Merci pour votre participation ...'.tr(),
          ),
        );
        Navigator.pop(context);
        String imgurl = await DBServices().uploadBlogFile(file);
        DBServices().addBlog(
          BlogModel(
            authorName: user.displayName,
            authorMail: user.email,
            authorImg: user.photoURL,
            content: content,
            img: imgurl,
          ),
        );
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          context,
          "Veuillez vous connecter à internet pour l'envoie ...",
        ),
      );
    }
    emit(OnEditSubmitedState());
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
