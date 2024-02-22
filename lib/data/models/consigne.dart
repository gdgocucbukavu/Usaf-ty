class Consigne {
  String img;
  String name;
  String mail;
  String content;

  Consigne({
    required this.img,
    required this.name,
    required this.mail,
    required this.content,
  });
}

List<Consigne> consignes = [
  Consigne(
    img: '',
    name: 'Tri des déchêts ',
    mail: 'uusafty@gmail.com',
    content:
        '''Il est important de placer chaque type de déchêts dans un endroit particulier pour des raisons :
        + Protection de l'environnement
        + Préservations des ressources naturelles
        + Economies d'énergie
        + Lutte contre le changement climatique''',
  ),
  Consigne(
    img: '',
    name: 'Tri des déchêts ',
    mail: 'uusafty@gmail.com',
    content:
        '''+ Types de déchets : Papier & Carton, Verre, Plastique, Métaux, Biodéchêts, Déchêts électroniques.
           + Demander à votre agence selon ces types quels sont ces consignes
           + Utiliser des contenants spécifiques pour chacun de ces types.''',
  ),
  Consigne(
    img: 'https://avatars.githubusercontent.com/u/127692851?v=4',
    name: 'Georges Byona ',
    mail: 'georgesbyona@gmail.com',
    content: '''? Comment réduire les déchêts
        + Privilégier les produits durables
        + Eviter les produits jetables
        + Composter les biodéchets
        + Réparer et donner une seconde vie aux objets''',
  ),
  Consigne(
    img: 'https://avatars.githubusercontent.com/u/96162207?s=70&v=4',
    name: 'Bénédict Lubembela ',
    mail: 'mahangobenedict4@gmail.com',
    content: '''? Comment vous protéger
        + Porter des gants et un masque à la manipulation
        + Se laver les mains après avoir manipulé des déchets
        + Ne pas mélanger les produits chimiques
        + Respecter les consignes de sécurité spécifiques''',
  ),
  Consigne(
    img: 'https://avatars.githubusercontent.com/u/147336570?s=70&v=4',
    name: 'Kévin Kish ',
    mail: 'kevinkish117@gmail.com',
    content: '''? Types de maladie lié aux déchêts
        + Maladies infectieuses
        + Maladies respiratoires
        + Problèmes de santé chroniques''',
  ),
  Consigne(
    img: 'https://avatars.githubusercontent.com/u/128302807?s=70&v=4',
    name: 'Abraham Imani ',
    mail: 'imanibahati0@gmail.com',
    content: '''Son impact sur le changement climatique
        + La gestion des déchets est une source importante de gaz à effet de serre, qui contribuent au changement climatique.
        + La réduction, le tri et le recyclage des déchets permettent de réduire les émissions de gaz à effet de serre et de lutter contre le changement climatique.''',
  ),
];
