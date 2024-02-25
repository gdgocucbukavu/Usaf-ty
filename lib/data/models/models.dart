//Agence

class Agence {
  String idAgence;
  String name;
  String tel;
  String mail;
  String password;
  Agence(
      {required this.idAgence,
      required this.name,
      required this.tel,
      required this.mail,
      required this.password});
}

List<Agence> agenceList = [];

// Agent

class Employer {
  String idEmployer;
  String name;
  dynamic imgPath;
  String mail;
  String tel;
  String fonction;
  dynamic secteur;
  String idAgence;
  Employer({
    required this.idEmployer,
    required this.name,
    required this.fonction,
    this.imgPath,
    required this.mail,
    this.secteur,
    required this.tel,
    required this.idAgence,
  });
}

List<Employer> employerList = [];

// les clients

class Customer {
  String idCustomer;
  String name;
  dynamic imgPath;
  String mail;
  String tel;
  dynamic adresse;
  String idAgence;
  Customer({
    required this.idCustomer,
    required this.name,
    this.imgPath,
    required this.mail,
    this.adresse,
    required this.tel,
    required this.idAgence,
  });
}

List<Customer> clientRepertorie = [];

// les Points des collectes

class SecterPC {
  String idSecteur;
  String denomination;
  String adresse;
  dynamic localisation;

  SecterPC(
      {required this.idSecteur,
      required this.denomination,
      required this.adresse,
      required this.localisation});
}

List<SecterPC> pointDesCollectes = [];

// Les Abonnements

class Abonnement {
  String idAbonnement;
  String idCustomer;
  double during;
  dynamic beginDate;
  double cash;
  Abonnement(
      {required this.idAbonnement,
      required this.idCustomer,
      required this.during,
      this.beginDate,
      required this.cash});
}

List<Abonnement> abonnements = [];
