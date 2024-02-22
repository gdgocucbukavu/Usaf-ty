import 'location.dart';

class SignalModel {
  String name;
  String email;
  dynamic img;
  dynamic content;
  Location location;

  SignalModel({
    required this.name,
    required this.email,
    required this.img,
    required this.content,
    required this.location,
  });
}
