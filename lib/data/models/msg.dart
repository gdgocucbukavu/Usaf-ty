class Msg {
  String? name;
  String? msg;
  dynamic image;
  bool isGroup;
  DateTime date;

  Msg({
    required this.name,
    required this.msg,
    required this.isGroup,
    required this.date,
    this.image,
  });
}

List msgs = [
  Msg(
    name: 'Dr Faith',
    isGroup: false,
    date: DateTime.now(),
    image: 'https://avatars.githubusercontent.com/u/128302807?v=4',
    msg:
        "L'anatomie est l'une de mes cours préférés, tu le trouves complexe ! T'inquiètes viens qu'on s'amuse avec ...",
  ),
  Msg(
    name: 'Groupe TP Algo',
    date: DateTime.now(),
    msg:
        "Il ne nous reste plus que 6 jours pour finir le TP comment on s'y prend !",
    isGroup: true,
  ),
  Msg(
    name: 'M. Tacite',
    date: DateTime.now(),
    isGroup: false,
    image: 'https://avatars.githubusercontent.com/u/71480535?v=4',
    msg:
        "Tu n'as pas à avoir peur, tu veux découvrir le monde de la tech, n'hésite pas suis moi !",
  ),
  Msg(
    name: 'Ir Georges',
    isGroup: false,
    date: DateTime.now(),
    image: 'https://avatars.githubusercontent.com/u/127692851?v=4',
    msg:
        "Ravie de t'avoir lu, je suis disponible pour toi, hâte de te voir débuter le cours !",
  ),
  Msg(
    name: 'Engish Group 6',
    date: DateTime.now(),
    msg:
        "Don't miss our meeting at 6:30 PM at Jifunza Plateform, here is the link ...",
    isGroup: true,
  ),
  Msg(
    name: 'Groupe TP Algo',
    date: DateTime.now(),
    msg:
        "Il ne nous reste plus que 6 jours pour finir le TP comment on s'y prend !",
    isGroup: true,
  ),
  Msg(
    name: 'M. Tacite',
    date: DateTime.now(),
    isGroup: false,
    image: 'https://avatars.githubusercontent.com/u/71480535?v=4',
    msg:
        "Tu n'as pas à avoir peur, tu veux découvrir le monde de la tech, n'hésite pas suis moi !",
  ),
  Msg(
    name: 'Dr Faith',
    isGroup: false,
    date: DateTime.now(),
    image: 'https://avatars.githubusercontent.com/u/128302807?v=4',
    msg:
        "L'anatomie est l'une de mes cours préférés, tu le trouves complexe ! T'inquiètes viens qu'on s'amuse avec ...",
  ),
];
