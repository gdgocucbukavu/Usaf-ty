class Consigne {
  String img;
  String name;
  String profession;
  String content;

  Consigne({
    required this.img,
    required this.name,
    required this.profession,
    required this.content,
  });
}

List<Consigne> consignes = [
  Consigne(
    img: 'https://avatars.githubusercontent.com/u/127692851?v=4',
    name: 'Georges Byona ',
    profession: 'Developer, Co-founder LosingDynasty',
    content:
        "Si nous sentons et voyons que la technologie fait perdre notre génération ... Il est donc à nous, acteurs du domaine, de donner une nouvelle image à celle-ci en oeuvrant pour le bien-être de notre génération et celle du future.",
  ),
  Consigne(
    img:
        'https://des-livres-pour-changer-de-vie.com/wp-content/uploads/2019/10/Citations-sur-la-motivation-e1572007337580.jpg',
    name: 'Anonyme ',
    profession: 'Motivation',
    content:
        "Si vous continuez à vous entraîner comme vous l'avez toujours fait, ne vous attendez pas à obtenir de meilleurs résultats.",
  ),
  Consigne(
    img:
        'https://futureoflife.org/wp-content/uploads/2020/08/elon_musk_royal_society-1024x1024.jpg',
    name: 'Elon Musk ',
    profession: 'Founder, SpaceX and Tesla Motors',
    content:
        "Si les enfants peuvent être super engagés dans les jeux vidéo, il existe un moyen pour eux d'être aussi super engagés dans l'éducation.",
  ),
  Consigne(
    img:
        'https://scontent.fgom1-1.fna.fbcdn.net/v/t31.18172-8/20280559_10154756882766961_3434466954525858896_o.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7a1959&_nc_eui2=AeHsrB0P_RgDKFTfgicBICvOnMbmzSKQv2icxubNIpC_aG8v64cUJhw4dXEndGK8Eq-TUpWyB4Z8zXXM3zuaZdkc&_nc_ohc=1REJaf-9R50AX-kqUd_&_nc_ht=scontent.fgom1-1.fna&oh=00_AfCV5nAZJqkhexucYJ8zS5QrIuVnC4Lv1jCQ3Ifq8K7-qA&oe=65B5DBEF',
    name: 'Bill Gates ',
    profession: 'Co-founder of Microsoft',
    content:
        "Lorsque je voulais apprendre quelque chose en dehors de l'école quand j'étais enfant, ouvrir mon encyclopédie World Book était le mieux que je pouvais faire. Aujourd'hui, tout ce que vous avez à faire est d'aller en ligne.",
  ),
  Consigne(
    img:
        'https://media.licdn.com/dms/image/C5603AQECJoOkM9O7kw/profile-displayphoto-shrink_400_400/0/1550347858676?e=1709164800&v=beta&t=UAN942PzMQ7kYVak4_TReZgiIb9EZ3NvLWNFbsnNeBA',
    name: 'Keith Bachman ',
    profession: 'CFA - BMO Capital Markets',
    content:
        "À une époque où les salles de classe dirigées par un instructeur ont tendance à être l'exception, les solutions d'apprentissage électronique peuvent offrir plus de collaboration et d'interaction avec des experts et des pairs, ainsi qu'un taux de réussite plus élevé que l'alternative en direct.",
  ),
  Consigne(
    img:
        'https://fr.web.img6.acsta.net/r_1920_1080/pictures/16/10/18/11/54/231787.jpg',
    name: 'Barack Obama ',
    profession: '44th President of USA',
    content:
        "La technologie n'est pas une solution miracle. C'est seulement aussi bon que les enseignants… l'utilisent comme un outil de plus pour aider à inspirer, enseigner et résoudre les problèmes.",
  ),
];
