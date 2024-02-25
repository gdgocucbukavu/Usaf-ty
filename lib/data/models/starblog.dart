class StarModel {
  bool isStar;
  int starNumber;

  StarModel({
    required this.isStar,
    required this.starNumber,
  });
}

class StarBlogModel {
  String userName;
  String userMail;
  String authorName;
  String authorMail;
  String blogTitle;
  StarModel star;

  StarBlogModel({
    required this.userName,
    required this.userMail,
    required this.authorName,
    required this.authorMail,
    required this.blogTitle,
    required this.star,
  });
}
