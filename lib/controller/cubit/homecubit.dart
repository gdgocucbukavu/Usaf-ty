import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  bool isLike = false;
  int starCount = 0;
  void isLiked() {
    isLike = !isLike;
    isLike ? starCount = 1 : starCount = 0;
    // DBServices().addStarBlog(
    //   StarBlogModel(
    //     userName: user.displayName,
    //     userMail: user.email,
    //     authorName: authorName,
    //     authorMail: authorMail,
    //     blogTitle: blogTitle,
    //     star: StarModel(
    //       isStar: isLike,
    //       starNumber: starCount,
    //     ),
    //   ),
    // );
    emit(IsLikedState());
  }
}
