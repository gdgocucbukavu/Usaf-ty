import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  dynamic useR;

  void userName(String user) {
    useR = user;
    emit(UserNameState());
  }
}
