import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usaficity/app/shared/styles/styles.dart';
import 'package:usaficity/controller/state/profilstate.dart';

class ProfilCubic extends Cubit<ProfilState> {
  ProfilCubic() : super(InitialState());

  static ProfilCubic get(context) {
    return BlocProvider.of(context);
  }

  dynamic useR;

  ProfilPage personnage = ProfilPage(
      name: "Bénédict Lubembela",
      mail: "mhg4@gmail.com",
      location: ["Fizi", "Ndendere", "n°54"],
      numero: "+243 894 097 071",
      agence: "Usaf'ty",
      frais: "90 000 CDF/mois",
      imgPhoto: AppImages.ia1,
      photoP: AppImages.logo);

  void userName(String user) {
    useR = user;
    emit(UserNameState());
  }

  bool isDark = false;

  void changeThemeMode({bool? darkMode}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (darkMode != null) {
      isDark = darkMode;
    } else {
      isDark = !isDark;
      sharedPreferences.setBool('isDark', isDark);
    }
    emit(ChangeThemeModeState());
  }

  bool isConnect = false;

  void seConnecter() {
    isConnect = !isConnect;

    emit(SeConnecterState());
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
